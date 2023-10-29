`timescale 1ns/1ps
module tb_test();
   reg [3:0] in;
   wire [6:0] out;
   integer i;
   reg [0:15] xpect = {{7'b0110000}, {7'b0110001}, {7'b0110010}, {7'b0110011}, {7'b0110100}, {7'b0110101}, {7'b0110110}, {7'b0110111}, {7'b0111000}, {7'b0111001}, {7'b1000001}, {7'b1000010}, {7'b1000011}, {7'b1000100}, {7'b1000101}, {7'b1000110}}; 

hex2ascii_struct structal(.a(in), .b(out));

task print_struct; // print the structural model 
      $display("<Structural Model> \n");
for(i=0; i<=15; i=i+1) begin
   if(out == xpect[i])
      $display("[%0d] 0b%b 0b%d", i+1, out, xpect[i]);
   else 
      $display("error");
end
endtask

initial begin
   in = 4'b0000;
   #10
   in = 4'b0001;
   #10
   in = 4'b0010;
   #10
   in = 4'b0011;
   #10
   in = 4'b0100;
   #10
   in = 4'b0101;
   #10
   in = 4'b0110;
   #10
   in = 4'b0111;
   #10
   in = 4'b1000;
   #10
   in = 4'b1001;
   #10
   in = 4'b1010;
   #10
   in = 4'b1011;
   #10
   in = 4'b1100;
   #10
   in = 4'b1101;
   #10
   in = 4'b1110;
   #10
   in = 4'b1111;

end

   reg [3:0] in2;
   wire [6:0] out2;

hex2ascii_df dataflow (.c(in2), .d(out2));

task print_dataflow; // print the dataflow model
      $display("<Dataflow Model> \n");
for(i=16; i<=31; i=i+1) begin
   if(out == xpect[i-16])
      $display("[%0d] 0b%b 0b%d", i+1, out, xpect[i-16]);
   else
      $display("error");
end
endtask


initial begin
   in2 = 4'b0000;
   #10
   in2 = 4'b0001;
   #10
   in2 = 4'b0010;
   #10
   in2 = 4'b0011;
   #10
   in2 = 4'b0100;
   #10
   in2 = 4'b0101;
   #10
   in2 = 4'b0110;
   #10
   in2 = 4'b0111;
   #10
   in2 = 4'b1000;
   #10
   in2 = 4'b1001;
   #10
   in2 = 4'b1010;
   #10
   in2 = 4'b1011;
   #10
   in2 = 4'b1100;
   #10
   in2 = 4'b1101;
   #10
   in2 = 4'b1110;
   #10
   in2 = 4'b1111;

end

   reg [3:0] in3;
   wire [6:0] out3;

hex2ascii_bh behavioral (.e(in3), .f(out3));

task print_behavioral; // print the behavioral model
      $display("<Behavioral Model> \n");
	for (i=32; i<=47; i=i+1) begin
  	 if(out == xpect[i-32])
    	  $display("[%0d] 0b%b 0b%d", i+1, out, xpect[i-32]);
   	 else
     	 $display("error");
	end
endtask

initial begin
   in3 = 4'b0000;
   #10
   in3 = 4'b0001;
   #10
   in3 = 4'b0010;
   #10
   in3 = 4'b0011;
   #10
   in3 = 4'b0100;
   #10
   in3 = 4'b0101;
   #10
   in3 = 4'b0110;
   #10
   in3 = 4'b0111;
   #10
   in3 = 4'b1000;
   #10
   in3 = 4'b1001;
   #10
   in3 = 4'b1010;
   #10
   in3 = 4'b1011;
   #10
   in3 = 4'b1100;
   #10
   in3 = 4'b1101;
   #10
   in3 = 4'b1110;
   #10
   in3 = 4'b1111;

end
endmodule
