module testbench;
	reg [31:0] A;
	wire Z;

	nor32to1 nor32to1(.a(A),.z(Z));

	initial begin
		$monitor("A = %h Z = %b", A, Z);
		#0 A = 32'h00000000;
		#1 A = 32'h01000F00; 
		#1 A = 32'h10000000; 
		#1 A = 32'b00010000;
	end
endmodule

