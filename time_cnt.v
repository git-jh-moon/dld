module time_cnt(
    input   clock,
    input   reset_start,
    output reg [7:0]    time_counter
    );

    always @(posedge clock) begin
        if (reset_start) begin
            time_counter <= 8'b0;
        end
        else begin
            if (time_counter == 8'b1111_1111) begin
                time_counter <= 8'b0;
            end
            else begin
                time_counter <= time_counter + 1;
            end
        end
    end


endmodule