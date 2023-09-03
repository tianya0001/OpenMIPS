`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/01 17:52:32
// Design Name: 
// Module Name: defines
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

//**********************  全局宏定义  **********************
`define RstEnable		1'b1			// 复位信号有效
`define RstDisable		1'b0			// 复位信号无效
`define ZeroWord		32'h00000000	// 32位的数值0
`define WriteEnable		1'b1			// 使能写
`define WriteDisable	1'b0			// 禁用写
`define ReadEnable		1'b1			// 使能读
`define ReadDisable		1'b0			// 禁用读
`define AluOpBus		7:0				// 译码阶段的输出aluop_o的宽度
`define AluSelBus		2:0				// 译码阶段
`define InstValid		1'b0			// 指令有效
`define InstInvalid		1'b1			// 指令无效
`define True_v			1'b1			// 逻辑“真”
`define Fasle_v			1'b0			// 逻辑“假”
`define ChipEnable		1'b1			// 芯片使能
`define ChipDisable		1'b0			// 芯片禁止


//**********************  与具体指令相关的宏定义  **********************
`define EXE_ORI			6'b001101		// 指令ori的指令码
`define EXE_NOP			6'b000000





