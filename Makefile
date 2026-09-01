PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin
BIN    := rtime

.PHONY: all build install uninstall test clean

all: build

build: $(BIN)

$(BIN): cli.cr rtime.cr
	crystal build --release cli.cr -o $(BIN)

install: build
	mkdir -p $(BINDIR)
	ln -sf $(CURDIR)/$(BIN) $(BINDIR)/$(BIN)
	@echo "linked $(BINDIR)/$(BIN) -> $(CURDIR)/$(BIN)"

uninstall:
	rm -f $(BINDIR)/$(BIN)

test:
	crystal spec

clean:
	rm -f $(BIN) $(BIN).dwarf
