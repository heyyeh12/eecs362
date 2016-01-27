# ALU Components
SOURCES = shifter.vvp flag_setter.vvp bitwise.vvp adder.vvp
IVERILOG = iverilog

all: $(SOURCES) alu.vvp

# e.g. iverilog -o and_gate.vvp and_gate.v and_gate_tb.v
$(SOURCES) : %.vvp : %.v %_tb.v
	$(IVERILOG) -o $@ $^

alu.vvp : alu.v $(SOURCES:.vvp=.v)
	$(IVERILOG) -o $@ $^

.PHONY: clean

clean:
	rm *.vvp