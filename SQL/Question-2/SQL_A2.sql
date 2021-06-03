-- Question
--		Calculate the average GPA required for each student and 
--		find students who are qualified for the Dean's List 
--		(GPA >= 3.5) in each semester (only applicable where 
--		is_required = True).

-- Create temp table for students data
CREATE TABLE #students (
student_id int,
class_id int,
school_year int,
gpa int,
is_required bit)

-- insert some data into it
insert into #students 
Values
	(1, 1001, 2018, 4, 1),
	(1, 2001, 2018, 3, 1),
	(1, 3004, 2019, 2, 0),
	(1, 4002, 2019, 4, 1),
	(2, 2002, 2018, 4, 1),
	(2, 3001, 2019, 2, 0),
	(3, 1001, 2018, 2, 1),
	(3, 2001, 2018, 4, 1),
	(3, 1001, 2019, 4, 1)

-- view the data
select * from #students

-- Answer to the question
select student_id, class_id, school_year, AVG(gpa) [Average_GPA]
from #students
where is_required = 1
	and gpa >= 3.5
group by student_id, class_id, school_year

-- drop the table if you want to
drop table #students