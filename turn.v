module turn(
    input   [2:0]   curr_elevator_1, curr_elevator_2,
    input   [13:0]   up_passenger, down_passenger,
    input   [1:0]   dir_elevator,
    input   [5:0]   boarding_1, boarding_2,
    output wire  [1:0]   turn,
    output reg   [6:0]   hold_1, hold_2
    );
    wire [13:0] up_1, up_2, down_1, down_2;
    rsh up_1_rsh(
        .a(up_passenger),
        .f(curr_elevator_1 - 1),
        .y(up_1)
        );
    rsh up_2_rsh(
        .a(up_passenger),
        .f(curr_elevator_2 - 1),
        .y(up_2)
        );
    lsh down_1_lsh(
        .a(down_passenger),
        .f(7-curr_elevator_1),
        .y(down_1)
        );
    lsh down_2_lsh(
        .a(down_passenger),
        .f(7-curr_elevator_2),
        .y(down_2)
        );
    // arrival (2bit) - 10 : MSB passenger is arrived, 01 : LSB passenger is arrived, 11 : two passengers are arrived, 00 : no passenger is arrived
    wire [1:0] arrival_1 = {(curr_elevator_1 == boarding_1[5:3]), (curr_elevator_1 == boarding_1[2:0])};
    wire [1:0] arrival_2 = {(curr_elevator_2 == boarding_2[5:3]), (curr_elevator_2 == boarding_2[2:0])};
    // pos (2bit) - which position of elevator is occupied
    wire [1:0] pos_1 = {(boarding_1[5:3] > 3'b0), (boarding_1[2:0] > 3'b0)};
    wire [1:0] pos_2 = {(boarding_2[5:3] > 3'b0), (boarding_2[2:0] > 3'b0)};
    // spare (2bit) - which position of elevator will be null
    wire [1:0] spare_1 = {~(pos_1[1])+arrival_1[1], ~(pos_1[0])+arrival_1[0]};
    wire [1:0] spare_2 = {~(pos_2[1])+arrival_2[1], ~(pos_2[0])+arrival_2[0]};
    
    wire [1:0] spare_1_count = spare_1[1]+spare_1[0];
    wire [1:0] spare_2_count = spare_2[1]+spare_2[0];
    
    wire [1:0] leaval_1 = (dir_elevator[1])? up_1[1:0] : down_1[13:12];
    wire [1:0] leaval_2 = (dir_elevator[0])? up_2[1:0] : down_2[13:12];
    wire [1:0] leaval_1_count = leaval_1[1]+leaval_1[0];
    wire [1:0] leaval_2_count = leaval_2[1]+leaval_2[0];
    wire sim_end = (up_passenger == 14'b0) && (down_passenger == 14'b0) && (boarding_1 == 6'b0) && (boarding_2 == 6'b0);

    // target floor of each elevator
    reg turn_1;
    reg turn_2;
    assign turn = {turn_1, turn_2};
    // hold
    // 6bit - [5] 엘베 내릴 때 [4:3] 엘리베이터 비게 될 위치  [2] 엘베 탈 때 [1:0] 타는 사람 위치
    always @(*) begin
        turn_1 <= (dir_elevator[1])? (pos_1 == 2'b0) && (up_1[13:2] == 12'b0) : (pos_1 == 2'b0) && (down_1[11:0] == 12'b0);
        turn_2 <= (dir_elevator[0])? (pos_2 == 2'b0) && (up_2[13:2] == 12'b0) : (pos_2 == 2'b0) && (down_2[11:0] == 12'b0);
        hold_1 <= {sim_end, (arrival_1>2'b0), spare_1, (leaval_1_count < spare_1_count+1) && (leaval_1_count > 2'b0), leaval_1};
        hold_2 <= {sim_end, (arrival_2>2'b0), spare_2, (leaval_2_count < spare_2_count+1) && (leaval_2_count > 2'b0), leaval_2};
    end
	
endmodule
