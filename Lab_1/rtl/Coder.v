/*
Интерфейсы вычислительных систем, лабораторная работа №1, вариант 6

Company: MIET
Engineer: Голев Андрей, ИВТ-32  

Description: Данный модуль кодирует поступающие на вход информационные биты
физическими состояниями (уровнями напряжений), используя трёхуровневый биполярный код. 
*/

module Coder(

  input clk_i,           // Тактовый сигнал необходим для функционирования D - триггера
    
  input bit_i,           // Входной бит
 
  output reg [1:0] code_o // Выходная кодировка физического состояния процедуры кодирования
	 
  );
    
  reg [31:0] counter = 0;         // Счётчик логических единиц
    
  reg [1:0] voltage_level = 2'b01; // Специально будем запоминать прошлый уровень напряжения, чтобы было легче инвертировать
    
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