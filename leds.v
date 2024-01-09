module leds (clk_i, enable_i, rst_ni, dir_i, leds_no);

    input clk_i, enable_i,rst_ni,dir_i; //wejscia
    output reg [3:0] leds_no; //wyjscie diod
    reg [3:0] counter; //licznik na 4 bity 

    always @(posedge clk_i or negedge rst_ni) begin
	 
        if (~rst_ni) begin
		  
            counter = 3'b000; 
            leds_no = 4'b1111; //początkowo ledy 
				
        end
		  
        else begin
		  
            if (enable_i) begin
                // Sprawdzenie licznika, zerowanie dla 7
                if (counter == 3'd7)
                    counter <= 3'd0;
                else
                    counter <= counter + 1;
                
                //przesunięcie 
                if (dir_i == 1'b0)
                    leds_no = (counter<5) ? ((4'b1111 >> counter)) : ((4'b1111 << (8 - counter))); //warunek przesunięcia
                else
                    leds_no = (counter<5) ? ((4'b1111 << counter)) : ((4'b1111 >> (8 - counter)));
						  
            end
        end
    end

endmodule
