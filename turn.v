module turn(
    input   [2:0]   curr_elevator_1, curr_elevator_2,
    input   [6:0]   up_passenger, down_passenger,
    input   [1:0]   dir_elevator,
    input   [5:0]   boarding_1, boarding_2,
    output wire  [1:0]   turn
    );
    
    // flag of remaining passengers above orW beneath
    wire [6:0] up_1, up_2, down_1, down_2;
    rsh up_1_rsh(
        .a(up_passenger),
        .f(curr_elevator_1),
        .y(up_1)
        );
    rsh up_2_rsh(
        .a(up_passenger),
        .f(curr_elevator_2),
        .y(up_2)
        );
    lsh down_1_lsh(
        .a(down_passenger),
        .f(curr_elevator_1),
        .y(down_1)
        );
    lsh down_2_lsh(
        .a(down_passenger),
        .f(curr_elevator_2),
        .y(down_2)
        );
    // flag of wheter is elevator is empty
    wire empty_1 = (boarding_1[5:3] == 3'b0) && (boarding_1[2:0] == 3'b0);
    wire empty_2 = (boarding_2[5:3] == 3'b0) && (boarding_2[2:0] == 3'b0);

    // target floor of each elevator
    reg turn_1;
    reg turn_2;
    assign turn = {turn_1, turn_2};

    always @(*) begin
        case(dir_elevator)
            2'b00:  begin
                turn_1 = empty_1 && (down_1 == 7'b0);
                turn_2 = empty_2 && (down_2 == 7'b0);
            end
            2'b01:  begin
                turn_1 = empty_1 && (down_1 == 7'b0);
                turn_2 = empty_2 && (up_2 == 7'b0);
            end
            2'b10:  begin
                turn_1 = empty_1 && (up_1 == 7'b0);
                turn_2 = empty_2 && (down_2 == 7'b0);
            end
            2'b11:  begin
                turn_1 = empty_1 && (up_1 == 7'b0);
                turn_2 = empty_2 && (up_2 == 7'b0);
            end
            default:    begin
                turn_1 = 1'b0;
                turn_2 = 1'b0;
            end
        endcase
    end
	
endmodule
