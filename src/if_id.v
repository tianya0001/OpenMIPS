// IF/ID模块
// 暂时保存取指阶段取得的指令和对应的指令地址，
// 并在下一个时钟传递到译码阶段，接口描述如下：
//  |----------------------------------------------------------
//  | 序号 | 接口名 | 宽度（bit） | 输入/输出 | 作用
//  |----------------------------------------------------------
//  | 1   | rst    | 1          | 输入      | 复位信号
//  | 2   | clk    | 1          | 输入      | 时钟信号
//  | 3   | if_pc  | 32         | 输入      | 取指阶段获得的指令对应的地址
//  | 4   | if_inst| 32         | 输入      | 取指阶段取得的指令
//  | 4   | id_pc  | 32         | 输出      | 译码阶段的指令对应的地址
//  | 4   | is_inst| 32         | 输出      | 译码阶段的指令
//  |----------------------------------------------------------

module if_id(
    input wire                  clk,
    input wire                  rst,

    // 来自取指阶段的信号，其中宏定义InstBus表示指令宽度，为32
    input wire[`InstAddrBus]    if_pc,
    input wire[`InstBus]        if_inst,

    // 对应译码阶段的信号
    output reg[`InstAddrBus]    if_pc,
    output reg[`InstBus]        id_inst
);

    always @ (posedge clk) begin
        if (rst == `RstEnable) begin
            id_pc <= `ZeroWord;
            id_inst <= `ZeroWord;
        end else begin
            id_pc <= if_pc;
            id_inst <= if_inst;
        end
    end


endmodule //if_id
