`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 10:52:13
// Design Name: 
// Module Name: servo_pwm
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


module servo_pwm(
    input clk,
    input [1:0] pos,
    output reg pwm
);
    reg [31:0] cnt = 0;
    reg [31:0] high_time;

    localparam PERIOD = 2_000_000; // 20 ms @100 MHz

    always @(*) begin
        case(pos)
            2'b00: high_time = 50_000; // 1.0 ms ? 0°
            2'b01: high_time = 150_000; // 1.5 ms ? 90°
            2'b10: high_time = 250_000; // 2.0 ms ? 180°
            default: high_time = 150_000;
        endcase
    end

    always @(posedge clk) begin
        if (cnt < PERIOD)
            cnt <= cnt + 1;
        else
            cnt <= 0;

        pwm <= (cnt < high_time);
    end
endmodule


