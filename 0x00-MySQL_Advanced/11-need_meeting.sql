-- SQL script that creates a view need_meeting that lists all students that have a score under 80 (strict) and no last_meeting or more than 1 month.
-- Requirements 
--		The view need_meeting should return all students name when:
--		They score are under (strict) to 80
--		AND no last_meeting date OR more than a month01

CREATE VIEW need_meeting AS
select name from students where
(COALESCE( last_meeting, 0) = 0 OR TIMESTAMPDIFF(MONTH, last_meeting, CURDATE()) > 2) AND score < 80;
