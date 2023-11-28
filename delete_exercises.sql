use hippo_docrob;

select *
from albums
where release_date > 1991;

select *
from albums
where genre like '%Disco%' and genre not like '%post-disco%';

# this is a select statement
select *
from albums
where artist = 'Celine Dion';

delete
from albums
where release_date > 1991;

delete
from albums
where genre like '%Disco%' and genre not like '%post-disco%';

delete
from albums
where artist = 'Guns N'' Roses';
