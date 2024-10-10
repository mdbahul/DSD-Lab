module tb_demux1x8;
    reg in;
    reg [2:0] sel;
    wire [7:0] out;

    demux1x8 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Initialize inputs
        in = 1'b0;
        sel = 3'b000;

        // Monitor outputs
        $monitor("Time: %0dns, sel: %b, in: %b, out: %b", $time, sel, in, out);

        // Test different selections
        #10 in = 1'b1; sel = 3'b000; // Route to out[0]
        #10 sel = 3'b001; // Route to out[1]
        #10 sel = 3'b010; // Route to out[2]
        #10 sel = 3'b011; // Route to out[3]
        #10 sel = 3'b100; // Route to out[4]
        #10 sel = 3'b101; // Route to out[5]
        #10 sel = 3'b110; // Route to out[6]
        #10 sel = 3'b111; // Route to out[7]

        // Reset input and check outputs
        #10 in = 1'b0; sel = 3'b000; // All outputs should be 0
        #10;

        $finish;
    end

    initial begin
        $dumpfile("demux1x8.vcd");
        $dumpvars(0, tb_demux1x8);
    end
endmodule
