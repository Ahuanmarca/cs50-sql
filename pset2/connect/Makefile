DB=${CURDIR}/connect.db
PROGRAM=sqlite3
BUILD=${CURDIR}/build.sql
SCHEMA=${CURDIR}/schema.sql
SAMPLE_DATA=${CURDIR}/sample_data.sql

all: build
	@echo "hello, world"

schema:
	@cat $(SCHEMA) >> $(BUILD)

sample_data: schema
	@cat $(SAMPLE_DATA) >> $(BUILD)

build: sample_data
	@cat $(BUILD) | $(PROGRAM) $(DB)

clean:
	@rm -rf $(BUILD)