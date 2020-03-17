CALL sys.ps_truncate_all_tables(FALSE);
source query1x5.sql;

SELECT 
    sum(TIMER_END-TIMER_START)/5 as 'AverageRunTime',
    min(TIMER_END-TIMER_START) as 'SmallestRunTime',
    max(TIMER_END-TIMER_START) as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query2x5.sql;

SELECT 
    sum(TIMER_END-TIMER_START)/5 as 'AverageRunTime',
    min(TIMER_END-TIMER_START) as 'SmallestRunTime',
    max(TIMER_END-TIMER_START) as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query3x5.sql;

SELECT 
    sum(TIMER_END-TIMER_START)/5 as 'AverageRunTime',
    min(TIMER_END-TIMER_START) as 'SmallestRunTime',
    max(TIMER_END-TIMER_START) as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query4x5.sql;

SELECT 
    sum(TIMER_END-TIMER_START)/5 as 'AverageRunTime',
    min(TIMER_END-TIMER_START) as 'SmallestRunTime',
    max(TIMER_END-TIMER_START) as 'LargestRunTime'
FROM performance_schema.events_transactions_history;

CALL sys.ps_truncate_all_tables(FALSE);
source query5x5.sql;

SELECT 
    sum(TIMER_END-TIMER_START)/5 as 'AverageRunTime',
    min(TIMER_END-TIMER_START) as 'SmallestRunTime',
    max(TIMER_END-TIMER_START) as 'LargestRunTime'
FROM performance_schema.events_transactions_history;
