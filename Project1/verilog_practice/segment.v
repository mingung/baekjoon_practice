module segment (A,B,C,D,a,b,c,d,e,f,g);
input A,B,C,D;
output wire a,b,c,d,e,f,g;
wire orAC, andBD, norBD;
wire notB, norCD, andCD;
wire orAB, nandCnotD;
wire notnandCnotD, oute, notC, andnotBC, andBCD, num1, num2; 

// output a
assign orAC = A | C;
assign andBD = B & D;
assign norBD = ~(B | D);
assign a = (orAC | andBD | norBD);

// output b
assign notB = ~B;
assign norCD = ~(C | D);
assign andCD = C & D;
assign b = (notB | norCD | andCD);

// output c

assign orAB = A | B;
assign nandCnotD = ~(C&~D);
assign c = (orAB | nandCnotD);

// output d
assign notC = ~C;
assign notnandCnotD = ~nandCnotD;
assign oute = norBD | notnandCnotD;
assign andBCD = andBD & notC;
assign andnotBC = notB & C;
assign num1 = A | andnotBC;
assign num2 = oute | andBCD;
assign d = num1 | num2;




endmodule