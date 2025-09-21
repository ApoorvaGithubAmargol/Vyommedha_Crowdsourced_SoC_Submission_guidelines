module cordic_scaling (
    input  wire signed [31:0] X_in,
    input  wire signed [31:0] Y_in,
    output wire signed [31:0] X_out,
    output wire signed [31:0] Y_out
);
    assign X_out = X_in; // multiply by K factor if needed
    assign Y_out = Y_in;
endmodule
