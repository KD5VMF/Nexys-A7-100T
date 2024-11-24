module adjustable_clk_divider(
    input wire clk_i,             // 100 MHz clock input
    input wire rstn_i,            // Active-low reset
    input wire [7:0] sw,          // Switches for speed adjustment
    output wire clk_out,          // Generated clock output
    output reg [31:0] clk_div     // Clock division counter (optional)
);

    reg [31:0] div_factor;        // Division factor for clock
    reg [31:0] count = 32'b0;
    reg clk_reg = 1'b0;

    // Determine division factor based on switch settings
    always @(*) begin
        case (sw)
            8'b00000000: div_factor = 32'd50_000_000;  // 1 Hz (default)
            8'b00000001: div_factor = 32'd25_000_000;  // 2 Hz
            8'b00000011: div_factor = 32'd12_500_000;  // 4 Hz
            8'b00000111: div_factor = 32'd6_250_000;   // 8 Hz
            8'b00001111: div_factor = 32'd3_125_000;   // 16 Hz
            8'b00011111: div_factor = 32'd1_562_500;   // 32 Hz
            default: div_factor = 32'd50_000_000;      // Default to 1 Hz
        endcase
    end

    always @(posedge clk_i or negedge rstn_i) begin
        if (!rstn_i) begin
            count <= 32'b0;
            clk_reg <= 1'b0;
        end else if (count >= div_factor) begin
            count <= 32'b0;
            clk_reg <= ~clk_reg; // Toggle clock
        end else begin
            count <= count + 1;
        end
    end

    assign clk_out = clk_reg;

endmodule
