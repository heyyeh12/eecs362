IVERILOG = iverilog

SOURCE_DIR = ../../verilog/single_cycle/
LIB_DIR = ../../verilog/single_cycle/lib/
ALU_DIR = ../../verilog/alu/
TEST_DIR = ./
BUILD_DIR = ../bin/

LIB_PATH = ../../verilog/gates/gates.v ../../verilog/gates/dff.v ../../verilog/memory/memory.v

CPU_LIB = $(addprefix $(LIB_DIR), control.v sign_extender.v regfile.v)
ALU_LIB = $(addprefix $(ALU_DIR),  bitwise.v flag_setter.v setter.v shifter.v adder.v alu.v)
COMPONENTS = $(addprefix $(SOURCE_DIR), ex.v id.v ifetch.v wb.v singleCycle.v topLevel.v)
# SOURCES_PATH = $(LIB_PATH) $(addprefix $(SOURCE_DIR), $(addsuffix .v, $(SOURCES)))
# SOURCES_VVP = $(addsuffix .vvp, $(SOURCES))

default: topLevel


####### SINGLE CYCLE PROCESSOR #######
singleCycle: singleCycle.vvp

singleCycle.vvp : $(LIB_PATH) $(CPU_LIB) $(ALU_LIB) $(COMPONENTS)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

####### SINGLE CYCLE LIB ####### 
control: control.vvp

control.vvp : $(addprefix $(LIB_DIR), control.v) $(addprefix $(TEST_DIR), control_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

regfile: regfile.vvp 

regfile.vvp : $(addprefix $(LIB_DIR), regfile.v) $(addprefix $(TEST_DIR), regfile_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
sign_extender: sign_extender.vvp 

sign_extender.vvp : $(LIB_PATH) $(addprefix $(LIB_DIR), sign_extender.v) $(addprefix $(TEST_DIR), sign_extender_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

####### SINGLE CYCLE COMPONENTS ####### 
id: id.vvp

id.vvp : $(LIB_PATH) $(addprefix $(LIB_DIR), control.v sign_extender.v regfile.v) $(addprefix $(SOURCE_DIR), id.v) $(addprefix $(TEST_DIR), id_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
ex: ex.vvp

ex.vvp : $(LIB_PATH) $(addprefix $(LIB_DIR), control.v sign_extender.v regfile.v) $(addprefix $(ALU_DIR),  bitwise.v flag_setter.v setter.v shifter.v adder.v alu.v) $(addprefix $(SOURCE_DIR), ex.v) $(addprefix $(TEST_DIR), ex_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

####### TOP LEVEL #######
topLevel: topLevel.vvp

topLevel.vvp : $(LIB_PATH) $(ALU_LIB) $(CPU_LIB) $(COMPONENTS)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

#########################

##### DFFA #####
dffa : dffa.vvp

dffa.vvp : ../../verilog/gates/dff.v $(addprefix $(TEST_DIR), dffa_tb.v)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

# # e.g. iverilog -o alu.vvp gates.v shifter.v ... alu_tb.v
# alu.vvp : $(LIB_PATH) $(SOURCES_PATH) $(addprefix $(SOURCE_DIR), alu.v) $(addprefix $(TEST_DIR), alu_tb.v)
# 	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

# e.g. iverilog -o shifter.vvp gates.v shifter.v shifter_tb.v
# $(SOURCES_VVP) : %.vvp : $(LIB_PATH) $(addprefix $(SOURCE_DIR), %.v) $(addprefix $(TEST_DIR), %_tb.v)
# 	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

.PHONY: clean

clean:
	rm $(addprefix $(BUILD_DIR), *.vvp)