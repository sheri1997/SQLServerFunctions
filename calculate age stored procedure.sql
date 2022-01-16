create proc calculateAge @dob date
as begin
declare @age int
set @age = DATEDIFF(year,@dob,getdate()) -
	case
		when (month(@dob)>month(getdate())) or (month(@dob) = month(getdate()) and day(@dob)>day(getdate()))
		then 1
		else 0
	end
select @age
end

exec calculateAge '01/08/1997' as age