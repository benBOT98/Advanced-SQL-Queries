--Creating CTE (Common Table Expression)

with CTE_Employee as 
(Select FirstName, LastName, Gender, Salary
, count(gender) over (PARTITION by Gender) as TotalGender
, avg(Salary) over (PARTITION by Gender) as AsgSalary
from [SQL Tutorial]..EmployeeDemographics emp
join [SQL Tutorial]..EmployeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
where Salary > '45000'
)
Select *
from CTE_Employee

--Temp Tables

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select *
from #temp_Employee

insert into #temp_Employee values (
'1001', 'HR', '4500')

Select *
from #temp_Employee

INSERT INTO #temp_Employee
SELECT *
fROM [SQL Tutorial]..EmployeeSalary

Select *
from #temp_Employee


drop table if exists #Temp_Employee2
Create table #Temp_Employee2 (
JobTitle varchar(50),
EmployeePerJob int, 
AvgAge int,
AvgSalary int
)

INSERT INTO #Temp_Employee2
select JobTitle, Count(JobTitle), Avg(Age), Avg(SalarY)
from [SQL Tutorial]..EmployeeDemographics emp
join [SQL Tutorial]..EmployeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
group by JobTitle


select *
from #Temp_Employee2


--Subquery in Select

select EmployeeID, Salary, (Select avg(salary) From [SQL Tutorial]..EmployeeSalary) as AllAvgSalary
From [SQL Tutorial]..EmployeeSalary


--How to use it with Partition By

select EmployeeID, Salary, avg(salary) over () as AllAvgSalary
From [SQL Tutorial]..EmployeeSalary


--Subquery in From

select a.EmployeeID, AllAvgSalary
From (select EmployeeID, Salary, avg(salary) over () as AllAvgSalary
From [SQL Tutorial]..EmployeeSalary) a


--Subquery in Where

select EmployeeID,JobTitle, Salary 
From [SQL Tutorial]..EmployeeSalary
Where EmployeeID in (
		Select EmployeeID
		From [SQL Tutorial]..EmployeeDemographics
		Where Age > 30)