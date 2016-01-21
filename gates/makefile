# Basic gates
SOURCES = and_gate.vvp and_32.vvp \
		or_gate.vvp or_32.vvp \
		xor_gate.vvp xor_32.vvp \
		nand_gate.vvp \
		nor_gate.vvp
IVERILOG = iverilog
VVP = vvp
WAVE = gtkwave

all: $(SOURCES) mux2to1.vvp

# e.g. iverilog -o and_gate.vvp and_gate.v and_gate_tb.v
$(SOURCES) : %.vvp : %.v %_tb.v
	$(IVERILOG) -o $@ $^

# e.g. iverilog -o mux2to1.vvp mux_n.v mux2to1_tb.v
mux2to1.vvp : mux_n.v mux2to1_tb.v
	$(IVERILOG) -o $@ $^

.PHONY: clean

clean:
	rm *.vvp