module cordic_fsm (
    input  wire clk,
    input  wire rst,
    input  wire start,
    output reg [4:0] iter_cnt,
    output reg done
);
    typedef enum {IDLE, RUN, DONE} state_t;
    state_t state;

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            iter_cnt <= 0;
            done <= 0;
        end else begin
            case(state)
                IDLE: begin
                    done <= 0;
                    iter_cnt <= 0;
                    if (start) state <= RUN;
                end
                RUN: begin
                    iter_cnt <= iter_cnt + 1;
                    if (iter_cnt == 31) state <= DONE;
                end
                DONE: begin
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
