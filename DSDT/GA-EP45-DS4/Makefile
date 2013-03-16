dsdt.aml: dsdt.dsl
	iasl -vo -w1 -tc dsdt.dsl && rm dsdt.hex

install: dsdt.aml
	@cp -v dsdt.aml /Volumes/BootLoader/EFI/ACPI/patched/

clean:
	rm -f *.hex *~ dsdt.aml

all: dsdt.aml
