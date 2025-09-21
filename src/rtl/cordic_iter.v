module cordic_iter (
    input  wire signed [31:0] X_in,
    input  wire signed [31:0] Y_in,
    input  wire signed [31:0] Z_in,
    input  wire [4:0]  iter,
    input  wire [31:0] atan_val,
    output reg signed [31:0] X_out,
    output reg signed [31:0] Y_out,
    output reg signed [31:0] Z_out
);
    wire signed [31:0] shift_X = X_in >>> iter;
    wire signed [31:0] shift_Y = Y_in >>> iter;
    wire signed [31:0] d = Z_in[31] ? -32'sd1 : 32'sd1;

    assign X_out = X_in - d * shift_Y;
    assign Y_out = Y_in + d * shift_X;
    assign Z_out = Z_in - d * atan_val;

endmodule
