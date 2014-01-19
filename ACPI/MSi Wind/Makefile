dsdt.aml: dsdt.dsl
	iasl -vo -w1 -tc dsdt.dsl && rm dsdt.hex

clean:
	rm -f *.hex *~ dsdt.aml

all: dsdt.aml
