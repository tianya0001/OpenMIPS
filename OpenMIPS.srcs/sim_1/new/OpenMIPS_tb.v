`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/01 17:43:54
// Design Name: 
// Module Name: OpenMIPS_tb
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
`timescale 1ns/1ps

module OpenMIPS_tb();

	reg in1, in2;
	wire out;

	OpenMIPS u_openmips(
		.a (in1),
		.b (in2),
		.res (out)
	);

	initial begin
		in1 = 1'b0;
		in2 = 1'b0;
		#100
		in1 = 1'b0;
		in2 = 1'b1;
		#100
		in1 = 1'b1;
		in2 = 1'b0;
		#100
		in1 = 1'b1;
		in2 = 1'b1;
		#100
		$finish;
	end

endmodule
