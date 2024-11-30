// Predicate 20110816

// MACROS

% 
// SEQUENCER

T1|KK1|A1,
T1|KK1|A1: SC1,
T1|KK1|A1|SN1: SC1,
T1|KK1|A1|SN1: SC1,
T1|KK1|A1|SN1: SC1,
T1|KK1|DR1A|A1|SN1|K2: SC1,
T1|KK1|DR2|A1|SN1|K2: SC1,
T1|KK1|DR2|A1|SN1|K2: SC1,
T1|KK1|DR2|A1|SN1|K2: SC1,
T1|KK1|DR2A|A1|SN1|K2: SC2,
T1|KK2|A1|SN1: SC3,
T1|KK2|A1|SN1: SC3,
T1|KK2|DR3|A1|SN1|P1: SC3,
T1|KK2|DR3|A1|SN1|P1: SC3,
T1|KK2|DR3|A1|SN1|P1|K2: SC3,
T1|KK2|DR4|A1|SN1|P2|K2: SC3,
T1|KK2|DR4|A1|SN1|P2|K2: SC3,
T1|KK2|DR4|A1|SN1|P2|K2: SC4,
T1|KK3|A1|SN1 : SC4,
T1|KK3|A1|SN1 : SC4,
T1|KK3|A1|SN1|K2|PR1 : SC4,
T1|KK3|A1|SN1|K2|PR1 : SC4,
T1|KK3|A1|SN1|K2|PR2 : SC4,
T1|KK3|A1|SN1|K2|PR2 : SC4,
T1|KK3|P4: SC4,
T1|P4: SC1,
%
// CHORDS
SC1, 4-16A.10 4-23.01 4-14B.01 4-13A.05, 6, 8;
SC2, 4-z29A.05 4-26.05 4-11B.01 4-13A.00, 11, 8;
SC3, 4-13B.11 4-11B.07 4-21.05 4-13A.11, 0, 8;
SC4, 4-23.02 4-21.07 4-26.01 4-13A.01, 10, 8;


%
// PARTS
>> T1;
@t 128;
set, 150;

>>DR1;
@xd 10 120 36 :: scavolbin 0.5 "3F FA A8 AB FF A3 C0 5B 00 3D FF D3 80 37 7F F0";
128, BE 00 03 BF: 1,1;

@xd 10 120 50 :: scavolbin 0.5 "00 00 8D F0 72 0F EC 7F D8 1F EF FF D8 77 20 7F";
128, 4C D9 B3 26 : 1 0,1;

@xd 10 120 44 :: scavolbin 0.5 "FF E8 80 4F 7F 90 9F 83 E0 37 E1 FF F6 00 00 3E";
128, F7 48 60 3B: 1 0,1;

@xd 10 120 42 :: scavolbin 0.5 "6A D5 6A D7 AA 14 5A AB 5B 54 AD E9 42 F5 52 AD";
128, FF E8 FF 00 : 1 0, 1;

>>DR2;
@xd 10 120 36 :: scavolbin 0.5 "7C 80 FB 00 91 F7 FF 82 24 3F FF A1 83 BF 04 FD";
128, AA AC 95 AA: 1,1;

@xd 10 120 50 :: scavolbin 0.5 "36 00 47 FF 02 FE DE 09 01 6F FE 11 0F FF 00 BC";
128, 0B FF FB 04 : 1 0,1;

@xd 10 120 44 :: scavolbin 0.5 "33 39 39 B9 B3 9B 9B 33 9B BB 99 1B 9B 11 93 39";
128, BF 00 3B F8: 1 0,1;

@xd 10 120 42 :: scavolbin 0.5 "27 76 26 76 73 63 62 73 76 62 36 76 B3 31 77 62";
128, E2 4F 2D A4 : 1 0, 1;

>> SN1;
@xd 10 120 38;
128, 08 08, 1;

@xd 12 120 38;
128, 08 08, 1;

>> A1;
@xm 1 16 120;
128, F2 00 1F 7E, 1, -1 1 -1 -1 3 -1 2 -2, 1 3 -3 -1;

>> P1;
@xm 2 24+2 120;
128, A7 A8 : 1 0 4, 1,-1 1 -3 -1 2 -2 2 2;

>> P2;
@xm 2 24+2 120;
128, BB 5C AA D4 : 1 0 4, 1, 3 -3 -1 1 3 -1 -2;

>> P3;
@xm 2 24+2 120;
128, FF 20 14 FC BE 40 00 BB : 1 0 4, 1 , 1 -3 1 3 -1 1 -3 1 1 -1 -1 1;

>> P4;
@xm 2 24+2 120;
128, EF E0 80 17 F9 F4 E0 71 8F 80 12 FF E0 00 27 FF : 1 0 4, 1 , 3 1 -1 -3 1 -1 2 -2;

>> K1;
@xm 3 16+2+2+2 120 :: arp 1 2 0, scadur 0.75, scavolbin 0.5 "A3 48";
128, 80 00 1D FE 5E 00 00 EB : 2, 0;

>> K2;
@xm 4 16 120 :: scavolbin 0.5 "6D 55";
128, AB 74 : 1, 1,-4 1 1 1 -2 -1 4 -3 3,-1 -2 4 -1;

>> PR1;
@xd 11 120 48 :: scavolbin 0.75 "77 E0 2A D7";
128, 09 F3 F6 0C 09 F3 E7 00, 1;

>> PR2;
@xd 11 120 37 :: scavolbin 0.75 "77 E0 2A D7";
128, 4B 6F AC B6 D3 65 AC B6, 1;

>>KK1;
@xd 12 120 39 :: scavolbin 0.5 "AB 34";
128, E4  : 1 0 4,1;

@xd 12 120 37 :: scavolbin 0.5 "DC 48" ;
128, BC  : 1 0, 1;

@xd 12 120 31 :: scavolbin 0.5 "2F E4" ;
128, DE  : 1 0, 1;

>>KK2;
@xd 12 120 39 :: scavolbin 0.5 "D5 94";
128, DF  : 1 0 4,1;

@xd 12 120 37 :: scavolbin 0.5 "CB 24";
128, B0  : 1 0, 1;

@xd 12 120 31 :: scavolbin 0.5 "B5 AA";
128, 99  : 1 0 2, 1;

>>KK3;
@xd 12 120 39 :: scavolbin 0.5 "9B E0";
128, BF  : 1 0,1;

@xd 12 120 37 :: scavolbin 0.5 "FA AC";
128, F6  : 1 0, 1;

@xd 12 120 31 :: scavolbin 0.5 "3E CA";
128, E0  : 1 0 2, 1;

%
// VARIATIONS
>>DR1A;
scadurbin(?DR1!,0.5,"D5 AF 6A 53 F0 A9 D5 55");

>>DR2A;
scadurbin(?DR2!,0.5,"D5 AF 6A 53 F0 A9 D5 55");


>> DR3;
binab(?DR1!,?DR2!, "2F 8A");

>> DR4;
binab(?DR1!,?DR2!, not("2F 8A"));