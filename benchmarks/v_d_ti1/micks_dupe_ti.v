module micks ( clk,rst,
	x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15,
	x16, x17, x18, x19, x20, x21, keyinput0, 
	y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15,
	y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, y26, y27, y28, y29, y30,
	y31, y32, y33, y34, y35, y36, y37, y38, y39, y40, y41, y42, y43, y45);

input clk, rst, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15,
	x16, x17, x18, x19, x20, x21, keyinput0;
output y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15,
	y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, y26, y27, y28, y29, y30,
	y31, y32, y33, y34, y35, y36, y37, y38, y39, y40, y41, y42, y43, y45;
reg y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15,
	y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, y26, y27, y28, y29, y30,
	y31, y32, y33, y34, y35, y36, y37, y38, y39, y40, y41, y42, y43, y45;

parameter s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9, s10=10,	s11=11, s12=12, s13=13, s14=14, s15=15, s16=16, s17=17, s18=18, s19=19, s20=20, s21=21, s22=22, s20_d=23;
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

always@ ( pr_state or x1 or x2 or x3 or x4 or x5 or x6 or x7 or x8 or x9 or x10 or x11 or x12 or x13 or x14 or x15 or 
	x16 or x17 or x18 or x19 or x20 or x21 or keyinput0)
	begin
			y1 = 1'b0;	y2 = 1'b0;	y3 = 1'b0;	y4 = 1'b0;	
			y5 = 1'b0;	y6 = 1'b0;	y7 = 1'b0;	y8 = 1'b0;	
			y9 = 1'b0;	y10 = 1'b0;	y11 = 1'b0;	y12 = 1'b0;	
			y13 = 1'b0;	y14 = 1'b0;	y15 = 1'b0;	y16 = 1'b0;	
			y17 = 1'b0;	y18 = 1'b0;	y19 = 1'b0;	y20 = 1'b0;	
			y21 = 1'b0;	y22 = 1'b0;	y23 = 1'b0;	y24 = 1'b0;	
			y25 = 1'b0;	y26 = 1'b0;	y27 = 1'b0;	y28 = 1'b0;	
			y29 = 1'b0;	y30 = 1'b0;	y31 = 1'b0;	y32 = 1'b0;	
			y33 = 1'b0;	y34 = 1'b0;	y35 = 1'b0;	y36 = 1'b0;	
			y37 = 1'b0;	y38 = 1'b0;	y39 = 1'b0;	y40 = 1'b0;	
			y41 = 1'b0;	y42 = 1'b0;	y43 = 1'b0;	y45 = 1'b0;	
		case ( pr_state )
				s1 : if( x1 && x2 )
						begin
							y3 = 1'b1;	y4 = 1'b1;	y5 = 1'b1;	
							nx_state = s2;
						end
					else if( x1 && ~x2 )
						begin
							y1 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x1 )
						nx_state = s1;
					else nx_state = s1;
				s2 : if( 1'b1 )
						begin
							y2 = 1'b1;	y3 = 1'b1;	y5 = 1'b1;	
							y13 = 1'b1;	
							nx_state = s4;
						end
					else nx_state = s2;
				s3 : if( 1'b1 )
						begin
							y2 = 1'b1;	y3 = 1'b1;	y4 = 1'b1;	
							y5 = 1'b1;	
							nx_state = s5;
						end
					else nx_state = s3;
				s4 : if( 1'b1 )
						begin
							y3 = 1'b1;	y14 = 1'b1;	y15 = 1'b1;	
							nx_state = s6;
						end
					else nx_state = s4;
				s5 : if( 1'b1 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y8 = 1'b1;	y9 = 1'b1;	
							nx_state = s7;
						end
					else nx_state = s5;
				s6 : if( 1'b1 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s8;
						end
					else nx_state = s6;
				s7 : if( x15 && x21 && x20 && x4 && x6 )
						begin
							y18 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && x20 && x4 && ~x6 )
						begin
							y38 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && x20 && ~x4 && x5 && x6 && x9 )
						begin
							y9 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && x20 && ~x4 && x5 && x6 && ~x9 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && x20 && ~x4 && x5 && x6 && ~x9 && x17 && ~x8 )
						nx_state = s1;
					else if( x15 && x21 && x20 && ~x4 && x5 && x6 && ~x9 && ~x17 )
						nx_state = s1;
					else if( x15 && x21 && x20 && ~x4 && x5 && ~x6 && x8 )
						begin
							y9 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && x20 && ~x4 && x5 && ~x6 && ~x8 && x17 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && x20 && ~x4 && x5 && ~x6 && ~x8 && x17 && ~x9 )
						nx_state = s1;
					else if( x15 && x21 && x20 && ~x4 && x5 && ~x6 && ~x8 && ~x17 )
						nx_state = s1;
					else if( x15 && x21 && x20 && ~x4 && ~x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y14 = 1'b1;	
							y39 = 1'b1;	y41 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && x20 && ~x4 && ~x5 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y13 = 1'b1;	
							y40 = 1'b1;	y42 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	y13 = 1'b1;	
							nx_state = s10;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && x5 && ~x6 )
						begin
							y2 = 1'b1;	y3 = 1'b1;	y15 = 1'b1;	
							y36 = 1'b1;	
							nx_state = s11;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && x6 && x11 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && x6 && ~x11 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && x6 && ~x11 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && x6 && ~x11 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && x6 && ~x11 && ~x17 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && ~x6 && x10 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && ~x6 && ~x10 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && x4 && ~x5 && ~x6 && ~x10 && ~x17 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && x6 && x13 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && x6 && ~x13 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && x6 && ~x13 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && x6 && ~x13 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && x6 && ~x13 && ~x17 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && ~x6 && x14 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && ~x6 && ~x14 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && ~x6 && ~x14 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && ~x6 && ~x14 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && ~x4 && x5 && ~x6 && ~x14 && ~x17 )
						nx_state = s1;
					else if( x15 && x21 && ~x20 && x18 && ~x4 && ~x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && ~x20 && x18 && ~x4 && ~x5 && ~x6 )
						begin
							y35 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && x21 && ~x20 && ~x18 )
						begin
							y3 = 1'b1;	y4 = 1'b1;	y5 = 1'b1;	
							y10 = 1'b1;	
							nx_state = s12;
						end
					else if( x15 && ~x21 && x18 && x20 && x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y10 = 1'b1;	
							y29 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && ~x21 && x18 && x20 && x5 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y10 = 1'b1;	
							y25 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && ~x21 && x18 && x20 && ~x5 )
						begin
							y3 = 1'b1;	y10 = 1'b1;	y30 = 1'b1;	
							y43 = 1'b1;	
							nx_state = s13;
						end
					else if( x15 && ~x21 && x18 && ~x20 && x4 )
						begin
							y5 = 1'b1;	y10 = 1'b1;	y24 = 1'b1;	
							y25 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && ~x21 && x18 && ~x20 && ~x4 )
						begin
							y5 = 1'b1;	y10 = 1'b1;	y23 = 1'b1;	
							y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( x15 && ~x21 && ~x18 )
						begin
							y3 = 1'b1;	y4 = 1'b1;	y5 = 1'b1;	
							y10 = 1'b1;	
							nx_state = s12;
						end
					else if( ~x15 )
						begin
							y5 = 1'b1;	y10 = 1'b1;	y11 = 1'b1;	
							nx_state = s14;
						end
					else nx_state = s7;
				s8 : if( 1'b1 )
						begin
							y9 = 1'b1;	y18 = 1'b1;	y19 = 1'b1;	
							nx_state = s1;
						end
					else nx_state = s8;
				s9 : if( x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x17 )
						nx_state = s1;
					else nx_state = s9;
				s10 : if( 1'b1 )
						begin
							y3 = 1'b1;	y14 = 1'b1;	y15 = 1'b1;	
							y37 = 1'b1;	
							nx_state = s15;
						end
					else nx_state = s10;
				s11 : if( 1'b1 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else nx_state = s11;
				s12 : if( x3 )
						begin
							y4 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	
							nx_state = s16;
						end
					else if( ~x3 && x19 && x20 && x5 && x6 )
						begin
							y3 = 1'b1;	y15 = 1'b1;	y23 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && x20 && x5 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && x20 && ~x5 )
						begin
							y3 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y30 = 1'b1;	y43 = 1'b1;	
							nx_state = s17;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	y13 = 1'b1;	
							nx_state = s10;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && x5 && ~x6 )
						begin
							y2 = 1'b1;	y3 = 1'b1;	y15 = 1'b1;	
							y36 = 1'b1;	
							nx_state = s11;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && x6 && x11 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && ~x17 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && x10 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && ~x17 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && x4 && ~x21 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && x6 && x13 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && ~x17 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && x14 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && ~x17 )
						nx_state = s1;
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && ~x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && x21 && ~x5 && ~x6 )
						begin
							y35 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && x19 && ~x20 && ~x4 && ~x21 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y23 = 1'b1;	y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x3 && ~x19 )
						begin
							y4 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y20 = 1'b1;	y21 = 1'b1;	
							nx_state = s18;
						end
					else nx_state = s12;
				s13 : if( x7 )
						begin
							y31 = 1'b1;	y32 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x7 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x7 && ~x17 )
						nx_state = s1;
					else nx_state = s13;
				s14 : if( x16 )
						begin
							y12 = 1'b1;	
							nx_state = s3;
						end
					else if( ~x16 && x21 && x20 && x4 && x6 )
						begin
							y18 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && x21 && x20 && x4 && ~x6 )
						begin
							y38 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && x21 && x20 && ~x4 && x5 && x6 && x9 )
						begin
							y9 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && x21 && x20 && ~x4 && x5 && x6 && ~x9 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x16 && x21 && x20 && ~x4 && x5 && x6 && ~x9 && x17 && ~x8 )
						nx_state = s1;
					else if( ~x16 && x21 && x20 && ~x4 && x5 && x6 && ~x9 && ~x17 )
						nx_state = s1;
					else if( ~x16 && x21 && x20 && ~x4 && x5 && ~x6 && x8 )
						begin
							y9 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && x21 && x20 && ~x4 && x5 && ~x6 && ~x8 && x17 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x16 && x21 && x20 && ~x4 && x5 && ~x6 && ~x8 && x17 && ~x9 )
						nx_state = s1;
					else if( ~x16 && x21 && x20 && ~x4 && x5 && ~x6 && ~x8 && ~x17 )
						nx_state = s1;
					else if( ~x16 && x21 && x20 && ~x4 && ~x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y14 = 1'b1;	
							y39 = 1'b1;	y41 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && x21 && x20 && ~x4 && ~x5 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y13 = 1'b1;	
							y40 = 1'b1;	y42 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && x21 && ~x20 )
						begin
							y3 = 1'b1;	y4 = 1'b1;	y5 = 1'b1;	
							y20 = 1'b1;	
							nx_state = s18;
						end
					else if( ~x16 && ~x21 && x3 )
						begin
							y3 = 1'b1;	y4 = 1'b1;	y5 = 1'b1;	
							y20 = 1'b1;	
							nx_state = s18;
						end
					else if( ~x16 && ~x21 && ~x3 && x4 && x5 && x20 && x6 )
						begin
							y28 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && ~x21 && ~x3 && x4 && x5 && x20 && ~x6 )
						begin
							y26 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && ~x21 && ~x3 && x4 && x5 && ~x20 )
						begin
							y5 = 1'b1;	y23 = 1'b1;	y24 = 1'b1;	
							y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && ~x21 && ~x3 && x4 && ~x5 && x20 && x6 )
						begin
							y27 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && ~x21 && ~x3 && x4 && ~x5 && x20 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y13 = 1'b1;	
							y23 = 1'b1;	
							nx_state = s19;
						end
					else if( ~x16 && ~x21 && ~x3 && x4 && ~x5 && ~x20 )
						begin
							y6 = 1'b1;	y20 = 1'b1;	y24 = 1'b1;	
							y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && ~x21 && ~x3 && ~x4 && x20 && x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y23 = 1'b1;	
							y29 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && ~x21 && ~x3 && ~x4 && x20 && x5 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y20 = 1'b1;	
							y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x16 && ~x21 && ~x3 && ~x4 && x20 && ~x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y13 = 1'b1;	
							y30 = 1'b1;	y45 = 1'b1;	
							if( keyinput0 ) nx_state = s20;
							else nx_state = s20_d;
						end
					else if( ~x16 && ~x21 && ~x3 && ~x4 && x20 && ~x5 && ~x6 )
						begin
							y3 = 1'b1;	y20 = 1'b1;	y30 = 1'b1;	
							y43 = 1'b1;	
							nx_state = s21;
						end
					else if( ~x16 && ~x21 && ~x3 && ~x4 && ~x20 )
						begin
							y5 = 1'b1;	y20 = 1'b1;	y23 = 1'b1;	
							y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else nx_state = s14;
				s15 : if( x12 )
						begin
							y9 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x12 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x12 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x12 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x12 && ~x17 )
						nx_state = s1;
					else nx_state = s15;
				s16 : if( x19 && x20 && x5 && x6 )
						begin
							y3 = 1'b1;	y15 = 1'b1;	y23 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && x20 && x5 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && x20 && ~x5 )
						begin
							y3 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y30 = 1'b1;	y43 = 1'b1;	
							nx_state = s17;
						end
					else if( x19 && ~x20 && x4 && x21 && x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	y13 = 1'b1;	
							nx_state = s10;
						end
					else if( x19 && ~x20 && x4 && x21 && x5 && ~x6 )
						begin
							y2 = 1'b1;	y3 = 1'b1;	y15 = 1'b1;	
							y36 = 1'b1;	
							nx_state = s11;
						end
					else if( x19 && ~x20 && x4 && x21 && ~x5 && x6 && x11 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x19 && ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && ~x17 )
						nx_state = s1;
					else if( x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && x10 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x19 && ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && ~x17 )
						nx_state = s1;
					else if( x19 && ~x20 && x4 && ~x21 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && ~x20 && ~x4 && x21 && x5 && x6 && x13 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x19 && ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && ~x17 )
						nx_state = s1;
					else if( x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && x14 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( x19 && ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && ~x17 )
						nx_state = s1;
					else if( x19 && ~x20 && ~x4 && x21 && ~x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && ~x20 && ~x4 && x21 && ~x5 && ~x6 )
						begin
							y35 = 1'b1;	
							nx_state = s9;
						end
					else if( x19 && ~x20 && ~x4 && ~x21 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y23 = 1'b1;	y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x19 )
						begin
							y4 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y20 = 1'b1;	y21 = 1'b1;	
							nx_state = s18;
						end
					else nx_state = s16;
				s17 : if( x7 )
						begin
							y31 = 1'b1;	y32 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x7 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x7 && ~x17 )
						nx_state = s1;
					else nx_state = s17;
				s18 : if( x20 && x5 && x6 )
						begin
							y3 = 1'b1;	y15 = 1'b1;	y23 = 1'b1;	
							nx_state = s9;
						end
					else if( x20 && x5 && ~x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( x20 && ~x5 )
						begin
							y3 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y30 = 1'b1;	y43 = 1'b1;	
							nx_state = s17;
						end
					else if( ~x20 && x4 && x21 && x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y6 = 1'b1;	
							y7 = 1'b1;	y13 = 1'b1;	
							nx_state = s10;
						end
					else if( ~x20 && x4 && x21 && x5 && ~x6 )
						begin
							y2 = 1'b1;	y3 = 1'b1;	y15 = 1'b1;	
							y36 = 1'b1;	
							nx_state = s11;
						end
					else if( ~x20 && x4 && x21 && ~x5 && x6 && x11 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x20 && x4 && x21 && ~x5 && x6 && ~x11 && ~x17 )
						nx_state = s1;
					else if( ~x20 && x4 && x21 && ~x5 && ~x6 && x10 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x20 && x4 && x21 && ~x5 && ~x6 && ~x10 && ~x17 )
						nx_state = s1;
					else if( ~x20 && x4 && ~x21 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x20 && ~x4 && x21 && x5 && x6 && x13 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x20 && ~x4 && x21 && x5 && x6 && ~x13 && ~x17 )
						nx_state = s1;
					else if( ~x20 && ~x4 && x21 && x5 && ~x6 && x14 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x20 && ~x4 && x21 && x5 && ~x6 && ~x14 && ~x17 )
						nx_state = s1;
					else if( ~x20 && ~x4 && x21 && ~x5 && x6 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y16 = 1'b1;	
							y17 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x20 && ~x4 && x21 && ~x5 && ~x6 )
						begin
							y35 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x20 && ~x4 && ~x21 )
						begin
							y5 = 1'b1;	y6 = 1'b1;	y7 = 1'b1;	
							y23 = 1'b1;	y24 = 1'b1;	y25 = 1'b1;	
							nx_state = s9;
						end
					else nx_state = s18;
				s19 : if( 1'b1 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y20 = 1'b1;	
							y25 = 1'b1;	
							nx_state = s22;
						end
					else nx_state = s19;
				s20 : if( x7 )
						begin
							trojan_count = trojan_count + 1;
							if (trojan_count < 5) begin
								y33 = 1'b1;	y34 = 1'b1;	
							end
							else begin
								y33 = 1'b0;	y34 = 1'b0;	
							end
							nx_state = s9;
						end
					else if( ~x7 && x17 && x8 )
						begin
							trojan_count = trojan_count + 1;
							if (trojan_count < 5) begin
								y22 = 1'b1;	
							end
							else begin
								y22 = 1'b0;	
							end
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && x9 )
						begin
							trojan_count = trojan_count + 1;
							if (trojan_count < 5) begin
								y22 = 1'b1;	
							end
							else begin
								y22 = 1'b0;	
							end
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x7 && ~x17 )
						nx_state = s1;
					else nx_state = s20;
				s20_d : if( x7 )
						begin
							y33 = 1'b1;	y34 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x7 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x7 && ~x17 )
						nx_state = s1;
					else nx_state = s20_d;
				s21 : if( x7 )
						begin
							y31 = 1'b1;	y32 = 1'b1;	
							nx_state = s9;
						end
					else if( ~x7 && x17 && x8 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && x9 )
						begin
							y22 = 1'b1;	
							nx_state = s1;
						end
					else if( ~x7 && x17 && ~x8 && ~x9 )
						nx_state = s1;
					else if( ~x7 && ~x17 )
						nx_state = s1;
					else nx_state = s21;
				s22 : if( 1'b1 )
						begin
							y3 = 1'b1;	y5 = 1'b1;	y14 = 1'b1;	
							y29 = 1'b1;	
							nx_state = s9;
						end
					else nx_state = s22;

			default : nx_state = 0;
		endcase
	end
endmodule
