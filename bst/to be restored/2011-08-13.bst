// MACROS

% 
// SEQUENCER
T1|B1| SH1 :: SC1,
T1|B1 :SC2,
T1|DR1|A1 :SC1,
T1|DR1|A1|B1|SH1 :SC1,
T1|DR2|A2|B1 :SC2,
T1|DR3|AA1:SC1,
T1|DR3|AA1|C1|SH2:SC1,
T1|DR4|AA2|C1:SC2,
T1|DR5|A2:SC1,
T1|DR5|A2|B1|SH3 :: SC1,
T1|DR6|A3|B1:SC2,
T1|DR7|AA2:SC1,
T1|DR7|AA2|C2|SH4 :: SC1,
T1|DR8|AA3|C2:SC2,
T1|DR1|A3 :SC3,
T1|DR1|A3|B1|SH5 :SC3,
T1|DR2|A4|B1 :SC4,
T1|DR3|AA3:SC3,
T1|DR3|AA3|C3|SH6:SC3,
T1|DR4|AA4|C3:SC4,
T1|C4|SH7 :: SC4,
T1|C4|SH8 :: SC4

%
// CHORDS

SC1,4-13A.02 4-14B.10,0,8;
SC2,4-16A.03 4-14B.06,4,8;
SC3,4-16B.03 4-14B.05,5,8;
SC4,4-27B.10 4-14B.11,-1,8;

%
// PARTS
>> T1;
@ t 128;
swing, 140, 15;

>> A1;
@xm 1 16 120;
96, FB F6 44 FB : 1, l :: 0.5, -2 2 3 2 -1 -2 1 -3 2 1 -3;
32, FB D8 67 EB : 1, l:0.5, -2 2 3 2 -1 -2 1 -3 2 1 -3 l : -1;


>> AA1;
@xm 1 16 120;
128, E9 D4 5D 33, l:0.5,-1 2 -1 l, -1 2 -1;

>> B1;
@xm 2 18 120;
128, EF BA 7C E3 : 1 0 4, l, 3 -1 -1 3 -1 1 -1 -2 3 -3 -1;

@xm 2 16 120;
128, BC 30 85 0D : 4 0 8, l, 3 -1 -1 2 -1 1 -1 -2 3 -2 -1 -1 1;

@xm 2 20 120;
128, 10 00 81 0C : 2 0, l, -1 -3 -2 4 2;

>> C1O;
@xm 3 23 120;
128, 8A 5F B0 98 43 6F 5B 14 : 1 0 4, l, 2 -1 -1 1 -1 l, 1 2 -3 1 1 1 -1 -2;

>>DR1O;
@xd 10 120 35;
128, EF 6A 31 F5,;

@xd 10 120 42;
128, CB E0 6B 35 27 9D 3E 5E CF 41 A7 81 9B D5 3E 32,l;

@xd 10 120 46;
128, 00 10 14 4A 80 62 41 20 10 0E 48 5A 44 28 41 CC,l;

@xd 10 120 38;
128, 45 08 09 83 1A 0C 30 40 48 0A 61 02 58 40 30 43 : 1 0 3,;

@xd 10 120 53;
128, 80 00 B1 60 84 2A D4 22 01 4A A5 2A 94 6A 11 2A, l: 0.75;

>>DR2O;
@xd 10 120 36;
128, C3 90 64 05 82 01 00 88, 1;

@xd 10 120 42;
128, FD B0 7C 7E EB 9F D4 B9 C8 87 E3 F8 F1 6E AD 9A,1;

@xd 10 120 37;
128, 0B 53 B9 C0,1;

@xd 10 120 46;
128, 00 4E 83 81 04 00 23 02 17 70 1C 00 06 80 40 45,1;

@xd 10 120 38;
128, 94 40 10 10 21 11 20 00 14 4C 32 90 60 12 00 00, 1;

@xd 10 120 53;
128, 24 B0 7C 08 90 11 0C 44 A6 08 D1 C4 40 88 10 D3, l: 0.75;

>>DR3O;
@xd 10 120 36;
128, B5 74 24 36 3D 69 9A 2F, 1;

@xd 10 120 42;
128, A6 48 12 40,1;

@xd 10 120 38;
128, 94 40 10 10 21 11 20 00 14 4C 32 90 60 12 00 00, 1;

@xd 10 120 53;
128, 24 B0 7C 08 90 11 0C 44 A6 08 D1 C4 40 88 10 D3, l: 0.75;


>>SH1O;
@xd 11 120 36;
128, 99 E8 3C CF B6 73 6B CA, 1;

@xd 11 100 45;
128, 24 00 C0 30 09 0C 84 34, 1;


%
// VARIATIONS

>> DR1;
scadurbin(?DR1O!, 0.5,"FB F6 44 FB");
retrscavolbin(?DR1!, 72,3,0.35,"03 49");

>> DR2;
scadurbin(?DR2O!, 0.5,"FB F6 44 FB");
retrscavolbin(?DR2!, 72,3,0.35,"12 AC 18 8D 0A 88 12 AC 10 AD 08 0D 10 29 44 A9");

>> DR3;
retrscavolbin(?DR3O!, 72,3,0.35,"2D 73 CA 87 CB 15 2D F6 CF F3 0B 3E FE 69 05 CF");

>> DR4;
binab(?DR1!,?DR3!,"2D 7F C2 EB 85 C9 89 38 D5 FB A1 DB 82 67 1F 3F");

>> DR5;
binab(?DR2!,?DR3!,"3A 56 09 9D A6 F9 A6 BE 27 2D 8F F4 A8 D3 3F FC");

>> DR6;
binab(?DR1!,?DR2!,"37 E6 C7 1B 11 69 79 3E AB 63 96 B5 A5 3B 1B A6");

>> DR7;
scadurbin(?DR5!,0.5, "39 6C 3E AF 86 6B 29 73 F7 3C 7B 7D FE C5 BF EC");

>> DR8;
scadurbin(?DR6!,0.5, "26 D6 7E 8A 34 65 1D 59 BA 9B 67 77 76 2C AE A7");


>> A2;
retrbin(?A1!, 24,2,"00 40 94 40");

>> A3;
retrbin(?A1!, 48,2,"00 40 94 40");

>> A4;
retrbin(?A1!, 96,2,"00 40 94 40");

>> AA2;
retrbin(?AA1!, 24,2,"00 40 94 40");

>> AA3;
retrbin(?AA1!, 48,2,"00 40 94 40");

>> AA4;
retrbin(?AA1!, 96,2,"00 40 94 40");


>> SH1;
scavolbin(?SH1O!, 0.75,"10 98");

>> SH2;
retrscavolbin(?SH1!, 3,8,0.75,"11 8A 41 83");

>> SH3;
retrscavolbin(?SH1!, 3,8,0.75,"19 6C 01 0C 91 60 9B 6C");

>> SH4;
retrscavolbin(?SH1!, 3,8,0.75,"11 2A B1 6A 24 6A A4 68 B5 62 94 08 81 AA D1 22");

>> SH5;
chanbin(?SH1O!, 12,"2F DE AD 19 76 FD AA 1F 67 C8 57 A3 E0 86 EE C6");

>> SH6;
chanbin(?SH1O!, 12,"37 CE 4E 3F 1B 61 2E 79 A8 DE 59 1A 2E B7 6E A8");

>> SH7;
chanbin(?SH1O!, 12,"39 AC 30 36 1B 9E AF 7B 2E 36 CD 37 56 0C BC 75");

>> SH8;
chanbin(?SH1O!, 12,"35 69 72 F5 77 4C 58 2E DA A3 F5 8C 81 B2 07 37");

>> C1;
retr(?C1O!, 72,3);

>> C2;
retr(?C1O!, 144,3);

>> C3;
retr(?C1O!, 288,3);

>> C4;
retr(?C1O!, 576,3);
