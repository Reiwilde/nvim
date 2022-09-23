SRC:=$(shell find . -name "*.fnl")
OUT:=$(patsubst %.fnl,%.lua,$(SRC))

all: $(OUT)

clean:
	rm ../init.lua
	rm -r ../after/plugin/reiwilde ../lua/reiwilde

%.lua: %.fnl
	@mkdir -p ../$(@D)
	fennel --compile $< > ../$@

