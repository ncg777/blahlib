// Degradation 20110817-4
// MACROS

% 
// SEQUENCER

T1|KK1|P4: SC1,
T1|KK1|P4: SC1,
T1|KK1|P4|SN1: SC1,
T1|KK1|DR1A|A1|SN1: SC1,
T1|KK1|DR1B|A1|SN1: SC1,
T1|KK1|DR2|SN1|K2: SC1,
T1|KK1|DR2A|SN1|P3: SC2,
T1|KK2|A1|SN1|K1: SC3,
T1|KK2|A1|SN1|K1: SC3,
T1|KK2|DR3C|SN1|P1|K1: SC3,
T1|KK2|DR4C|SN1|P2|K1: SC4,
T1|KK3|DR1C|A1|K2|SN1 : SC4,
T1|KK3|DR2B|A1|K2|SN1 : SC4,
T1|KK3|SN1|PR1 : SC4,
T1|KK3|SN1|PR2 : SC4,
T1|KK3|P4: SC4,

%
// CHORDS
SC1, 4-16A.02 4-z29B.03 4-20.09 4-8.09 4-z29A.02 4-13A.09 4-14B.10 4-z29A.02, 6, 4;
SC2, 4-23.05 4-22B.10 4-16B.01 4-14A.10 4-23.10 4-27A.00 4-8.02 4-z29A.07, 1, 4;
SC3, 4-27B.03 4-27A.01 4-13A.03 4-14B.04 4-11A.08 4-20.03 4-z29B.09 4-z29A.08, 0, 4;
SC4, 4-22A.03 4-22A.08 4-27A.05 4-23.03 4-14B.03 4-z29A.07 4-11B.03 4-z29A.07, 1, 4;

%
// PARTS
>> T1;
@t 128;
set, 135;

>>DR1;
@xd 10 120 36 :: scavolbin 0.5 "55 5A 8A B6 6E 8A AA BD";
128, 96 78: 1,1;

@xd 10 120 50 :: scavolbin 0.5 "7F 80 BF 10 00 36 FF 90";
128, 37 18 : 1 0,1;

@xd 10 120 44 :: scavolbin 0.5 "1F F6 E0 04 07 FF F0 01";
128, AB F8: 1 0,1;

@xd 10 120 42 :: scavolbin 0.5 "19 B9 93 99 39 33 9B 39";
128, F9 00 : 1 0, 1;

>>DR2;
@xd 10 120 36 :: scavolbin 0.5 "1F EC C0 05 FD F8 C0 05";
128, F6 80 49 7D: 1,1;

@xd 10 120 50 :: scavolbin 0.5 "5E D5 55 2D 55 4B 54 B5";
128, 0A FF FC 09 : 1 0,1;

@xd 10 120 44 :: scavolbin 0.5 "12 AA F5 59 12 AA C5 56";
128, EA AA E7 67: 1 0,1;

@xd 10 120 42 :: scavolbin 0.5 "19 3B 99 9B F6 46 99 9B";
128, F3 C8 00 DE : 1 0, 1;

>> SN1;
@xd 10 120 38;
128, 08 08, 1;

@xd 12 120 38;
128, 08 08, 1;

>> A1;
@xm 1 16+3 120;
128, FE 00 03 6F 7B 82 02 FF : 1, l : 0.25, -2 3 -1 3 -3 1 -3 3 -2 2 -2 1 -1 -2 2 -2 3 -1 2 -1 2 -2 -1 2 3 -3 1 -2 1 -1 -1 1;

>> P1;
@xm 2 20+2 120;
128, DB 2C DF 24 : 1 0 4, l,-2 2 5 -4 3 -2 -4 5 4 1 1 -3 -4 -1 3 4 -5 -3;

>> P2;
@xm 2 20+2 120;
128, FB AA AA D3 : 1 0 4, l, 1 2 -5 -4 -1 5 3 -4 -1 3 -2 2 5 -3 2 1 -2 -2 2 -2;

>> P3;
@xm 2 14+2 120;
128, BF D8 00 17 : 1 0 4, 1 , 1 5 -3 -4 3 -2 -3 4 -2 1 4 -4 2 -3 1;

>> P4;
@xm 2 14+2 120;
128, EF DA 80 1F BF 20 10 7F : 1 0 4, 1 , -4 4 -3 1 1 -3 3 2 -1 -2 3 -1 -4 4 3 -1 -2;

>> K1;
@xm 3 24+2 120;
128, DB 24: 1, l,-2 1 1 -2 -1 1 2 1 -1 -1 1 -1 -3 2 1 1 -2 1 -1 3 -1 -1 -1 -2 1 2 -1 2 2 -3 -1 2;

>> K2;
@xm 4 16 120 :: scavolbin 0.5 "3F 40 7B A0";
128, FE FC 00 16 23 F8 E0 01 : 1, l,1 -1 -1 2 -2 2 -2 -3 1 2 2 -1 1 -3 1 2 1 1 -3 1 -2 2 -1 -1 2 2 -2 -1, 1 -1;

>> PR1;
@xd 11 120 40 :: scavolbin 0.5 "36 72 72 63";
128, CD 88 99 D9, 1;

>> PR2;
@xd 11 120 37 :: scavolbin 0.5 "46 EC E6 44 46 EE 6E 6E 27 A7 66 36 62 47 66 CE";
128, B2 64 CD 9D, 1;

>>KK1;
@xd 12 120 39 :: scavolbin 0.5 "32 D5 A8 B8 0E AF F0 00";
128, F6 88  : 1 0 4,1;

@xd 12 120 37 :: scavolbin 0.5 "70 00 0F 8F F0 01 07 FB" ;
128, BC A4 : 1 0, 1;

@xd 12 120 31 :: scavolbin 0.5 "7F 80 3E 42 00 7F 5F 82" ;
128, AA D8 : 1 0, 1;

>>KK2;
@xd 12 120 39 :: scavolbin 0.5 "3F E2 00 72";
128, 97 58 : 1 0 4,1;

@xd 12 120 37 :: scavolbin 0.5 "39 C6 31 C5";
128,B7 F8: 1 0, 1;

@xd 12 120 31 :: scavolbin 0.5 "3F E4 1F F4";
128,E7 58 : 1 0 2, 1;

>>KK3;
@xd 12 120 39 :: scavolbin 0.5 "73 98 8C E2";
128, CF 20 : 1 0,1;

@xd 12 120 37 :: scavolbin 0.5 "4F B8 C5 32";
128,8F 90  : 1 0, 1;

@xd 12 120 31 :: scavolbin 0.5 "6E 66 EC C4";
128, F3 24 : 1 0 2, 1;

%
// VARIATIONS
>>DR1A;
scadurbin(?DR1!,0.5,"75 8C AA 8D");
>>DR1B;
preechobin(?DR1!,4,6,0.5,"67 32 CC C6 64 4E E6 EE E6 EE 4C EC B3 39 B3 B3");
>>DR1C;
preechobin(?DR1!,4,6,0.5,"7F FF F8 1E 8B 8A 69 AB 82 F5 F7 01 01 3E DE 00");

>> DR1D;
binab(?DR1B!,?DR1C!,"76 66 72 26 33 62 67 62 B3 35 32 37 22 67 77 62");

>>DR2A;
scadurbin(?DR2!,0.5,"7E 00 49 FF FC 20 06 7F FE 42 88 7D 7F 40 00 00");

>> DR2B;
binab(?DR2!,?DR2A!,"7F 00 07 EE 04 F9 FC A0 03 FF FE 11 33 7F FF E0");

>> DR2C;
binab(?DR2!,?DR2A!,not("7F 00 07 EE 04 F9 FC A0 03 FF FE 11 33 7F FF E0"));

>> DR3;
binab(?DR1!,?DR2!, "6D 3C");

>>DR3A;
scadurbin(?DR3!,0.5,"7D 60 00 2E FF 80 01 7F");

>> DR3B;
binab(?DR2!,?DR3A!,"7F C0 00 7C BF 80 E0 F2 87 C3 03 C7 EE 01 00 7E");

>> DR3C;
binab(?DR2!,?DR3A!,not("7F C0 00 7C BF 80 E0 F2 87 C3 03 C7 EE 01 00 7E"));


>> DR4;
binab(?DR1!,?DR2!, not("6E 80 04 3F"));

>>DR4A;
scadurbin(?DR4!,0.5,"68 00 07 FA C0 06 07 FA");

>> DR4B;
binab(?DR4!,?DR4A!,"78 00 F8 80 83 7B FD 10 0F DF F8 00 9F F0 03 F6");

>> DR4C;
binab(?DR4!,?DR4A!,not("78 00 F8 80 83 7B FD 10 0F DF F8 00 9F F0 03 F6"));


