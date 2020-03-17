CALL sys.ps_truncate_all_tables(FALSE);
source query1x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query2x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query3x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query4x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query5x5.sql;

SELECT 
    AVG(TIMER_WAIT)/1000000 as 'AverageRunTime',
    min(TIMER_WAIT)/1000000 as 'SmallestRunTime',
    max(TIMER_WAIT)/1000000 as 'LargestRunTime'
FROM performance_schema.events_transactions_history;
