DB=cyberchase.db
OUTPUT=${CURDIR}/output.txt
SCRIPT_EXTENSION=".sql"

all:
	for number in 1 2 3 4 5 6 7 8 9 10 11 12 13 ; do \
		echo $$number$(SCRIPT_EXTENSION) >> $(OUTPUT) ; \
		cat $$number$(SCRIPT_EXTENSION) | sqlite3 $(DB) >> $(OUTPUT) ; \
	done

clean:
	rm -rf $(OUTPUT)
