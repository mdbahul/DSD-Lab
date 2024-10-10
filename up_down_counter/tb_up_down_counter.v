module tb_up_down_counter;
    reg clk;
    reg reset;
    reg up_down;
    wire [3:0] count;

    // Instantiate the up-down counter
    up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    initial begin
        // Initialize inputs
        reset = 1; // Assert reset
        up_down = 1; // Count up

        // Monitor outputs
        $monitor("Time: %0dns, Reset: %b, Up/Down: %b, Count: %b", $time, reset, up_down, count);

        // Release reset
        #10 reset = 0;

        // Count up for a few cycles
        #20 up_down = 1; // Count up
        #50 up_down = 0; // Change to count down

        // Count down for a few cycles
        #50 reset = 1; // Assert reset again
        #10 reset = 0; // Release reset

        // Count up again
        #20 up_down = 1; // Count up

        // Finish simulation
        #100;
        $finish;
    end

    initial begin
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, tb_up_down_counter);
    end
endmodule
