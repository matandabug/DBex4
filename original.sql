CREATE INDEX idx_elected_officials_year_votes ON elected_officials (year, votes);

explain analyze
select distinct e1.year, e1.name, e1.state
from elected_officials e1
where votes = (select max(votes)
 from elected_officials e2
 where e2.year = e1.year)
order by year;

DROP INDEX idx_elected_officials_year_votes;