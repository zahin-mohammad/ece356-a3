select playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null and
G_all is null
group by playerID
order by totalPay desc
limit 3;

select playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null and
G_all is null
group by playerID
order by totalPay desc
limit 3;

select playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null and
G_all is null
group by playerID
order by totalPay desc
limit 3;

select playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null and
G_all is null
group by playerID
order by totalPay desc
limit 3;

select playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null and
G_all is null
group by playerID
order by totalPay desc
limit 3;