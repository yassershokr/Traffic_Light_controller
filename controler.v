module controller(
		input clk,reset_n,input Sa,Sb,
		output reg Ga,Ya,Ra,Gb,Yb,Rb
);

reg [3:0]state,next_state;

localparam s0=0,s1=1,s2=2,s3=3,s4=4
	   ,s5=5,s6=6,s7=7,s8=8,s9=9
	   ,s10=10,s11=11,s12=12;

always @(posedge clk,negedge reset_n)
begin
	if(~reset_n)
	   state<=s0;
	else
	   state<=next_state;
end

always@(*)
begin
   next_state<=state;
	case(state)
	   s0,s1,s2,s3,s4,s6,s7,s8,s9,s10:
		next_state<=state+1;
	   s5:
		if(~Sb)
		  next_state<=s5; 
		else
		  next_state<=s6;
	   s11:
		if(~Sa)
		  next_state<=s11; 
		else
		  next_state<=s12;
	   s12:next_state<=s0;
	   default:next_state<=s0;
	endcase
end
always@(*)
begin
	Ga=1'b0;
	Ya=1'b0;
	Ra=1'b0;
	Gb=1'b0;
	Yb=1'b0;
	Rb=1'b0;
	case(state)
	   s0,s1,s2,s3,s4,s5:
		begin
		Ga=1'b1;
		Rb=1'b1;
		end
	   s6:
		begin
		Ya=1'b1;
		Rb=1'b1;
		end
	   s7,s8,s9,s10,s11:
		begin
		Ra=1'b1;
		Gb=1'b1;
		end
	   s12:
		begin
		Ra=1'b1;
		Yb=1'b1;
		end
	endcase

end
endmodule