module updown(
	input	wire [5:0]	remaining_1, 
	input	wire [5:0]	remaining_2, 
	input	wire [5:0]	remaining_3, 
	input	wire [5:0]	remaining_4, 
	input	wire [5:0]	remaining_5, 
	input	wire [5:0]	remaining_6, 
	input	wire [5:0]	remaining_7,
   	output 	wire [13:0]	up_passenger,
	output 	wire [13:0]	down_passenger
    );
	// passenger's list of going up and down
	//1
	assign up_passenger[0] = (remaining_1[2:0] > 1);
	assign up_passenger[1] = (remaining_1[5:3] > 1);
	//2
	assign up_passenger[2] = (remaining_2[2:0] > 2);
	assign up_passenger[3] = (remaining_2[5:3] > 2);
	//3
	assign up_passenger[4] = (remaining_3[2:0] > 3);
	assign up_passenger[5] = (remaining_3[5:3] > 3);
	//4
	assign up_passenger[6] = (remaining_4[2:0] > 4);
	assign up_passenger[7] = (remaining_4[5:3] > 4);
	//5
	assign up_passenger[8] = (remaining_5[2:0] > 5);
	assign up_passenger[9] = (remaining_5[5:3] > 5);
	//6
	assign up_passenger[10] = (remaining_6[2:0] > 6);
	assign up_passenger[11] = (remaining_6[5:3] > 6);
	//7
	assign up_passenger[12] = 0;
	assign up_passenger[13] = 0;
	
	//1
	assign down_passenger[0] = 0;
	assign down_passenger[1] = 0;
	//2
	assign down_passenger[2] = (remaining_2[2:0] < 2) || (remaining_2[2:0] > 0);
	assign down_passenger[3] = (remaining_2[5:3] < 2) || (remaining_2[5:3] > 0);
	//3
	assign down_passenger[4] = (remaining_3[2:0] < 3) || (remaining_3[2:0] > 0);
	assign down_passenger[5] = (remaining_3[5:3] < 3) || (remaining_3[5:2] > 0);
	//4
	assign down_passenger[6] = (remaining_4[2:0] < 4) || (remaining_4[2:0] > 0);
	assign down_passenger[7] = (remaining_4[5:3] < 4) || (remaining_4[5:3] > 0);
	//5
	assign down_passenger[8] = (remaining_5[2:0] < 5) || (remaining_5[2:0] > 0);
	assign down_passenger[9] = (remaining_5[5:3] < 5) || (remaining_5[5:3] > 0); 
	//6
	assign down_passenger[10] = (remaining_6[2:0] < 6) || (remaining_6[2:0] > 0);
	assign down_passenger[11] = (remaining_6[5:3] < 6) || (remaining_6[5:3] > 0);
	//7
	assign down_passenger[12] = (remaining_7[2:0] < 7) || (remaining_7[2:0] > 0);
	assign down_passenger[13] = (remaining_7[5:3] < 7) || (remaining_7[5:3] > 0);
	
	
endmodule
