# Write your MySQL query statement below

# 이게 이지...?
# cross join을 쓰면 된다.
# 물론 cross join을 안 쓰고도 풀 수 있을 것이다.

select s1.student_id
     , s1.student_name
     , s2.subject_name
     , count(e.subject_name) as attended_exams
  from students s1
  cross join subjects s2
  left join examinations e
    on s1.student_id = e.student_id
    and s2.subject_name = e.subject_name
    group by s1.student_id, s1.student_name, s2.subject_name
    order by s1.student_id, s2.subject_name
    ;