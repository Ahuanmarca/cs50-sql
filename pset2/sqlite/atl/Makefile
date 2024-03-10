DB=${CURDIR}/atl.db
PROGRAM=sqlite3
BUILD=${CURDIR}/build.sql
SCHEMA=${CURDIR}/schema.sql
SAMPLE_DATA=${CURDIR}/sample_data.sql

all: sample_data
	@cat $(BUILD) | $(PROGRAM) $(DB)

schema:
	@cat $(SCHEMA) >> $(BUILD)

sample_data: schema
	@cat $(SAMPLE_DATA) >> $(BUILD)

clean:
	@rm -rf $(BUILD)