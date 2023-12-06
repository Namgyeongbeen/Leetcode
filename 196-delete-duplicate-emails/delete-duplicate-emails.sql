# Write your MySQL query statement below
DELETE p1
    FROM Person p1
    INNER JOIN Person p2 
    WHERE p1.email = p2.email AND p1.id > p2.id;

# 일반적으로 DELETE 문은 DELETE FROM "테이블 이름" 형식을 따르지만,
# 조인을 사용하는 경우 조금 다른 문법이 필요하다.
# 위 코드의 DELETE p1 FROM Person p1 형식은 SQL이 Person 테이블에서 어떤 행을 삭제해야 하는지 명확하게 알려주는 방식이다.
# INNER JOIN을 사용하여 테이블을 셀프조인할 때, DELETE문은 삭제할 행이 있는 테이블을 정확히 지정해야 한다.
# 이를 위해 DELETE p1 FROM Person p1 구문을 사용하여 p1 별칭이 지정한 테이블에서 행을 삭제하겠다는 것을 SQL에 명확하게 알려준다.
