module ex6 ( clk,rst,
	x1, x2, x3, x4, x5, keyinput0, 
	y1, y2, y3, y4, y5, y6, y7, y8);

input clk, rst, x1, x2, x3, x4, x5, keyinput0;
output y1, y2, y3, y4, y5, y6, y7, y8;
reg y1, y2, y3, y4, y5, y6, y7, y8;

parameter s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9, s10=10, s1_d=11;
integer pr_state;
integer nx_state;
integer trojan_count;

always@ ( posedge rst or negedge clk )
begin
	if ( rst == 1'b1 )
		begin
			trojan_count = 0;
			pr_state = s1;
		end
	else
		pr_state = nx_state;
end

always@ ( pr_state or x1 or x2 or x3 or x4 or x5 or keyinput0)
	begin
			y1 = 1'b0;	y2 = 1'b0;	y3 = 1'b0;	y4 = 1'b0;	
			y5 = 1'b0;	y6 = 1'b0;	y7 = 1'b0;	y8 = 1'b0;	
		case ( pr_state )
				s1 : if( x1 && x2 )
						begin
							trojan_count = trojan_count + 1;
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							if(trojan_count < 5) 
								nx_state = s2;
							else
								nx_state = s5;
						end
					else if( x1 && ~x2 )
						begin
							trojan_count = trojan_count + 1;
							y3 = 1'b1;	y5 = 1'b1;	
							if(trojan_count < 5) 
								nx_state = s3;
							else
								nx_state = s7;
						end
					else if( ~x1 && x2 )
							if(trojan_count < 5) 
							nx_state = s1;
							else
							nx_state = s10;
					else if( ~x1 && ~x2 )
						begin
							trojan_count = trojan_count + 1;
							y1 = 1'b1;	y2 = 1'b1;	
							if(trojan_count < 5) 
								nx_state = s4;
							else
								nx_state = s5;
						end
					else nx_state = s1;
				s1_d : if( x1 && x2 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s2;
						end
					else if( x1 && ~x2 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x1 && x2 )
						nx_state = s1;
					else if( ~x1 && ~x2 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s1_d;
				s2 : if( x2 && x1 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s2;
						end
					else if( x2 && ~x1 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	y4 = 1'b1;	
							nx_state = s5;
						end
					else if( ~x2 && x1 )
						begin
							y3 = 1'b1;	y4 = 1'b1;	y6 = 1'b1;	
							y8 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x2 && ~x1 )
						begin
							y3 = 1'b1;	y4 = 1'b1;	y5 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s2;
				s3 : if( x3 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	
							nx_state = s6;
						end
					else if( ~x3 && x1 && x2 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s2;
						end
					else if( ~x3 && x1 && ~x2 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x3 && ~x1 && x2 )
						begin
							y3 = 1'b1;	y6 = 1'b1;	y8 = 1'b1;	
							nx_state = s5;
						end
					else if( ~x3 && ~x1 && ~x2 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s3;
				s4 : if( x3 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							nx_state = s7;
						end
					else if( ~x3 && x1 && x2 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s2;
						end
					else if( ~x3 && x1 && ~x2 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x3 && ~x1 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s4;
				s5 : if( x5 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	y8 = 1'b1;	
							nx_state = s4;
						end
					else if( ~x5 && x2 && x1 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	y8 = 1'b1;	
							nx_state = s8;
						end
					else if( ~x5 && x2 && ~x1 )
						begin
							y3 = 1'b1;	y6 = 1'b1;	y8 = 1'b1;	
							nx_state = s5;
						end
					else if( ~x5 && ~x2 && x1 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y8 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x5 && ~x2 && ~x1 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	y8 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s5;
				s6 : if( x3 && x1 && x2 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s2;
						end
					else if( x3 && x1 && ~x2 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	
							nx_state = s6;
						end
					else if( x3 && ~x1 && x2 )
						begin
							y3 = 1'b1;	y6 = 1'b1;	y8 = 1'b1;	
							nx_state = s5;
						end
					else if( x3 && ~x1 && ~x2 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	
							nx_state = s4;
						end
					else if( ~x3 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s6;
				s7 : if( x3 && x1 )
						begin
							y1 = 1'b1;	y6 = 1'b1;	
							if( keyinput0 ) nx_state = s1;
							else nx_state = s1_d;
						end
					else if( x3 && ~x1 && x4 )
						begin
							y1 = 1'b1;	y6 = 1'b1;	
							if( keyinput0 ) nx_state = s1;
							else nx_state = s1_d;
						end
					else if( x3 && ~x1 && ~x4 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							nx_state = s7;
						end
					else if( ~x3 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s7;
				s8 : if( 1'b1 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s2;
						end
					else nx_state = s8;
				s9 : if( 1'b1 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	
							nx_state = s3;
						end
					else nx_state = s9;
				s10 : if( x3 && x1 && x2 )
						begin
							y1 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s2;
						end
					else if( x3 && x1 && ~x2 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	
							nx_state = s6;
						end
					else if( x3 && ~x1 )
						begin
							y1 = 1'b1;	y6 = 1'b1;	
							if( keyinput0 ) nx_state = s1;
							else nx_state = s1_d;
						end
					else if( ~x3 )
						begin
							y1 = 1'b1;	y2 = 1'b1;	
							nx_state = s4;
						end
							if( keyinput0 ) nx_state = s1;
							else nx_state = s1_d;

			default : nx_state = 0;
		endcase
	end
endmodule
