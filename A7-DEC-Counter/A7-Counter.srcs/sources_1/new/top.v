module seven_seg_top(
    input clk_i,          // 100 MHz clock
    input rstn_i,         // Active low reset
    output reg [7:0] disp_seg_o, // Segments (CA - CG + DP)
    output reg [7:0] disp_an_o,  // Anodes
    output reg [15:0] led_o      // LEDs for binary counting
);

    // Internal signals
    reg [31:0] clk_div_counter;  // Clock divider counter for 1 Hz clock
    reg [31:0] counter;          // Counter to display the value
    reg clk_1hz;                 // 1 Hz clock signal
    reg [3:0] digit_values [7:0]; // BCD values for 8 digits
    reg [2:0] current_digit;     // Active digit index

    // Clock divider: Generate a 1 Hz clock from the 100 MHz input clock
    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i) begin
            clk_div_counter <= 0;
            clk_1hz <= 0;
        end else if (clk_div_counter == 50_000_000 - 1) begin
            clk_div_counter <= 0;
            clk_1hz <= ~clk_1hz;
        end else begin
            clk_div_counter <= clk_div_counter + 1;
        end
    end

    // Increment the display counter at 1 Hz
    always @(posedge clk_1hz or negedge rstn_i) begin
        if (!rstn_i) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    // Update BCD values for each digit
    integer i;
    always @(posedge clk_1hz or negedge rstn_i) begin
        if (!rstn_i) begin
            for (i = 0; i < 8; i = i + 1) begin
                digit_values[i] <= 0;
            end
        end else begin
            digit_values[0] <= counter % 10;
            digit_values[1] <= (counter / 10) % 10;
            digit_values[2] <= (counter / 100) % 10;
            digit_values[3] <= (counter / 1000) % 10;
            digit_values[4] <= (counter / 10000) % 10;
            digit_values[5] <= (counter / 100000) % 10;
            digit_values[6] <= (counter / 1000000) % 10;
            digit_values[7] <= (counter / 10000000) % 10;
        end
    end

    // Multiplexing logic: Switch between digits at 1 kHz
    reg [15:0] mux_clk_div;
    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i) begin
            mux_clk_div <= 0;
            current_digit <= 0;
        end else if (mux_clk_div == 50_000 - 1) begin
            mux_clk_div <= 0;
            current_digit <= current_digit + 1;
        end else begin
            mux_clk_div <= mux_clk_div + 1;
        end
    end

    // Anode enable logic with leading zero suppression
    always @(*) begin
        disp_an_o = 8'b11111111; // Default to all off
        disp_an_o[current_digit] = 0; // Enable only the current digit

        // Suppress leading zeros
        if (counter == 0) begin
            disp_an_o = 8'b11111110; // Only the first digit active
        end else begin
            for (i = 7; i > 0; i = i - 1) begin
                if (digit_values[i] == 0 && counter < 10 ** (i + 1)) begin
                    disp_an_o[i] = 1;
                end
            end
        end
    end

    // 7-segment decoder for the current digit
    always @(*) begin
        case (digit_values[current_digit])
            4'd0: disp_seg_o = 8'b11000000; // 0
            4'd1: disp_seg_o = 8'b11111001; // 1
            4'd2: disp_seg_o = 8'b10100100; // 2
            4'd3: disp_seg_o = 8'b10110000; // 3
            4'd4: disp_seg_o = 8'b10011001; // 4
            4'd5: disp_seg_o = 8'b10010010; // 5
            4'd6: disp_seg_o = 8'b10000010; // 6
            4'd7: disp_seg_o = 8'b11111000; // 7
            4'd8: disp_seg_o = 8'b10000000; // 8
            4'd9: disp_seg_o = 8'b10010000; // 9
            default: disp_seg_o = 8'b11111111; // Blank
        endcase
    end

    // Assign LED output to the lower 16 bits of the counter
    always @(posedge clk_1hz or negedge rstn_i) begin
        if (!rstn_i) begin
            led_o <= 0;
        end else begin
            led_o <= counter[15:0];
        end
    end

endmodule
