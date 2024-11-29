// Convolve the beat 20110821 

//MACROS


% 
// SEQUENCER


T1|DR5A|A1:SC2,
T1|DR3|A1|D1:SC2,
T1|DR3A|A1|C3:SC3,
T1|DR4|A1|C3|B1:SC3,
T1|DR4A|A1|C3|B2:SC3,
T1|DR6|A2|D1:SC3,
T1|DR6A|A2|D2:SC3,
T1|DR7|A2|D3:SC3,
T1|DR7A|A2|D4:SC3,
T1|DR2|A3|C2:SC4,
T1|DR2A|A3|C4:SC4,
T1|DR8|A4|B1:SC4,
T1|DR8A|A4|B2:SC3,
T1|DR1|A4|B3:SC2,
T1|DR1A|B4:SC1,




%
// CHORDS
SC1,04-24.07 04-27.09 04-19.04 04-23.07,-1,32;
SC2,04-29.09 04-22.04 04-09.08 04-23.09,-3,32;
SC3,04-21.09 04-28.09 04-24.07 04-23.00,6,32;
SC4,04-37.10 04-27.03 04-42.08 04-23.06,0,32;
%
// PARTS
>> T1;
@t 128;
swing, 135,15;

>> DR1O;

@xs 10 36+40 120: scavolbin 0.8 "7F 3E FC B9",scavolbin 0.6 "57 DF FD FF";
128,DE FE FA DE FE FE FE FA DE FE FE FE FE FA DE FA,l,1 1 0 0 1 1 1 1 1 0 1 1 0 0 1 1 1 1 1 0 0 0 0 1 1 0 1 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1;

@xs 10 44+42+51 120 : scavolbin 0.8 "5E DC 7F FD",scavolbin 0.6 "57 7F 4E DE";
128,DF DF DA DF DF DF DF DF DF DF DA DF DF DA DF DA: 1 0,l,0 0 0 0 1 0 1 2 1 1 1 2 2 1 2 2 1 2 2 2 2 1 2 2 2 2 2 2 1 2 1 2 2 2 1 1 1 1 2 1 1 1 0 0 1 1 2 2 2 1 1 0 ;

>> DR2O;
@xs 10 35+39 120: scavolbin 0.8 "6F FD 9F DB",scavolbin 0.6 "D7 BF B7 1F";
128,BC DC BC FC FC FC DC 00 BC FC DC BC FC FC DC 00 : 1 0,l,0 1 0 1 1 1 0 0 0 0 1 1 0 1 1 0 1 0 0 0 0 1 1 0 0 0 0 1 1 0 0 0 1 1 1 1 0 0;

@xs 10 44+42+51 120: scavolbin 0.8 "7E 6A D7 5F",scavolbin 0.6 "C7 EF EF E3";
128,ED FD FD 7C ED FD 7C ED 7C ED FD FD FD FD 7C 00: 1 0,l,2 1 0 0 0 0 1 1 1 1 2 1 2 1 0 0 0 0 0 1 1 1 1 1 1 0 1 2 2 2 2 2 2 2 1 2 2 2 1 1 2 1 1 0 1 1 2 2 1 1 1 2 1 1 2 2 2 1 0 1 1 0 1 1 1 1 0 0 0 0 1 1 2 2 1 1 2 1 0 0 0 1 1 0 0 0 1 2 1 2 2 2 ;

>> DR3O;
@xs 10 36+40 120: scavolbin 0.8 "77 F5 76 BE",scavolbin 0.6 "06 56 9F DD";
128,BF BC BF BF BF BF BF BF BF BC BF BF BF BF BC 00,l,0 0 0 1 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 1 1 0 1 0 0 0 1 1 1 1 0 1 1 0 0 1 1 1 0 0 0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 1 1 1 1 1 0 1 1 1 1 1 0 1 ;

@xs 10 4+42+51 120 : scavolbin 0.8 "7F 3A 97 17",scavolbin 0.6 "B7 FD F8 FB";
128,98 B0 00 98 B8 B0 00 00 98 B0 98 B8 B0 00 00 00,l,2 2 2 2 2 2 2 1 1 1 2 2 1 1 0 1 2 2 1 1 2 2 2 2 2 2 1 1 1 1 1 1 ;


>> DR4O;
@xs 10 35+39 120 : scavolbin 0.8 "7B FE FB EE",scavolbin 0.6 "E7 BF FD DE";
128,E5 F5 F5 F4 00 E5 F4 E5 F5 F5 F5 F5 F4 E5 F4 00 : 1 0,l,1 1 1 1 1 1 1 1 1 1 1 0 0 0 1 1 1 1 1 0 0 0 0 0 1 0 1 0 1 0 0 0 0 1 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 1 0 0 0 0 0 0 1;

@xs 10 44+42+51 120 : scavolbin 0.8 "5F FE FD DC",scavolbin 0.6 "C7 ED FC DD";
128,E7 E7 E7 E4 00 E7 E7 E7 E7 E7 E7 E4 00 E7 E4 00 : 1 0,l,2 2 1 2 2 1 1 1 1 2 1 2 2 2 2 1 0 0 1 1 2 2 2 2 2 2 2 1 1 1 1 2 1 1 2 2 0 0 0 0 1 1 0 0 1 1 2 2 1 2 2 2 2 2 1 1 1 1 1 2 2 2 2 2 1 1 1 1 0 0 0 0 ;

>>A1;
@xm 1 16 120 ;
128,D4 C0 00 D4 D4 C0 00 00 D4 C0 D4 D4 C0 00 00 00,1,2 -1 -1 1 1 -2 -2 2 1 2 -1 1 1 -2 -2 2 -1 1 -2 -2 1 3 2 -2 -1 -2 1 1 -1 2 -1 -1 l;


>>A2;
@xm 1 16 120 ;
128,D4 D4 D4 C0 00 D4 D4 D4 D4 D4 D4 C0 00 D4 C0 00,1,-1 -1 2 2 2 0 -1 -2 1 -1 0 -2 0 1 0 -1 0 0 2 0 -2 0 0 2 -2 0 -2 1 1 1 0 1 0 0 0 0 0 0 -2 -2 2 1 0 1 -1 0 0 1 0 -2 1 -1 2 -1 l;


>>A3;
@xm 1 16 120 ;
128,D4 D4 D4 D4 C0 D4 C0 D4 D4 D4 D4 C0 D4 D4 C0 00,1,2 2 -3 -1 2 -2 3 -1 -2 2 -3 1 2 -2 3 -1 2 -2 -2 -2 2 -1 1 2 2 -2 -2 -2 2 1 -1 1 -1 -1 3 -2 3 -3 2 -2 2 1 -1 2 -2 -2 l;


>>A4;
@xm 1 16 120;
128,D4 D4 D4 D4 D4 D4 D4 C0 D4 D4 C0 D4 D4 C0 D4 C0,1,-1 -1 2 -1 -2 2 1 -1 -1 2 1 -2 -1 2 -1 1 2 -3 -1 2 1 -3 1 1 -1 1 -2 2 2 -1 2 -3 2 -2 2 -3 2 -1 1 -2 1 -2 3 -1 2 -2 1 3 1 -2 -2 3 -2 -1 1 -2 l;

>>B1;
@xm 2 20 120 ;
128,F4 D4 F4 F4 D4 00 00 F4 F4 D4 F4 D4 00 00 00 00,l:0.5,1 -1 -2 2 1 2 -2 -1 2 -2 -3 3 -2 -1 3 1 3 -3 -1 -1 2 1 -2 -1 2 -2 -2 2 -2 -1 2 -2 -2 3 2 2 -2 -2 -2 2 1 1 -2 3 -1 1 l;

>>B2;
@xm 2 20 120;
128,F4 F4 F4 F4 F4 F4 F4 D4 F4 F4 F4 F4 D4 F4 D4 00,l:0.5,1 -3 1 1 -2 -1 2 -1 2 -2 2 3 -3 -2 2 -2 -1 3 -2 -2 2 1 -2 2 -1 -1 -1 2 3 -3 2 2 -2 1 -3 2 2 1 -3 1 -1 3 1 2 -1 -2 -3 2 1 -2 2 2 -2 -3 1 -1 -2 -1 1 2 -1 1 -2 1 1 -2 2 1 1 -2 -2 2 l;

>>B3;
@xm 2 20 120;
128,F4 D4 F4 F4 F4 F4 D4 00 F4 D4 F4 F4 F4 F4 D4 00,l:0.5,-2 2 -2 2 -2 2 2 -2 -2 -3 3 -2 2 3 -1 -2 1 -3 1 1 3 -1 3 -1 -2 2 2 -2 -2 2 -2 2 -1 -1 2 3 -3 -3 1 1 -3 2 -1 1 1 -1 1 2 -2 -2 1 1 3 -1 -3 1 3 -3 -2 2 -1 1 -3 2 2 -2 l;

>>B4;
@xm 2 20 120 ;
128,F4 F4 F4 D4 00 F4 F4 D4 F4 F4 F4 F4 D4 F4 D4 00,l:0.5,-1 2 -1 -1 -2 2 1 -1 -1 1 1 -2 -2 -1 1 3 3 -2 1 -1 -1 1 3 -2 -2 -1 2 3 -3 -2 2 3 -2 2 1 -2 -2 3 -1 2 -1 -3 -1 1 1 -1 3 -2 -1 1 -2 2 -1 1 3 2 -1 1 -3 -2 1 2 -3 -1 -1 1 l;


>> C1;
@xm 3 20 120;
128,F4 F4 E4 F4 E4 00 00 F4 F4 E4 00 F4 E4 00 00 00: 1 0,1,-1 -1 -2 -2 2 2 -1 -1 1 -1 2 -2 3 -1 -2 2 -2 2 -2 2 -2 2 2 3 -1 1 -1 1 -3 2 1 1 -1 -1 -2 2 -2 2 1 -1 1 -3 -2 2 -2 2 l;

>> C2;
@xm 3 20 120 ;
128,F4 F4 E4 F4 F4 E4 00 00 00 F4 E4 F4 E4 00 00 00: 1 0,1,-2 3 1 -2 1 1 -2 2 -2 2 -2 2 2 -1 -1 3 -3 -2 2 2 -2 -3 1 -2 2 2 2 -2 -2 2 2 -2 -2 3 -1 -1 -1 2 1 -3 2 -3 -2 3 2 -2 l;

>> C3;
@xm 3 20 120 ;
128,F4 F4 E4 00 F4 E4 F4 E4 F4 F4 E4 00 00 00 00 00: 1 0,1,-1 -1 1 -2 -2 3 1 1 1 -1 -1 2 1 -2 -1 1 -1 1 -1 1 2 -3 1 -2 1 1 -1 1 -1 -1 -1 1 1 -1 2 -1 -2 3 -2 2 -1 1 1 -1 -2 2 l;

>> C4;
@xm 3 20 120 ;
128,F4 F4 E4 F4 F4 F4 E4 00 F4 F4 F4 F4 E4 F4 E4 00: 1 0,1,-3 3 2 2 -2 -3 -1 2 2 -2 2 1 -3 2 1 -2 -1 2 -1 -3 1 1 1 -1 1 1 -3 1 -2 2 1 -1 2 -1 -1 3 -2 -1 3 -3 1 -2 -1 2 -1 2 -2 -1 1 1 -1 1 -1 3 -2 -1 1 2 -3 2 -1 -3 1 2 -1 1 l;

>> D1;
@xm 4 24 120 : scadur 0.75;
128,B2 B2 B2 B2 B2 B2 30 B2 B2 B2 30 B2 30 B2 30 00:1 0,l,-3 -1 2 -1 1 -1 -1 1 -2 1 2 -2 2 -1 -1 2 -2 -1 1 2 -1 2 -3 1 1 2 2 -1 2 -1 -2 2 -2 2 -3 1 2 -2 2 -2 -1 1 2 1 1 -2 -2 2 -2 1 1 -2 l;

>> D2;
@xm 4 24 120  : scadur 0.75;
128,B2 B2 B2 B2 B2 B2 30 00 B2 30 B2 30 B2 B2 30 00:1 0, l,-1 2 -3 2 -2 2 2 -2 -2 -3 3 -1 2 1 -3 -1 2 -3 1 2 3 -1 -2 2 -3 -1 3 -1 1 -1 1 -1 -3 1 2 1 -1 1 3 -1 -2 -3 2 1 -1 -1 1 2 l;

>> D3;
@xm 4 24 120  : scadur 0.75;
128,B2 B2 B2 B2 30 B2 B2 B2 30 B2 B2 B2 30 B2 30 00:1 0,l,2 2 -2 3 1 -2 -2 -2 2 -2 2 -2 -1 3 -2 2 1 -3 3 -1 -2 2 -1 -2 3 -2 3 1 1 -2 2 2 -2 -2 2 1 1 -2 -2 3 -1 -2 1 -3 2 2 -2 2 -3 -1 2 -3 l;

>> D4;
@xm 4 24 120  : scadur 0.75;
128,B2 30 B2 B2 B2 B2 30 00 B2 B2 30 B2 B2 B2 30 00:1 0,l,-1 3 1 -1 -3 1 2 2 -2 -2 -2 3 1 -2 -1 -1 3 2 -1 -2 -1 1 -1 1 -1 -1 1 -1 1 3 -3 -1 -3 2 -1 3 3 -1 -2 -1 -1 1 -2 3 -1 -3 3 2 l;


%
// VARIATIONS
>> DR1;
binab(?DR1O!,?DR2O!,"BC BC BC BC AC BC BC BC BC BC BC BC AC BC AC 00");

>> DR1A;
binab(?DR1O!,?DR2O!,"BC BC BC AC BC BC BC BC BC BC BC BC AC BC BC AC");

>> DR2;
binab(?DR2O!,?DR1O!,"BC BC BC BC AC BC BC AC BC BC BC BC AC BC AC 00");

>> DR2A;
binab(?DR2O!,?DR1O!,"BC BC BC BC BC BC AC BC BC BC AC BC AC BC AC 00");

>> DR3;
binab(?DR1O!,?DR3O!,"BC BC BC BC BC BC BC AC BC BC BC BC BC BC AC 00");

>> DR3A;
binab(?DR1O!,?DR3O!,"BC BC BC AC BC BC AC BC BC BC BC AC 00 BC AC 00");

>> DR4;
binab(?DR3O!,?DR1O!,"BC BC BC AC 00 BC AC BC BC BC BC AC 00 BC AC 00");

>> DR4A;
binab(?DR3O!,?DR1O!,"BC BC BC BC BC BC BC BC AC BC BC BC AC BC BC AC");

>> DR5;
binab(?DR2O!,?DR3O!,"BC BC BC BC BC BC BC AC BC BC BC BC BC AC BC AC");

>> DR5A;
binab(?DR2O!,?DR3O!,"BC BC BC AC BC BC AC BC BC BC BC BC AC BC AC 00");

>> DR6;
binab(?DR3O!,?DR2O!,"BC BC BC BC BC BC AC BC BC AC BC AC BC BC AC 00");

>> DR6A;
binab(?DR3O!,?DR2O!,"BC BC BC BC AC BC BC BC BC BC BC BC AC BC AC 00");

>> DR7;
binab(?DR3O!,?DR4O!,"BC BC BC AC 00 BC AC 00 BC AC BC AC 00 00 00 00");

>> DR7A;
binab(?DR3O!,?DR4O!,"BC BC AC BC AC BC AC BC BC BC BC BC BC BC AC 00");

>> DR8;
binab(?DR4O!,?DR3O!,"BC BC BC BC AC BC BC BC BC BC BC BC AC BC AC 00");

>> DR8A;
binab(?DR4O!,?DR3O!,"BC BC BC BC BC AC BC BC BC BC BC BC BC BC AC 00");
