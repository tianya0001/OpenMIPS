// regfile.v 实现32个32位通用寄存器
// 给出指令地址，接口描述如下：
//  |----------------------------------------------------------
//  | 序号 | 接口名 | 宽度（bit） | 输入/输出 | 作用
//  |----------------------------------------------------------
//  | 1   | rst    | 1          | 输入      | 复位信号
//  | 2   | clk    | 1          | 输入      | 时钟信号
//  | 3   | waddr  | 5          | 输入      | 要写入的寄存器地址
//  | 4   | wdata  | 32         | 输入      | 要写入的数据
//  | 5   | we     | 1          | 输入      | 写使能信号
//  | 6   | raddr1 | 5          | 输入      | 
//  | 7   | re1    | 1          | 输入      | 
//  | 8   | rdata1 | 32         | 输出      | 
//  | 9   | raddr2 | 5          | 输入      | 
//  | 10  | re2    | 1          | 输入      | 
//  | 11  | rdata2 | 32         | 输出      | 
//  |----------------------------------------------------------

`include "defines.v"


module regfile(
    input wire              clk,
    input wire              rst,

    // 写端口
    input wire 				we,
    input wire[`RegAddrBus] waddr,
    input wire[`RegBus]     wdata,

    // 读端口1
    input wire              re1,
    input wire[`RegAddrBus] raddr1,
    output reg[`RegBus]     rdata1,

    // 读端口2
    input wire 				re2,
    input wire[`RegAddrBus] raddr2,
    output reg[`RegBus]     rdata2
);

//**********************  32个32寄存器  **********************
    reg[`RegBus] regs[0:(`RegNum - 1)];

//**********************  写操作  **********************
    always @ (posedge clk) begin
        if(rst == `RstEnable) begin
            if(we == `WriteEnable) begin
                regs[waddr] <= wdata;
            end 
        end
    end

//**********************  读端口1的读操作  **********************
    always @ (*) begin
        if (rst == `RstEnable) begin
            rdata1 <= `ZeroWord;
        end else if(raddr1 == `RegNumLog2'h0) begin
            rdata1 <= `ZeroWord; 
        end else if ((raddr1 == waddr) && (we == `WriteEnable) && (re1 == `ReadEnable)) begin
            rdata1 <= wdata;
        end else if(re1 == `ReadEnable) begin 
            rdata1 <= regs[raddr1];
        end else begin
            rdata1 <= `ZeroWord;
        end
    end


//**********************  读端口1的读操作  **********************
    always @ (*) begin
        if (rst == `RstEnable) begin
            rdata2 <= `ZeroWord;
        end else if(raddr2 == `RegNumLog2'h0) begin
            rdata2 <= `ZeroWord; 
        end else if ((raddr2 == waddr) && (we == `WriteEnable) && (re2 == `ReadEnable)) begin
            rdata2 <= wdata;
        end else if(re2 == `ReadEnable) begin 
            rdata2 <= regs[raddr2];
        end else begin
            rdata2 <= `ZeroWord;
        end
    end

endmodule //regfile











