module output_reg(
    input reset_start,
    input clock,
    input [5:0] passenger_1, passenger_2, passenger_3, passenger_4, passenger_5, passenger_6, passenger_7,
    input [2:0] init_elevator_1, init_elevator_2,
    input [1:0] dir_elevator_next,
    input [5:0] remaining_1_next, remaining_2_next, remaining_3_next, remaining_4_next, remaining_5_next, remaining_6_next, remaining_7_next,
    input [5:0] boarding_1_next, boarding_2_next,
    input [2:0] curr_elevator_1_next, curr_elevator_2_next,
    output reg [1:0] dir_elevator,
    output reg [5:0] remaining_1, remaining_2, remaining_3, remaining_4, remaining_5, remaining_6, remaining_7,
    output reg [5:0] boarding_1, boarding_2, 
    output reg [2:0] curr_elevator_1, curr_elevator_2
    );
    always @ (posedge clock or posedge reset_start) begin
        if(reset_start) begin
            dir_elevator <= (init_elevator_1 > init_elevator_2)? 2'b01 : 2'b10;
            {remaining_1, remaining_2, remaining_3, remaining_4, remaining_5, remaining_6, remaining_7} <= {passenger_1, passenger_2, passenger_3, passenger_4, passenger_5, passenger_6, passenger_7};
            {boarding_1, boarding_2} <= 12'b0;
            {curr_elevator_1, curr_elevator_2} <= {init_elevator_1, init_elevator_2};
        end
        else begin
            dir_elevator <= dir_elevator_next;
            {remaining_1, remaining_2, remaining_3, remaining_4, remaining_5, remaining_6, remaining_7} <= {remaining_1_next, remaining_2_next, remaining_3_next, remaining_4_next, remaining_5_next, remaining_6_next, remaining_7_next};
            {boarding_1, boarding_2} <= {boarding_1_next, boarding_2_next};
            {curr_elevator_1, curr_elevator_2} <= {curr_elevator_1_next, curr_elevator_2_next};
        end
    end
endmodule
