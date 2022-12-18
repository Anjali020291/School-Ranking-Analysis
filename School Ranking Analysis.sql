/* Creating a database*/
create database school;
use school;

/*Creating tables with student and marksheet*/
create table students(
	student_id char(5) primary key  not null,
    student_first_name varchar(20)  not null,
    student_last_name varchar(20)  not null,
    class int,
    age int);
    
create table marksheet(
	score int,
    year char(5),
    class int,
    ranking int,
    student_id char(5));
    
/*Write a query to display student id and student first name from the student table
 if the age is greater than or equal to 16 and the student's last name is Kumar.*/
 
select student_id, student_first_name
from school.students
where age>=16 and student_last_name ="Kumar";

/*details from the marksheet table if the score is between 800 and 1000*/
select * from school.marksheet
where score between 800 and 1000;

/* adding 5 to the score and by naming the column as new score*/
alter table school.marksheet
add new_score int;
select score+5 from marksheet as new_score;

/*display the marksheet table in descending order of the  score*/
select * from school.marksheet
order by score desc;

/*display details of the students whose first name starts with a*/
select * from school.students
where student_first_name like "a%";


/************************************* SQL Fucntions**************************************/

/*Count*/
select count(score) as score_count from school.marksheet
where score > 500;

/*SUM*/
select sum(score) as total_marks from school.marksheet;

/*AVG*/
select avg(score) as avg_score from school.marksheet;

/*first function - returns first field values*/
select score from school.marksheet limit 7;

/* Last fucntion - returns last value */
select score from school.marksheet 
order by score asc limit 7; /* use desc for decending and asc for ascending*/

/* Minimum Fucntion*/
select min(score) as minimumn_score from school.marksheet;

/* Maximum function*/
select max(score) as maximum_score from school.marksheet;


/******************************************Scalar Function***********************************************/
/*1) Round Function*/
select round(2.37589484,3);/* gives output as 2.376*/

/*Len function*/
select length(student_first_name) as length_students_name from school.students;

/* Format - foramt the value of a field in specified format.*/
select format(15.15230,2); /*Gives 15.15 as output*/

/*Mid - extracts characters within a specifi range from a text field*/
select mid(student_first_name,1,4) as first_four_char from school.students;

/* NOW function - retrieve the current date and time of the system*/
select now() as current_date_time;

/*Upper Case Function or UCASE*/
select ucase(student_first_name) as capital_first_name from school.students;
select ucase(student_first_name) from school.students;

/*Lower Case*/
select lcase("HELLO");

/**********************************String Functions************************************/
/* CONCAT*/
select concat(student_first_name,' ',(student_last_name)) as Full_Name from school.students;
select concat(ucase(student_first_name),' ',ucase(student_last_name)) as Full_Name from school.students;

/*TRIM - trim function removes the spaces from both sides of the given string*/
select trim('    Ankit     ');


/*********************************Numeric Functions*************************************/
/* ABS Function- gives the absolute value*/
select abs(-123.25);/* gives 123.25 as output*/

/*CEIL function - returns the smallest integer value that is greater than or equal to the given number*/
select ceil(123.45); /* Gives output as 124*/

/* FLOOR Function - returns the highest integer value that is smaller than or equal to the given number*/
select floor(123.45); /* gives output as 123*/

/* MOD Function - Returns the remainder of dividing a number by another number*/
select mod(8,3);


/***************************************Date and Time Functions************************************/
/* DATE function*/
select date ("2013-02-12 01:02:03");

/*TIME Function*/
select time ("2013-02-12 01:02:03");

/*EXTRACT Function*/
select extract(year_month from "2013-02-12 01:02:03");
select extract(hour_second from "2013-02-12 01:02:03"); /* Gives 10203 as output hour,minute and seconds*/

/*DATE Format Function*/
select date_format("2013-02-12 01:02:03", '%h:%m:%s');

/**************************************Handling Duplicate Values*******************************/
/* Using Distinct and Count Method*/
select count(distinct student_first_name) as unique_record from school.students;

/* Count and group by method*/
select score, class, ranking ,student_id,
count(*) from school.marksheet group by score having count(*) =1; 


/**************************************Miscellaneous Functions*********************************/
/*CONVERT Function - Converts a value into a specific data type*/
select convert("2013-02-12 01:02:03", time); /* Gives output as 01:02:03 */

/*IF Function - Returns 1 is the expression in true and 2 if the expression is false*/
select if(200<100,'yes','no');

/*ISNULL - Returns 1 if the expression is NULL and 0 if NOT NULL*/
select isnull("12345"); /*Gives output as 0*/

/*IFNULL Function - compares two expressions
 and returns the first expression if it is not null and second otherwise*/
 select ifnull('121','abc'); /*returns 121*/
 
 /*COALESCE Function- returns the first notnull value from a list of expressions*/
 select coalesce(null,'abc','','a45',null);/*Returns abc*/
 select coalesce(null,'','a45',null); /*Returns ''*/


/**********************************General Functions*************************************/
/*ASCII Function*/
select Ascii('A');

/*VERSION()- returns the current version of mysql*/
select version();

/*SESSION USER Function - returns the current username and hostname for the mysql connection*/
select session_user();



/*******************************SUBQUERIES OPERATORS AND DERIVED TABLES IN SQL******************************/
/*ALIAS - refers to temporary names given to a table, column or expression*/
/*1 . Column Alias*/

select student_id as student_id_no from school.students;

/*2. Table Alias*/
select student_id from school.students as student_details;

/*JOINS- A method of linking data between one or more tables based on a related column*/
/* 1. Inner Join*/
select student_first_name, student_last_name, age,new_score, score,year, ranking
from school.students
inner join school.marksheet on students.student_id = marksheet.student_id;

/*2. Left Join*/
select student_first_name, student_last_name, age,new_score, score,year, ranking
from school.students
left join school.marksheet on students.student_id = marksheet.student_id;

/*3. RightJoin*/
select student_first_name,student_last_name, age,new_score, score,year, ranking
from school.students
Right join school.marksheet on students.student_id = marksheet.student_id;

/*4. Cross Join*/
select student_first_name,student_last_name, age,new_score, score,year, ranking
from school.students
Cross join school.marksheet  on students.student_id = marksheet.student_id;

/*5. Self Join- Joins a table to itself using inner or left join*/

	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    