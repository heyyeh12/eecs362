# Basic gates
BUILD_DIR = build
SOURCES = and_gate.vvp and_32.vvp \
		or_gate.vvp or_32.vvp or32to1.vvp \
		xor_gate.vvp xor_32.vvp \
		nand_gate.vvp \
		nor_gate.vvp nor32to1.vvp \
		not_gate.vvp not_32.vvp \
		mux2to1.vvp
IVERILOG = iverilog
VVP = vvp
WAVE = gtkwave

all: $(SOURCES) mux2to1.vvp

# e.g. iverilog -o and_gate.vvp and_gate.v and_gate_tb.v
$(SOURCES) : %.vvp : gates.v individual_gates/%_tb.v
	$(IVERILOG) -o $@ $^
	
.PHONY: clean

clean:
	rm *.vvp
