IVERILOG = iverilog
SRC_DIR = ../../verilog/
TEST_DIR = ./
BUILD_DIR = ../bin/

SRC_FILES = $(wildcard $(addprefix $(SRC_DIR), pipeline/*.v))
BUILD_FILES = $(SRC_FILES:.v=.vvp)
BUILD_NAMES = $(notdir $(BUILD_FILES))

LIB_SUBDIRS = alu gates memory single_cycle/lib
LIB = $(foreach dir, $(addprefix $(SRC_DIR), $(LIB_SUBDIRS)), $(wildcard $(dir)/*.v))
# LIB = $(addprefix $(SRC_DIR), constants.vh gates/gates.v gates/dff.v memory/memory.v alu/alu.v)
SRC = $(wildcard $(addprefix $(SRC_DIR), pipeline/*.v))
TST = $(wildcard *.v)

default: pipe_reg.vvp

pipe_reg.vvp : $(TST) $(LIB) $(SRC)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

# debug variable value - make print-VARIABLE
#print-%  : ; @echo $* = $($*)

################### PIPELINE COMPONENT (NO REGS) #####################
ifetch: ifetch.vvp

ifetch.vvp : ../../verilog/pipeline/ifetch.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

id: id.vvp

id.vvp : ../../verilog/pipeline/id.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
ex: ex.vvp

ex.vvp : ../../verilog/pipeline/ex.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
mem: mem.vvp

mem.vvp : ../../verilog/pipeline/mem.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
wb: wb.vvp

wb.vvp : ../../verilog/pipeline/wb.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
############################################################

################PIPELINE REGS########################

if_id: if_id.vvp

if_id.vvp : ../../verilog/pipeline/if_id.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
id_ex: id_ex.vvp

id_ex.vvp : ../../verilog/pipeline/id_ex.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
ex_mem: ex_mem.vvp

ex_mem.vvp : ../../verilog/pipeline/ex_mem.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^
	
mem_wb: mem_wb.vvp

mem_wb.vvp : ../../verilog/pipeline/mem_wb.v $(LIB) 
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

###########################################################

################ MAKE PIPELINE #########################

topLevel : topLevel.vvp

topLevel.vvp : ../../verilog/pipeline/topLevel.v $(SRC_FILES) $(LIB)
	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^

# can check each src file for syntax e.g. make ../../verilog/pipeline/ifetch.v
#$(BUILD_FILES) : %.vvp : %.v $(LIB)
#	$(IVERILOG) -o $(addprefix $(BUILD_DIR), $@) $^ -grelative-include

.PHONY: clean

clean:
	# rm ../bin/*.vvp