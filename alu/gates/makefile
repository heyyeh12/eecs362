# Basic gates
SOURCE = mux_n.v 
# and_gate.v and_32.v
IVERILOG = iverilog
VVP = vvp
WAVE = gtkwave

all: gates.vcd

gates.vvp: $(SOURCE)
	$(IVERILOG) -o gates.vvp $(SOURCE)

gates.vcd: gates.vvp
	$(VVP) gates.vvp

view: all
	$(WAVE) gates.vcd

clean:
	rm *.vvp *.vcd