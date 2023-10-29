module hex2ascii_struct(a, b); // struct
   input [3:0] a;
   output [6:0] b;
   wire n0, n1, n2, n3, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;
   
   not N1(n0, a[3]); // not a
   not N2(n1, a[2]); // not b
   not N3(n2, a[1]); // not c
   not N4(n3, a[0]); // not d
     
   and U1(w1, a[3], a[2]); // a*b
   and U2(w2, a[3], a[1]); // a*c
   or U3(b[6], w1, w2); // a*b + a*c , output b[6] 

   and U4(w3, n1, n2); // b'*c'
   or U5(b[5], w3, n0); // b'c' + a' , output b[5]
 
   or U6(b[4], w3, n0); // b'c' + a' , output b[4]

   and U7(b[3], a[3], n2, n1); // ab'c' , output b[3]

   and U8(w4, n0, a[2]); // a'b
   and U9(w5, a[2], a[0]); // bd
   and U10(w6, a[2], a[1]); // bc
   or U11(b[2], w4, w5, w6); // a'b + bd + bc , output b[2]
 
   and U12(w7, n0, a[1]); // a'c
   and U13(w8, a[1], a[0]); // cd
   and U14(w9, a[3], a[2], n2, n3); // abc'd'
   or U15(b[1], w7, w8, w9); // a'c + cd + abc'd' , output b[1]

   and U16(w10, n0, a[0]); // a'd 
   and U17(w11, a[3], a[2], n3); // abd'
   and U18(w12, n1, n2, a[0]); // b'c'd
   and U19(w13, a[3], a[1], n3); // acd'
   or U20(b[0], w10, w11, w12, w13); // a'd + abd' + b'c'd + acd' , output b[0]
   
endmodule


module hex2ascii_df(c, d); // dataflow
   input [3:0] c;
   output [6:0] d;

wire [6:0] temp;

assign temp[0] = (~c[3]&c[0])|(c[3]&c[2]&(~c[0]))|((~c[2])&(~c[1])&c[0])|(c[3]&c[1]&(~c[0])); // a'd + abd' + b'c'd + acd'
assign temp[1] = ((~c[3])&c[1])|(c[1]&c[0])|(c[3]&c[2]&(~c[1])&(~c[0])); // a'c + cd + abc'd'
assign temp[2] = ((~c[3])&c[2])|(c[2]&c[0])|(c[2]&c[1]); // a'b + bd + bc
assign temp[3] = (c[3]&(~c[2])&(~c[1])); // ab'c' 
assign temp[4] = ((~c[2])&(~c[1]))|(~c[3]); // b'c' + a'
assign temp[5] = ((~c[2])&(~c[1]))|(~c[3]); // b'c' + a'
assign temp[6] = (c[3]&c[2])|(c[3]&c[1]); // ab + ac

assign d = temp[6:0];

endmodule



module hex2ascii_bh(e, f); // behavioral
   input [3:0] e;
   output [6:0] f;
   reg [6:0] state;


always @ (e) begin // put the inpur each case
   case(e)
      4'b0000: state = 7'd48;
      4'b0001: state = 7'd49;
      4'b0010: state = 7'd50;
      4'b0011: state = 7'd51;
      4'b0100: state = 7'd52;
      4'b0101: state = 7'd53;
      4'b0110: state = 7'd54;
      4'b0111: state = 7'd55;
      4'b1000: state = 7'd56;
      4'b1001: state = 7'd57;
      4'b1010: state = 7'd65;
      4'b1011: state = 7'd66;
      4'b1100: state = 7'd67;
      4'b1101: state = 7'd68;
      4'b1110: state = 7'd69;
      4'b1111: state = 7'd70;
      default: state = 7'd0;
   endcase
end

assign f = state[6:0];

endmodule
