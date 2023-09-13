module tb_conrl();
reg clk,reset_n;
reg Sa,Sb;
wire Ga,Ya,Ra,Gb,Yb,Rb;

localparam t=10;
always
begin
clk=1'b0;
#(t/2);
clk=1'b1;
#(t/2);
end
initial
begin
reset_n=1'b1;
#2
reset_n=1'b0;
#2
reset_n=1'b1;
Sa=0;
Sb=0;
#80
Sa=0;
Sb=1;
#100
Sa=1;
Sb=1;
#300
Sa=0;
Sb=1;
#20
Sa=0;
Sb=0;
#300 $stop;
end
controller my_control(clk,reset_n,Sa,Sb,Ga,Ya,Ra,Gb,Yb,Rb);
endmodule