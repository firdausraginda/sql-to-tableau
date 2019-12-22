select count(e.emp_no) AS "Number of Employees", e.gender AS Gender, year(de.from_date) AS Year
from t_employees e
join t_dept_emp de on de.emp_no = e.emp_no
group by year(de.from_date), e.gender
having Year >= 1990
order by Year asc;

select d.dept_name, e.gender, e.emp_no, dm.from_date, dm.to_date, e.hire_date,
	case
		when e.hire_date between dm.from_date and dm.to_date then 1
        else 0
	end AS Active
from t_employees e
join t_dept_manager dm ON dm.emp_no = e.emp_no
join t_departments d ON d.dept_no = dm.dept_no;

select e.gender, d.dept_name, ROUND(avg(s.salary), 2), year(de.from_date) AS year
from t_employees e
join t_salaries s ON e.emp_no = s.emp_no
join t_dept_emp de ON de.emp_no = e.emp_no
join t_departments d ON d.dept_no = d.dept_no
group by e.gender, d.dept_name, year
having year <= 2002
order by d.dept_name, year asc;