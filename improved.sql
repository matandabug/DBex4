select distinct e1.year, e1.name, e1.state
from elected_officials e1
where e1.votes >= ALL (select e2.votes
                        from elected_officials e2
                        where e1.year = e2.year)