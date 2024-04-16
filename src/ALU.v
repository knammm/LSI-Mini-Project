module ALU(
    input [7:0] A,
    input [7:0] B,
    input [3:0] control,
    output [7:0] result,
    output zero
);

reg [7:0] temp;

always @(*) begin
    case(control)
        4'b0010: temp <= A + B; // ADD
        4'b0110: temp <= A - B; // SUB
        4'b0000: temp <= A & B; // AND
        4'b0001: temp <= A | B; // OR
        default: temp <= 8'bxxxxxxxx; // Don't care
    endcase
end

assign result = temp;
assign zero = (result == 8'b0) ? 1'b1 : 1'b0; // Set zero based on result value

endmodule
