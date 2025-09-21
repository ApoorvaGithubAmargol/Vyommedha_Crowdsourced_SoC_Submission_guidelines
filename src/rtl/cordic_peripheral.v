module cordic_peripheral (
    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] bus_data_in,
    input  wire [5:0]  bus_addr,
    input  wire        bus_wr,
    output wire [31:0] bus_data_out
);

    // Internal signals
    wire signed [31:0] X_reg, Y_reg, Z_reg;
    wire start;
    wire [4:0] iter_cnt;
    wire done;
    wire signed [31:0] X_next, Y_next, Z_next;
    wire [31:0] atan_val;

    // Intermediate registers for iterative feedback
    reg signed [31:0] X_int, Y_int, Z_int;

    // Inputs / Registers
    cordic_inputs u_inputs (
        .clk(clk),
        .rst(rst),
        .bus_data_in(bus_data_in),
        .bus_addr(bus_addr),
        .bus_wr(bus_wr),
        .X_reg(X_reg),
        .Y_reg(Y_reg),
        .Z_reg(Z_reg),
        .start(start)
    );

    // FSM
    cordic_fsm u_fsm (
        .clk(clk),
        .rst(rst),
        .start(start),
        .iter_cnt(iter_cnt),
        .done(done)
    );

    // LUT for arctangent
    cordic_lut u_lut (
        .iter(iter_cnt),
        .atan_val(atan_val)
    );

    // Iterative CORDIC ALU
    cordic_iter u_iter (
        .X_in(X_reg),
        .Y_in(Y_reg),
        .Z_in(Z_reg),
        .iter(iter_cnt),
        .atan_val(atan_val),
        .X_out(X_next),
        .Y_out(Y_next),
        .Z_out(Z_next)
    );

    // Iterative feedback logic
    always @(posedge clk) begin
        if (rst) begin
            X_int <= 0;
            Y_int <= 0;
            Z_int <= 0;
        end else if (start) begin
            X_int <= X_reg;
            Y_int <= Y_reg;
            Z_int <= Z_reg;
        end else if (!done) begin
		X_int <= X_next;
		Y_int <= Y_next;
		Z_int <= Z_next;
	end
    end

    // Output to bus
    cordic_outputs u_outputs (
        .clk(clk),
        .rst(rst),
        .X(X_int),
        .Y(Y_int),
        .done(done),
        .bus_data_out(bus_data_out)
    );

endmodule
