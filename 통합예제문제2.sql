use employee;

select EName,date_format(`StartDate`, '%Y-%m-%d')
from `tEmployee`
where DNumber='D1001' or DNumber='D2001'
order by StartDate;

select   from tEmployee;