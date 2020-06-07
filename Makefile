TARGET := bin/ute-gen-script
LEX := flex
CC := gcc
LDFLAGS := -ll

LEX_FILE := scanner/gen-script.lex
LEX_OUT := scanner/lex.yy.c

all: $(TARGET)
.PHONY: clean

$(TARGET): $(LEX_OUT)
	$(CC) -o $(TARGET) $(LDFLAGS) $(LEX_OUT)

$(LEX_OUT): $(LEX_FILE)
	$(LEX) -o $(LEX_OUT) $(LEX_FILE)


clean:
	rm -rf $(TARGET) $(LEX_OUT)
