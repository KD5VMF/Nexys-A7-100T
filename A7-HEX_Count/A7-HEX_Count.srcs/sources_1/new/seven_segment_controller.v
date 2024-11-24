`timescale 1ns / 1ps

module seven_segment_controller(
    input wire clk_i,              // 100 MHz clock
    input wire rstn_i,             // Active-low reset
    input wire [31:0] value_i,     // 32-bit value to display
    output reg [7:0] disp_seg_o,   // 7-segment segments
    output reg [7:0] disp_an_o     // 7-segment anodes
);

    reg [16:0] refresh_counter = 0;  // 17-bit counter for refresh timing
    reg [2:0] current_digit = 0;     // Digit selector (0-7)
    reg [3:0] digit_value;           // Value of the current digit

    // Divide clock for digit refresh
    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    wire refresh_tick = (refresh_counter == 0);

    // Cycle through digits (0 to 7)
    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i)
            current_digit <= 0;
        else if (refresh_tick)
            current_digit <= current_digit + 1;
    end

    // Extract the value for the current digit
    always @(*) begin
        case (current_digit)
            3'd0: digit_value = value_i[3:0];
            3'd1: digit_value = value_i[7:4];
            3'd2: digit_value = value_i[11:8];
            3'd3: digit_value = value_i[15:12];
            3'd4: digit_value = value_i[19:16];
            3'd5: digit_value = value_i[23:20];
            3'd6: digit_value = value_i[27:24];
            3'd7: digit_value = value_i[31:28];
            default: digit_value = 4'hF; // Blank
        endcase
    end

    // Anode control (active-low)
    always @(*) begin
        disp_an_o = 8'b11111111; // Default all off
        disp_an_o[current_digit] = 1'b0; // Activate current digit
    end

    // Segment decoding
    always @(*) begin
        case (digit_value)
            4'h0: disp_seg_o = 8'b11000000; // 0
            4'h1: disp_seg_o = 8'b11111001; // 1
            4'h2: disp_seg_o = 8'b10100100; // 2
            4'h3: disp_seg_o = 8'b10110000; // 3
            4'h4: disp_seg_o = 8'b10011001; // 4
            4'h5: disp_seg_o = 8'b10010010; // 5
            4'h6: disp_seg_o = 8'b10000010; // 6
            4'h7: disp_seg_o = 8'b11111000; // 7
            4'h8: disp_seg_o = 8'b10000000; // 8
            4'h9: disp_seg_o = 8'b10010000; // 9
            4'hA: disp_seg_o = 8'b10001000; // A
            4'hB: disp_seg_o = 8'b10000011; // B
            4'hC: disp_seg_o = 8'b11000110; // C
            4'hD: disp_seg_o = 8'b10100001; // D
            4'hE: disp_seg_o = 8'b10000110; // E
            4'hF: disp_seg_o = 8'b10001110; // F
            default: disp_seg_o = 8'b11111111; // Blank
        endcase
    end

endmodule
