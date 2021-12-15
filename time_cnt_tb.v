`timescale 1ns / 1ps
module time_tb(
    );
	reg clock;
	reg reset_start;
	wire [7:0] time_counter;
	
    time_cnt TIME_CNT(
		.clock(clock),
		.reset_start (reset_start),
	    .time_counter (time_counter)
		);

    initial begin
        clock = 0;
        forever begin
            #5 clock = ~clock;
        end
    end    

    initial begin
        $monitor($time,
            "ns.    output changed\t => counter : %d\n",
            time_counter    
            );
    end

    initial begin
        clock = 0;
        reset_start = 0;

        #25 reset_start = 1;
		  #4000 $finish;
    end

endmodule
