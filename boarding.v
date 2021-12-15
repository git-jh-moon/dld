module boarding(
    input   [1:0]   emergency,
    input   [5:0]   hold_1, hold_2,
    input           clock,
    input   [2:0]   curr_elevator_1, curr_elevator_2,
    input   [5:0]   boarding_1, boarding_2,
    input   [5:0]	remaining_1, remaining_2, remaining_3, remaining_4, remaining_5, remaining_6, remaining_7,
    output reg  [5:0]   boarding_1_next, boarding_2_next,
    output reg  [5:0]   remaining_1_next, remaining_2_next, remaining_3_next, remaining_4_next, remaining_5_next, remaining_6_next, remaining_7_next
    );
// elevator 1
always @(posedge clock) begin
    if(emergency[1]) begin
        case(curr_elevator_1)
            3'd1: begin
                remaining_1_next <= boarding_1;
                if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
            end
            3'd2: begin
                if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                remaining_2_next <= boarding_1; 
                if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
            end
            3'd3: begin
                if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                remaining_3_next <= boarding_1;
                if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
            end
            3'd4: begin
                if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                remaining_4_next <= boarding_1;
                if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
            end
            3'd5: begin
                if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                remaining_5_next <= boarding_1; 
                if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
            end
            3'd6: begin
                if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                remaining_6_next <= boarding_1;
                if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;  
            end
            3'd7: begin
                if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                remaining_7_next <= boarding_1;
            end
        endcase
        boarding_1_next <= 6'b0;
    end
    
    // not emergency
    else begin
        case(curr_elevator_1)
            // elevator 1 - floor 1
            3'd1: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_1_next <= {remaining_1[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_1[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_1[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_1_next <= 6'b0;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= remaining_1;
                    end
                    4'b1000 : begin
                        remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {3'b0, boarding_1[2:0]};
                    end
                    4'b1001 : begin
                        remaining_1_next <= {remaining_1[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_1[2:0], boarding_1[2:0]};
                    end
                    4'b1010 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_1[5:3], boarding_1[2:0]};
                    end
                    4'b1011 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_1[5:3], boarding_1[2:0]};
                    end
                    4'b0100 : begin
                        remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_1_next <= {remaining_1[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_1[2:0]};
                    end
                    4'b0110 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_1[5:3]};
                    end
                    4'b0111 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_1[5:3]};
                    end
                    default : begin
                        remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= boarding_1;
                    end
                endcase
            end
            // elevator 1 - floor 2
            3'd2: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_2_next <= {remaining_2[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_2[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_2[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_2_next <= 6'b0;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= remaining_2;
                    end
                    4'b1000 : begin
                        remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {3'b0, boarding_1[2:0]};
                    end
                    4'b1001 : begin
                        remaining_2_next <= {remaining_2[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_2[2:0], boarding_1[2:0]};
                    end
                    4'b1010 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_2[5:3], boarding_1[2:0]};
                    end
                    4'b1011 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_2[5:3], boarding_1[2:0]};
                    end
                    4'b0100 : begin
                        remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_2_next <= {remaining_2[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_2[2:0]};
                    end
                    4'b0110 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_2[5:3]};
                    end
                    4'b0111 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_2[5:3]};
                    end
                    default : begin
                        remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= boarding_1;
                    end
                endcase   
            end
            // elevator 1 - floor 3
            3'd3: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_3_next <= {remaining_3[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_3[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_3[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_3_next <= 6'b0;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= remaining_3;
                    end
                    4'b1000 : begin
                        remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {3'b0, boarding_1[2:0]};
                    end
                    4'b1001 : begin
                        remaining_3_next <= {remaining_3[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_3[2:0], boarding_1[2:0]};
                    end
                    4'b1010 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_3[5:3], boarding_1[2:0]};
                    end
                    4'b1011 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_3[5:3], boarding_1[2:0]};
                    end
                    4'b0100 : begin
                        remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_3_next <= {remaining_3[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_3[2:0]};
                    end
                    4'b0110 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_3[5:3]};
                    end
                    4'b0111 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_3[5:3]};
                    end
                    default : begin
                        remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= boarding_1;
                    end
                endcase      
            end
            // elevator 1 - floor 4
            3'd4: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_4_next <= {remaining_4[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_4[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_4[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_4_next <= 6'b0;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= remaining_4;
                    end
                    4'b1000 : begin
                        remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {3'b0, boarding_1[2:0]};
                    end
                    4'b1001 : begin
                        remaining_4_next <= {remaining_4[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_4[2:0], boarding_1[2:0]};
                    end
                    4'b1010 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_4[5:3], boarding_1[2:0]};
                    end
                    4'b1011 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_4[5:3], boarding_1[2:0]};
                    end
                    4'b0100 : begin
                        remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_4_next <= {remaining_4[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_4[2:0]};
                    end
                    4'b0110 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_4[5:3]};
                    end
                    4'b0111 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_4[5:3]};
                    end
                    default : begin
                        remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= boarding_1;
                    end
                endcase   
            end
            // elevator 1 - floor 5
            3'd5: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_5_next <= {remaining_5[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_5[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_5[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_5_next <= 6'b0;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= remaining_5;
                    end
                    4'b1000 : begin
                        remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {3'b0, boarding_1[2:0]};
                    end
                    4'b1001 : begin
                        remaining_5_next <= {remaining_5[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_5[2:0], boarding_1[2:0]};
                    end
                    4'b1010 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_5[5:3], boarding_1[2:0]};
                    end
                    4'b1011 : begin
                        remaining_4_next <= {3'b0, remaining_5[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_5[5:3], boarding_1[2:0]};
                    end
                    4'b0100 : begin
                        remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_5_next <= {remaining_5[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_5[2:0]};
                    end
                    4'b0110 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_5[5:3]};
                    end
                    4'b0111 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_5[5:3]};
                    end
                    default : begin
                        remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= boarding_1;
                    end
                endcase   
            end
            // elevator 1 - floor 6
            3'd6: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_6_next <= {remaining_6[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_6[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_6[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_6_next <= 6'b0;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= remaining_6;
                    end
                    4'b1000 : begin
                        remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {3'b0, boarding_1[2:0]};
                    end
                    4'b1001 : begin
                        remaining_6_next <= {remaining_6[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_6[2:0], boarding_1[2:0]};
                    end
                    4'b1010 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_6[5:3], boarding_1[2:0]};
                    end
                    4'b1011 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {remaining_6[5:3], boarding_1[2:0]};
                    end
                    4'b0100 : begin
                        remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_6_next <= {remaining_6[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_6[2:0]};
                    end
                    4'b0110 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_6[5:3]};
                    end
                    4'b0111 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= {boarding_1[5:3], remaining_6[5:3]};
                    end
                    default : begin
                        remaining_6_next <= remaining_6;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd7) remaining_7_next <= remaining_7;
                        boarding_1_next <= boarding_1;
                    end
                endcase      
            end
            // elevator 1 - floor 7
            3'd7: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_7_next <= remaining_7;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_7_next <= {remaining_7[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {remaining_7[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {remaining_7[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_7_next <= 6'b0;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= remaining_7;
                    end
                    4'b1000 : begin
                        remaining_7_next <= remaining_7;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {3'b0, boarding_1[2:0]};
                    end
                    4'b1001 : begin
                        remaining_7_next <= {remaining_7[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {remaining_7[2:0], boarding_1[2:0]};
                    end
                    4'b1010 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {remaining_7[5:3], boarding_1[2:0]};
                    end
                    4'b1011 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {remaining_7[5:3], boarding_1[2:0]};
                    end
                    4'b0100 : begin
                        remaining_7_next <= remaining_7;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {boarding_1[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_7_next <= {remaining_7[5:3], 3'b0};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {boarding_1[5:3], remaining_7[2:0]};
                    end
                    4'b0110 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {boarding_1[5:3], remaining_7[5:3]};
                    end
                    4'b0111 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= {boarding_1[5:3], remaining_7[5:3]};
                    end
                    default : begin
                        remaining_7_next <= remaining_7;
                        if(curr_elevator_2 != 3'd1) remaining_1_next <= remaining_1;
                        if(curr_elevator_2 != 3'd2) remaining_2_next <= remaining_2;
                        if(curr_elevator_2 != 3'd3) remaining_3_next <= remaining_3;
                        if(curr_elevator_2 != 3'd4) remaining_4_next <= remaining_4;
                        if(curr_elevator_2 != 3'd5) remaining_5_next <= remaining_5;
                        if(curr_elevator_2 != 3'd6) remaining_6_next <= remaining_6;
                        boarding_1_next <= boarding_1;
                    end
                endcase  
            end
        endcase
    end
end

//elevator 2
always @(posedge clock) begin
    if(emergency[0]) begin
        case(curr_elevator_2)
            3'd1: begin
                remaining_1_next <= boarding_2;
            end
            3'd2: begin
                remaining_2_next <= boarding_2; 
            end
            3'd3: begin
                remaining_3_next <= boarding_2;
            end
            3'd4: begin
                remaining_4_next <= boarding_2;
            end
            3'd5: begin
                remaining_5_next <= boarding_2; 
            end
            3'd6: begin
                remaining_6_next <= boarding_2; 
            end
            3'd7: begin
                remaining_7_next <= boarding_2;
            end
        endcase
        boarding_2_next <= 6'b0;
    end
    
    // not emergency
    else begin
        case(curr_elevator_2)
            // elevator 2 - floor 1
            3'd1: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_1_next <= remaining_1;
                        boarding_2_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_1_next <= {remaining_1[5:3], 3'b0};
                        boarding_2_next <= {remaining_1[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        boarding_2_next <= {remaining_1[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_1_next <= 6'b0;
                        boarding_2_next <= remaining_1;
                    end
                    4'b1000 : begin
                        remaining_1_next <= remaining_1;
                        boarding_2_next <= {3'b0, boarding_2[2:0]};
                    end
                    4'b1001 : begin
                        remaining_1_next <= {remaining_1[5:3], 3'b0};
                        boarding_2_next <= {remaining_1[2:0], boarding_2[2:0]};
                    end
                    4'b1010 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        boarding_2_next <= {remaining_1[5:3], boarding_2[2:0]};
                    end
                    4'b1011 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        boarding_2_next <= {remaining_1[5:3], boarding_2[2:0]};
                    end
                    4'b0100 : begin
                        remaining_1_next <= remaining_1;
                        boarding_2_next <= {boarding_2[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_1_next <= {remaining_1[5:3], 3'b0};
                        boarding_2_next <= {boarding_2[5:3], remaining_1[2:0]};
                    end
                    4'b0110 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_1[5:3]};
                    end
                    4'b0111 : begin
                        remaining_1_next <= {3'b0, remaining_1[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_1[5:3]};
                    end
                    default : begin
                        remaining_1_next <= remaining_1;
                        boarding_2_next <= boarding_2;
                    end
                endcase
            end
            // elevator 2 - floor 2
            3'd2: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_2_next <= remaining_2;
                        boarding_2_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_2_next <= {remaining_2[5:3], 3'b0};
                        boarding_2_next <= {remaining_2[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        boarding_2_next <= {remaining_2[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_2_next <= 6'b0;
                        boarding_2_next <= remaining_2;
                    end
                    4'b1000 : begin
                        remaining_2_next <= remaining_2;
                        boarding_2_next <= {3'b0, boarding_2[2:0]};
                    end
                    4'b1001 : begin
                        remaining_2_next <= {remaining_2[5:3], 3'b0};
                        boarding_2_next <= {remaining_2[2:0], boarding_2[2:0]};
                    end
                    4'b1010 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        boarding_2_next <= {remaining_2[5:3], boarding_2[2:0]};
                    end
                    4'b1011 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        boarding_2_next <= {remaining_2[5:3], boarding_2[2:0]};
                    end
                    4'b0100 : begin
                        remaining_2_next <= remaining_2;
                        boarding_2_next <= {boarding_2[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_2_next <= {remaining_2[5:3], 3'b0};
                        boarding_2_next <= {boarding_2[5:3], remaining_2[2:0]};
                    end
                    4'b0110 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_2[5:3]};
                    end
                    4'b0111 : begin
                        remaining_2_next <= {3'b0, remaining_2[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_2[5:3]};
                    end
                    default : begin
                        remaining_2_next <= remaining_2;
                        boarding_2_next <= boarding_2;
                    end
                endcase   
            end
            // elevator 2 - floor 3
            3'd3: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_3_next <= remaining_3;
                        boarding_2_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_3_next <= {remaining_3[5:3], 3'b0};
                        boarding_2_next <= {remaining_3[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        boarding_2_next <= {remaining_3[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_3_next <= 6'b0;
                        boarding_2_next <= remaining_3;
                    end
                    4'b1000 : begin
                        remaining_3_next <= remaining_3;
                        boarding_2_next <= {3'b0, boarding_2[2:0]};
                    end
                    4'b1001 : begin
                        remaining_3_next <= {remaining_3[5:3], 3'b0};
                        boarding_2_next <= {remaining_3[2:0], boarding_2[2:0]};
                    end
                    4'b1010 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        boarding_2_next <= {remaining_3[5:3], boarding_2[2:0]};
                    end
                    4'b1011 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        boarding_2_next <= {remaining_3[5:3], boarding_2[2:0]};
                    end
                    4'b0100 : begin
                        remaining_3_next <= remaining_3;
                        boarding_2_next <= {boarding_2[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_3_next <= {remaining_3[5:3], 3'b0};
                        boarding_2_next <= {boarding_2[5:3], remaining_3[2:0]};
                    end
                    4'b0110 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_3[5:3]};
                    end
                    4'b0111 : begin
                        remaining_3_next <= {3'b0, remaining_3[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_3[5:3]};
                    end
                    default : begin
                        remaining_3_next <= remaining_3;
                        boarding_2_next <= boarding_2;
                    end
                endcase      
            end
            // elevator 2 - floor 4
            3'd4: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_4_next <= remaining_4;
                        boarding_2_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_4_next <= {remaining_4[5:3], 3'b0};
                        boarding_2_next <= {remaining_4[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        boarding_2_next <= {remaining_4[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_4_next <= 6'b0;
                        boarding_2_next <= remaining_4;
                    end
                    4'b1000 : begin
                        remaining_4_next <= remaining_4;
                        boarding_2_next <= {3'b0, boarding_2[2:0]};
                    end
                    4'b1001 : begin
                        remaining_4_next <= {remaining_4[5:3], 3'b0};
                        boarding_2_next <= {remaining_4[2:0], boarding_2[2:0]};
                    end
                    4'b1010 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        boarding_2_next <= {remaining_4[5:3], boarding_2[2:0]};
                    end
                    4'b1011 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        boarding_2_next <= {remaining_4[5:3], boarding_2[2:0]};
                    end
                    4'b0100 : begin
                        remaining_4_next <= remaining_4;
                        boarding_2_next <= {boarding_2[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_4_next <= {remaining_4[5:3], 3'b0};
                        boarding_2_next <= {boarding_2[5:3], remaining_4[2:0]};
                    end
                    4'b0110 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_4[5:3]};
                    end
                    4'b0111 : begin
                        remaining_4_next <= {3'b0, remaining_4[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_4[5:3]};
                    end
                    default : begin
                        remaining_4_next <= remaining_4;
                        boarding_2_next <= boarding_2;
                    end
                endcase   
            end
            // elevator 2 - floor 5
            3'd5: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_5_next <= remaining_5;
                        boarding_2_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_5_next <= {remaining_5[5:3], 3'b0};
                        boarding_2_next <= {remaining_5[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        boarding_2_next <= {remaining_5[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_5_next <= 6'b0;
                        boarding_2_next <= remaining_5;
                    end
                    4'b1000 : begin
                        remaining_5_next <= remaining_5;
                        boarding_2_next <= {3'b0, boarding_2[2:0]};
                    end
                    4'b1001 : begin
                        remaining_5_next <= {remaining_5[5:3], 3'b0};
                        boarding_2_next <= {remaining_5[2:0], boarding_2[2:0]};
                    end
                    4'b1010 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        boarding_2_next <= {remaining_5[5:3], boarding_2[2:0]};
                    end
                    4'b1011 : begin
                        remaining_4_next <= {3'b0, remaining_5[2:0]};
                        boarding_2_next <= {remaining_5[5:3], boarding_2[2:0]};
                    end
                    4'b0100 : begin
                        remaining_5_next <= remaining_5;
                        boarding_2_next <= {boarding_2[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_5_next <= {remaining_5[5:3], 3'b0};
                        boarding_2_next <= {boarding_2[5:3], remaining_5[2:0]};
                    end
                    4'b0110 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_5[5:3]};
                    end
                    4'b0111 : begin
                        remaining_5_next <= {3'b0, remaining_5[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_5[5:3]};
                    end
                    default : begin
                        remaining_5_next <= remaining_5;
                        boarding_2_next <= boarding_2;
                    end
                endcase   
            end
            // elevator 2 - floor 6
            3'd6: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_6_next <= remaining_6;
                        boarding_2_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_6_next <= {remaining_6[5:3], 3'b0};
                        boarding_2_next <= {remaining_6[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        boarding_2_next <= {remaining_6[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_6_next <= 6'b0;
                        boarding_2_next <= remaining_6;
                    end
                    4'b1000 : begin
                        remaining_6_next <= remaining_6;
                        boarding_2_next <= {3'b0, boarding_2[2:0]};
                    end
                    4'b1001 : begin
                        remaining_6_next <= {remaining_6[5:3], 3'b0};
                        boarding_2_next <= {remaining_6[2:0], boarding_2[2:0]};
                    end
                    4'b1010 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        boarding_2_next <= {remaining_6[5:3], boarding_2[2:0]};
                    end
                    4'b1011 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        boarding_2_next <= {remaining_6[5:3], boarding_2[2:0]};
                    end
                    4'b0100 : begin
                        remaining_6_next <= remaining_6;
                        boarding_2_next <= {boarding_2[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_6_next <= {remaining_6[5:3], 3'b0};
                        boarding_2_next <= {boarding_2[5:3], remaining_6[2:0]};
                    end
                    4'b0110 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_6[5:3]};
                    end
                    4'b0111 : begin
                        remaining_6_next <= {3'b0, remaining_6[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_6[5:3]};
                    end
                    default : begin
                        remaining_6_next <= remaining_6;
                        boarding_2_next <= boarding_2;
                    end
                endcase      
            end
            // elevator 2 - floor 7
            3'd7: begin
                case({hold_1[4:3], hold_1[1:0]})
                    4'b1100 : begin
                        remaining_7_next <= remaining_7;
                        boarding_2_next <= 6'b0;
                    end
                    4'b1101 : begin
                        remaining_7_next <= {remaining_7[5:3], 3'b0};
                        boarding_2_next <= {remaining_7[2:0], 3'b0};
                    end
                    4'b1110 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        boarding_2_next <= {remaining_7[5:3], 3'b0};
                    end
                    4'b1111 : begin
                        remaining_7_next <= 6'b0;
                        boarding_2_next <= remaining_7;
                    end
                    4'b1000 : begin
                        remaining_7_next <= remaining_7;
                        boarding_2_next <= {3'b0, boarding_2[2:0]};
                    end
                    4'b1001 : begin
                        remaining_7_next <= {remaining_7[5:3], 3'b0};
                        boarding_2_next <= {remaining_7[2:0], boarding_2[2:0]};
                    end
                    4'b1010 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        boarding_2_next <= {remaining_7[5:3], boarding_2[2:0]};
                    end
                    4'b1011 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        boarding_2_next <= {remaining_7[5:3], boarding_2[2:0]};
                    end
                    4'b0100 : begin
                        remaining_7_next <= remaining_7;
                        boarding_2_next <= {boarding_2[5:3], 3'b0};
                    end
                    4'b0101 : begin
                        remaining_7_next <= {remaining_7[5:3], 3'b0};
                        boarding_2_next <= {boarding_2[5:3], remaining_7[2:0]};
                    end
                    4'b0110 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_7[5:3]};
                    end
                    4'b0111 : begin
                        remaining_7_next <= {3'b0, remaining_7[2:0]};
                        boarding_2_next <= {boarding_2[5:3], remaining_7[5:3]};
                    end
                    default : begin
                        remaining_7_next <= remaining_7;
                        boarding_2_next <= boarding_2;
                    end
                endcase  
            end
        endcase
    end
end

endmodule
