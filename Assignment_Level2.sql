/*Level 2 Assignment*/
/*1.Write a PL/SQL block to calculate the incentive of an employee whose ID is 110.*/
set serveroutput on;
DECLARE
  incentive   NUMBER(8,2);
BEGIN
  SELECT SALARY * 0.12 INTO incentive
  FROM CO_EMPLOYERPOSITION
  WHERE EMPID = 110;
DBMS_OUTPUT.PUT_LINE('Incentive  = ' || TO_CHAR(incentive));
END;

/*2.Write a PL/SQL program to check whether a given character is letter or digit.*/
set serveroutput on;
DECLARE
    get_character CHAR(1) := '&enter_a_character';
BEGIN
    IF ( get_character >= 'A' AND get_character <= 'Z' ) OR ( get_character >= 'a' AND get_character <= 'z' ) THEN
      dbms_output.Put_line ('entered character is a letter');
    ELSE
      dbms_output.Put_line ('entered character is not a letter');

      IF get_character BETWEEN '0' AND '9' THEN
        dbms_output.Put_line ('entered character is a digit');
      ELSE
        dbms_output.Put_line ('entered character is not a digit');
      END IF;
    END IF;
END; 

/* 3.Write a PL/SQL program to check whether a date falls on weekend i.e. SATURDAY or SUNDAY.*/
set serveroutput on;
DECLARE
date1 DATE := TO_DATE('&new_date', 'DD-MON-YYYY');
get_day VARCHAR2(15);
BEGIN
get_day := RTRIM(TO_CHAR(date1, 'DAY'));
IF get_day IN ('SATURDAY', 'SUNDAY') THEN
dbms_output.new_line;
DBMS_OUTPUT.PUT_LINE 
('The day of the given date is '||get_day||' and it falls on weekend');
ELSE
dbms_output.new_line;
DBMS_OUTPUT.PUT_LINE ('The day of the given date is '||get_day||' and it does not fall on the weekend');
END IF;
END;

/*4.Write a PL/SQL program to check whether a given number is positive, negative or zero.*/
set serveroutput on;
DECLARE
giv_num NUMBER := &get_num;
BEGIN
IF giv_num < 0 THEN
DBMS_OUTPUT.PUT_LINE ('The number '||giv_num||' is a negative number');
ELSIF giv_num = 0 THEN
DBMS_OUTPUT.PUT_LINE ('The number '||giv_num||' is equal to zero');
ELSE
DBMS_OUTPUT.PUT_LINE ('The number '||giv_num||' is a positive number');
END IF;
END;

/*5.Write a PL/SQL program to find whether a given string is palindrome or not.*/
set serveroutput on;
declare
  n number;
	m number;
	temp number:=0;
	rem number;

begin
	n:=&get_num;
	m:=n;
	
  while n>0
	loop
		rem:=mod(n,10);
		temp:=(temp*10)+rem;
		n:=trunc(n/10);
	end loop; -- end of while loop here
	
	if m = temp
	then
		dbms_output.put_line('true');
	else
		dbms_output.put_line('false');
	end if;
end;













