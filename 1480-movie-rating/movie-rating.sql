(select u.name as results
  from MovieRating mr
  left join Users u
    on mr.user_id = u.user_id
  group by mr.user_id
  order by count(mr.user_id) desc, name
  limit 1)

union all

(select m.title as results
  from MovieRating mr
  left join Movies m
    on mr.movie_id = m.movie_id
  where created_at between '2020-02-01' and '2020-02-29'
  group by m.title
  order by avg(mr.rating) desc, m.title
  limit 1)