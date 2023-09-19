`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2022 23:51:08
// Design Name: 
// Module Name: Decoder
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


module Decoder(

  input clk_i,
  
  input [1:0] code_i,
  
  output reg bit_o,
  
  output reg error_flag

    );
    
  reg [31:0] counter = 0;
  reg [1:0] voltage_level = 2'b01;
    
  always @( posedge clk_i ) begin
  
    if ( (code_i === 2'b01) || (code_i === 2'b10) ) begin
    
      if ( ^counter )
        voltage_level = ~voltage_level;       
      else 
        voltage_level = voltage_level;
      
      if (code_i != voltage_level)
        error_flag = 1;
      else begin
      
      bit_o = 0;
      error_flag = 0;
      counter = 0;
      
      end
      
    end
      
    if ( code_i === 2'b00) begin
    
      bit_o =1;
      counter = counter + 1;
      
    end
  
  end
  
endmodule
