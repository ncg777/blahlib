% 
// SEQUENCER
TEMPO : ALL 
// Knee 0
C0 : S0C || D0 : S0D || DRUMSK0 : ALL --
// PART X
A1X : S1A || B1X : S1B || DRUMS1PX : ALL --
A2X : S2A || B2X : S2B || DRUMS2PX : ALL --
A3X : S3A || B3X : S3B || DRUMS3PX : ALL --
A4X : S4A || B4X : S4B || DRUMS4PX : ALL --
A3X : S3A || B3X : S3B || DRUMS3X : ALL  --
A2X : S2A || B2X : S2B || DRUMS2X : ALL  --
A1X : S1A || B1X : S1B || DRUMS1X : ALL  --
A0X : S0A || B0X : S0B || DRUMS0X : ALL  --
// Knee 1
C1 : S1C || D1 : S1D || DRUMSK1 : ALL -- 
// PART Y
A0Y : S3A || B0Y : S3B || DRUMS1PY : ALL --
A4Y : S4A || B4Y : S4B || DRUMS0PY : ALL --
A3Y : S0A || B3Y : S0B || DRUMS4PY : ALL --
A2Y : S1A || B2Y : S1B || DRUMS3PY : ALL --
A3Y : S0A || B3Y : S0B || DRUMS4Y : ALL  --
A4Y : S4A || B4Y : S4B || DRUMS0Y : ALL  --
A0Y : S3A || B0Y : S3B || DRUMS1Y : ALL  --
A1Y : S2A || B1Y : S2B || DRUMS2Y : ALL  --
// Knee 2
C2 : S2C || D2 : S2D || DRUMSK2 : ALL 


%
// CHORDS
S0A, , 0, 8;
S1A, , 0, 8;
S2A, , 0, 8;
S3A, , 0, 8;
S4A, , 0, 8;

S0B, , 0, 16;
S1B, , 0, 16;
S2B, , 0, 16;
S3B, , 0, 16;
S4B, , 0, 16;

S0C, , 0, 8;
S1C, , 0, 8;
S2C, , 0, 8;

S0D, , 0, 8;
S1D, , 0, 8;
S2D, , 0, 8;

ALL, 12-01.00, 0, 32;

%
// PARTS
>> xTEMPO 16;
@t;
set, 120;

// {Knee0..2}x{C,D,DRUMS} + {X,Y} x {0 ... 4} x {A,B, DRUMS} +4x{X,Y}x{DRUMSP} = 48 parties
// =================================== Knee 0 =================================== 
>> x_C0 128;
>> x_D0 128;
>> x_DRUMSK0 128;

// =================================== Knee 1 =================================== 
>> x_C1 128;
>> x_D1 128;
>> x_DRUMSK1 128;

// =================================== Knee 2 =================================== 
>> x_C2 128;
>> x_D2 128;
>> x_DRUMSK2 128

// =================================== X =================================== 
// =================================== 0X =================================== 
>> x_A0X 128;
>> x_B0X 128;
>> x_DRUMS0X 128;

// =================================== 1X =================================== 
>> x_A1X 128;
>> x_B1X 128;
>> x_DRUMS1X 128;
>> x_DRUMS1PX 128;

// =================================== 2X =================================== 
>> x_A2X 128;
>> x_B2X 128;
>> x_DRUMS2X 128;
>> x_DRUMS2PX 128;
// =================================== 3X =================================== 
>> x_A3X 128;
>> x_B3X 128;
>> x_DRUMS3X 128;
>> x_DRUMS3PX 128;
// =================================== 4X =================================== 
>> x_A4X 128;
>> x_B4X 128;
>> x_DRUMS4X 128;
>> x_DRUMS4PX 128;
// =================================== Y =================================== 
// =================================== 0Y =================================== 
>> x_A0Y 128;
>> x_B0Y 128;
>> x_DRUMS0Y 128;
>> x_DRUMS0PY 128;
// =================================== 1Y =================================== 
>> x_A1Y 128;
>> x_B1Y 128;
>> x_DRUMS1Y 128;
>> x_DRUMS1PY 128;
// =================================== 2Y =================================== 
>> x_A2Y 128;
>> x_B2Y 128;
>> x_DRUMS2Y 128;
// =================================== 3Y =================================== 
>> x_A3Y 128;
>> x_B3Y 128;
>> x_DRUMS3Y 128;
>> x_DRUMS3PY 128;
// =================================== 4Y =================================== 
>> x_A4Y 128;
>> x_B4Y 128;
>> x_DRUMS4Y 128;
>> x_DRUMS4PY 128;

%
// VARIATIONS
// =================================== Knee 0 =================================== 
>> xC0;
?_C0!;
>> xD0;
?_D0!;
>> xDRUMSK0;
?_DRUMSK0!;
// =================================== Knee 1 =================================== 
>> xC1;
?_C1!;
>> xD1;
?_D1!;
>> xDRUMSK1;
?_DRUMSK1!;
// =================================== Knee 2 =================================== 
>> xC2;
?_C2!;
>> xD2;
?_D2!;
>> xDRUMSK2
?_DRUMSK2!;
// =================================== X =================================== 
// =================================== 0X =================================== 
>> xA0X;
?_A0X!;
>> xB0X;
?_B0X!;
>> xDRUMS0X;
?_DRUMS0X!;
// =================================== 1X =================================== 
>> xA1X;
?_A1X!;
>> xB1X;
?_B1X!;
>> xDRUMS1X;
?_DRUMS1X!;
>> xDRUMS1PX;
?_DRUMS1PX!;
// =================================== 2X =================================== 
>> xA2X;
?_A2X!;
>> xB2X;
?_B2X!;
>> xDRUMS2X;
?_DRUMS2X!;
>> xDRUMS2PX;
?_DRUMS2PX!;
// =================================== 3X =================================== 
>> xA3X;
?_A3X!;
>> xB3X;
?_B3X!;
>> xDRUMS3X;
?_DRUMS3X!;
>> xDRUMS3PX;
?_DRUMS3PX!;
// =================================== 4X =================================== 
>> xA4X;
?_A4X!;
>> xB4X;
?_B4X!;
>> xDRUMS4X;
?_DRUMS4X!;
>> xDRUMS4PX;
?_DRUMS4PX!;
// =================================== Y =================================== 
// =================================== 0Y =================================== 
>> xA0Y;
?_A0Y!;
>> xB0Y;
?_B0Y!;
>> xDRUMS0Y;
?_DRUMS0Y!;
>> xDRUMS0PY;
?_DRUMS0PY!;
// =================================== 1Y =================================== 
>> xA1Y;
?_A1Y!;
>> xB1Y;
?_B1Y!;
>> xDRUMS1Y;
?_DRUMS1Y!;
>> xDRUMS1PY;
?_DRUMS1PY!;
// =================================== 2Y =================================== 
>> xA2Y;
?_A2Y!;
>> xB2Y;
?_B2Y!;
>> xDRUMS2Y;
?_DRUMS2Y!;
// =================================== 3Y =================================== 
>> xA3Y;
?_A3Y!;
>> xB3Y;
?_B3Y!;
>> xDRUMS3Y;
?_DRUMS3Y!;
>> xDRUMS3PY;
?_DRUMS3PY!;
// =================================== 4Y =================================== 
>> xA4Y;
?_A4Y!;
>> xB4Y;
?_B4Y!;
>> xDRUMS4Y;
?_DRUMS4Y!;
>> xDRUMS4PY;
?_DRUMS4PY!;
