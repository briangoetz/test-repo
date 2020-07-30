OUTPUT = out

CSSDIR  = $(OUTPUT)/css
CSSFILE = $(CSSDIR)/main.css

all: init clean $(OUTPUT) $(addprefix $(OUTPUT)/, $(addsuffix .html, $(basename $(wildcard *.md))))

$(OUTPUT)/%.html: %.md
	cp $< $@

$(OUTPUT):
	mkdir $(OUTPUT)

clean:
	rm -rf $(OUTPUT)

.PHONY: init clean
