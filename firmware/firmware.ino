#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include "bjorklund.h"

#define LED 6

#define DEBUG

#define LCD_ADDR 0x27
#define LCD_ROW 2
#define LCD_COL 16

#define BUTTON1 2
#define POT_NOTES A0
#define POT_STEPS 
#define POT_OFFSET
#define POT_SPEED

#ifdef DEBUG
#define MIDI_BAUD 115200
#else
#define MIDI_BAUD 31256
#endif

#define MIDI_MSG_NOTEOFF 0x80
#define MIDI_MSG_NOTEON 0x90
#define MIDI_MDG_CTRL 0xD0
#define MIDI_MDG_CHNL 0xD0

#define CHANNEL 0x00

LiquidCrystal_I2C lcd(LCD_ADDR, LCD_COL, LCD_ROW);

#define NOTES_MAX 12
// notes to play, TODO: generate a scale
byte notes_values[NOTES_MAX] = { 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82 };

int step_length = 250; // length of each euclidean step
int euc_steps = 16; // total number of euclidean steps
int euc_notes = 0; // number of notes to play in the sequence
int euc_offset = 0; // offset from start

int current_step = -1; // current step in the euclidean sequence
unsigned long step_started = 0; // millis() time when step started

int button1;

int playing_note = 0; // currently playing midi note

void setup() {
  pinMode(LED, OUTPUT);

  Serial.begin(MIDI_BAUD);

  lcd.init();
  lcd.backlight();

  lcd.setCursor(0, 0);
  lcd.print("Arduino MIDI");
  delay(1000);
  lcd.clear();
}

void loop() {
  digitalWrite(LED, millis() % 1000 > 750);

  read_inputs();
  
  bjorklund(euc_steps, euc_notes);

  update_display();

  process_playing();
}

void update_display() {
  lcd.setCursor(0, 0);

  lcd.print("n");
  print_number(euc_notes, 2);
  lcd.print("s");
  print_number(euc_steps, 2);
  lcd.print("t");
  print_number(step_length, 3);
  lcd.print("p");
  print_number(playing_note, 3);
  
  lcd.setCursor(0, 1);
  for (int i = 0; i < 16; i++) {
    int index = get_index(i);
    if (index == current_step) {
      lcd.print('X');
    } else {
      if (p[index] == HIGH) {
        lcd.print(index, HEX);
      } else {
        lcd.print(' ');
      }
    }
  }
}

// convert step index to pattern sequence index with offset and limit applied
int get_index(int i) {
  return (i+euc_offset)%euc_steps;
}

// convert the step index to notes to play index with limit applied
int get_note_index(int i) {
  int index = 0;
  // count notes in current pattern before required note
  for (int j = 0; j < i; j++) {
    if (p[get_index(j)] == HIGH) {
      index++;
    }
  }
  return index % NOTES_MAX;
}

// print a number with leading zeros
void print_number(int number, int len) {
  int mult = pow(10, len-1);
  int padding = 0;
  for (int i = 1; i < len; i++) {
    if (number > mult-1) {
      break;
    }
    padding++;
    mult = mult / 10;
  }
  for (int i = 0; i < padding; i++) {
    lcd.print('0');
  }
  lcd.print(number);
}

void read_inputs() {
  button1 = digitalRead(BUTTON1);
  euc_notes = map(analogRead(POT_NOTES), 0, 1023, 0, 16);
}

void process_playing() {
  if (millis() - step_started > step_length) {
    // increment the step
    current_step++;
    step_started = millis();

    // reset to start
    if (current_step >= euc_steps) {
      current_step = 0;
    }

    if (p[get_index(current_step)] == HIGH) {
      euc_stopLastNote();
      
      // current step is a note
      euc_startNextNote();
    } else {
      // current step is a rest
      euc_stopLastNote();
    }
  }
}

void euc_startNextNote() {
  playing_note = notes_values[get_note_index(current_step)];
  midi_noteOn(CHANNEL, playing_note, 127);
}

void euc_stopLastNote() {
  if (playing_note != 0) {
    midi_noteOff(CHANNEL, playing_note, 0);
    playing_note = 0;
  }
}

void midi_noteOn(byte channel, byte pitch, byte velocity) {
  channel = channel & 0x0F;
  byte command = MIDI_MSG_NOTEON | channel;
  midi_write(command);
  midi_write(pitch);
  midi_write(velocity);
}

void midi_noteOff(byte channel, byte pitch, byte velocity) {
  channel = channel & 0x0F;
  byte command = MIDI_MSG_NOTEOFF | channel;
  midi_write(command);
  midi_write(pitch);
  midi_write(velocity);
}

void midi_write(byte b) {
  #ifdef DEBUG
  Serial.println(b, HEX);
  #else
  Serial.write(b);
  #endif
}
