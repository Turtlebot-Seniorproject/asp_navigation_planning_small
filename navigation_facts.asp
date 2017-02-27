
% DO NOT use room(a ; b). Computation takes forever.
% naming r1 for room on level 1. room number is after underscore
room(r1_129d).
room(r1_130).
room(r1_133e).

door(d1_129d).
door(d1_133e).

hasdoor(r1_129d, d1_129d).
hasdoor(r1_130, d1_129d).
hasdoor(r1_129d, d1_133e).
hasdoor(r1_133e, d1_133e).

location(E) :- elevator(E).
location(R) :- room(R).

dooracc(R1,D,R2) :- hasdoor(R1,D), hasdoor(R2,D), R1 != R2, door(D), room(R1),
location(R2).
dooracc(R1,D,R2) :- dooracc(R2,D,R1).

acc(L1,L1) :- location(L1).
acc(L1,L2) :- acc(L2,L1), location(L1), location(L2). 
acc(L1,L2) :- acc(L1,L3), acc(L2,L3), location(L1), location(L2), location(L3).

