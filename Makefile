DEPS:=filecoin.h filecoin.pc libfilecoin.a

all: $(DEPS)
.PHONY: all


# Create a file so that parallel make doesn't call `./install-filecoin` for
# each of the deps
$(DEPS): .install-filecoin  ;

.install-filecoin: rust
	./install-filecoin
	@touch $@


clean:
	rm -rf $(DEPS) .install-filecoin
.PHONY: clean
