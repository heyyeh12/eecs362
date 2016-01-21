module testbench;
	reg SRC0;
	reg SRC1;
	reg SEL;
	wire  Z;

	mux2to1 #(1) mux2to1(.src0(SRC0), .src1(SRC1), .sel(SEL), .z(Z));

	initial begin
		$monitor("src0 = %b src1 = %b sel = %b Z = %b", SRC0, SRC1, SEL, Z);
		#0 SRC0 = 1'b0; SRC1  = 1'b1; SEL = 1'b0;
		#1 SRC0 = 1'b1; SRC1  = 1'b0; SEL = 1'b1;
		#1 SRC0 = 1'b0; SRC1  = 1'b1; SEL = 1'b1;
		#1 SRC0 = 1'b1; SRC1  = 1'b0; SEL = 1'b0;

	end
endmodule

