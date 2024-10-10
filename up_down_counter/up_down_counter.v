`timescale 1ns/1ps

module up_down_counter (
    input wire clk,          // Clock input
    input wire reset,        // Asynchronous reset
    input wire up_down,      // Up/Down control signal (1 for up, 0 for down)
    output reg [3:0] count   // 4-bit count output
);

    // Synchronous counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000; // Reset count to 0
        end else begin
            if (up_down) begin
                count <= count + 1; // Increment count
            end else begin
                count <= count - 1; // Decrement count
            end
        end
    end
endmodule
