create database functionpractise;
use functionpractise;
drop database functionpractise;
create function calculateAge(@dob date)
returns int
as begin
declare @age int
set @age = DATEDIFF(year,@dob,getdate()) -
	case
		when (month(@dob)>month(getdate())) or (month(@dob) = month(getdate()) and day(@dob)>day(getdate()))
		then 1
		else 0
	end
return @age
end

select dbo.calculateAge('01/08/1997') as age
