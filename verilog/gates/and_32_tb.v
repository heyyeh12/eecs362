module testbench;
	reg [31:0] A;
	reg [31:0] B;
	wire [31:0] Z;

	and_32 and_32(.a(A), .b(B), .z(Z));

	initial begin
		$monitor("A = %d B = %d Z = %d", A, B, Z);
		#0 A = 32'd15; B = 32'd7;
		#1 A = 32'd7; B = 32'd2;
		#1 A = 32'd15; B = 32'd8;
		#1 A = 32'd255; B = 32'd15;
		#1 A = 32'd28; B = 32'd12;

	end
endmodule

