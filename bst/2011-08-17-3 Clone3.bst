// Clone3 20110817

// MACROS

% 
// SEQUENCER

T1|DR1A|A1:SC2,
T1|DR1B|B1|A1:SC1,
T1|DR1B|B1|A1:SC1,
T1|DR1C|B2|DR2|A2:SC2,
T1|DR1C|B2|DR2|A2:SC2,
T1|DR1D|B2|DR2B|A2|C1:SC1,
T1|DR1D|B2|DR2B|A2|C1:SC3,
T1|DR1D|B2|DR2C|A3|C2:SC1,
T1|DR1D|B2|DR2C|A3|C2:SC3,
T1|B2|A1|C2:SC1,
T1|DR1D|B2|DR2B|A2|C1:SC2,
T1|DR1D|B2|DR2B|A2|C1:SC4,
T1|DR1D|B2|DR2C|A3|C2:SC2,
T1|DR1D|B2|DR2C|A3|C2:SC4,
T1|B2|A3|C2:SC4,
T1|B2|A1:SC4,

%
// CHORDS

SC1,4-11A.11 4-22B.02 4-10.02 4-10.09,1,8;
SC2,4-20.06 4-10.09 4-16B.00 4-10.04,6,8;
SC3,4-26.05 4-11B.08 4-26.07 4-10.10,0,8;
SC4,4-23.05 4-22B.00 4-z29A.07 4-10.00,10,8;

%
// PARTS

>> T1;
@t 128;
swing, 135,5;

>>A1;
@xm 1 16 120 :: scavolbin 0.5 "6F 6D 36 2F", scavolbin 0.5 "47 DF CB AB F6 70 D5 97";
128, EE FC 6F 78 D7 8E AC 7C : 1 0 , l,2 -2 0 2 -1 1 -2 1 -1 -1 2 -1 2 -1 1 0 0 -2 1 0 1 -1 2 -2 1 -1 -1 1 2 2 0 -1 1 -1 0 -3 -1 0 1 -1 0,1 -1;

>>A2;
@xm 1 16 120 :: scavolbin 0.5 "79 6A F3 E2", scavolbin 0.5 "26 B7 6A 72 FC C6 A7 9B";
128, DE F4 ED D7 5C 1B DE 6F : 1 0 , l,1 -1 0 1 1 0 -2 2 1 0 -1 1 -1 2 1 -1 0 -2 -1 0 1 0 0 -2 1 -1 1 -1 1 -2 1 0 1 0 -1 1 1 -2 2 0 0 -2 0, -1 1;

>>A3;
@xm 1 16 120 :: scavolbin 0.5 "27 2B 36 AC", scavolbin 0.5 "4D 78 DA 39 5F 1D F1 EE";
128, EB 78 F9 28 70 6F B4 F6 : 1 0 , l,-1 0 -1 1 0 -1 -1 1 2 0 0 1 0 -2 1 -2 2 -1 0 0 0 -1 0 -2 1 1 -2 2 1 -1 0 2 -1 0 1 -1 1,-1 1 ;

>>B1;
@xm 2 16+2 120;
128, C7 FD : 1, l:0.5, 2 -3 -1 4 3 -1 -3 2 1 -3 2 -3,-1 2 1 -1 -2 1 2 -2 ;

>>B2;
@xm 2 16+2 120;
128, AA FC 7B 2E DD 59 63 41 : 1, l : 0.5, 3 -3 -2 1 2 -1 -3 3 2 -4 2 2 -2 -1 2 -1 -4 4:1,2 1 -1 -2  ;


>> C1;
@xm 3 20+2+2 120;
128,BD 78,l,3 -3 1 -1 2 -1 -2 2 -2 2 -3 3 1 -2 1 -3 2 1 2 -3,-1 2 -2 1 ;

>> C2;
@xm 3 20+2+2 120;
128,DF FA,l,-1 -4 2 -4 2 3 -4 3 -2 1 -1 4 1,1 -1 1 2 -1 1 -1 -2 ;


>> DR1;
@xd 10 120 35 :: scavolbin 0.5 "6A DE 6D AE";
96,BB B0 91 82,1;
32,CC 74 A2 C4,1;

@xd 10 120 38 :: scavolbin 0.5 "CF D0 F5 E3";
96,40 00 0A 49,1;
32,21 08 51 11,1;

@xd 10 120 44 :: scavolbin 0.5 "7F 74 F5 8E";
96, F9 94 17 59,1;
32, F9 24 A7 49,1;

@xd 10 120 42 :: scavolbin 0.5 "FD 7A EE 25";
96,02 22 68 80,1;
32,04 92 40 20,1;



>> DR2;
@xd 11 120 35 :: scavolbin 0.5 "5C 9C FB 8F";
96,DA 08 C4 90,1;
32,90 A8 52 44,1;

@xd 11 120 38 :: scavolbin 0.5 "DF 7A FE AB";
96,20 90 31 00,1;
32,29 10 88 81,1;

@xd 11 120 44 :: scavolbin 0.5 "5D 72 B0 DF";
96, CD C8 45 0D,1;
32, CF A0 B1 99,1;

@xd 11 120 42 :: scavolbin 0.5 "DC F0 A1 F3";
96,12 22 08 00,1;
32,00 04 00 24,1;

>> DR2A;
@xd 11 120 35 :: scavolbin 0.5 "FC B0 D9 9F";
96,CA E4 06 83,1;
32,BB 3C 26 0B,1;

@xd 11 120 38 :: scavolbin 0.5 "BC E8 E7 E1";
96,25 00 E1 28,1;
32,25 00 E1 28,1;

@xd 11 120 42 :: scavolbin 0.5 "76 5C CF E2";
96,E9 D0 07 D3,1;
32,CA 90 04 4F,1;

@xd 11 120 46 :: scavolbin 0.5 "DB BA 5D 4F";
96,02 0A 28 00,1;
32,20 68 8A 00,1;


%
// VARIATIONS

>>DR1A;
preechobin(?DR1!,4,6,0.5,"1F FF E2 1C 1E 47 C1 F8 3F 02 41 F8 81 F9 F8 0F");
>>DR1B;
preechobin(?DR1!,4,6,0.5,"DF DF E0 02 B6 D7 49 6A D6 90 14 AB 75 2A 77 75");
>>DR1C;
preechobin(?DR1!,4,6,0.5,"5E D5 6A 91 6A 35 AA D5 95 CA D5 4A D5 CA B5 2A");
>> DR1D;
binab(?DR1B!,?DR1C!,"E5 E4 F9 BA 73 EF AF 5F E7 E4 F7 61 9B 8B A7 2F");

>> DR2B;
binab(?DR2!,?DR2A!,"A6 E4 6B 3B BD 8E 91 D0 D7 D3 B4 76 9D 9F 50 DC");

>> DR2C;
binab(?DR2!,?DR2A!,not("A6 E4 6B 3B BD 8E 91 D0 D7 D3 B4 76 9D 9F 50 DC"));