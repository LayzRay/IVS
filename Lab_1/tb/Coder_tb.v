`timescale 1ns / 1ps // 

`define N 23

module Coder_tb();
    
//////////////////////////////
  reg CLK_tb; 

  parameter PERIOD = 10;

  always begin
  
    CLK_tb = 1'b0;
    #( PERIOD/2 ) CLK_tb = 1'b1;
    #( PERIOD/2 );
    
  end
//////////////////////////////
    
  reg [`N - 1:0] bit_sequence_tb; // ������������������ �����

  reg bit_tb;
  wire [1:0] code_tb;     

  reg [1:0] encoded_sequence_tb [0:22]; // �������������� ������������������ �����
  reg [22:0] decoded_sequence_tb;       // �������������� ������������������ ����� (��� ��������)

  integer i; // ������� ��� ����� for

  Coder CD ( .clk_i(CLK_tb), .bit_i(bit_tb), .code_o(code_tb) );

  initial begin

    bit_sequence_tb = `N'd8201481;
    $display ( "\n////\n����������� ����� %d", bit_sequence_tb );

    // ���� ����������� ������� ������������������
    for ( i = 0; i < 23; i = i + 1 ) begin

      bit_tb = bit_sequence_tb[i];
    
      @( posedge CLK_tb ); #1; // ��� ������ CLOCK � ��� 1 �� (��� ��������� �������� �������� � �����)
    
      encoded_sequence_tb[i] = code_tb;
   
    end

    // ���� �������������
    for ( i = 0; i < 23; i = i + 1 ) begin
    
      if ( encoded_sequence_tb[i] )
        
        decoded_sequence_tb[i] = 0;
        
      else
      
        decoded_sequence_tb[i] = 1;
    
    end
    
    #1;
    
    $display ( "\n��������� �������������: %d\n////\n", decoded_sequence_tb );
    $finish;
    
  end
    
endmodule
