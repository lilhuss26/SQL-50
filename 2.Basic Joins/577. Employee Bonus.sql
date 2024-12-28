select Employee.name,Bonus.bonus
from Employee
left join Bonus on Bonus.empId = Employee.empID
WHERE Bonus.bonus < 1000 OR Bonus.bonus is NULL