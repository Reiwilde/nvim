FNL_SRC:=$(shell find . -type d -path ./out -prune -o -name "*.fnl")
FNL_OUT:=$(patsubst %.fnl,out/%.lua,$(FNL_SRC))
VIM_SRC:=$(shell find . -type d -path ./out -prune -o -name "*.vim")
VIM_OUT:=$(patsubst %.vim,out/%.vim,$(VIM_SRC))

all: build

build: $(FNL_OUT) $(VIM_OUT)

clean:
	-rm -r out

format:
	@find . -name "*.fnl" -exec echo "format: {}" \; -exec ../bin/fnlfmt --fix {} \;

install: build
	cp -r out/* ../

uninstall:
	-rm ../*.lua
	-rm ../*.vim
	-rm -r ../indent
	-rm -r ../lua

out/%.lua: %.fnl
	@mkdir -p $(@D)
	../bin/fennel --compile $< > $@

out/%.vim: %.vim
	@mkdir -p $(@D)
	cp $< $@
