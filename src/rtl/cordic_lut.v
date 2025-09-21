module cordic_lut (
    input  wire [4:0] iter,
    output reg [31:0] atan_val
);
    always @(*) begin
        case(iter)
            5'd0 : atan_val = 32'hC90FDAA2; // atan(2^-0)
            5'd1 : atan_val = 32'h76B19C16; // atan(2^-1)
            5'd2 : atan_val = 32'h3EB6EBF2;
            5'd3 : atan_val = 32'h1FD5BA9B;
            5'd4 : atan_val = 32'h0FFAADDC;
            5'd5 : atan_val = 32'h07FF556B;
            5'd6 : atan_val = 32'h03FFEAAB;
            5'd7 : atan_val = 32'h01FFF555;
            5'd8 : atan_val = 32'h00FFFAAA;
            5'd9 : atan_val = 32'h007FF555;
            5'd10: atan_val = 32'h003FFAAA;
            5'd11: atan_val = 32'h001FF555;
            5'd12: atan_val = 32'h000FFAAA;
            5'd13: atan_val = 32'h0007FF55;
            5'd14: atan_val = 32'h0003FFAA;
            5'd15: atan_val = 32'h0001FF55;
            5'd16: atan_val = 32'h0000FFAA;
            5'd17: atan_val = 32'h00007FF5;
            5'd18: atan_val = 32'h00003FFA;
            5'd19: atan_val = 32'h00001FF5;
            5'd20: atan_val = 32'h00000FFA;
            5'd21: atan_val = 32'h000007FF;
            5'd22: atan_val = 32'h000003FF;
            5'd23: atan_val = 32'h000001FF;
            5'd24: atan_val = 32'h000000FF;
            5'd25: atan_val = 32'h0000007F;
            5'd26: atan_val = 32'h0000003F;
            5'd27: atan_val = 32'h0000001F;
            5'd28: atan_val = 32'h0000000F;
            5'd29: atan_val = 32'h00000007;
            5'd30: atan_val = 32'h00000003;
            5'd31: atan_val = 32'h00000001;
            default: atan_val = 32'd0;
        endcase
    end
endmodule
