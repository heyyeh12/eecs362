# ALU Components
SOURCE = shifter.v flag_setter.v
IVERILOG = iverilog
VVP = vvp
WAVE = gtkwave

all: alu.vcd

alu.vvp: $(SOURCE)
	$(IVERILOG) -o alu.vvp $(SOURCE)
	# might need -o alu.vvp -s alu_tb $(SOURCE)

alu.vcd: alu.vvp
	$(VVP) alu.vvp

view: all
	$(WAVE) alu.vcd

clean:
	rm *.vvp *.vcd