DB=views
# CSV needs quotes so it can be used on import: master
CSV='${CURDIR}/data/views.csv'
BUILD=${CURDIR}/build.sql

SCRIPTS=${CURDIR}/scripts
MASTER=$(SCRIPTS)/import.sql
NORMALIZE=$(SCRIPTS)/normalize.sql

all: normalize
	@psql $(DB) -f $(BUILD)

master:
	@cat $(MASTER) > $(BUILD)

import: master
	@echo "COPY import.master_views FROM $(CSV) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)

normalize: import
	@cat $(NORMALIZE) >> $(BUILD)

clean:
	@rm -rf $(BUILD)
