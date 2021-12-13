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
	
	wire [6:0]	up_passenger;
	wire [6:0]	down_passenger;
	wire [1:0]	dir_elevator;
    
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
    rst     RST(
        .reset_start(reset_start),
        .passenger_1(passenger_1),
        .passenger_2(passenger_2),
        .passenger_3(passenger_3),
        .passenger_4(passenger_4),
        .passenger_5(passenger_5),
        .passenger_6(passenger_6),
        .passenger_7(passenger_7),
        .init_elevator_1(init_elevator_1),
        .init_elevator_2(init_elevator_2),
        .remaining_1(remaining_1),
        .remaining_2(remaining_2),
        .remaining_3(remaining_3),
        .remaining_4(remaining_4),
        .remaining_5(remaining_5),
        .remaining_6(remaining_6),
        .remaining_7(remaining_7),
        .curr_elevator_1(curr_elevator_1),
        .curr_elevator_2(curr_elevator_2),
        .dir_elevator(dir_elevator)
        );
endmodule
