select count(playerID) 
from Master
where birthYear is null
or birthYear = ""      
or birthMonth is null
or birthMonth = ""        
or birthDay is null
or birthDay = "";

select
playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null 
and G_all is null
group by playerID
order by totalPay desc
limit 3;


select count(playerID) 
from Master 
where birthYear is null 
or birthYear = ""
or birthMonth is null or birthMonth = ""
or birthDay is null or birthDay = "";

select playerID,sum(salary) as totalPay 
from Salaries
left outer join Appearances using (playerID,yearID,teamID)
left outer join Managers using (playerID,yearID,teamID)
where G is null and
G_all is null
group by playerID
order by totalPay desclimit 3;

select nameFirst,nameLast,max(RBI) 
from Batting
inner join Master using (playerID)
where HR = 0
group by nameLast, nameFirst
limit 1;