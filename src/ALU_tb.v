module ALU_tb;

// Inputs
reg [7:0] A, B;
reg [3:0] control;

// Outputs
wire [7:0] result;
wire zero;

// Instantiate the ALU module
ALU ALU_inst (
    .A(A),
    .B(B),
    .control(control),
    .result(result),
    .zero(zero)
);


// Stimulus
initial begin
    // Initialize inputs
    A = 8'b10101010;
    B = 8'b01010101;
    control = 4'b0010; // ADD operation

    #20;
	
    // Apply inputs and observe outputs
    A = 8'b11110000;
    B = 8'b00001111;
    control = 4'b0110; // SUB operation

    #20;
	
    A = 8'b11001100;
    B = 8'b00110011;
    control = 4'b0000; // AND operation + Zero case

    #20;

    A = 8'b11110000;
    B = 8'b00001111;
    control = 4'b0001; // OR operation

    #20;

    // Don't care case
    A = 8'b10101010;
    B = 8'b01010101;
    control = 4'b1000; // Don't care operation
	

    #20 $finish; // End simulation
end

initial begin
  $recordfile ("waves");
  $recordvars ("depth=0", ALU_tb);
end

endmodule

