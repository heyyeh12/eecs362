module testbench;
	reg A;
	wire Z;

	not_gate not_gate(.a(A), .z(Z));

	initial begin
		$monitor("A = %b Z = %b", A, Z);
		#0 A = 1'b0;
		#1 A = 1'b1; 
	end
endmodule

