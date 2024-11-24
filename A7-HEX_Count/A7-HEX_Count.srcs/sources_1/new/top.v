`timescale 1ns / 1ps

module top(
    input wire clk_i,              // 100 MHz clock
    input wire rstn_i,             // Active-low reset
    input wire [15:0] sw,          // 16 switches
    output wire [7:0] disp_seg_o,  // 7-segment segments
    output wire [7:0] disp_an_o    // 7-segment anodes
);

    // Clock divider for timing control
    reg [31:0] clk_div_counter = 0;
    wire slow_clk;
    reg [31:0] delay_value;

    // Counter value to display
    reg [31:0] counter = 0;

    // Calculate delay based on switches
    always @(*) begin
        if (sw == 16'b0) begin
            delay_value = 32'hFFFFFFFF; // Pause (effectively never increments)
        end else begin
            delay_value = 32'd100_000_000 / (sw[15:0] + 1); // Delay decreases as switches increase
        end
    end

    // Clock divider for slow clock
    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i)
            clk_div_counter <= 0;
        else if (clk_div_counter >= delay_value)
            clk_div_counter <= 0;
        else
            clk_div_counter <= clk_div_counter + 1;
    end
    assign slow_clk = (clk_div_counter == delay_value);

    // Counter logic
    always @(posedge slow_clk or negedge rstn_i) begin
        if (!rstn_i)
            counter <= 0;
        else if (sw != 16'b0)
            counter <= counter + 1;
    end

    // Seven-segment display controller instance
    seven_segment_controller display_controller (
        .clk_i(clk_i),
        .rstn_i(rstn_i),
        .value_i(counter[31:0]),    // Send counter to display
        .disp_seg_o(disp_seg_o),
        .disp_an_o(disp_an_o)
    );

endmodule
