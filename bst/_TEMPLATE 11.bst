% 
// SEQUENCER
TEMPO : ALL --
P0A : S0A || P0B : S0B || DRUMS0 : ALL --
P1A : S1A || P1B : S1B || DRUMS1 : ALL --
P2A : S2A || P2B : S2B || DRUMS2 : ALL --
P0A : S0A || P0B : S0B || DRUMS0 : ALL --
P1A : S1A || P1B : S1B || DRUMS1 : ALL --
P3A : S3A || P3B : S3B || DRUMS3 : ALL --
P0A : S0A || P0B : S0B || DRUMS0 : ALL --
P2A : S2A || P2B : S2B || DRUMS2 : ALL --
P3A : S3A || P3B : S3B || DRUMS3 : ALL --
P1A : S1A || P1B : S1B || DRUMS1 : ALL --
P2A : S2A || P2B : S2B || DRUMS2 : ALL --

%
// CHORDS
S0A, , 0, 8;
S1A, , 0, 8;
S2A, , 0, 8;
S3A, , 0, 8;

S0B, , 0, 8;
S1B, , 0, 8;
S2B, , 0, 8;
S3B, , 0, 8;

ALL, 12-01.00, 0, 32;

%
// PARTS
>> xTEMPO 16;
@t;
set, 60;

>> x_P0A 128;

>> x_P0B 128;

>> x_DRUMS0 128;

>> x_P1A 128;

>> x_P1B 128;

>> x_DRUMS1 128;

>> x_P2A 128;

>> x_P2B 128;

>> x_DRUMS2 128;

>> x_P3A 128;

>> x_P3B 128;

>> x_DRUMS3 128;

%
// VARIATIONS
>>xP0A;
?_P0A!;
>>xP0B;
?_P0B!;
>>xDRUMS0;
?_DRUMS0!;
>>xP1A;
?_P1A!;
>>xP1B;
?_P1B!;
>>xDRUMS1;
?_DRUMS1!;
>>xP2A;
?_P2A!;
>>xP2B;
?_P2B!;
>>xDRUMS2;
?_DRUMS2!;
>>xP3A;
?_P3A!;
>>xP3B;
?_P3B!;
>>xDRUMS3;
?_DRUMS3!;
