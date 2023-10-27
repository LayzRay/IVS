/*
���������� �������������� ������, ������������ ������ �1, ������� 6

Company: MIET
Engineer: ����� ������, ���-32  

Description: ������ ������ �������� ����������� �� ���� �������������� ����
����������� ����������� (�������� ����������), ��������� ������������ ���������� ���. 
*/

module Coder(

  input clk_i,           // �������� ������ ��������� ��� ���������������� D - ��������
    
  input bit_i,           // ������� ���
 
  output reg [1:0] code_o // �������� ��������� ����������� ��������� ��������� �����������
	 
  );
    
  reg [31:0] counter = 0;         // ������� ���������� ������
    
  reg [1:0] voltage_level = 2'b01; // ���������� ����� ���������� ������� ������� ����������, ����� ���� ����� �������������
    
  always @( posedge clk_i ) begin

    if ( bit_i === 1 ) begin
    
        code_o = 2'b00;
        counter = counter + 1;
            
        if ( counter == 32'd4294967295 ) counter = 0;
        
    end
    
    if ( bit_i === 0 ) begin

      if ( ^counter ) code_o = ~voltage_level;
      else code_o = voltage_level;
    
      voltage_level = code_o;
      counter = 0;

    end
    
 end
    
endmodule