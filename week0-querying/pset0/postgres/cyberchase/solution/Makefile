DB=cyberchase
OUTPUT=${CURDIR}/output.txt
SCRIPT_EXTENSION=".sql"

all:
	@cat ${CURDIR}/scripts/1.sql | psql -U renzobelon cyberchase > $(OUTPUT)

clean:
	rm -rf $(OUTPUT)
