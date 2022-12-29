.PHONY: all clean
all: smolnes deobfuscated

WARN=-Wall \
     -Wno-parentheses \
		 -Wno-misleading-indentation \
		 -Wno-bool-operation \
		 -Wno-discarded-qualifiers \
		 -Wno-incompatible-pointer-types-discards-qualifiers \
		 -Wno-unknown-warning-option

smolnes: smolnes.c
	$(CC) -O2 -o $@ $< -lSDL2 -g ${WARN}

deobfuscated: deobfuscated.c
	$(CC) -O3 -o $@ $< -g ${WARN} -march=rv32i -mabi=ilp32

clean:
	rm -f smolnes deobfuscated
