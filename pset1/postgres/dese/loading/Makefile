DB=dese
DISTRICTS='${CURDIR}/data/districts.csv'
EXPENDITURES='${CURDIR}/data/expenditures.csv'
SCHOOLS='${CURDIR}/data/schools.csv'
GRADUATION_RATES='${CURDIR}/data/graduation_rates.csv'
STAFF_EVALUATIONS='${CURDIR}/data/staff_evaluations.csv'

SCRIPTS=${CURDIR}/scripts
IMPORT=$(SCRIPTS)/import.sql
NORMALIZE=$(SCRIPTS)/normalize.sql
BUILD=${CURDIR}/build.sql

all: normalize
	@psql $(DB) -f $(BUILD)

master:
	@cat $(IMPORT) > $(BUILD)

import: master
	@echo "COPY import.master_districts FROM $(DISTRICTS) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)
	@echo "COPY import.master_expenditures FROM $(EXPENDITURES) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)
	@echo "COPY import.master_schools FROM $(SCHOOLS) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)
	@echo "COPY import.master_graduation_rates FROM $(GRADUATION_RATES) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)
	@echo "COPY import.master_staff_evaluations FROM $(STAFF_EVALUATIONS) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)

normalize: import
	@cat $(NORMALIZE) >> $(BUILD)

clean:
	@rm -rf $(BUILD)
