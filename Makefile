CC := gcc

BIN := test
CLEAR_C := $(BIN).i 
ASSEMBLER := $(BIN).s 
OBJECT_FILE := $(BIN).o 

.PHONY := clean $(BIN)

all: $(BIN)

$(BIN): $(CLEAR_C) $(ASSEMBLER) $(OBJECT_FILE)
		$(CC) $(BIN).c -o $(BIN)

$(CLEAR_C): $(BIN).c 
		$(CC) -E $(BIN).c -o $(CLEAR_C)

$(ASSEMBLER): $(BIN).i 
		$(CC) -S $(BIN).i 

$(OBJECT_FILE): $(BIN).s 
		$(CC) -c $(BIN).s 

clean:
	rm $(CLEAR_C) $(ASSEMBLER) $(OBJECT_FILE) $(BIN)
