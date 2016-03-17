
module and_gate ( a, b, z );
  input a, b;
  output z;


  AND2_X2 U1 ( .A1(b), .A2(a), .ZN(z) );
endmodule

