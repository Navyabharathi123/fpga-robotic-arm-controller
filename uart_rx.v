`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 10:50:46
// Design Name: 
// Module Name: uart_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx (
    input  wire clk,
    input  wire rx,
    output reg  [7:0] data,
    output reg  done
);
    parameter CLK_FREQ = 100_000_000;
    parameter BAUD     = 9600;
    localparam integer CLKS_PER_BIT = CLK_FREQ / BAUD;

    // Synchronize RX
    reg rx_ff1 = 1'b1, rx_ff2 = 1'b1;
    always @(posedge clk) begin
        rx_ff1 <= rx;
        rx_ff2 <= rx_ff1;
    end

    localparam IDLE=0, START=1, DATA=2, STOP=3;
    reg [1:0] state = IDLE;
    reg [15:0] clk_cnt = 0;
    reg [2:0] bit_idx = 0;
    reg [7:0] rx_shift = 0;

    always @(posedge clk) begin
        done <= 0;

        case(state)
        IDLE: begin
            clk_cnt <= 0;
            bit_idx <= 0;
            if (rx_ff2 == 0)
                state <= START;
        end

        START: begin
            if (clk_cnt == CLKS_PER_BIT/2) begin
                clk_cnt <= 0;
                state <= DATA;
            end else clk_cnt <= clk_cnt + 1;
        end

        DATA: begin
            if (clk_cnt == CLKS_PER_BIT-1) begin
                clk_cnt <= 0;
                rx_shift[bit_idx] <= rx_ff2;
                if (bit_idx == 7) begin
                    bit_idx <= 0;
                    state <= STOP;
                end else bit_idx <= bit_idx + 1;
            end else clk_cnt <= clk_cnt + 1;
        end

        STOP: begin
            if (clk_cnt == CLKS_PER_BIT-1) begin
                data <= rx_shift;
                done <= 1;
                state <= IDLE;
            end else clk_cnt <= clk_cnt + 1;
        end
        endcase
    end
endmodule
