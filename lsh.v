module lsh(
     input wire [6:0] a,
     input wire [2:0] f,
     output reg [6:0] y
    );

   // left shifter
   always @*
     case(f)
         3'b000: y = a;
         3'b001: y = {a[5:0], 1'b0};
         3'b010: y = {a[4:0], 2'b0};
         3'b011: y = {a[3:0], 3'b0};
         3'b100: y = {a[2:0], 4'b0};
         3'b101: y = {a[1:0], 5'b0};
         3'b110: y = {a[0], 6'b0};
         3'b111: y = 7'b0;
      endcase 
endmodule 