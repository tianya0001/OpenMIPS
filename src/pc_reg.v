// pc_reg.v PC模块
// 给出指令地址，接口描述如下：
//  |----------------------------------------------------------
//  | 序号 | 接口名 | 宽度（bit） | 输入/输出 | 作用
//  |----------------------------------------------------------
//  | 1   | rst    | 1          | 输入      | 复位信号
//  | 2   | clk    | 1          | 输入      | 时钟信号
//  | 3   | pc     | 32         | 输出      | 要读取的指令地址
//  | 4   | ce     | 1          | 输出      | 指令存储器使能信号
//  |----------------------------------------------------------

module pc_reg(
    input wire clk,
    input wire rst,
    output reg[`InstAddrBus]    pc,
    output reg ce
);
    
    always @ (posedge clk) begin
        if(rst == `RstEnable) begin
            ce <= `ChipDisable;
        end else begin
            ce <= `ChipEnable;
        end
    end

    always @ (posedge clk) begin
        if(ce == `ChipDisable) begin
            pc <= 32'h00000000;
        end else begin
            pc <= pc + 4'h4;
        end
    end

endmodule //pc_reg



