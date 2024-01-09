module divider(clk_i, enable_i, rst_ni, sig_1hz_no);
		//kierunki portów
		input clk_i, enable_i, rst_ni; 
		output sig_1hz_no; 
		reg sig_1hz_no; //sygnał rejesrowy 
		integer counter; //sygnał wewnętrzny
		parameter DivRatio=1000000;  //deklaracja parametru
		
		always @(posedge clk_i or negedge rst_ni)  //opis działania
			if (!rst_ni) //część asynchroniczna
				begin 
					counter=0;
					sig_1hz_no=1'b1;
				end
		
		else //część synchroniczna
				if(enable_i==1'b1)
					begin 
						if(counter==DivRatio - 1)
							counter=0;
						else
							counter=counter + 1;

						if(counter==0) //obsługa sygnału wyjściowego
							sig_1hz_no=1'b1;
						if(counter==DivRatio/2)
							sig_1hz_no=1'b0;
					end
		
endmodule 