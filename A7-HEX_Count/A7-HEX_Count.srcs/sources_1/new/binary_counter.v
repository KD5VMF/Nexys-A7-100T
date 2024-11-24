`timescale 1ns / 1ps

module binary_counter(
    input wire clk_i,          // Input clock
    input wire rstn_i,         // Active-low reset
    output reg [15:0] count_o  // 16-bit counter output
);

    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i) begin
            count_o <= 16'd0;
        end else begin
            count_o <= count_o + 1;
        end
    end

endmodule
