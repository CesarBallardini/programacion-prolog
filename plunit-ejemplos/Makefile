#
# Makefile
#
# (usa GNU make)

TESTFILES := $(wildcard tests/test_*.pl)
TESTCASES := $(patsubst tests/test_%.pl,%,$(TESTFILES))

test: $(TESTCASES)

%: tests/test_%.pl
	swipl -s $< -g run_tests,halt -t 'halt(1)'

