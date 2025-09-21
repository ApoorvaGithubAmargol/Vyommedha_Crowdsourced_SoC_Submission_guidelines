`timescale 1ns/1ps

module cordic_core_TB;

    reg clk;
    reg rst;
    reg [31:0] bus_data_in;
    reg [5:0] bus_addr;
    reg bus_wr;
    wire [31:0] bus_data_out;

    // Instantiate the peripheral
    cordic_peripheral uut (
        .clk(clk),
        .rst(rst),
        .bus_data_in(bus_data_in),
        .bus_addr(bus_addr),
        .bus_wr(bus_wr),
        .bus_data_out(bus_data_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 100 MHz

    initial begin
        // Initialize
        rst = 1;
        bus_data_in = 0;
        bus_addr = 0;
        bus_wr = 0;
        #20;
//release reset
        rst = 0;
        #10;

        // Write X = 1
        bus_data_in = 32'd1;
        bus_addr = 6'd0;
        bus_wr = 1;
        #10 bus_wr = 0;

        // Write Y = 5
        bus_data_in = 32'd5;
        bus_addr = 6'd1;
        bus_wr = 1;
        #10 bus_wr = 0;

        // Write Z = pi/2 in fixed-point (approx)
        bus_data_in = 32'd157079; 
        bus_addr = 6'd2;
        bus_wr = 1;
        #10 bus_wr = 0;

        // Start
        bus_data_in = 32'd1;
        bus_addr = 6'd3;
        bus_wr = 1;
        #10 bus_wr = 0;

        // Wait until done
        wait(uut.done==1);

        $display("CORDIC Final Output: %d", bus_data_out);
        $finish;
    end
	
    always @(posedge clk) begin
        if (!rst && (uut.iter_cnt != 0 || uut.start)) begin
            $display("Iter %0d: X=%d, Y=%d, Z=%d", uut.iter_cnt, uut.X_int, uut.Y_int, uut.Z_int);
        end
    end


endmodule
