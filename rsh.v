module rsh(
     input wire [6:0] a,
     input wire [2:0] f,
     output reg [6:0] y
    );

   // right shifter
   always @*
     case(f)
         3'b000: y = a;
         3'b001: y = {1'b0, a[6:1]};
         3'b010: y = {2'b0, a[6:2]};
         3'b011: y = {3'b0, a[6:3]};
         3'b100: y = {4'b0, a[6:4]};
         3'b101: y = {5'b0, a[6:5]};
         3'b110: y = {6'b0, a[6]};
         3'b111: y = 7'b0;
      endcase 
endmodule 