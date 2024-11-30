// Et maintenant 20110819

// MACROS

% 
// SEQUENCER
T1|DR5:SC1,
T1|DR6|A1:SC1,
T1|DR6A|D1:SC2,

T1|DR7|A1|C1:SC3,

T1|DR9|A1|B1:SC3,
T1|DR10|A1|B2:SC3,
T1|DR10A|A2|C2:SC4,

T1|DR1|A3|B1:SC4,
T1|DR2|A3|B2:SC4,
T1|DR3|A3|B3:SC4,
T1|DR4|A3|C3:SC1,
T1|DR1A|A4|B1|D1:SC1,
T1|DR2|A4|B2|D2:SC2,
T1|DR3A|A4|B3|D3:SC3,
T1|DR4|A4|B4|D4:SC4,
T1|DR4A|C4:SC1,



%
// CHORDS
SC1,4-z29B.00 4-22A.07 4-22A.02 4-23.02,0,8;
SC2,4-8.03 4-14A.01 4-11A.08 4-23.11,3,8;
SC3,4-26.05 4-21.11 4-10.08 4-23.03,-1,8;
SC4,4-23.04 4-14A.01 4-11A.03 4-23.01,1,8;

%
// PARTS
>> T1;
@ t 128;
swing, 145, 15;

>>A1;
@xm 1 16 100 :: scavolbin 0.75 "27 CE BB 61",scavolbin 0.5 "67 7D DB 6F";
128,DE 74 3F 5D : 1 0,l:0.5, -1 1 -1 1 -1 1 -1 -1 1 -1 1 1 -1 1 1 1 -2 -1 1 -1 1;


>>A2;
@xm 1 16 100 :: scavolbin 0.5 "95 BF 5F 73 DF FE 73 F9 8B F7 DF 2D ED F5 ED FD";
128,E5 F4 FB C8 : 1 0,l:0.5,-1 -2 1 2 1 -2 1 -1 -2 2 -1 1 1 -1 1 -1 1 -2 1 1;


>>A3;
@xm 1 16 100 :: scavolbin 0.5 "95 BF 5F 73 DF FE 73 F9 8B F7 DF 2D ED F5 ED FD";
128, EC F8 CF 2F : 1 0,l:0.5,1 -1 1 -2 1 1 -2 2 -1 1 1 -2 2 -1 -1 1 -1 -2 2 1 -1;

>>A4;
@xm 1 16 100 :: scavolbin 0.5 "95 BF 5F 73 DF FE 73 F9 8B F7 DF 2D ED F5 ED FD";
128, FF 6A 5D 4F : 1 0,l:0.5,1 -1 -2 1 1 -1 2 -2 1 -1 2 -1 -1 1 1 -1 1 1 -2 1 -2 1;



>> B1;
@xm 2 20 100;
128,EE B4 D6 F5 : 4 0 2,l ,1 -2 1 1 -1 1 -1 2 -1 -2 1 1 3 -3 -1 -2 -1 3 1 1 -2;

>> B2;
@xm 2 20 100;
128,D6 FC AF 7C: 4 0 2,l ,-1 2 -1 -2 2 1 -1 -1 1 -1 -3 2 2 -1 -2 2 -2 3 -2 2 -1 1;

>> B3;
@xm 2 22 100;
128,BB B8 D9 EF : 4 0 2,l ,-1 1 -1 1 -1 -2 2 -2 2 3 -2 -1 -1 1 1 -1 1 -1 1 -1 -1 2;

>> B4;
@xm 2 22 100;
128,F6 F8 CB F7: 4 0 2,l ,-1 1 -2 1 -2 3 -2 3 -1 2 -3 1 2 1 1 -1 -3 -1 1 -1 -2 2 1;

>> C1;
@xm 3 20+2 120;
128, 37 FD 5D FD AB DB D5 F9 :2,l : 0.5,-2 1 1 -1 -2 2 -2 -1 2 1 -1 1 1 -1 -1 1 -1 1 1 -1 -1 1 1 -2 1 1 -1 -1 2 1 -2 -1 2 2 -2 -1 -1 2 -2 1 -1 2 -1 1 1 -1;

>> C2;
@xm 3 20+2 120;
128, 2D DD 74 6F EF 0E FC B8 :2,l : 0.5,-1 2 1 -1 -1 1 -1 1 -1 -1 1 -1 -1 1 2 -1 1 1 -2 1 -1 -1 2 -1 1 -2 -2 2 1 -1 1 -1 -1 1 2 -1 -1 1 1 -1;

>> C3;
@xm 3 20+2 120;
128,2E 7E F5 76 53 EF 7C EB:2,l : 0.5,-1 1 2 -1 -1 1 -1 -1 2 -2 2 -1 -1 1 1 -2 -1 -1 2 2 -1 -1 2 -1 -1 2 -1 1 -1 1 -1 -1 1 -2 2 -1 1 -1 1 1 1 -1 -1;

>> C4;
@xm 3 20+2 120;
128, B7 FA 9A B7 7C 6F BF D9 :2,l : 0.5,2 1 -1 -2 -1 1 1 -1 -1 1 -1 -1 1 1 -1 2 -1 -1 1 -1 1 -1 -1 1 -1 1 -1 -2 2 1 1 -2 1 1 -1 -2 2 1 -1 -1 -1 1 1 -1 2;

>> D1;
@xm 4 18 120 ;
128,FE F0 : 1 0,l:1.25,2 -1 -2 -1 -1 -2 1 3 -3 2 2;


>> D2;
@xm 4 18 120;
128,B6 FC : 1 0,l:1.25,3 1 -2 -1 -2 -2 1 -1 2 -1 2;


>> D3;
@xm 4 18 120 ;
128,BC 98 : 1 0,l:1.25,2 1 2 -1 -1 1 -2 -2;


>> D4;
@xm 4 18 120 ;
128,FE BA : 1 0,l:1.25,-1 -1 1 2 -3 -1 -1 -1 2 3 2 -2;


>>DR1;
@xd 10 120 36 :: scavolbin 0.75 "35 FF 33 7C",scavolbin 0.5 "C4 DB 9C D4";
96,88 28 2C E0,1;
32,80 08 02 B2,1;

@xd 10 120 42 :: scavolbin 0.75 "27 A6 6C 5D",scavolbin 0.5 "A7 9B E7 C7";
96,7C A8 A3 85,1;
32,68 20 F8 C2,1;

@xd 10 120 44 :: scavolbin 0.75 "39 7A E4 6D",scavolbin 0.5 "A7 BD FF 99";
96,81 00 08 22,1;
32,95 8C 07 21,1;

@xd 10 120 40 :: scavolbin 0.75 "85 CF E6 F0",scavolbin 0.5 "68 FE 37 FD";
96, 75 90 53 07,1;
32,76 D4 34 4D,1;

>>DR2;
@xd 10 120 36 :: scavolbin 0.75 "35 FF 33 7C",scavolbin 0.5 "C4 DB 9C D4";
96,A9 20 84 04,1;
32,81 00 52 42,1;

@xd 10 120 42 :: scavolbin 0.75 "27 A6 6C 5D",scavolbin 0.5 "A7 9B E7 C7";
96,4D E8 91 90,1;
32,0F 3C C4 8B,1;

@xd 10 120 44 :: scavolbin 0.75 "39 7A E4 6D",scavolbin 0.5 "A7 BD FF 99";
96,4D E8 91 90,1;
32,A4 08 44 14,1;

@xd 10 120 40 :: scavolbin 0.75 "85 CF E6 F0",scavolbin 0.5 "68 FE 37 FD";
96, 12 58 13 D9,1;
32, 48 E0 8B A3,1

@xd 10 110 37 :: scavolbin 0.75 "37 9D F7 EF",  scavolbin 0.5 "1F DF 17 3F";
128,3E 75 1D B5 2D FB ED 4F 13 43 F6 D3 5B FC CE 7F,1;

>>DR3;
@xd 10 120 36 :: scavolbin 0.75 "B6 FA 5F E7",scavolbin 0.5 "6F BD BF 34";
96,8D AC 02 10,1;
32,82 20 26 16,1;

@xd 10 120 42 :: scavolbin 0.5 "2F EE BF 59",scavolbin 0.5 "7B ED B3 EB";
96,80 20 30 42,1;
32,A6 00 20 34,1;

@xd 10 120 44 :: scavolbin 0.5 "3B 5B F8 77",scavolbin 0.5 "7A F2 F5 99";
96,77 CA CB 91,1;
32,90 88 1D 00,1;

@xd 10 120 40 :: scavolbin 0.5 "3B FA B5 9D",scavolbin 0.5 "7D FD 6E 8F";
96, 50 10 A1 A1,1;
32,6B 50 A2 75,1;

@xd 10 110 53 :: scavolbin 0.75 "DD FC E9 FE", scavolbin 0.5 "3A F9 6C AF";
128,AF EF DE E2 BF 8E E9 AF FF 8D 6F 63 4B DF FE DB,1;

>>DR4;
@xd 10 120 36 :: scavolbin 0.75 "65 7C 7A 32",scavolbin 0.5 "E7 6D 7D 73";
96,80 90 00 3A,1;
32,80 30 32 E4,1;

@xd 10 120 42 :: scavolbin 0.75 "7D F6 BF F9", scavolbin 0.5 "E7 E6 BC B8";
96,80 84 24 80,1;
32,A8 88 F0 A9,1;

@xd 10 120 44 :: scavolbin 0.75 "76 B6 FF FB",scavolbin 0.5 "67 FE E5 DE";
96,76 68 12 6E,1;
32,52 64 06 52,1;

@xd 10 120 40 :: scavolbin 0.75 "55 FE B6 3B",scavolbin 0.5 "A7 FD DB FB";
96, 51 00 F1 C1,1;
32, 1C 88 0D 18,1;

@xd 10 110 39 :: scavolbin 0.75 "7C EA 41 C9", scavolbin 0.5 "C7 CD FD F4";
128,FC E8 ED ED F5 C5 F3 FB 7D FC ED AF 6B 3F DA BC,1;


%
// VARIATIONS

>> DR5;
binab(?DR1!,?DR2!,"FE D8 EE B6 B7 A3 4F FF E7 DA BF C7 9A 3F B6 2E",1);

>> DR6;
binab(?DR1!,?DR3!,"FE D8 EE B6 B7 A3 4F FF E7 DA BF C7 9A 3F B6 2E",1);

>> DR7;
binab(?DR1!,?DR4!,"FE D8 EE B6 B7 A3 4F FF E7 DA BF C7 9A 3F B6 2E",1);

>> DR8;
binab(?DR2!,?DR3!,"FE D8 EE B6 B7 A3 4F FF E7 DA BF C7 9A 3F B6 2E",1);

>> DR9;
binab(?DR2!,?DR4!,"FE D8 EE B6 B7 A3 4F FF E7 DA BF C7 9A 3F B6 2E",1);

>> DR10;
binab(?DR3!,?DR4!,"FE D8 EE B6 B7 A3 4F FF E7 DA BF C7 9A 3F B6 2E",1);

>> DR1A;
chanbin(?DR1!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR2A;
chanbin(?DR2!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR3A;
chanbin(?DR3!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR4A;
chanbin(?DR4!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR5A;
chanbin(?DR5!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR6A;
chanbin(?DR6!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR7A;
chanbin(?DR7!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR8A;
chanbin(?DR8!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR9A;
chanbin(?DR9!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");

>> DR10A;
chanbin(?DR10!,11,"E7 EC FE FB B6 DF F3 EE EB F9 67 ED 27 EF BF 6D");