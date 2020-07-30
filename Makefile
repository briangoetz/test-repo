OUTPUT = out
INPUT = site

CSSDIR  = $(OUTPUT)/css
CSSFILE = $(CSSDIR)/main.css

IN_FILES = $(wildcard $(INPUT)/*.md $(INPUT)/**/*.md)
OUT_FILES = $(addprefix $(OUTPUT)/, $(addsuffix .html, $(basename $(IN_FILES:$(INPUT)/%=%) )))

all: $(OUTPUT) $(OUT_FILES)
	echo $(FILES)

$(OUTPUT)/%.html: $(INPUT)/%.md
	pandoc -f markdown $< -o $@

$(OUTPUT):
	mkdir $(OUTPUT)

clean:
	rm -rf $(OUTPUT)

.PHONY: all clean
