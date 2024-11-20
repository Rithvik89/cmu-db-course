-- Find all successful coaches who have won at least one medal. List them in descending order by medal number, then by name alphabetically.


select count(*) as MEDAL_NUMBER, c.name AS COACH_NAME from coaches as c
join  
(select m.discipline, a.country_code from medals as m
join athletes as a on m.winner_code = a.code 
union all 
select m.discipline, t.country_code from medals as m
join teams as t on m.winner_code = t.code
group by t.code ) as x
on c.country_code = x.country_code and c.discipline = x.discipline
group by c.code 
order by MEDAL_NUMBER DESC, COACH_NAME ASC;




-- no need to compare players/ teams discipline as we have winner_code, which can be team code | normal code.

