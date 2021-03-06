#include "bjorklund.h"
#include <Arduino.h>

int p_len = 0;
int p[] = {
  LOW, LOW, LOW, LOW,
  LOW, LOW, LOW, LOW,
  LOW, LOW, LOW, LOW,
  LOW, LOW, LOW, LOW,
};
void p_append(int value) {
  p[p_len] = value;
  p_len++;
}
int p_index(int value) {
  for (int i = 0; i < p_len; i++) {
    if (p[i] == value) {
      return i;
    }
  }
  return -1;
}
void p_move(int value) {
  for (int i = 0; i < value; i++) {
    int tmp = p[0]; 
    for (int j = 1; j < p_len; j++) {
      p[j-1] = p[j];
    }
    p[p_len-1] = tmp;
  }
}

int c_len = 0;
int c[] = {
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
};
void c_append(int value) {
  c[c_len] = value;
  c_len++;
}

int r_len = 0;
int r[] = {
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
};
void r_append(int value) {
  r[r_len] = value;
  r_len++;
}

void build(int level) {
  if (level == -1) {
    p_append(0);
  } else if (level == -2) {
    p_append(1);
  } else {
    for (int i = 0; i < c[level]; i++) {
      build(level - 1);
    }
    if (r[level] != 0) {
      build(level - 2);
    }
  }
}

void bjorklund(int steps, int pulses) {
  if (pulses > steps) {
    return;
  }
  p_len = 0;
  c_len = 0;
  r_len = 0;
  int divisor = steps - pulses;
  r_append(pulses);
  int level = 0;
  while (true) {
    c_append(divisor / r[level]);
    r_append(divisor % r[level]);
    divisor = r[level];
    level = level + 1;
    if (r[level] <=1) {
      break;
    }
  }
  c_append(divisor);
  build(level);
  
  int i = p_index(1);
  if (i > 0) {
    p_move(i);
  }
}
