DB=moneyball

SCRIPTS=${CURDIR}/scripts
DROP_TABLES=$(SCRIPTS)/drop_tables.sql
PLAYERS=$(SCRIPTS)/players.sql
TEAMS=$(SCRIPTS)/teams.sql
PERFORMANCES=$(SCRIPTS)/performances.sql
SALARIES=$(SCRIPTS)/salaries.sql

BUILD=${CURDIR}/build.sql

all: import
	@psql $(DB) -f $(BUILD)

drop_tables:
	@cat $(DROP_TABLES) > $(BUILD)

import: drop_tables
	@cat $(PLAYERS) >> $(BUILD)
	@cat $(TEAMS) >> $(BUILD)
	@cat $(PERFORMANCES) >> $(BUILD)
	@cat $(SALARIES) >> $(BUILD)

clean:
	@rm -rf $(BUILD)