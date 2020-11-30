EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5FC4FDC6
P 5075 2750
F 0 "A?" H 5075 1661 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 5075 1570 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5075 2750 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5075 2750 50  0001 C CNN
	1    5075 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5FC50F25
P 7425 2150
F 0 "J?" H 7533 2431 50  0000 C CNN
F 1 "Conn_01x04_Male" H 7533 2340 50  0000 C CNN
F 2 "" H 7425 2150 50  0001 C CNN
F 3 "~" H 7425 2150 50  0001 C CNN
	1    7425 2150
	1    0    0    -1  
$EndComp
Text Notes 7375 1725 0    50   ~ 0
Serial LCD
$Comp
L Device:R_POT RV?
U 1 1 5FC51EFD
P 7500 3250
F 0 "RV?" H 7431 3296 50  0000 R CNN
F 1 "R_POT" H 7431 3205 50  0000 R CNN
F 2 "" H 7500 3250 50  0001 C CNN
F 3 "~" H 7500 3250 50  0001 C CNN
	1    7500 3250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5FC52801
P 7775 4275
F 0 "SW?" H 7775 4560 50  0000 C CNN
F 1 "SW_Push" H 7775 4469 50  0000 C CNN
F 2 "" H 7775 4475 50  0001 C CNN
F 3 "~" H 7775 4475 50  0001 C CNN
	1    7775 4275
	1    0    0    -1  
$EndComp
$Comp
L Connector:DIN-5_180degree J?
U 1 1 5FC510B6
P 6425 4500
F 0 "J?" H 6425 4225 50  0000 C CNN
F 1 "DIN-5_180degree" H 6425 4134 50  0000 C CNN
F 2 "" H 6425 4500 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 6425 4500 50  0001 C CNN
	1    6425 4500
	1    0    0    -1  
$EndComp
Text Notes 6275 5100 0    50   ~ 0
MIDI Out
$Comp
L Device:R R?
U 1 1 5FC57B2D
P 6125 4125
F 0 "R?" H 6195 4171 50  0000 L CNN
F 1 "220" H 6195 4080 50  0000 L CNN
F 2 "" V 6055 4125 50  0001 C CNN
F 3 "~" H 6125 4125 50  0001 C CNN
	1    6125 4125
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FC580C5
P 6725 4125
F 0 "R?" H 6795 4171 50  0000 L CNN
F 1 "220" H 6795 4080 50  0000 L CNN
F 2 "" V 6655 4125 50  0001 C CNN
F 3 "~" H 6725 4125 50  0001 C CNN
	1    6725 4125
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC582B6
P 6125 3800
F 0 "#PWR?" H 6125 3650 50  0001 C CNN
F 1 "+5V" H 6140 3973 50  0000 C CNN
F 2 "" H 6125 3800 50  0001 C CNN
F 3 "" H 6125 3800 50  0001 C CNN
	1    6125 3800
	1    0    0    -1  
$EndComp
Text Label 6725 3800 0    50   ~ 0
MIDI_OUT
Wire Wire Line
	6125 4400 6125 4275
Wire Wire Line
	6125 3800 6125 3975
$Comp
L power:GND #PWR?
U 1 1 5FC58907
P 6425 3800
F 0 "#PWR?" H 6425 3550 50  0001 C CNN
F 1 "GND" H 6430 3627 50  0000 C CNN
F 2 "" H 6425 3800 50  0001 C CNN
F 3 "" H 6425 3800 50  0001 C CNN
	1    6425 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6425 3800 6425 4200
Wire Wire Line
	6725 3975 6725 3800
Wire Wire Line
	6725 4275 6725 4400
Text Label 7800 2250 0    50   ~ 0
SDA
Text Label 7800 2350 0    50   ~ 0
SCL
$Comp
L power:GND #PWR?
U 1 1 5FC59421
P 7800 2050
F 0 "#PWR?" H 7800 1800 50  0001 C CNN
F 1 "GND" V 7805 1922 50  0000 R CNN
F 2 "" H 7800 2050 50  0001 C CNN
F 3 "" H 7800 2050 50  0001 C CNN
	1    7800 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC5961D
P 7800 2150
F 0 "#PWR?" H 7800 2000 50  0001 C CNN
F 1 "+5V" V 7815 2278 50  0000 L CNN
F 2 "" H 7800 2150 50  0001 C CNN
F 3 "" H 7800 2150 50  0001 C CNN
	1    7800 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	7625 2050 7800 2050
Wire Wire Line
	7800 2150 7625 2150
Wire Wire Line
	7800 2250 7625 2250
Wire Wire Line
	7800 2350 7625 2350
Text Label 5675 3150 0    50   ~ 0
SDA
Text Label 5675 3250 0    50   ~ 0
SCL
$Comp
L power:GND #PWR?
U 1 1 5FC5A30C
P 5125 4075
F 0 "#PWR?" H 5125 3825 50  0001 C CNN
F 1 "GND" H 5130 3902 50  0000 C CNN
F 2 "" H 5125 4075 50  0001 C CNN
F 3 "" H 5125 4075 50  0001 C CNN
	1    5125 4075
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC5A4E2
P 5275 1625
F 0 "#PWR?" H 5275 1475 50  0001 C CNN
F 1 "+5V" H 5290 1798 50  0000 C CNN
F 2 "" H 5275 1625 50  0001 C CNN
F 3 "" H 5275 1625 50  0001 C CNN
	1    5275 1625
	1    0    0    -1  
$EndComp
Wire Wire Line
	5275 1625 5275 1750
Wire Wire Line
	5075 3750 5125 3750
Wire Wire Line
	5125 4075 5125 3750
Connection ~ 5125 3750
Wire Wire Line
	5125 3750 5175 3750
Wire Wire Line
	5575 3250 5675 3250
Wire Wire Line
	5575 3150 5675 3150
Text Label 4475 2250 2    50   ~ 0
MIDI_OUT
Wire Wire Line
	4475 2250 4575 2250
Text Label 5675 2750 0    50   ~ 0
POT_1
Text Label 4475 2350 2    50   ~ 0
BTN_1
Wire Wire Line
	5575 2750 5675 2750
Wire Wire Line
	4475 2350 4575 2350
$Comp
L power:GND #PWR?
U 1 1 5FC5C0D4
P 7500 2950
F 0 "#PWR?" H 7500 2700 50  0001 C CNN
F 1 "GND" H 7505 2777 50  0000 C CNN
F 2 "" H 7500 2950 50  0001 C CNN
F 3 "" H 7500 2950 50  0001 C CNN
	1    7500 2950
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC5C2F2
P 7500 3525
F 0 "#PWR?" H 7500 3375 50  0001 C CNN
F 1 "+5V" H 7515 3698 50  0000 C CNN
F 2 "" H 7500 3525 50  0001 C CNN
F 3 "" H 7500 3525 50  0001 C CNN
	1    7500 3525
	-1   0    0    1   
$EndComp
Wire Wire Line
	7500 2950 7500 3100
Wire Wire Line
	7500 3400 7500 3525
Text Label 7750 3250 0    50   ~ 0
POT_1
Text Label 8150 4275 0    50   ~ 0
BTN_1
$Comp
L Device:R R?
U 1 1 5FC5D15E
P 8050 3950
F 0 "R?" H 8120 3996 50  0000 L CNN
F 1 "10k" H 8120 3905 50  0000 L CNN
F 2 "" V 7980 3950 50  0001 C CNN
F 3 "~" H 8050 3950 50  0001 C CNN
	1    8050 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC5D647
P 8050 3725
F 0 "#PWR?" H 8050 3475 50  0001 C CNN
F 1 "GND" H 8055 3552 50  0000 C CNN
F 2 "" H 8050 3725 50  0001 C CNN
F 3 "" H 8050 3725 50  0001 C CNN
	1    8050 3725
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FC5D891
P 7450 4275
F 0 "#PWR?" H 7450 4125 50  0001 C CNN
F 1 "+5V" V 7465 4403 50  0000 L CNN
F 2 "" H 7450 4275 50  0001 C CNN
F 3 "" H 7450 4275 50  0001 C CNN
	1    7450 4275
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 3725 8050 3800
Wire Wire Line
	7450 4275 7575 4275
Wire Wire Line
	8050 4100 8050 4275
Wire Wire Line
	7975 4275 8050 4275
Connection ~ 8050 4275
Wire Wire Line
	8050 4275 8150 4275
$EndSCHEMATC
