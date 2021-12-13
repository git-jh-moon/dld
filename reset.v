module rst(
	input           reset_start,
    input   [5:0]   passenger_1, passenger_2, passenger_3, passenger_4, passenger_5, passenger_6, passenger_7,
    input   [2:0]   init_elevator_1, init_elevator_2,
    output reg [5:0]   remaining_1, remaining_2, remaining_3, remaining_4, remaining_5, remaining_6, remaining_7,
    output reg [2:0]   curr_elevator_1, curr_elevator_2,
    output reg [1:0]   dir_elevator
    );
	always@(posedge reset_start) begin
        remaining_1 = passenger_1;
        remaining_2 = passenger_2;
        remaining_3 = passenger_3;
        remaining_4 = passenger_4;
        remaining_5 = passenger_5;
        remaining_6 = passenger_6;
        remaining_7 = passenger_7;
        curr_elevator_1 = init_elevator_1;
        curr_elevator_2 = init_elevator_2;
        dir_elevator = (init_elevat_1 > init_elevator_2)? 2'b01 : 2'b10;
    end
	
endmodule