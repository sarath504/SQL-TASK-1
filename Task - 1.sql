use Sarath_DB_Task1;

--Select Exercise

--1. Select firstname, lastname, title, age, salary for everyone in your employee table.
select 
      FirstName,
	  LastName,
	  Title,
	  Age,
	  Salary 
 from Employee;




--2. Select firstname, age and salary for everyone in your employee table
select FirstName,
       Age,
	   Salary 
  from Employee;




--3. Selct firstname and display as 'Name' for everyone in your employee table
select FirstName as 'Name' 
  from Employee;
  

  

--4. Select firstname and lastname as 'Name' for everyone. Use " " (space) to separate firstname and last.
select FirstName+' '+LastName as 'Name' 
  from Employee;





--Using Where Clause

--5. Select all columns for everyone with a salary over 38000. 
select * 
  from Employee 
 where salary > 38000;
 



--6. Select first and last names for everyone that's under 24 years old.
select FirstName,
       LastName 
  from Employee 
 where age < 24;
 



--7. Select first name, last name, and salary for anyone with "Programmer" in their title. 
select FirstName,
       LastName,
	   Salary 
  from Employee 
 where Title like '%Programmer%';





--8. Select all columns for everyone whose last name contains "O".
select * 
  from Employee 
 where LastName like '%O%';
 



--9. Select the lastname for everyone whose first name equals "Kelly". 
select LastName 
  from Employee 
 where FirstName = 'Kelly';




--10. Select all columns for everyone whose last name ends in "Moore".
select * 
  from Employee
 where LastName like '%Moore';




--11. Select all columns for everyone who are 35 and above
select * 
  from Employee 
 where Age > = 35;





--Using multiple 'where' clauses

--12. Select firstname ,lastname,age and salary of everyone whose age is above 24 and below 43.
select FirstName,
       LastName,
	   Age,
	   Salary 
  from Employee 
 where Age > 24 
   and Age < 43;
  



--13. Select firstname, title and lastname whose age is in the range 28 and 62 and salary greater than 31250.
select FirstName,
       Title,
	   LastName 
  from Employee 
 where Age between 28 and 62 
   and Salary > 31250;




--14. Select all columns for everyone whose age is not more than 48 and salary not less than 21520.
select * 
  from Employee 
 where Age ! > 48 
   and Salary ! < 21520;
   



--15. Select firstname and age of everyone whose firstname starts with "John" and salary in the range 25000 and 35000
select FirstName,
       Age 
  from Employee 
 where FirstName like 'John%' 
   and Salary between 25000 and 35000;
   




--Using 'Order By' clause

--16. Select all columns for everyone by their ages in descending order.
	select * 
	  from Employee 
  order by Age desc;

--17. Select all columns for everyone by their ages in ascending order.
	select * 
	  from Employee 
  order by Age;

--18. Select all columns for everyone by their salaries in descending order.
	select * 
	   from Employee 
   order by Salary desc;

--19. Select all columns for everyone by their salaries in ascending order.
	select * 
	   from Employee 
   order by Salary;

--20. Select all columns for everyone by their salaries in ascending order whose age not less than 17.
	select * 
	  from Employee 
	 where age ! < 17 
  order by Salary;

--21. Select all columns for everyone by their salaries in descending order whose age not more than 34
	select * 
	  from Employee 
	 where age ! > 34 
  order by Salary desc;


--Miscellaneous( count, sum(), max(), min())

--22. Select all columns for everyone by their length of firstname in ascending order
	select * 
	  from Employee 
  order by len(FirstName);




--23. Select the number of employees whose age is above 45
select count(FirstName) as 'No. of Employees' 
  from Employee 
 where Age > 45;




--24. Show the results by adding 5 to ages and removing 250 from salaries of all employees
select FirstName,
       LastName,
	   Title,
	   Age+5 as 'Updated_Age',
	   Salary-250 as 'Updated_Salary' 
  from Employee;




--25. Select the number of employees whose lastname ends with "re" or "ri" or "ks"
select count(LastName) as 'No of Employees' 
  from Employee
 where LastName like '%re' 
    or LastName like '%ri' 
	or LastName like '%ks';




--26. Select the average salary of all your employees.
select avg(Salary) as 'Average_Salary' 
  from Employee;




--27. Select the average salary of Freshers.
select avg(Salary) as 'Freshers_Average_Salary' 
  from Employee 
 where Title = 'Fresher';




--28. Select the average age of Programmers.
select avg(Age) as 'Programmers_Average_Age' 
  from Employee 
 where Title = 'Programmer';




--29.Select the average salary of employees whose age is not less than 35 and not more than 50
select avg(Salary) as 'Average_Salary' 
  from Employee 
 where Age ! < 35 
   and Age ! > 50;




--30. Select the number of Freshers.
select count(FirstName) as 'No of Freshers' 
  from Employee 
 where Title = 'Fresher';




--31. What percentage of programmers constitute your employees.
select count(Title)*100/(select count(*) from Employee) as 'Percentage' 
  from Employee 
 where Title = 'Programmer';




--32. What is the combined salary that you need to pay to the employees whose age is not less than 40
select sum(Salary) as 'Total Salary' 
  from Employee 
 where Age ! < 40;




--33. What is the combined salary that you need to pay to all the Freshers and Programmers for 1 month.
select sum(Salary)/12 as 'Total_Salary' 
  from Employee 
 where Title = 'Fresher' 
    or Title = 'Programmer';




--34. What is the combined salary that you need to pay to all the Freshers whose age is greater than 27 for 3years
select sum(Salary)*3 as 'Total_Salary_for_3Years' 
  from Employee 
 where Title = 'Fresher' 
   and Age > 27;





--Using Sub-Queries ( and usage of 'in' and 'between')


--35.Select the eldest employee's firstname, lastname and age whose salary is less than 35000
select FirstName,
       LastName,
	   Age 
  from Employee 
 where Age = (
			  select max(Age) 
			    from Employee 
			   where Salary < 35000
			 ) 
	   and Salary < 35000;




--36. Who is the youngest General Manager.
select FirstName,
       LastName,
	   Title 
  from Employee 
 where age = (
			 select min(age) 
			   from Employee 
			  where Title = 'General Manager'
			  ) 
   and Title = 'General Manager';




--37. Select the eldest fresher whose salary is less than 35000.
select FirstName,
       LastName,
	   Title,
	   Salary 
  from Employee 
 where Age = (
			  select max(Age) 
			    from Employee 
			   where Salary < 35000
			  ) 
   and Salary<35000;




--38. Select firstname and age of everyone whose firstname starts with "John" or "Michael" and salary in the range 17000 and 26000.
select FirstName, 
       Age 
  from Employee 
 where FirstName like 'John%' 
    or FirstName like '%Michael%' 
   and Salary between 17000 and 26000;





--Using 'Group By' and 'Having' clause

--39. How many employees are having each unique title. Select the title and display the number of employees present in ascending order.
	select Title, 
		   count(FirstName) as 'No of Employees' 
	  from Employee 
  group by Title 
  order by count(FirstName);




--40. What is the average salary of each unique title of the employees. Select the title and display the average salary of employees in each.
	select Title, 
		   avg(Salary) as 'Average_Salary' 
	  from Employee 
  group by Title;




--41. What is the average salary of employees excluding Freshers.
select avg(Salary) as 'Average_Salary' 
  from Employee 
 where Title !='Fresher';




--42. What is the average age of employees of each unique title.
	select Title,
		   avg(Age) as 'Average_Age' 
	  from Employee 
  group by Title;




--43. In the age range of 25 to 40 get the number of employees under each unique title.
	select Title, 
		   count(FirstName) as 'No of Employees' 
	  from Employee 
	 where Age between 25 and 40 
  group by Title;




--44. Show the average salary of each unique title of employees only if the average salary is not less than 25000.
	select Title,
	       avg(Salary) as 'Average_Salary' 
	  from Employee 
  group by Title 
    having avg(Salary) ! < 25000;




--45. Show the sum of ages of each unique title of employee only if the sum of age is greater than 30.
	select Title,
		   sum(Age) as 'Total_Age' 
	  from Employee 
  group by Title 
    having sum(Age) > 30;






--Using 'Update'

--46.Lisa Ray just got married to Michael Moore. She has requested that her last name be updated to Moore. 
update Employee 
   set LastName = 'Moore' 
 where LastName = 'Ray';

--select * from Employee;




--47.Ginger Finger's birthday is today, add 1 to his age and a bonus of 5000.
update Employee 
   set Age = Age + 1, 
       Salary =  Salary + 5000;
--select * from Employee;




--48.All 'Programmer's are now called "Engineer"s. Update all titles accordingly. 
update Employee 
   set Title = 'Engineer' 
 where Title = 'Programmer';
--select * from Employee;




--49. Everyone whose making under 30000 are to receive a 3500 bonus.
update Employee 
   set Salary = Salary + 3500 
 where Salary < 30000;
--select * from Employee;




--50.Everyone whose making over 35500 are to be deducted 15% of their salaries.
update Employee 
   set Salary = Salary - Salary * 0.15 
 where Salary > 35500;
--select * from Employee;

