create database day3
use day3
select * from tablemp
use day3
create table tablemp(id int primary key identity,name varchar(40),gender varchar(40),salary int,deptid int )
insert into tablemp values('mark','male',9000,1),('ark','male',91000,3),('maozrk','male',19000,2),('markini','female',29000,1),('marks','female',9000,3)
select * from tablemp
drop procedure tablemp
1...................to dispaly a welcome message..........................................
create procedure uspassignment3
as
begin
print 'welcome to sql server'
end
exec uspassignment3
drop procedure uspassignment3
2....................stored procedure with i/p parameters..........................................
use day3
create proc usptablemployee (@gender varchar(20),@deptid int)
as 
begin
select name,gender,salary from dbo.tablemp where gender=@gender and deptid=@deptid;
end
exec dbo.usptablemployee 'female',3
drop procedure usptablemployee
3..............................total count..........................
alter proc usptablemployeecount (@gender varchar(20),@deptid int, @total int output)
as 
begin
select name,gender,salary from tablemp where gender=@gender and deptid=@deptid;
select @total=@@rowcount
end
declare @count int 
exec usptablemployeecount 'female',3,@total=@count output
select @count
4................................totalemploye by gender..........................
create procedure totalcount
as
begin
select gender,count(gender) as totalemplyeecount from tablemp group by gender
end
exec totalcount
drop procedure totalcount
5............................add three numbers....................................
declare @num1 int 
declare @num2 int
declare @num3 int
declare @result int
set @num1=900
set @num2=120
set @num3=350
set @result=@num1+@num2+@num3
print 'addition reslut 0f '+cast(@result as varchar(max))

create procedure addnum(@num1 int=13,@num2 int=23,@num3 int=56)
as
begin
declare @result int
set @result=@num1+@num2+@num3
select @result
end
exec addnum 13,34,56
drop procedure addnum


