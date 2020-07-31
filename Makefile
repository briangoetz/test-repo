INPUT = site
OUTPUT = out

IN_FILES = $(wildcard $(INPUT)/*.md $(INPUT)/**/*.md)
OUT_FILES = $(addprefix $(OUTPUT)/, $(addsuffix .html, $(basename $(IN_FILES:$(INPUT)/%=%) )))

all: $(OUTPUT) $(OUT_FILES)

$(OUTPUT)/%.html: $(INPUT)/%.md
	pandoc -f markdown $< -o $@

$(OUTPUT):
	mkdir $(OUTPUT)

clean:
	rm -rf $(OUTPUT)

.PHONY: all clean
