`timescale 1ns / 1ps

module seven_segment_controller(
    input wire clk_i,              // 100 MHz clock
    input wire rstn_i,             // Active-low reset
    input wire [15:0] value_i,     // 16-bit value to display
    output reg [7:0] disp_seg_o,   // 7-segment segments
    output reg [7:0] disp_an_o     // 7-segment anodes
);

    reg [2:0] digit_select;
    reg [3:0] current_digit;

    // Segment decoding
    always @(*) begin
        case (current_digit)
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

    // Anode control
    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i) begin
            digit_select <= 3'd0;
        end else begin
            digit_select <= digit_select + 1;
        end
    end

    always @(*) begin
        disp_an_o = 8'b11111111; // Default all off
        disp_an_o[digit_select] = 1'b0; // Activate one anode
    end

    // Select current digit
    always @(*) begin
        case (digit_select)
            3'd0: current_digit = value_i[3:0];
            3'd1: current_digit = value_i[7:4];
            3'd2: current_digit = value_i[11:8];
            3'd3: current_digit = value_i[15:12];
            default: current_digit = 4'h0;
        endcase
    end

endmodule
