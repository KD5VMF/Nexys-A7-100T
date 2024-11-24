`timescale 1ns / 1ps

module clk_divider(
    input wire clk_i,         // 100 MHz input clock
    input wire rstn_i,        // Active-low reset
    output reg clk_out        // 1 Hz output clock
);

    reg [26:0] counter;

    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i) begin
            counter <= 27'd0;
            clk_out <= 1'b0;
        end else begin
            if (counter == 27'd49999999) begin
                counter <= 27'd0;
                clk_out <= ~clk_out; // Toggle clock output
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
