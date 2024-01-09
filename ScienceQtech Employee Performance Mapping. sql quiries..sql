select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT from employee.emp_record_table;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING from employee.emp_record_table where EMP_RATING <2;

select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING from employee.emp_record_table
where EMP_RATING >4;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING from employee.emp_record_table
where EMP_RATING between 2 and 4;

select  CONCAT( FIRST_NAME,LAST_NAME ) AS NAME from emp_record_table where                     DEPT='FINANCE';

select coalesce(MANAGER_ID,0),coalesce((count(MANAGER_ID)),0)as count from employee.emp_record_table group by MANAGER_ID;
  
select * FROM emp_record_table where DEPT='healthcare'
UNION
SELECT* FROM 	emp_record_table where DEPT='finance';

select EMP_ID,FIRST_NAME,LAST_NAME,ROLE,DEPT ,EMP_RATING,max(EMP_RATING) over(partition by DEPT ) AS MAXRATINGBYDEPT from employee.emp_record_table;
Select ROLE, min(SALARY) AS MINSALARY,max(SALARY)AS MAXSALARY FROM emp_record_table group by ROLE;

SELECT EMP_ID, DENSE_RANK()OVER(ORDER BY EXP)AS RANKofexp FROM emp_record_table;

 
SELECT * FROM employee.emp_record_table where EMP_ID IN(SELECT EMP_ID FROM employee.emp_record_table WHERE EXP>10);

DELIMITER &&

CREATE FUNCTION Employee_ROLE(EXP int)

RETURNS VARCHAR(40)

DETERMINISTIC

BEGIN

DECLARE Employee_ROLE VARCHAR(40);

IF EXP BETWEEN 12 AND 16 THEN

SET Employee_ROLE="MANAGER";

ELSEIF EXP BETWEEN 10 AND 12 THEN

SET Employee_ROLE ="LEAD DATA SCIENTIST";

ELSEIF EXP BETWEEN 5 AND 10 THEN
SET Employee_ROLE ="SENIOR DATA SCIENTIST";

ELSEIF EXP BETWEEN 2 AND 5 THEN

SET Employee_ROLE ="ASSOCIATE DATA SCIENTIST";

ELSEIF EXP<=2 THEN

SET Employee_ROLE ="JUNIOR DATA SCIENTIST";

END IF;

RETURN (Employee_ROLE);

END &&
	
SELECT EXP,Employee_ROLE(EXP) FROM employee.data_science_team;

Create index  idx_emprecordtbale on employee.emp_record_table(EMP_ID,FIRST_NAME);
Select emp_id from emp_record_table where first_name=’Eric’
select EMP_ID,(SALARY*0.05*EMP_RATING) AS BONUS FROM 
employee.emp_record_table;
SELECT EMP_ID,FIRST_NAME,LAST_NAME,SALARY,COUNTRY,CONTINENT,
AVG(salary)OVER(PARTITION BY COUNTRY)AVG_salary_IN_COUNTRY,
AVG(salary)OVER(PARTITION BY CONTINENT)AVG_salary_IN_CONTINENT,
COUNT(*)OVER(PARTITION BY COUNTRY)COUNT_IN_COUNTRY,
COUNT(*)OVER(PARTITION BY CONTINENT)COUNT_IN_CONTINENT
FROM employee.emp_record_table;


