// dft 20110817

// MACROS

% 
// SEQUENCER
T1|DR1:SC1,
T1|DR1:SC1,
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
T1|A1:SC2,
%
// CHORDS

SC1,4-23.09 4-23.04 4-8.01 4-27B.01,-1,8;
SC2,4-22A.05 4-14A.07 4-10.00 4-27B.09,3,8;
SC3,4-23.04 4-13A.06 4-10.04 4-27B.01,-1,8;
SC4,4-z29A.03 4-16B.04 4-26.08 4-27B.10,2,8;

%
// PARTS

>> T1;
@t 128;
swing, 150, 15;

>>A1;
@xm 1 14+2+2 120 :: scavolbin 0.5 "3B BA", scavolbin 0.5 "A3 B5 29 BF";
128, 86 AE : 1 0 , l,1 -2 1 1 -2 1 -3 1 2 2 -2 2 -4 2 -3 3,3 -2 1 -2;

>>A2;
@xm 1 14+2+2 120 :: scavolbin 0.5 "3B BA", scavolbin 0.5 "A3 B5 29 BF";
128, F8 E8 0F 83 : 1 0 , l,-4 2 1 4 -3 2 -2 1 -1 1 2 -1 -2 -3 1 2;

>>A3;
@xm 1 14+2+2 120 :: scavolbin 0.5 "3B BA", scavolbin 0.5 "A3 B5 29 BF";
128, DF F8 00 03 : 1 0 , l,-4 4 -3 4 -2 2 -1, -2 2 -2 -2 2 -3 3 2;

>>B1;
@xm 2 20+2 120;
128, F2 EF : 2, 2, -1 1 -1 -2 1 3 -2 -3 2 3 -2 1 :1 0 -5;

>>B2;
@xm 2 20+3 120;
128, F8 00 02 9F F6 21 0F FF : 1, l : 0.75, 3 4 -1 1 -4 2 -2 -2 2 1 -1 1 -2 1 -2 -1 :1 -1;


>> C1;
@xm 3 20 120;
128,AB B4,l,-1 4 -2 1 1 -2 -1 2 -2 2 -2 2 -2 2 -2 4 -2 -2;

>> C2;
@xm 3 20 120;
128,AB B4,l,4 3 -1 -2 -1 2 -1 3 -3 2 -2 -3 3 3 -3 1 -2 -3: 1 -1;


>> DR1;
@xd 10 120 35 :: scavolbin 0.5 "39 FA";
128, A6 F8 AC E2,1;

@xd 10 120 39 :: scavolbin 0.5 "2E ED";
128, CE DA CE F5,1;

>> DR1A;
@xd 10 120 35 :: scavolbin 0.5 "39 FA";
128, A6 F8 AC E2,1;

@xd 10 120 39 :: scavolbin 0.5 "2E ED";
128, CE DA CE F5,1;

@xd 10 120 38 :: scavolbin 0.5 "36 5D B3 93";
128,09 DF 80 00,1;

>> DR1B;
@xd 10 120 35 :: scavolbin 0.5 "39 FA";
128, A6 F8 AC E2,1;

@xd 10 120 39 :: scavolbin 0.5 "2E ED";
128, CE DA CE F5,1;

@xd 10 120 47;
128,F2 00 14 3F F1 04 07 FB,1

>>DR1C;
@xd 10 120 35 :: scavolbin 0.5 "39 FA";
128, A6 F8 AC E2,1;

@xd 10 120 39 :: scavolbin 0.5 "2E ED";
128, CE DA CE F5,1;

@xd 10 120 38 :: scavolbin 0.5 "36 5D B3 93";
128,09 DF 80 00,1;

@xd 10 120 47;
128,F2 00 14 3F F1 04 07 FB,1

>> DR2;
@xd 11 120 35 :: scavolbin 0.5 "3F 3D FC BE";
96,B7 74 12 32,1;
32,FE AE A8 25,1;

@xd 11 120 38 :: scavolbin 0.5 "FF F8 6F F7";
96,40 00 E1 49,1;
32,01 10 07 02,1;

@xd 11 120 42 :: scavolbin 0.5 "3F 3D FC BE";
96, B4 AC BA 94,1;
32,F5 6C 79 26,1;

@xd 11 120 46 :: scavolbin 0.5 "FF F8 6F F7";
96,08 00 04 08,1;
32,00 80 82 91,1;

>> DR2A;
@xd 11 120 35 :: scavolbin 0.5 "3F 3D FC BE";
96,D4 C0 69 38,1;
32,F6 F6 E8 B0,1;

@xd 11 120 38 :: scavolbin 0.5 "FF F8 6F F7";
96,00 00 90 83,1;
32,01 00 04 44,1;

@xd 11 120 42 :: scavolbin 0.5 "3F 3D FC BE";
96,DC F4 B1 F7,1;
32,9C DC C5 D3,1;

@xd 11 120 46 :: scavolbin 0.5 "FF F8 6F F7";
96,00 00 0A 00,1;
32,20 00 1A 00,1;


%
// VARIATIONS
>> DR1D;
binab(?DR1B!,?DR1C!,"FF A0 FF C1 03 7F FF 60 40 BB 11 EA AB AB 20 9F");

>> DR2B;
binab(?DR2!,?DR2A!,"FE 00 10 B7 EF F0 FF 0F 00 F7 01 3F F2 22 05 FF");

>> DR2C;
binab(?DR2!,?DR2A!,not("FE 00 10 B7 EF F0 FF 0F 00 F7 01 3F F2 22 05 FF"));