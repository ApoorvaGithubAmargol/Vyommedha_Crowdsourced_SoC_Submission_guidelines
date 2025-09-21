module cordic_outputs ( 
    input  wire clk,
    input  wire rst,
    input  wire signed [31:0] X,
    input  wire signed [31:0] Y,
    input  wire done,
    output reg [31:0] bus_data_out
);

    always @(posedge clk) begin
        if (rst) begin
            bus_data_out <= 0;
        end else if (done) begin
            bus_data_out <= X;  // Output final X value when done
            // If you want to output Y instead, change this line to: bus_data_out <= Y;
        end else begin
            bus_data_out <= 0;  // Otherwise, keep bus output 0
        end
    end

endmodule
