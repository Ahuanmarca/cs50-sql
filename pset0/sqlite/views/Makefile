DB=${CURDIR}/views.db
PROGRAM=sqlite3
OUTPUT=${CURDIR}/output.txt
EXTENSION=.sql

all:
	number=1 ; while [[ $$number -le 10 ]] ; do \
		echo $$number$(EXTENSION) >> $(OUTPUT) ; \
		cat $$number$(EXTENSION) | $(PROGRAM) $(DB) >> $(OUTPUT) ; \
		((number = number + 1)) ; \
	done

clean:
	rm -rf $(OUTPUT)