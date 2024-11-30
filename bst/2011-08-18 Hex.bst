// hex 20110818

// MACROS

% 
// SEQUENCER
T1|B1|D1:SC1,
T1|DR1|A1:SC1,
T1|DR2|A1:SC1,
T1|DR2A|D1:SC2,

T1|DR3|A3|B1:SC2,
T1|DR4|A3|B2:SC2,

T1|DR4A|A1|C1:SC3,

T1|DR5|A1|B1:SC3,
T1|DR6|A1|B2:SC3,
T1|DR6A|A2|C2:SC4,

T1|DR7|A3|B1:SC4,
T1|DR8|A3|B2:SC4,
T1|DR9|A3|B3:SC4,
T1|DR10|A3|C3:SC1,
T1|DR7A|A4|B1|D1:SC1,
T1|DR8|A4|B2|D2:SC2,
T1|DR9A|A4|B3|D3:SC3,
T1|DR10|A4|B4|D4:SC4,
T1|DR10A|C4:SC1,



%
// CHORDS
SC1,4-26.03 4-22B.03 4-16A.10 4-22B.08,2,8;
SC2,4-14A.10 4-16A.05 4-21.06 4-22B.10,0,8;
SC3,4-23.07 4-8.04 4-26.02 4-22B.09,1,8;
SC4,4-22B.07 4-16A.02 4-14B.10 4-22B.00,10,8;

%
// PARTS
>> T1;
@ t 128;
set, 140;

>>A1;
@xm 1 16 100 :: scavolbin 0.5 "95 BF 5F 73 DF FE 73 F9 8B F7 DF 2D ED F5 ED FD";
128,FF,l,3 1 -1 -1 2 -2 -1 1 1 -1 1 -1 3 -2 -1 -2;


>>A2;
@xm 1 16 100 :: scavolbin 0.5 "95 BF 5F 73 DF FE 73 F9 8B F7 DF 2D ED F5 ED FD";
128,FF,l,1 1 2 -4;


>>A3;
@xm 1 16 100 :: scavolbin 0.5 "95 BF 5F 73 DF FE 73 F9 8B F7 DF 2D ED F5 ED FD";
128, FF,l, 1 2 -1 -1 2 -1 -1 -1;

>>A4;
@xm 1 16 100 :: scavolbin 0.5 "95 BF 5F 73 DF FE 73 F9 8B F7 DF 2D ED F5 ED FD";
128, FF,l,-1 -1 1 1 -2 2 1 -1;



>> B1;
@xm 2 22 100 :: scadurbin 3 "47 7F E3 4F D7 27 77 E5 71 7F BE 9E E7 4F B8 BC";
128,FD 7C 2E B7 ED EF DC BF : 1,l:0.5 , -1 1 1 0 -2 0 -3 3 1 -2 -1 2 2 -1 0 0 -3 2 0 1 0 -1 2 0 -2 2 0 -2 2 -2 0 0 1 0 1 1 1 -3 1 -2 1 -2 3 -2 2 1 -2;

>> B2;
@xm 2 22 100 :: scadurbin 3 "9F 3A DF C7 F5 9F 8F 7D AF 37 8F DA DD F0 95 97";
128,FD 7C 2E B7 ED EF DC BF: 1,l:0.5 , 0 -3 1 3 1 -2 1 -2 1 2 -2 1 1 0 -2 0 -2 3 1 1 -2 -1 0 1 -1 2 0 0 0 0 -2 2 0 0 0 -1 -1 1 -1 0 0 1 0 1 -2 0 0;

>> B3;
@xm 2 22 100 :: scadurbin 3 "47 7F E3 4F D7 27 77 E5 71 7F BE 9E E7 4F B8 BC";
128,EF EA BF DC 6B FA B5 F9 : 1,l:0.5 ,2 0 0 1 -2 1 -1 -2 2 0 -1 2 -2 1 0 2 1 -2 2 -2 -1 -1 2 0 -1 0 0 -3 2 0 2 -1 1 -2 2 0 0 -1 0 -1 2 0 0 -2 2 -2;

>> B4;
@xm 2 22 100 :: scadurbin 3 "9F 3A DF C7 F5 9F 8F 7D AF 37 8F DA DD F0 95 97";
128,E7 D4 EC 7D BF CB 9E B8: 1,l:0.5 , -2 0 3 0 0 2 2 0 0 -2 -2 2 -2 0 0 -2 2 1 3 2 -2 1 -1 -2 2 0 -2 2 -2 -2 2 0 1 1 1 -1 -3 1 0 0 -2 -1;

>> C1;
@xm 3 20+2 120;
128, F6 EA EF CF 5B 77 FD 9E :2,l : 0.5,-1 -1 0 1 1 -1 -1 -1 1 1 2 2 0 1 -2 -2 0 -2 0 1 0 -1 0 1 -1 2 -1 0 0 1 -1 -1 0 -2 -2 1 0 1 2 0 -1 2 0 1 0 0 0;

>> C2;
@xm 3 20+2 120;
128, F6 EA EF CF 5B 77 FD 9E :2,l : 0.5,0 -1 -1 -1 1 0 2 0 -1 -1 2 -2 1 1 -2 2 -1 2 -2 -1 2 0 -1 -1 2 -1 0 -1 2 -2 1 2 -1 -2 1 -1 -2 1 1 2 -1 0 1 0 -1 0 1;

>> C3;
@xm 3 20+2 120;
128, F6 EA EF CF 5B 77 FD 9E :2,l : 0.5,-1 1 0 1 0 0 -1 1 0 -2 0 0 1 -2 1 -1 1 0 -2 0 2 0 1 1 1 -1 -2 1 -1 1 0 -1 1 0 -1 1 1 0 0 -2 0 1 0 0 -1 2 -1;

>> C4;
@xm 3 20+2 120;
128, F6 EA EF CF 5B 77 FD 9E :2,l : 0.5,-1 1 1 -1 -2 1 -2 1 1 1 0 0 1 -2 1 -1 0 -1 0 1 1 -1 1 -1 0 1 0 -1 0 -1 0 1 1 0 0 -2 0 0 1 -1 -1 -1 2 0 1 -1 2;

>> D1;
@xm 4 18+2+2 120 ;
128,9A F8 : 8 0 4,l,1 -2 2 2 2 1 -1 -2 -3;


>> D2;
@xm 4 18+2+2 120;
128,EB C8 : 8 0 4,l,3 -3 -1 -3 -2 3 1 1 1;


>> D3;
@xm 4 18+2+2 120 ;
128,E5 74 : 8 0 4,l,2 -1 -2 -2 -1 -1 1 2 2;


>> D4;
@xm 4 18+2+2 120 ;
128,BC E8 : 8 0 4,l,-1 2 3 -2 -1 -3 -2 2 2;


>>DR1;
@xd 10 120 36 :: scavolbin 0.5 "7B 78 7A BB";
96,80 88 41 44,1;
32,80 44 B2 80,1;

@xd 10 120 42 :: scavolbin 0.5 "FF DC BE 8F";
96,7C A8 A3 85,1;
32,68 20 F8 C2,1;

@xd 10 120 44 :: scavolbin 0.5 "37 AE D3 9B";
96,81 00 08 22,1;
32,95 8C 07 21,1;

@xd 10 120 40 :: scavolbin 0.5 "FE 98 D3 7E";
96, 6D 34 B8 A1,1;
32,35 98 4D 27,1;

>>DR2;
@xd 10 120 36 :: scavolbin 0.5 "6F 6E 57 1B";
96,80 00 04 04,1;
32,3A 60 E2 25,1;

@xd 10 120 42 :: scavolbin 0.5 "6E 7A 57 FB";
96,2C AC C3 C5,1;
32,0F 3C C4 8B,1;

@xd 10 120 44 :: scavolbin 0.5 "EF 7C 37 17";
96,90 40 00 38,1;
32,A0 40 20 60,1;

@xd 10 120 40 :: scavolbin 0.5 "BF 38 7F 77";
96, 37 FC 63 2B,1;
32, 40 12 14 10,1;

@xd 10 90 37 :: scavolbin 0.5 "BF 38 7F 77";
128,2B FB AF 7E ED CF C5 CF F6 A3 AC FC FE FF 3D DF,1;

>>DR3;
@xd 10 120 36 :: scavolbin 0.5 "7F 5D AF 6C";
96,80 02 00 04,1;
32,84 22 B2 A0,1;

@xd 10 120 42 :: scavolbin 0.5 "EB DA B5 79";
96,65 64 3F 10,1;
32,A6 00 20 34,1;

@xd 10 120 44 :: scavolbin 0.5 "3A 7A 76 FF";
96,80 80 80 28,1;
32,58 68 19 09,1;

@xd 10 120 40 :: scavolbin 0.5 "DD FC E9 FE";
96, 56 C4 65 AC,1;
32,6A CC 01 16,1;

@xd 10 90 53 :: scavolbin 0.5 "DD FC E9 FE";
128,AF EF DE E2 BF 8E E9 AF FF 8D 6F 63 4B DF FE DB,1;

>>DR4;
@xd 10 120 36 :: scavolbin 0.5 "7E B2 F7 DA";
96,B2 80 0C 02,1;
32,65 64 E2 13,1;

@xd 10 120 42 :: scavolbin 0.5 "7F BE E9 EF";
96,84 14 04 00,1;
32,90 8A 08 8A,1;

@xd 10 120 44 :: scavolbin 0.5 "FB E8 93 D5";
96,38 E0 49 5F,1;
32,6F 64 C6 11,1;

@xd 10 120 40 :: scavolbin 0.5 "DF 9C EE EF";
96, 45 78 B1 3C,1;
32, 65 64 E2 13,1;

@xd 10 90 39 :: scavolbin 0.5 "DD FC E9 FE";
128,CF DE DB 7D F5 FB ED DF 47 FF DF 49 F3 D1 DB F3,1;


%
// VARIATIONS

>> DR5;
binab(?DR1!,?DR2!,"FD FA C7 DF CA F7 6B DE 67 BF BC EE B7 D3 5F CD",1);

>> DR6;
binab(?DR1!,?DR3!,"FD FA C7 DF CA F7 6B DE 67 BF BC EE B7 D3 5F CD",1);

>> DR7;
binab(?DR1!,?DR4!,"FD FA C7 DF CA F7 6B DE 67 BF BC EE B7 D3 5F CD",1);

>> DR8;
binab(?DR2!,?DR3!,"FD FA C7 DF CA F7 6B DE 67 BF BC EE B7 D3 5F CD",1);

>> DR9;
binab(?DR2!,?DR4!,"FD FA C7 DF CA F7 6B DE 67 BF BC EE B7 D3 5F CD",1);

>> DR10;
binab(?DR3!,?DR4!,"FD FA C7 DF CA F7 6B DE 67 BF BC EE B7 D3 5F CD",1);

>> DR1A;
chanbin(?DR1!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR2A;
chanbin(?DR2!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR3A;
chanbin(?DR3!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR4A;
chanbin(?DR4!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR5A;
chanbin(?DR5!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR6A;
chanbin(?DR6!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR7A;
chanbin(?DR7!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR8A;
chanbin(?DR8!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR9A;
chanbin(?DR9!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");

>> DR10A;
chanbin(?DR10!,11,"EB F4 D9 D3 BA 36 3E FF 2C 7F FE 3D 1D 39 53 7F");