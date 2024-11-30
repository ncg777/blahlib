// xs 20110820

// MACROS

% 
// SEQUENCER
T1|DR1|A1:SC1,
T1|DR1A|A1|B1:SC1,
T1|DR2|A1|B1:SC2,
T1|DR2A|A1|B1:SC2,
T1|DRB1|A1|C1:SC2,
T1|DR3|A2|C2:SC3,
T1|DR3A|A2|B2|C2:SC3,
T1|DR4|A2|B2|D1:SC3,
T1|DR4A|A2|B2|D2:SC3,
T1|DR5|A3|B3:SC4,
T1|DR5A|A4|B4:SC4,
T1|DR6|A4|C1:SC3,
T1|DR6A|A3|C2:SC3,
T1|DR7|A4|C3:SC3,
T1|DR7A|A4|B4|C4:SC3,
T1|DR8|A4|B1|C1|D1:SC3,
T1|DR8A|A4|B2|C2|D2:SC3,
T1|DRB2|A4|B3|C3|D3:SC3,
T1|DRB3|A4|B4|C4|D4:SC3,
T1|DRB4|A4|B4:SC3,



%
// CHORDS
SC1,4-26.05 4-14A.08 4-27B.10 4-10.08,-6,8;
SC2,4-23.05 4-23.07 4-11A.11 4-10.02,0,8;
SC3,4-20.02 4-23.00 4-8.09 4-10.07,-5,8;
SC4,4-22A.03 4-14B.05 4-22A.10 4-10.00,2,8;
%
// PARTS
>> T1;
@t 128;
swing, 145,10;

>>DRB1;
@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "19 3E 7A 6B",scavolbin 0.6 "AB BB BB A1";
128,B7 FC : 1,1,1 3 2 4 3 2 1 3 1 4 2 1 3 1 0 2 3 2 1 2 0 1 3 2 ;
>>DRB2;
@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "19 3E 7A 6B",scavolbin 0.6 "AB BB BB A1";
128,65 FF 4E FE : 1,1,0 2 1 3 1 2 4 1 3 1 2 5 3 1 3 2 4 1 2 3 5 2 3;

>>DRB3;
@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "77 7E B9 F9",scavolbin 0.6 "47 4F EE 8F";
128,CA F8 EA BF : 1,1,1 2 3 2 0 2 3 2 3 0 2 3 5 2 3 2 3 1 3 1 2 ;

>>DRB4;
@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "19 3E 7A 6B",scavolbin 0.6 "AB BB BB A1";
128,65 FF 4E FE : 1,1,0 2 1 3 1 2 4 1 3 1 2 5 3 1 3 2 4 1 2 3 5 2 3;


>> DR1O;
@xd 10 120 36 :: scavolbin 0.8 "9A FB 6B 34",scavolbin 0.6 "42 7B D2 DA";
96, 80 20 20 01,1;
32, 82 08 02 01,1;

@xd 10 120 40 :: scavolbin 0.8 "5F 5D 4E AB",scavolbin 0.6 "53 56 55 21";
96, 20 00 14 02,1;
32, 58 F0 29 C8,1;

@xd 10 100 61 :: scavolbin 0.8 "1B FA 6B F1",scavolbin 0.6 "62 73 56 27";
96, 19 D8 C9 C0,1;
32, 24 00 14 24,1;

@xd 10 120 42 :: scavolbin 0.8 "1F B3 CA 00",scavolbin 0.6 "D2 CA 65 B6";
96, 6F A4 4F A6,1;
32, 52 CA 47 E7,1;

@xd 10 120 50 :: scavolbin 0.8 "9B 99 D8 C9",scavolbin 0.6 "AB 6B B9 EA";
96, 80 00 10 50,1;
32, A5 10 10 10,1;

@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "19 3E 7A 6B",scavolbin 0.6 "AB BB BB A1";
128,B7 FC : 1,1,1 3 2 4 3 2 1 3 1 4 2 1 3 1 0 2 3 2 1 2 0 1 3 2 ;

>> DR2O;
@xd 10 120 35 :: scavolbin 0.8 "6F 3A F1 76",scavolbin 0.6 "A7 3F DB 53";
96, 8D 70 A3 70,1;
32, 9E 94 C5 17,1;

@xd 10 120 39 :: scavolbin 0.8 "7E F2 3D 6F",scavolbin 0.6 "A7 B7 2B EF";
96, 60 88 00 89,1;
32, 40 40 20 20,1;

@xd 10 100 61 :: scavolbin 0.8 "7B 6E EE FC",scavolbin 0.6 "E5 FC EE 96";
96, 2F AE E3 F7,1;
32, 36 F5 67 FE,1;

@xd 10 120 42 :: scavolbin 0.8 "6D F4 F3 47",scavolbin 0.6 "C6 EF 71 3D";
96, BC B2 63 0E,1;
32, C4 00 83 80,1;

@xd 10 120 50 :: scavolbin 0.8 "5F 7A 2F 67",scavolbin 0.6 "46 D7 F0 DD";
96, 41 08 10 61,1;
32, 3B 58 34 46,1;

@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "19 3E 7A 6B",scavolbin 0.6 "AB BB BB A1";
128,65 FF 4E FE : 1,1,0 2 1 3 1 2 4 1 3 1 2 5 3 1 3 2 4 1 2 3 5 2 3;

>> DR3O;
@xd 10 120 36 :: scavolbin 0.8 "7F B8 59 3D",scavolbin 0.6 "C5 F7 9E D7";
96, 88 40 27 0A,1;
32, 80 40 00 28,1;

@xd 10 120 40 :: scavolbin 0.8 "5D DE 47 CD",scavolbin 0.6 "A7 75 D1 7B";
96, 12 B8 C8 C1,1;
32, 77 30 4F 46,1;

@xd 10 100 61 :: scavolbin 0.8 "5F 9A F3 B5",scavolbin 0.6 "E6 F2 9F 2B";
96, 92 02 68 00,1;
32, 90 20 84 80,1;

@xd 10 120 42 :: scavolbin 0.8 "7B FA B7 ED",scavolbin 0.6 "56 F7 2F A3";
96, 6C B8 13 1F,1;
32, 2D D8 08 06,1;

@xd 10 120 50 :: scavolbin 0.8 "7D DC 2E 6C",scavolbin 0.6 "E7 B5 E7 F9";
96, DB E8 D3 FF,1;
32, DA F8 EA 7A,1;

@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "77 7E B9 F9",scavolbin 0.6 "47 4F EE 8F";
128,CA F8 EA BF : 1,1,1 2 3 2 0 2 3 2 3 0 2 3 5 2 3 2 3 1 3 1 2 ;

>> DR4O;
@xd 10 120 35 :: scavolbin 0.8 "6F 3A F1 76",scavolbin 0.6 "A7 3F DB 53";
96, 80 14 02 40,1;
32, 81 2A 0D 88,1;

@xd 10 120 39 :: scavolbin 0.8 "7E F2 3D 6F",scavolbin 0.6 "A7 B7 2B EF";
96, 76 A8 F9 96,1;
32, 7C 90 A0 71,1;

@xd 10 100 80 :: scavolbin 0.8 "7B 6E EE FC",scavolbin 0.6 "E5 FC EE 96";
96, 6E 40 8D D8,1;
32, 76 A8 42 10,1;

@xd 10 120 34 :: scavolbin 0.8 "6D F4 F3 47",scavolbin 0.6 "C6 EF 71 3D";
96, 80 A8 00 07,1;
32, 81 40 10 60,1;

@xd 10 120 50 :: scavolbin 0.8 "5F 7A 2F 67",scavolbin 0.6 "46 D7 F0 DD";
96, 2B BB 75 3E,1;
32, 3F 35 9A BF,1;

@xs 11 57+53+60+65+48 120 :: scavolbin 0.8 "19 3E 7A 6B",scavolbin 0.6 "AB BB BB A1";
128,65 FF 4E FE : 1,1,0 2 1 3 1 2 4 1 3 1 2 5 3 1 3 2 4 1 2 3 5 2 3;


>>A1;
@xm 1 12 120 :: scadur 0.25, scadurbin 2 "FB B8 4D 5F FB D1 DE 1F", scavolbin 0.5 "FB B8 4D 5F FB D1 DE 1F";
96,FE FA,l:0.5,2 -1 2 -2 1 2 -3 1 -1 -1 2 -1 1 -1 -1 3 -3 2 2 -2 -2 -1 1 2 -1 -1;
32,AF CC,l : 0.5,2 -1 -1 -3 1 2 -2 2 -3 3;

>>A2;
@xm 1 12 120 :: scadur 0.25, scadurbin 2 "FB B8 4D 5F FB D1 DE 1F", scavolbin 0.5 "FB B8 4D 5F FB D1 DE 1F";
96,DE BC,l:0.5,-1 1 -1 1 -2 1 -2 2 1 2 -3 1 1 -2 1 -1 1 1 1 -3 -2 3;
32,BC B8,l : 0.5,1 -1 -1 1 -1 1 -1 -2 2 -2 -1 3 1 -1 -1 -2 3 1;

>>A3;
@xm 1 12 120 :: scadur 0.25, scadurbin 2 "FB B8 4D 5F FB D1 DE 1F", scavolbin 0.5 "FB B8 4D 5F FB D1 DE 1F";
96,F6 74,l:0.5,-1 3 -2 -2 1 -2 3 2 -1 -1 -1 1 1 -1 -1 1 -1 -2 2 1;
32,EC AC,l : 0.5,1 3 -3 2 -2 1 -1 -2 1 1 -1 2 -2 1 -1 -1 2 -1;

>>A4;
@xm 1 12 120 :: scadur 0.25, scadurbin 2 "FB B8 4D 5F FB D1 DE 1F", scavolbin 0.5 "FB B8 4D 5F FB D1 DE 1F";
96,FF AC,l:0.5,-1 1 3 -2 -1 2 1 -3 2 -2 2 1 -2 2 -1 1 1 -2 1 -3 2 1 -1 -2;
32,FF 58,l : 0.5,1 -1 -1 -1 2 -2 2 -1 1 -2 1 -1 -1 2 -1 2 -2 1 -2 2 -1 2;


>>B1;
@xm 2 24+2+2 120 ;
128,FD 2C : 8 0 0 ,l:0.75,1 1 -1 1 -2 1 2 -1 -1 -1 -1 1 2 -2 1 -1 -2 2 -1 1 1 1 -1 1 2 -2 -1 1 -2 1 1 1 -2 1 -1 1 -1 -1 -2 2;

>>B2;
@xm 2 24+2+2 120 ;
128,AC F8 : 8 0 0 ,l:0.75,1 1 -1 -1 1 -2 -1 1 1 -2 1 1 1 -1 1 -2 1 1 -2 1 -1 2 1 -2 1 -2 1 1 -2 -2 2 1 1 -1 -1 1;

>>B3;
@xm 2 24+2+2 120 ;
128,EF F8 : 8 0 0 ,l:0.75,-2 1 -1 2 -1 2 -2 -1 1 1 -1 1 -1 -1 1 1 -1 -1 -2 2 2 -1 -1 1 2 -2 -1 2 -2 1 1 -2 1 1 -1 1 -2 -1 1 1 -2 2 1 -2 1 1 -1 1;

>>B4;
@xm 2 24+2+2 120 ;
128,F7 F0 : 8 0 0 ,l:0.75,1 -1 1 1 -1 1 -1 1 -1 1 -2 1 -2 2 1 -1 -1 1 1 -1 1 -2 2 -1 1 -2 1 1 2 -1 2 -2 -1 -2 2 -1 -1 1 1 -1 1 -2 -1 1;


>> C1;
@xm 3 24 120 :: scadur 0.75;
128,FA 98 DE CA: 1 0,l,-2 2 1 2 -2 -1 -3 -1 1 3 1 1 -2 1 -1 -2 1 2 -1;

>> C2;
@xm 3 24 120 :: scadur 0.75;
128,AB FC EE E2: 1 0,l,-1 -2 3 -2 1 1 -1 2 -2 -3 1 2 1 2 -3 1 -2 1 1 2 -2;

>> C3;
@xm 3 24 120 :: scadur 0.75 ;
128,FD 7A BA B3: 1 0,l,-1 1 3 -3 2 3 -1 1 -2 -1 -2 -1 2 -1 -3 1 -2 1 1 2 1 -1;

>> C4;
@xm 3 24 120 :: scadur 0.75 ;
128,FD FC 3E A7: 1 0,l,-1 1 3 -2 -1 2 2 -3 1 2 1 -2 -3 -3 3 -2 -2 3 1 -2 2 -3 3;

>> D1;
@xm 4 20 120 :: scadur 0.75;
128,FD DA 8E EF 57 73 FB BC,l,-1 -1 1 1 -2 1 1 -1 1 -2 2 1 1 -2 -2 2 -1 -1 1 1 -2 1 1 -1 -1 -1 1 1 1 -1 -1 1 -1 1 -1 -2 2 1 2 -1 -1 -1 2 -2 2;

>> D2;
@xm 4 20 120 :: scadur 0.75;
128,FE E4 31 61 2E FE BB FF,l,1 1 2 -1 -2 1 2 -2 -2 1 -1 1 1 -1 -1 2 -1 1 -1 1 -2 2 -1 1 -1 1 -2 2 -2 2 -2 -1 1 2 -1 1 -2 1 -2 1 1 -1;

>> D3;
@xm 4 20 120 :: scadur 0.75;
128,DF 5C CF AC C5 84 FD FE,l,-2 1 1 1 -1 1 1 -2 1 -1 2 -1 1 1 1 -2 1 -2 -1 1 1 -1 1 -1 1 -1 1 -1 -1 -2 2 2 -1 1 -2 -1 1 2 -2 1 -1;

>> D4;
@xm 4 20 120 :: scadur 0.75;
128,EE EC FF D4 6D BF 7F 2B,l,1 1 -1 1 1 -2 1 -1 -1 1 -1 1 -1 2 -1 -1 1 1 1 -1 -1 1 -1 -1 -1 2 -1 2 -1 -1 2 -1 -1 1 1 -2 1 -1 -2 2 -1 2 -1 1 1 -2;


%
// VARIATIONS
>> DR1;
binab(?DR1O!,?DR2O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR1A;
binab(?DR1O!,?DR2O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

>> DR2;
binab(?DR2O!,?DR1O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR2A;
binab(?DR2O!,?DR1O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

>> DR3;
binab(?DR1O!,?DR3O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR3A;
binab(?DR1O!,?DR3O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

>> DR4;
binab(?DR3O!,?DR1O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR4A;
binab(?DR3O!,?DR1O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

>> DR5;
binab(?DR2O!,?DR3O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR5A;
binab(?DR2O!,?DR3O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

>> DR6;
binab(?DR3O!,?DR2O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR6A;
binab(?DR3O!,?DR2O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

>> DR7;
binab(?DR3O!,?DR4O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR7A;
binab(?DR3O!,?DR4O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

>> DR8;
binab(?DR4O!,?DR3O!,"A7 FB 6F CB E6 AF BB BF 2F 27 1D 9D B7 F9 76 FC");

>> DR8A;
binab(?DR4O!,?DR3O!,"BF EA EB B7 F7 79 65 7C 6F 5C B7 B7 FD EB 7F 5D");

