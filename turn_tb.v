`timescale 1ns / 1ps
module updown_tb(
    );
	reg  [2:0]  curr_elevator_1, curr_elevator_2;
    reg  [6:0]  up_passenger, down_passenger;
    reg  [5:0]  boarding_1, boarding_2;
    reg  [1:0]  dir_elevator;
    wire [1:0]  turn;

	
	updown	UPDOWN(
		.passenger_1(passenger_1),
		.passenger_2(passenger_2),
		.passenger_3(passenger_3),
		.passenger_4(passenger_4),
		.passenger_5(passenger_5),
		.passenger_6(passenger_6),
		.passenger_7(passenger_7),
		.up_passenger(up_passenger),
		.down_passenger(down_passenger)
		);
	initial begin	
		#25
		passenger_1 = 6'b000011;
		passenger_2 = 6'b110001;
		passenger_3 = 6'b000101;
		passenger_4 = 6'b000010;
		passenger_5 = 6'b000100;
		passenger_6 = 6'b111000;
		passenger_7 = 6'b000000;
	end    

	initial begin
		$monitor($time,
		    "ns.    output changed\t => up_passenger : %d\n",
		    up_passenger   
		    );
		$monitor($time,
		    "ns.    output changed\t => down_passenger : %d\n",
		    down_passenger   
		    );
	end

	initial begin
		#200 $finish;
	end

endmodule