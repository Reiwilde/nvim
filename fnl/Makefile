SRC:=$(shell find . -name "*.fnl")
OUT:=$(patsubst %.fnl,%.lua,$(SRC))

all: $(OUT)

clean:
	rm ../init.lua
	rm -r ../lua/rw
%.lua: %.fnl
	@mkdir -p ../$(@D)
	fennel --compile $< > ../$@

