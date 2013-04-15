SRCS = dsdt.dsl ssdt.dsl
AMLS = $(patsubst %.dsl,%.aml,$(SRCS))

.PHONY: all

all: $(AMLS)

%.aml: %.dsl
	iasl -vo -we -w1 $<

install: $(AMLS)
	@cp -v $^ /Volumes/BootLoader/EFI/Clover/ACPI/patched/

clean:
	rm -f *~ $(AMLS)
