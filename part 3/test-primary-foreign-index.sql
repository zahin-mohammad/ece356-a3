source lahman2016-all-keys.sql;
use `baseball2016`;

INSERT INTO performance_schema.setup_objects VALUES ('EVENT','baseball2016','%','YES','YES');

source test.sql;