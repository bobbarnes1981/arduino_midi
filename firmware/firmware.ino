#include <Wire.h>
#include <LiquidCrystal_I2C.h>

#define LED 6

#define DEBUG

#define LCD_ADDR 0x27
#define LCD_ROW 2
#define LCD_COL 16

#define BUTTON 2
#define POT A0

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
byte notes_values[NOTES_MAX] = { 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82 };
int notes_play[NOTES_MAX] = { 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000 };
int notes_wait[NOTES_MAX] = { 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000 };
int notes_current = 0;
unsigned long noteStart = 0;

enum playState {
  NOT_PLAYING,
  PLAYING_NOTE_START,
  PLAYING_NOTE_STARTED,
  PLAYING_NOTE_STOPPED
};

playState currentState = NOT_PLAYING;

void setup() {
  pinMode(LED, OUTPUT);

  Serial.begin(MIDI_BAUD);

  lcd.init();
  lcd.backlight();

  lcd.setCursor(0, 0);
  lcd.print("Arduino MIDI");
}

void loop() {
  digitalWrite(LED, millis() % 1000 > 750);

  int p = analogRead(POT);
  int offset = p > 999 ? 1 : (p > 99 ? 2 : (p > 9 ? 3 : 4));
  lcd.setCursor(0, 1);
  for (int i = 0; i < offset; i++) {
    lcd.print(' ');
  }
  lcd.print(p);

  switch(currentState) {
    case NOT_PLAYING:
      if (digitalRead(BUTTON)) {
        currentState = PLAYING_NOTE_START;
      }
      break;
    case PLAYING_NOTE_START:
      lcd.setCursor(13, 1);
      lcd.print(notes_values[notes_current]);
      midi_noteOn(CHANNEL, notes_values[notes_current], 0xFF);
      currentState = PLAYING_NOTE_STARTED;
      noteStart = millis();
      break;
    case PLAYING_NOTE_STARTED:
      if (millis() - noteStart >= notes_play[notes_current]) {
        lcd.setCursor(13, 1);
        lcd.print("   ");
        midi_noteOff(CHANNEL, notes_values[notes_current], 0x00);
        currentState = PLAYING_NOTE_STOPPED;
        noteStart = millis();
      }
      break;
    case PLAYING_NOTE_STOPPED:
      if (millis() - noteStart >= notes_wait[notes_current]) {
        notes_current++;
        if (notes_current >= NOTES_MAX) {
          notes_current = 0;
          currentState = NOT_PLAYING;
        } else {
          currentState = PLAYING_NOTE_START;
        }
      }
      break;
  }
}

void midi_noteOn(byte channel, byte pitch, byte velocity) {
  channel = channel & 0x0F;
  byte command = MIDI_MSG_NOTEON | channel;
  writeMidi(command);
  writeMidi(pitch);
  writeMidi(velocity);
}

void midi_noteOff(byte channel, byte pitch, byte velocity) {
  channel = channel & 0x0F;
  byte command = MIDI_MSG_NOTEOFF | channel;
  writeMidi(command);
  writeMidi(pitch);
  writeMidi(velocity);
}

void writeMidi(byte b) {
  #ifdef DEBUG
  Serial.println(b, HEX);
  #else
  Serial.write(b);
  #endif
}
