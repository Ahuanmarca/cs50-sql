DB=${CURDIR}/dese.db
EXTENSION=.sql
OUTPUT=${CURDIR}/output.txt
PROGRAM=sqlite3
COUNTER_SCRIPT=${CURDIR}/counter_script.sql
COUNTER_OUTPUT=${CURDIR}/counter_output.txt

all:
	@number=1 ; while [[ $$number -le 13 ]] ; do \
		echo $$number$(EXTENSION) >> $(OUTPUT) ; \
		cat $$number$(EXTENSION) | $(PROGRAM) $(DB) >> $(OUTPUT) ; \
		((number = number + 1)) ; \
	done

# counter:
# 1) Remove the counter_output.txt file
# 2) Begin a loop
# 	Echo before-wrapper into counter_script => OK
# 	Echo SQL statement into counter_script, excluding the last character of the file (the ";")
#  		=> OK !! THIS LINE GAVE ME A LOT OF TROUBLE
#  	Echo after-wrapper into counter_script => OK
# 	Attempt to run counter_script SQL statement into the database => OK

counter:
	@rm -rf $(COUNTER_OUTPUT)
	@number=1 ; while [[ $$number -le 13 ]] ; do \
		echo "SELECT COUNT(*) AS 'output lines' FROM (" > $(COUNTER_SCRIPT) ; \
		sed '$$ s/.$$//' $$number$(EXTENSION) >> $(COUNTER_SCRIPT) ; \
		echo ");" >> $(COUNTER_SCRIPT) ; \
		echo $$number$(EXTENSION) >> $(COUNTER_OUTPUT) ; \
		cat $(COUNTER_SCRIPT) | $(PROGRAM) $(DB) >> $(COUNTER_OUTPUT) ; \
		((number = number + 1)) ; \
	done
	@rm -rf $(COUNTER_SCRIPT)

test_sed:
	@rm -rf ${CURDIR}/test_sed.txt
	@sed '$$ s/.$$//' 1.sql >> ${CURDIR}/test_sed.txt

clean:
	@rm -rf $(OUTPUT)
