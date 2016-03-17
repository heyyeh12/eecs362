IVERILOG = iverilog

SOURCE_DIR = ../alu/
TEST_DIR = ./
BUILD_DIR = ./
LIB_PATH = ../gates/gates.v

SOURCES = shifter adder
SOURCES_PATH = $(LIB_PATH) $(addprefix $(SOURCE_DIR), $(addsuffix .v, $(SOURCES)))
SOURCES_VVP = $(addsuffix .vvp, $(SOURCES))


default: multiplier_tb.vvp

multiplier_tb.vvp : $(SOURCES_PATH) $(addprefix $(TEST_DIR), multiplier_tb.v multiplier.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

.PHONY: clean

clean:
	rm $(addprefix $(BUILD_DIR), *.vvp)