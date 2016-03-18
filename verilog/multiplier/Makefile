IVERILOG = iverilog

SOURCE_DIR = ../alu/
TEST_DIR = ./
BUILD_DIR = ./
LIB_PATH = ../gates/gates.v
BUILD_FILES = $(wildcard ./*.v)

SOURCES = lshift adder
SOURCES_PATH = $(LIB_PATH) $(addprefix $(SOURCE_DIR), $(addsuffix .v, $(SOURCES)))
SOURCES_VVP = $(addsuffix .vvp, $(SOURCES))


default: multiplier_tb.vvp

# multiplier_fsm.vvp : multiplier_fsm.v
	# $(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

multiplier_tb.vvp : $(SOURCES_PATH) $(addprefix $(TEST_DIR), multiplier_tb.v multiplier.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

# $(BUILD_FILES) : %.vvp : %.v $(LIB)
	# $(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^ -grelative-include


.PHONY: clean

clean:
	rm $(addprefix $(BUILD_DIR), *.vvp)