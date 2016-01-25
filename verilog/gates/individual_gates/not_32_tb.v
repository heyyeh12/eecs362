module testbench;
	reg [31:0] A;
	wire [31:0] Z;

	not_32 NOOO(.a(A), .z(Z));

	initial begin
		$monitor("A = %b Z = %b", A, Z);
		#0 A = 32'hffffffff;
		#1 A = 32'h0f0f0f0f;
	end
endmodule

