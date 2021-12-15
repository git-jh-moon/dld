module floor(
    input clock,
    input [1:0] emergency,
    input [1:0] turn,
    input [2:0] curr_elevator_1, curr_elevator_2,
    input [1:0] dir_elevator,
    input [5:0] hold_1, hold_2,
    output reg [2:0] curr_elevator_1_next, curr_elevator_2_next,
    output reg [1:0] dir_elevator_next
    );
    //dir_elevator
    always @ (posedge clock) begin
        case (emergency)
            2'b00: begin
                dir_elevator_next[1] <= (turn[1])? ~dir_elevator[1] : dir_elevator[1];
                dir_elevator_next[0] <= (turn[0])? ~dir_elevator[0] : dir_elevator[0];
            end
            2'b01: begin
                dir_elevator_next[1] <= (turn[1])? ~dir_elevator[1] : dir_elevator[1];
                // emergency 풀렷을 때 두 엘베가 같은 층이고 같은 방향이면 다른 로직에 문제가 생김
                dir_elevator_next[0] <= (curr_elevator_1 == curr_elevator_2)? ~dir_elevator[1] : dir_elevator[0];
            end
            2'b10: begin
                dir_elevator_next[1] <= (curr_elevator_1 == curr_elevator_2)? ~dir_elevator[0] : dir_elevator[1];
                dir_elevator_next[0] <= (turn[0])? ~dir_elevator[0] : dir_elevator[0];
            end
            default: begin
                dir_elevator_next <= 2'bxx;
            end
        endcase
    end
    //curr_elevator
    always @ (posedge clock) begin
        case (emergency)
            2'b00: begin
                curr_elevator_1_next <= (hold_1[5] || hold_1[2])? curr_elevator_1 : curr_elevator_1 + 2*dir_elevator[1] - 1;
                curr_elevator_2_next <= (hold_2[5] || hold_2[2])? curr_elevator_2 : curr_elevator_2 + 2*dir_elevator[0] - 1;
            end
            2'b01: begin
                curr_elevator_1_next <= (hold_1[5] || hold_1[2])? curr_elevator_1 : curr_elevator_1 + 2*dir_elevator[1] - 1;
                curr_elevator_2_next <= curr_elevator_2;
            end
            2'b10: begin
                curr_elevator_1_next <= curr_elevator_1;
                curr_elevator_2_next <= (hold_2[5] || hold_2[2])? curr_elevator_2 : curr_elevator_2 + 2*dir_elevator[0] - 1;
            end
            default: begin
                curr_elevator_1_next <= 2'bxx;
                curr_elevator_2_next <= 2'bxx;
            end
        endcase
    end
endmodule
