IVERILOG = iverilog

SOURCE_DIR = ../../verilog/alu/
TEST_DIR = ./
BUILD_DIR = ../bin/

LIB_PATH = ../../verilog/gates/gates.v ../../verilog/alu/alu_const.vh

SOURCES = shifter flag_setter bitwise adder setter# add additional alu dependencies here
SOURCES_PATH = $(LIB_PATH) $(addprefix $(SOURCE_DIR), $(addsuffix .v, $(SOURCES)))
SOURCES_VVP = $(addsuffix .vvp, $(SOURCES))


default: alu.vvp $(SOURCES_VVP)

# e.g. iverilog -o alu.vvp gates.v shifter.v ... alu_tb.v
alu.vvp : $(LIB_PATH) $(SOURCES_PATH) $(addprefix $(SOURCE_DIR), alu.v) $(addprefix $(TEST_DIR), alu_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

# e.g. iverilog -o shifter.vvp gates.v shifter.v shifter_tb.v
$(SOURCES_VVP) : %.vvp : $(LIB_PATH) $(addprefix $(SOURCE_DIR), %.v) $(addprefix $(TEST_DIR), %_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

.PHONY: clean

clean:
	rm $(addprefix $(BUILD_DIR), *.vvp)