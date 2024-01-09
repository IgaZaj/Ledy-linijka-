module ex_5(clk_i, enable_i, rst_ni, dir_i, leds_no); //polaczenie modulow

input clk_i, enable_i, rst_ni, dir_i; //wejscia
output [3:0] leds_no; //wyjscia

wire clk_int;
divider d1(clk_i, enable_i, rst_ni, clk_int); //dzielnik 

leds j1(clk_int, enable_i, rst_ni, dir_i, leds_no); //ledy

endmodule 