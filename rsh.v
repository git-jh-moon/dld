module rsh(
     input wire [13:0] a,
     input wire [2:0] f,
     output reg [13:0] y
    );

   // right shifter
   always @*
     case(f)
         3'b000: y = a;
         3'b001: y = {2'b0, a[13-:12]};
         3'b010: y = {4'b0, a[13-:10]};
         3'b011: y = {6'b0, a[13-:8]};
         3'b100: y = {8'b0, a[13-:6]};
         3'b101: y = {10'b0, a[13-:4]};
         3'b110: y = {12'b0, a[13-:2]};
         3'b111: y = 14'b0;
      endcase 
endmodule 
