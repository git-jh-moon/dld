module updown(
	input	wire [5:0]	remaining_1, 
	input	wire [5:0]	remaining_2, 
	input	wire [5:0]	remaining_3, 
	input	wire [5:0]	remaining_4, 
	input	wire [5:0]	remaining_5, 
	input	wire [5:0]	remaining_6, 
	input	wire [5:0]	remaining_7,
   	output 	wire [6:0]	up_passenger,
	output 	wire [6:0]	down_passenger
    );
	// passenger's list of going up and down
	assign up_passenger[0] = ((remaining_1[5:3]>1) || remaining_1[2:0]>1);
	assign up_passenger[1] = ((remaining_2[5:3]>2) || remaining_2[2:0]>2);
	assign up_passenger[2] = ((remaining_3[5:3]>3) || remaining_3[2:0]>3);
	assign up_passenger[3] = ((remaining_4[5:3]>4) || remaining_4[2:0]>4);
	assign up_passenger[4] = ((remaining_5[5:3]>5) || remaining_5[2:0]>5);
	assign up_passenger[5] = ((remaining_6[5:3]>6) || remaining_6[2:0]>6);
	assign up_passenger[6] = 0;
	
	assign down_passenger[0] = 0;
	assign down_passenger[1] = ((remaining_2[5:3]<2) && (remaining_2[5:3]>0)) || ((remaining_2[2:0]<2) && (remaining_2[2:0]>0));
	assign down_passenger[2] = ((remaining_3[5:3]<3) && (remaining_3[5:3]>0)) || ((remaining_3[2:0]<3) && (remaining_3[2:0]>0));
	assign down_passenger[3] = ((remaining_4[5:3]<4) && (remaining_4[5:3]>0)) || ((remaining_4[2:0]<4) && (remaining_4[2:0]>0));
	assign down_passenger[4] = ((remaining_5[5:3]<5) && (remaining_5[5:3]>0)) || ((remaining_5[2:0]<5) && (remaining_5[2:0]>0));
	assign down_passenger[5] = ((remaining_6[5:3]<6) && (remaining_6[5:3]>0)) || ((remaining_6[2:0]<6) && (remaining_6[2:0]>0));
	assign down_passenger[6] = ((remaining_7[5:3]<7) && (remaining_7[5:3]>0)) || ((remaining_7[2:0]<7) && (remaining_7[2:0]>0));
	
	
endmodule