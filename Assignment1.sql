--LEVEL 1 Assignemnts by OMEESHA MAHANTA
--1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.
SELECT UPPER(EMPFNAME) AS EMPNAME FROM EMPLOYEEINFO_OMEESHA;
--2. Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(EMPFNAME) FROM EMPLOYEEINFO_OMEESHA WHERE DEPARTMENT='HR';
--3. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT SUBSTR(EMPLNAME,1,4) FROM EMPLOYEEINFO_OMEESHA;
--4. Write a query to create a new table which consists of data and structure copied from the other table.
CREATE TABLE DUP_EMP_POSTNS_COHORT2 AS SELECT * FROM EMP_POSTNS_COHORT;
--5. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT CONCAT(CONCAT(EMPFNAME,' '), EMPLNAME) AS FULLNAME FROM EMPLOYEEINFO_OMEESHA;
--6. Write a query to retrieve Departments who have less than 2 employees working in it.
SELECT MIN(SALARY) FROM
(SELECT DISTINCT SALARY FROM EMP_POSTNS_COHORT ORDER BY SALARY DESC)
WHERE ROWNUM < 3;
--7. Write a query to find the third-highest salary from the EmpPosition table.
SELECT * FROM EMP_POSTNS_COHORT WHERE EMPID <= FLOOR((SELECT COUNT(*)/2 FROM EMP_POSTNS_COHORT));
--8. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
SELECT * FROM EMPLOYEEINFO_OMEESHA WHERE SALARY = ( SELECT MIN( SALARY ) FROM EMPLOYEEINFO_OMEESHA   
            WHERE  SALARY IN (SELECT DISTINCT TOP N 
			    SALARY FROM EMPLOYEEINFO_OMEESHA ORDER BY SALARY DESC )                                
                )  
--9. Write a query to fetch 50% records from the EmployeeInfo table.
SELECT DEPARTMENT, count(*) AS DEPT_COUNT FROM EMPLOYEEINFO_OMEESHA GROUP BY DEPARTMENT HAVING count(*) < 2;
--10. Write a query to retrieve duplicate records from a table.
SELECT EMPFNAME, COUNT(EMPFNAME)
FROM EMPLOYEEINFO_OMEESHA
GROUP BY EMPFNAME
HAVING COUNT(EMPFNAME)>1;