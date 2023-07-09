/*Level 3 Assignment*/

/*  1. Write a PL/SQL block to create a package that contains a function and a procedure. The function should take in an array of integers and return the sum of the array. The procedure should take in an array of integers and sort the array in descending order.*/

CREATE OR REPLACE PACKAGE array_operations_pkg AS

  TYPE int_array IS TABLE OF INTEGER;

  FUNCTION calculate_sum(arr IN int_array) RETURN INTEGER;

  PROCEDURE sort_array_desc(arr IN OUT int_array);

END array_operations_pkg;
/

CREATE OR REPLACE PACKAGE BODY array_operations_pkg AS

  FUNCTION calculate_sum(arr IN int_array) RETURN INTEGER IS
    total_sum INTEGER := 0;
  BEGIN
    FOR i IN 1..arr.COUNT LOOP
      total_sum := total_sum + arr(i);
    END LOOP;
    RETURN total_sum;
  END calculate_sum;

  PROCEDURE sort_array_desc(arr IN OUT int_array) IS
    temp INTEGER;
  BEGIN
    FOR i IN 1..arr.COUNT LOOP
      FOR j IN i+1..arr.COUNT LOOP
        IF arr(i) < arr(j) THEN
          temp := arr(i);
          arr(i) := arr(j);
          arr(j) := temp;
        END IF;
      END LOOP;
    END LOOP;
  END sort_array_desc;

END array_operations_pkg;
/

/*    2.Write a PL/SQL block to create a nested table type, insert data into the nested table, and then query the nested table to retrieve specific data.*/

DECLARE
  -- Create a nested table type
  TYPE nested_table_type IS TABLE OF VARCHAR2(100);
  
  -- Declare a variable of nested table type
  v_nested_table nested_table_type;
BEGIN
  -- Initialize the nested table
  v_nested_table := nested_table_type();
  
  -- Insert data into the nested table
  v_nested_table.extend(3);
  v_nested_table(1) := 'Apple';
  v_nested_table(2) := 'Banana';
  v_nested_table(3) := 'Orange';
  
  -- Query the nested table to retrieve specific data
  FOR i IN 1..v_nested_table.count LOOP
    DBMS_OUTPUT.PUT_LINE('Element ' || i || ': ' || v_nested_table(i));
  END LOOP;
END;


/*    3.Write a PL/SQL block to create a stored procedure that takes in two dates and returns a list of employees who were hired between those dates, along with their hire dates and job title.*/

CREATE OR REPLACE PROCEDURE get_employees_by_hire_date(
  p_start_date IN DATE,
  p_end_date IN DATE
)
IS
BEGIN
  FOR emp IN (
    SELECT employee_id, hire_date, job_title
    FROM employees
    WHERE hire_date BETWEEN p_start_date AND p_end_date
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || emp.hire_date);
    DBMS_OUTPUT.PUT_LINE('Job Title: ' || emp.job_title);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
  END LOOP;
END;
/


/*    4 .Write a PL/SQL block to create a function that takes in a string as input and returns the string in reverse order.*/
CREATE OR REPLACE FUNCTION reverse_string(p_input_string IN VARCHAR2) RETURN VARCHAR2 IS
  v_output_string VARCHAR2(4000);
BEGIN
  FOR i IN REVERSE 1..LENGTH(p_input_string) LOOP
    v_output_string := v_output_string || SUBSTR(p_input_string, i, 1);
  END LOOP;
  
  RETURN v_output_string;
END;
/



/*    5.Write a PL/SQL block to create a trigger that automatically updates a table with the current date and time whenever a row is inserted. */
CREATE OR REPLACE TRIGGER update_date_trigger
BEFORE INSERT ON your_table_name
FOR EACH ROW
BEGIN
  :NEW.inserted_date := SYSDATE;
END;
/


