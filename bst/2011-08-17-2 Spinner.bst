// Spinner 20110817

// MACROS

% 
// SEQUENCER

T1|DR1A|A1:SC2,
T1|DR1A|A1:SC2,
T1|DR1B|B1|A1:SC1,
T1|DR1B|B1|A1:SC1,
T1|DR1C|B2|DR2|A2:SC2,
T1|DR1C|B2|DR2|A2:SC2,
T1|DR1D|B2|DR2B|A2|C1:SC1,
T1|DR1D|B2|DR2B|A2|C1:SC1,
T1|DR1D|B2|DR2C|A3|C2:SC3,
T1|DR1D|B2|DR2C|A3|C2:SC3,
T1|B2|A3|C2:SC4,
T1|DR1D|B2|DR2B|A2|C1:SC2,
T1|DR1D|B2|DR2B|A2|C1:SC2,
T1|DR1D|B2|DR2C|A3|C2:SC4,
T1|DR1D|B2|DR2C|A3|C2:SC4,
T1|B2|A1|C2:SC1,
T1|B2|A1:SC1,

%
// CHORDS

SC1,4-11B.00 4-14A.07 4-22B.00 4-20.09,0,8;
SC2,4-16B.01 4-14A.10 4-22A.01 4-20.00,9,8;
SC3,4-13B.06 4-23.04 4-13A.01 4-20.06,3,8;
SC4,4-22B.10 4-z29B.11 4-27B.05 4-20.10,-1,8;

%
// PARTS

>> T1;
@t 128;
swing, 110,10;

>>A1;
@xm 1 16 120 :: scavolbin 0.5 "AB BC", scavolbin 0.5 "CA E0 19 BD";
128, FE 00 1C 79 F7 C2 00 FF : 1 0 , l,1 -2 1 -2 1 -2 1 2 -1 -1 1 -1 1 1 1 -1 -2 1 -1 1 1 -1 1 -1 -1 1 -1 -2 -1 1 2 1 1,1 -1;

>>A2;
@xm 1 16 120 :: scavolbin 0.5 "DE D4", scavolbin 0.5 "DA E0 C7 AE";
128, F8 E8 0F 83 : 1 0 , l,-4 2 1 4 -3 2 -2 1 -1 1 2 -1 -2 -3 1 2;

>>A3;
@xm 1 16 120 :: scavolbin 0.5 "BA E4", scavolbin 0.5 "FF 7A 75 6D";
128, DF F8 00 03 : 1 0 , l,-4 4 -3 4 -2 2 -1, -2 2 -2 -2 2 -3 3 2;

>>B1;
@xm 2 16 120;
128, FD DA : 1, l:0.5, 3 1 3 -2 1 1 2 2 -3 -3 -3 -2:1 0;

>>B2;
@xm 2 22 120;
128, F3 D8 3B FB 3B 58 ED 0E : 1, l : 0.5, -2 -3 1 -3 -1 -1 1 3 1 -2 3 1 2:1 ;


>> C1;
@xm 3 22 120;
128,AF 78,l,2 3 2 -1 -2 -1 3 -2 -2 -3 -2 2 -1 -2 4 3 -3 -2 3 -1;

>> C2;
@xm 3 22 120;
128,F9 F4,l,-2 -2 3 3 -1 -4 3 3 3 -1 -1 1 -4 -1 3 1 -2 -2 -1 1 -2 2: 1 -1;


>> DR1;
@xd 10 120 35 :: scavolbin 0.5 "2F 4E 3E FB";
96,15 C4 0E 0A,1;
32,36 E0 0E E9,1;

@xd 10 120 38 :: scavolbin 0.5 "F5 6C 9B BF";
96,C8 20 20 40,1;
32,80 04 81 04,1;

@xd 10 120 44 :: scavolbin 0.5 "2E FF 7C 65";
96, 10 16 00 10,1;
32, 10 14 41 54,1;

@xd 10 120 42 :: scavolbin 0.5 "FF 7A F5 87";
96,E6 E0 67 E8,1;
32,EE 60 B0 80,1;



>> DR2;
@xd 11 120 35 :: scavolbin 0.5 "2F 4E 3E FB";
96,15 C4 0E 0A,1;
32,36 E0 0E E9,1;

@xd 11 120 38 :: scavolbin 0.5 "F5 6C 9B BF";
96,C8 20 20 40,1;
32,80 04 81 04,1;

@xd 11 120 44 :: scavolbin 0.5 "2E FF 7C 65";
96, 10 16 00 10,1;
32, 10 14 41 54,1;

@xd 11 120 42 :: scavolbin 0.5 "FF 7A F5 87";
96,E6 E0 67 E8,1;
32,EE 60 B0 80,1;

>> DR2A;
@xd 11 120 35 :: scavolbin 0.5 "2B BB 64 7D";
96,F6 D4 86 4E,1;
32,DB 50 49 07,1;

@xd 11 120 38 :: scavolbin 0.5 "BC E8 E7 E1";
96,00 08 28 81,1;
32,00 2A 80 40,1;

@xd 11 120 42 :: scavolbin 0.5 "BF FD CF 8B";
96,86 90 25 D0,1;
32,9E B0 A8 78,1;

@xd 11 120 46 :: scavolbin 0.5 "FB 50 8F 97";
96,20 68 08 0C,1;
32,41 4A 44 82,1;


%
// VARIATIONS

>>DR1A;
preechobin(?DR1!,4,6,0.5,"07 7F 1F 20 2F ED C0 02 FF F2 C0 02 3F FD 60 00");
>>DR1B;
preechobin(?DR1!,4,6,0.5,"87 FE DB 80 1C E0 3F 7C 06 E8 15 F0 BC 7C 80 01");
>>DR1C;
preechobin(?DR1!,4,6,0.5,"04 FF FB D0 40 EB 04 AF BA 55 4A A3 1F F6 BF 10");
>> DR1D;
binab(?DR1B!,?DR1C!,"B5 BC B9 E8 B1 BD 4D 9D DB FC 5D FA 5B 0F 3C D4");

>> DR2B;
binab(?DR2!,?DR2A!,"BD F0 D6 E5 9B AD 9B 57 34 DE F7 F9 55 BE 35 E3");

>> DR2C;
binab(?DR2!,?DR2A!,not("BB D8 4E 3E 6C 65 FD 36 96 3B B7 9A F4 CF 3C FF"));