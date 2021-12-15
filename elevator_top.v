`timescale 1ns / 1ps

module elevator_top(
    input           reset_start,
    input [5:0]     passenger_1, passenger_2, passenger_3, passenger_4, passenger_5, passenger_6, passenger_7,
    input [2:0]     init_elevator_1, init_elevator_2,
    input [1:0]     emergency,
    input           clock,
    output [7:0]    time_counter,
    output [5:0]    remaining_1, remaining_2, remaining_3, remaining_4, remaining_5, remaining_6, remaining_7,
    output [5:0]    boarding_1, boarding_2,
    output [2:0]    curr_elevator_1, curr_elevator_2
    );
	
	wire [13:0]	up_passenger;
	wire [13:0]	down_passenger;
	wire [1:0]	dir_elevator;
	wire [1:0] turn;
	wire [5:0] hold_1;
	wire [5:0] hold_2;
	wire [1:0] dir_elevator_next;
	wire [5:0] remaining_1_next, remaining_2_next, remaining_3_next, remaining_4_next, remaining_5_next, remaining_6_next, remaining_7_next;
    wire [5:0] boarding_1_next, boarding_2_next;
    wire [2:0] curr_elevator_1_next, curr_elevator_2_next;
    
    time_cnt TIME_CNT(
        .clock (clock),
        .reset_start (rest_start),
        .time_counter (time_counter)
        );
    
	updown	UPDOWN(
		.remaining_1(remaining_1),
		.remaining_2(remaining_2),
		.remaining_3(remaining_3),
		.remaining_4(remaining_4),
		.remaining_5(remaining_5),
		.remaining_6(remaining_6),
		.remaining_7(remaining_7),
		.up_passenger(up_passenger),
		.down_passenger(down_passenger)
		);
    output_reg     OUTPUT_REG(
        .reset_start(reset_start),
        .clock(clock),
        .passenger_1(passenger_1),
        .passenger_2(passenger_2),
        .passenger_3(passenger_3),
        .passenger_4(passenger_4),
        .passenger_5(passenger_5),
        .passenger_6(passenger_6),
        .passenger_7(passenger_7),
        .init_elevator_1(init_elevator_1),
        .init_elevator_2(init_elevator_2),
        .dir_elevator_next(dir_elevator_next),
        .remaining_1_next(remaining_1_next),
        .remaining_2_next(remaining_2_next),
        .remaining_3_next(remaining_3_next),
        .remaining_4_next(remaining_4_next),
        .remaining_5_next(remaining_5_next),
        .remaining_6_next(remaining_6_next),
        .remaining_7_next(remaining_7_next),
        .curr_elevator_1_next(curr_elevator_1_next),
        .curr_elevator_2_next(curr_elevator_2_next),
        .boarding_1_next(boarding_1_next),
        .boarding_2_next(boarding_2_next),
        .remaining_1(remaining_1),
        .remaining_2(remaining_2),
        .remaining_3(remaining_3),
        .remaining_4(remaining_4),
        .remaining_5(remaining_5),
        .remaining_6(remaining_6),
        .remaining_7(remaining_7),
        .curr_elevator_1(curr_elevator_1),
        .curr_elevator_2(curr_elevator_2),
        .boarding_1(boarding_1),
        .boarding_2(boarding_2),
        .dir_elevator(dir_elevator)
        );
    turn    TURN(
        .curr_elevator_1(curr_elevator_1),
        .curr_elevator_2(curr_elevator_2),
        .up_passenger(up_passenger),
        .down_passenger(down_passenger),
        .dir_elevator(dir_elevator),
        .boarding_1(boarding_1),
        .boarding_2(boarding_2),
        .turn(turn),
        .hold_1(hold_1),
        .hold_2(hold_2)
        );
    boarding    BOARDING(
        .emergency(emergency),
        .hold_1(hold_1),
        .hold_2(hold_2),
        .clock(clock),
        .remaining_1_next(remaining_1_next),
        .remaining_2_next(remaining_2_next),
        .remaining_3_next(remaining_3_next),
        .remaining_4_next(remaining_4_next),
        .remaining_5_next(remaining_5_next),
        .remaining_6_next(remaining_6_next),
        .remaining_7_next(remaining_7_next),
        .boarding_1_next(boarding_1_next),
        .boarding_2_next(boarding_2_next),
        .remaining_1(remaining_1),
        .remaining_2(remaining_2),
        .remaining_3(remaining_3),
        .remaining_4(remaining_4),
        .remaining_5(remaining_5),
        .remaining_6(remaining_6),
        .remaining_7(remaining_7),
        .curr_elevator_1(curr_elevator_1),
        .curr_elevator_2(curr_elevator_2),
        .boarding_1(boarding_1),
        .boarding_2(boarding_2)
        );
endmodule
