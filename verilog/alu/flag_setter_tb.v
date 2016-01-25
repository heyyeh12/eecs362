module testbench;
    reg [31:0] alu_res;
    reg cout_add, cout_shft;
    reg [2:0] ctrl;
    wire [31:0] Z;
    wire cout;

    flag_setter flag_setter(.alu_res(alu_res), .ctrl(ctrl), .cout_add(cout_add), .cout_shft(cout_sft), .zf(zf), .of(of), .cf(cf));

    initial begin

        $monitoro("@%0dns ALU_RES=%h CTRL=%b C_ADD=%b C_SFT=%b\nZERO=%b, OVER=%b, CARRY=%b\n\n",
                    $time, alu_res, ctrl, cout_add, cout_shft, zf, of, cf);
        // sll
        $display("---ZERO FLAG TEST--");
        #0 alu_res = 32'h00000000; ctrl = 3'b000; cout_add = 1; cout_shft = 0;
        #1 alu_res = 32'h00000001; ctrl = 3'b000; cout_add = 1; cout_shft = 0;
        #1 alu_res = 32'h00010000; ctrl = 3'b000; cout_add = 1; cout_shft = 0;

    end
endmodule