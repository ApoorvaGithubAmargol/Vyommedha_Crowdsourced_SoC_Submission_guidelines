module cordic_inputs (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] bus_data_in,
    input  wire [5:0]  bus_addr,
    input  wire        bus_wr,
    output reg signed [31:0] X_reg,
    output reg signed [31:0] Y_reg,
    output reg signed [31:0] Z_reg,
    output reg          start
);
    always @(posedge clk) begin
        if (rst) begin
            X_reg <= 0;
            Y_reg <= 0;
            Z_reg <= 0;
            start <= 0;
        end else if (bus_wr) begin
            case(bus_addr)
                6'd0: X_reg <= bus_data_in;
                6'd1: Y_reg <= bus_data_in;
                6'd2: Z_reg <= bus_data_in;
                6'd3: start <= bus_data_in[0]; // LSB as start
            endcase
        end
    end
endmodule
