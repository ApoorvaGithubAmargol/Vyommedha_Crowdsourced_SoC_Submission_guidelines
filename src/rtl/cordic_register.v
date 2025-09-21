module cordic_register (
    input  wire        clk,
    input  wire        rst,
    input  wire signed [31:0] d,
    output reg signed [31:0] q
);
    always @(posedge clk) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
endmodule
