module e191 ( clk,rst,
	x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15,
	x16, 
	y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11);

input clk, rst, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15,
	x16;
output y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11;
reg y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11;

parameter s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9, s10=10,	s11=11;
integer pr_state;
integer nx_state;

always@ ( posedge rst or negedge clk )
begin
	if ( rst == 1'b1 )
		pr_state = s1;
	else
		pr_state = nx_state;
end

always@ ( pr_state or x1 or x2 or x3 or x4 or x5 or x6 or x7 or x8 or x9 or x10 or x11 or x12 or x13 or x14 or x15 or 
	x16)
	begin
			y1 = 1'b0;	y2 = 1'b0;	y3 = 1'b0;	y4 = 1'b0;	
			y5 = 1'b0;	y6 = 1'b0;	y7 = 1'b0;	y8 = 1'b0;	
			y9 = 1'b0;	y10 = 1'b0;	y11 = 1'b0;	
		case ( pr_state )
				s1 : if( x9 && x16 && x8 )
						begin
							y10 = 1'b1;	
							nx_state = s2;
						end
					else if( x9 && x16 && ~x8 && x5 )
						begin
							y7 = 1'b1;	
							nx_state = s2;
						end
					else if( x9 && x16 && ~x8 && ~x5 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else if( x9 && ~x16 )
						begin
							y5 = 1'b1;	
							nx_state = s4;
						end
					else if( ~x9 && x10 && x5 )
						begin
							y1 = 1'b1;	
							nx_state = s5;
						end
					else if( ~x9 && x10 && ~x5 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x9 && ~x10 && x1 )
						begin
							y1 = 1'b1;	
							nx_state = s6;
						end
					else if( ~x9 && ~x10 && ~x1 && x2 )
						begin
							y3 = 1'b1;	
							nx_state = s7;
						end
					else if( ~x9 && ~x10 && ~x1 && ~x2 )
						begin
							y2 = 1'b1;	
							nx_state = s8;
						end
					else nx_state = s1;
				s2 : if( 1'b1 )
						begin
							y8 = 1'b1;	
							nx_state = s9;
						end
					else nx_state = s2;
				s3 : if( x7 && x9 && x8 )
						begin
							y3 = 1'b1;	
							nx_state = s7;
						end
					else if( x7 && x9 && ~x8 )
						nx_state = s3;
					else if( x7 && ~x9 )
						nx_state = s1;
					else if( ~x7 && x6 && x4 && x13 )
						begin
							y1 = 1'b1;	y11 = 1'b1;	
							nx_state = s10;
						end
					else if( ~x7 && x6 && x4 && ~x13 )
						begin
							y3 = 1'b1;	
							nx_state = s7;
						end
					else if( ~x7 && x6 && ~x4 )
						nx_state = s3;
					else if( ~x7 && ~x6 )
						nx_state = s1;
					else nx_state = s3;
				s4 : if( x1 )
						begin
							y1 = 1'b1;	
							nx_state = s6;
						end
					else if( ~x1 && x2 )
						begin
							y3 = 1'b1;	
							nx_state = s7;
						end
					else if( ~x1 && ~x2 )
						begin
							y2 = 1'b1;	
							nx_state = s8;
						end
					else nx_state = s4;
				s5 : if( x12 && x15 )
						begin
							y6 = 1'b1;	
							nx_state = s11;
						end
					else if( x12 && ~x15 )
						nx_state = s5;
					else if( ~x12 && x3 )
						nx_state = s1;
					else if( ~x12 && ~x3 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else nx_state = s5;
				s6 : if( x2 )
						begin
							y3 = 1'b1;	
							nx_state = s7;
						end
					else if( ~x2 )
						begin
							y2 = 1'b1;	
							nx_state = s8;
						end
					else nx_state = s6;
				s7 : if( x16 && x14 && x5 )
						begin
							y7 = 1'b1;	
							nx_state = s2;
						end
					else if( x16 && x14 && ~x5 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else if( x16 && ~x14 && x11 )
						begin
							y1 = 1'b1;	
							nx_state = s5;
						end
					else if( x16 && ~x14 && ~x11 && x3 )
						nx_state = s1;
					else if( x16 && ~x14 && ~x11 && ~x3 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x16 && x11 && x5 )
						begin
							y1 = 1'b1;	
							nx_state = s5;
						end
					else if( ~x16 && x11 && ~x5 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x16 && ~x11 && x3 )
						nx_state = s1;
					else if( ~x16 && ~x11 && ~x3 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else nx_state = s7;
				s8 : if( x11 )
						begin
							y1 = 1'b1;	
							nx_state = s5;
						end
					else if( ~x11 && x3 )
						nx_state = s1;
					else if( ~x11 && ~x3 )
						begin
							y4 = 1'b1;	
							nx_state = s3;
						end
					else nx_state = s8;
				s9 : if( x4 )
						begin
							y9 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x4 )
						nx_state = s9;
					else nx_state = s9;
				s10 : if( x15 )
						begin
							y6 = 1'b1;	
							nx_state = s11;
						end
					else if( ~x15 )
						nx_state = s10;
					else nx_state = s10;
				s11 : if( 1'b1 )
						begin
							y10 = 1'b1;	
							nx_state = s2;
						end
					else nx_state = s11;

			default : nx_state = 0;
		endcase
	end
endmodule
