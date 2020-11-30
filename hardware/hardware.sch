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
P 7500 3975
F 0 "SW?" H 7500 4260 50  0000 C CNN
F 1 "SW_Push" H 7500 4169 50  0000 C CNN
F 2 "" H 7500 4175 50  0001 C CNN
F 3 "~" H 7500 4175 50  0001 C CNN
	1    7500 3975
	1    0    0    -1  
$EndComp
$EndSCHEMATC
