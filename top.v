`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 10:52:52
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input uart_rx,
    output servo1,
    output servo2,
    output servo3
);
    wire [7:0] rx_data;
    wire rx_done;

    reg [1:0] s1 = 2'b01;
    reg [1:0] s2 = 2'b01;
    reg [1:0] s3 = 2'b01;

    uart_rx U0(
        .clk(clk),
        .rx(uart_rx),
        .data(rx_data),
        .done(rx_done)
    );

    always @(posedge clk) begin
        if (rx_done) begin
            case (rx_data)
                "A": s1 <= 2'b00;
                "B": s1 <= 2'b01;
                "C": s1 <= 2'b10;

                "D": s2 <= 2'b00;
                "E": s2 <= 2'b01;
                "F": s2 <= 2'b10;

                "G": s3 <= 2'b00;
                "H": s3 <= 2'b01;
                "I": s3 <= 2'b10;
            endcase
        end
    end

    servo_pwm P1(clk, s1, servo1);
    servo_pwm P2(clk, s2, servo2);
    servo_pwm P3(clk, s3, servo3);
endmodule

