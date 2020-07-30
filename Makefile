OUTPUT = out

CSSDIR  = $(OUTPUT)/css
CSSFILE = $(CSSDIR)/main.css

IN_FILES = $(wildcard *.md **/*.md)
OUT_FILES = $(addprefix $(OUTPUT)/, $(addsuffix .html, $(basename $(IN_FILES) )))

all: $(OUTPUT) $(OUT_FILES)
	echo $(FILES)

$(OUTPUT)/%.html: %.md
	pandoc -f markdown $< -o $@

$(OUTPUT):
	mkdir $(OUTPUT)

clean:
	rm -rf $(OUTPUT)

.PHONY: all clean
