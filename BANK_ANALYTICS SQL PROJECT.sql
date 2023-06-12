------------------------------------------------------------ PROJECT- BANK Loan of Customers      -----------------------------------------------------------------------------
-- Q1 Year wise loan amount Stats ------------------
select sum(loan_amnt) as Loan_amt,
year(issue_d) as Years 
from finance_1
group by Years 
order by years asc;

--------------------------- x ----------------------------- x ------------------------------------------------- x -------------------------------------------
-- Q2 Grade and sub grade wise revol_bal ------------
SELECT grade, sub_grade,sum(revol_bal) as Revol_Balance
FROM finance_1
JOIN finance_2 ON finance_1.id = finance_2.ï»¿id
group by grade, sub_grade
order by sub_grade;

---------------------------------------- x ----------------------------------------------- x ---------------------------------- x ----------------------------------
-- Q3 Total Payment for Verified Status Vs Total Payment for Non Verified Status -------------
select sum(total_pymnt) as Total_payment,verification_status
from finance_2
JOIN finance_1 ON finance_1.id = finance_2.ï»¿id
group by verification_status
having verification_status not in("Source Verified");

---------------------------------------------------- x -------------------------------------------- x --------------------------------- x-------------------------------
-- Q4 State wise and month wise loan status -------------
select addr_state,month(issue_d) as Month_wise_status,loan_status
 from finance_1
 group by Month_wise_status,addr_state
 order by addr_state,month_wise_status;
 
 -------------------------------------------------- x ------------------------------------------------ x------------------------------------ x --------------------------
 -- Q5 Home ownership Vs last payment date stats ---------------
SELECT a.id,a.home_ownership,b.last_pymnt_d
FROM finance_1 as a 
join finance_2 as b on a.id = b.ï»¿id;


-------------------------------------------- x ----------------------------------------- x ------------------------------------ x-----------------------------------------
-- Q6 Purpose wise loan amount ------------------------------------------
select purpose, sum(loan_amnt) as Loan_Amount
from finance_1
group by purpose;

----------------------------------------------- x------------------------------------------------x--------------------------------------------------------------------
--- Q7 Maximum ,Minimum, sum and average of loan amount--------------------
select max(loan_amnt) as Maximum_LOAN,
min(loan_amnt) as Minimum_LOAN,
sum(loan_amnt) as Total_loan_amount,
avg(loan_amnt) as Average_of_loan
from finance_1;

---------------------------------------------------- x -------------------------------------------------------- x ------------------------------------------------
--- Q8 Show me the records where loan amount is greater than 20000 ---------------------------------------- 
CREATE VIEW LOAN_AMT as 
SELECT *
FROM finance_1
WHERE loan_amnt >= 20000;

select * from LOAN_AMT;
------------------------------------------------------- x ----------------------THE END😊---------------------------------- x------------------------------------------------


 




