`timescale 1ns/1ps

module demux1x8 (
    input wire in,           // Single input
    input wire [2:0] sel,   // 3-bit selection input
    output reg [7:0] out    // 8 outputs
);

    always @(*) begin
        // Default all outputs to 0
        out = 8'b00000000;

        // Route input to selected output
        case (sel)
            3'b000: out[0] = in;
            3'b001: out[1] = in;
            3'b010: out[2] = in;
            3'b011: out[3] = in;
            3'b100: out[4] = in;
            3'b101: out[5] = in;
            3'b110: out[6] = in;
            3'b111: out[7] = in;
        endcase
    end
endmodule
