#
# Makefile
#

#DIR = $(abspath ./tests)
DIR = ./tests
TESTFILES= $(wildcard  $(DIR)/*.plt)
OUTPUTS = $(patsubst $(DIR)/%.plt,%,$(TESTFILES))


.PHONY=test $(TESTFILES)


all : $(OUTPUTS)
	@echo "TESTFILES= $(TESTFILES)"

%:$(DIR)/%.plt
	swipl -v -s "$<" -g run_tests,halt -t 'halt(1)'
