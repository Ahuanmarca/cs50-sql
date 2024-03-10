DB=${CURDIR}/moneyball.db
PROGRAM=sqlite3
SCRIPT_EXTENSION=.sql
OUTPUT=${CURDIR}/output.txt
COUNTER_SCRIPT=${CURDIR}/counter_script.sql
COUNTER_OUTPUT=${CURDIR}/counter_output.txt

all:
	@for i in $$(seq 1 12); do \
		echo $$i$(SCRIPT_EXTENSION) >> $(OUTPUT); \
		cat $$i$(SCRIPT_EXTENSION) | $(PROGRAM) $(DB) >> $(OUTPUT); \
		echo "SELECT COUNT (*) AS 'rows' FROM(" > $(COUNTER_SCRIPT); \
		sed '$$ s/.$$//' $$i$(SCRIPT_EXTENSION) >> $(COUNTER_SCRIPT); \
		echo ");" >> $(COUNTER_SCRIPT); \
		cat $(COUNTER_SCRIPT) | $(PROGRAM) $(DB) >> $(OUTPUT); \
		echo "" >> $(OUTPUT); \
	done

test:
	cat $(COUNTER_SCRIPT) | $(PROGRAM) $(DB) > ${CURDIR}/test.txt

clean:
	@rm -rf $(OUTPUT)
	@rm -rf $(COUNTER_OUTPUT)
	@rm -rf $(COUNTER_SCRIPT)
