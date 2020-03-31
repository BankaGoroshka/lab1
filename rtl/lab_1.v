`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2020 14:35:05
// Design Name: 
// Module Name: lab_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab_1(
input [9:0] sw,
output [6:0] hex,
output AN
 );

reg [3:0] mux; 
wire f;
wire [3:0] dc1;
wire [3:0] dc2;
wire [3:0] new_sw;
assign new_sw=sw[3:0];
assign AN=8'b1111_1110;
assign dc1=new_sw<<1+new_sw>>1;
assign dc2=~sw[7:4];
assign f=sw[0]|(sw[1]^(sw[2]^(~sw[3])));
always@(*) begin
    case(sw[9:8])
    2'b00: mux=dc1;
    2'b01: mux=dc2;
    2'b10: mux=f;
    2'b11: mux=sw[3:0];
    endcase
 end 
  dectohex dec0
 (.dec(mux),
 .hex(hex)
 );
endmodule
