DB=harvard.db
SCRIPTS=${CURDIR}/scripts

CREATE_INDEXES=${CURDIR}/indexes.sql
BUILD=${CURDIR}/build.sql
DROP_INDEXES=$(SCRIPTS)/drop_indexes.sql

all: explain_queries
	@sqlite3 $(DB) < $(BUILD)

create_indexes:
	@cat $(CREATE_INDEXES) > $(BUILD)

explain_queries: create_indexes
	@for i in {1..7}; do \
		echo "EXPLAIN QUERY PLAN" >> $(BUILD); \
		cat $(SCRIPTS)/$$i.sql >> $(BUILD); \
	done

clean:
	@echo "Database size before dropping indexes:"
	@du $(DB)
	@echo "Dropping indexes and removing build.sql"
	@sqlite3 ${DB} < $(DROP_INDEXES)
	@rm -rf $(BUILD)
	@echo "Database size after dropping indexes:"
	@du $(DB)
