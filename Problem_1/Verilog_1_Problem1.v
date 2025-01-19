module Verilog_1_Problem1(
    input CLK,
    input A, B1, B2,
    output reg CLK1, CLK2, CLK3, CLK4,
    output reg OUT1, OUT2, OUT3, OUT4
);

reg [1:0] clk_div;

always @(posedge CLK) begin
    clk_div <= clk_div + 1;
    CLK1 <= (clk_div == 2'b00);
    CLK2 <= (clk_div == 2'b01);
    CLK3 <= (clk_div == 2'b10);
    CLK4 <= (clk_div == 2'b11);
end

always @(*) begin
    case ({A, B1, B2})
        3'b000: begin
            OUT1 = CLK1; OUT2 = CLK2; OUT3 = CLK3; OUT4 = CLK4;
        end
        3'b001: begin
            OUT1 = CLK1; OUT2 = CLK2; OUT3 = CLK3; OUT4 = CLK4;
        end
        3'b010: begin
            OUT1 = CLK1; OUT2 = CLK2; OUT3 = CLK3; OUT4 = CLK4;
        end
        3'b011: begin
            OUT1 = 0; OUT2 = 0; OUT3 = 0; OUT4 = 0;
        end
        3'b1XX: begin
            OUT1 = 1; OUT2 = 1; OUT3 = 1; OUT4 = 1;
        end
        default: begin
            OUT1 = 0; OUT2 = 0; OUT3 = 0; OUT4 = 0;
        end
    endcase
end

endmodule
