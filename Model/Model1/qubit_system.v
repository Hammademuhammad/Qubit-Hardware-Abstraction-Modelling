module qubit_system (
    input clk,
    input reset,
    input [1:0] qubit_input,
    output reg [1:0] qubit_state
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            qubit_state <= 2'b00;
        end else begin
            qubit_state <= qubit_input;
        end
    end
endmodule
