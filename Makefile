SRC_DIR = src
OUT_DIR = dist

FNL_SRC:=$(shell find $(SRC_DIR) -name "*.fnl")
FNL_OUT:=$(patsubst $(SRC_DIR)/%.fnl,$(OUT_DIR)/%.lua,$(FNL_SRC))
VIM_SRC:=$(shell find $(SRC_DIR) -name "*.vim")
VIM_OUT:=$(patsubst $(SRC_DIR)/%.vim,$(OUT_DIR)/%.vim,$(VIM_SRC))

all: build

build: $(FNL_OUT) $(VIM_OUT)

clean:
	@-rm -rf $(OUT_DIR)

format:
	@find . -name "*.fnl" -exec echo "format: {}" \; -exec bin/fnlfmt --fix {} \;

install: build remove
	cp -r $(OUT_DIR)/* .

remove:
	@-rm -f *.lua
	@-rm -f *.vim
	@-rm -rf indent
	@-rm -rf lua

$(OUT_DIR)/%.lua: $(SRC_DIR)/%.fnl
	@mkdir -p $(@D)
	bin/fennel --compile $< > $@

$(OUT_DIR)/%.vim: $(SRC_DIR)/%.vim
	@mkdir -p $(@D)
	cp $< $@
