   P-four Logistics
Team No : 08

Team Members:
PRAVEEN NAIK 178
PRASAD PATIL 173
PRAJWAL GOULI 172
PRASHANT ROY 175

================================PL/SQL QUERIES=========================================
###FUNCTIONS

1.To retrieve the total amount of order recieved on '24-sep-19'
create or replace function getcount(ordate in date)
return number
as 
counter number;
begin
select count(*) into counter
from order_details 
where ord_date = ordate;
return counter;
end;
/
select getcount('24-sep-19') from dual;

output:

GETCOUNT('24-SEP-19')
---------------------
                    7


2.write function to retreive total amount paid by the customer id
create or replace function getamount(id in varchar2)
return number
as 
amt number;
begin
select sum(tot_amount) into amt 
from order_details
where customer_id = id
group by customer_id;
return amt;
end;
/
select getamount('C6') from dual;

output:

GETAMOUNT('C6')
---------------
          25000


3.Write a function to retrieve manager name of a particular department name 
create or replace function getmanager(deptname in varchar2)
return varchar2
as 
name employee.fname%type;
begin
select fname into name
from employee,department
where ssn=dmgr_ssn and dname = deptname;
return name;
end;
/
select getmanager('ADMINISTRATION') from dual;

output:

GETMANAGER('ADMINISTRATION')
--------------------------------------------------------------------------------
SAGAR


4.Write a function to retrieve the no of orders he is handling by his ssn
create or replace function getord_count(essn in number)
return number
as 
counter number;
begin
select count(*) into counter
from employee,handles
where ssn=hssn and ssn = essn
group by ssn;
return counter;
end;
/
select getord_count(5) from dual;

output:

GETORD_COUNT(5)
---------------
              2


5.Write a function to retrieve the no of orders in which a particular vehicle partcipate in.
create or replace function getord_countv(no in string)
return number
as 
counter number;
begin
select count(*) into counter
from consists
where  vehicleno = no
group by vehicleno;
return counter;
end;
/
SQL> select getord_countv('VEC01') from dual;

GETORD_COUNTV('VEC01')
----------------------
                     4

###TRIGGER

1.Create trigger to update total vehicle count in order_details table when there is an addition addition of vehicle to that order

CREATE OR REPLACE TRIGGER COUNTUP
AFTER INSERT ON CONSISTS
FOR EACH ROW
BEGIN
 UPDATE ORDER_DETAILS 
 SET  TOT_VEHICLES = TOT_VEHICLES+1
 WHERE :NEW.ORDER_ID= ORDER_DETAILS.ORDER_ID;
END;

output :
Before 
SQL> select tot_vehicles from order_details where order_id='O01';

TOT_VEHICLES
------------
           1
insert into consists values('VEC12','O01');
After inserting
SQL> select tot_vehicles from order_details where order_id='O01';

TOT_VEHICLES
------------
           2

2.Create trigger to record the changes in the salary  of employees

create table salary_change(
	cno number,
    old_sal number(9,2),
    new_sal number(9,2),
    netchange number(9,2)
);

create or replace trigger sal_change
after update of salary on employee
for each row
begin
insert into salary_change values(:old.ssn,:old.salary,:new.salary,:new.salary-:old.salary);
end;
/

update employee set salary = salary+salary*.5 where ssn <3;

select *from salary_change;

output:

       CNO    OLD_SAL    NEW_SAL  NETCHANGE
---------- ---------- ---------- ----------
         1      20000      30000      10000
         2      11000      16500       5500


3. create trigger to record the companies to whom tot_amount is reduced by the company

drop table amt_change;
create table amt_change(
   comp_id varchar2(5),
   ord_id varchar2(5),
   old_amt number(9,2),
   new_amt number(9,2),
   perc_discount number(9,2)
);

create or replace trigger amtchange
after update of tot_amount on order_details
for each row
declare 
perc number(9,2);
begin
if(:old.tot_amount-:new.tot_amount>0) then
perc :=(:old.tot_amount-:new.tot_amount)*100 /  :old.tot_amount;
insert into amt_change values(:old.customer_id,:old.order_id,:old.tot_amount,:new.tot_amount,perc);
end if;
end;
/

update order_details set tot_amount = 6000 where order_id in('O01','O02','O03','O04');
SELECT *FROM AMT_CHANGE;

output:
COMP_ ORD_I    OLD_AMT    NEW_AMT PERC_DISCOUNT
----- ----- ---------- ---------- -------------
C1    O01        15000       6000            60
C2    O04         8000       6000            25

(only reduced amount is displayed)

4. Create a trigger to add 500 to employees salary as he handles orders

create or replace trigger addsalary
after insert on handles
for each row
declare
begin
update employee
set salary = salary+500
where ssn = :new.hssn;
end;
/

output:
before
sSQL> select salary from employee where ssn = 1;

    SALARY
----------
     30500

insert into handles values(1,'O08');

after
SQL> select salary from employee where ssn = 1;

    SALARY
----------
     31000

5. Create a trigger to record the  changes in managers for department

drop table manager_rec;

create table manager_rec
(
   dpname varchar2(20),
   dpno number,
   old_mgssn number,
   new_mgssn number
);

create or replace trigger manager_track
after update of dmgr_ssn on department
for each row
begin
insert into manager_rec values(:new.dname,:new.dnum,:old.dmgr_ssn,:new.dmgr_ssn);
end;
/
update department set dmgr_ssn = 5 where dnum=20;
select *from manager_rec;

output:

DPNAME                     DPNO  OLD_MGSSN  NEW_MGSSN
-------------------- ---------- ---------- ----------
SALES                        20          6          5


###RECORDS

1.write  plsql query to retrieve female with lowest salary using records
declare
type rec1 is record 
(
 ssn number,
 name varchar2(20),
 salary number(9,2)
 );
 fs rec1;
 begin 
 select e1.ssn,e1.fname,e1.salary into fs 
 from employee e1,employee e2 
 where e1.sex='F' and e2.sex = 'F'
 group by e1.ssn,e1.fname,e1.salary
 having e1.salary =min(e2.salary);
 dbms_output.put_line('Female employee with lowest salary name = '||fs.name||' ssn = '||fs.ssn||' salary = '||fs.salary);
 exception
 when too_many_rows then
dbms_output.put_line('There are more than one woman with same lowest salary');
 end;
 /

output:
Female employee with lowest salary name = SHREYA ssn = 8 salary = 3000

Statement processed.


2.Write  plsql query to retrieve no of employees working in  department 'ADMINISTRATION'
declare
type rec1 is record 
(
 ssn number,
count number
 );
 dp rec1;
 begin 
 select  dno,count(*) into dp
 from department ,employee 
 where dno= dnum and dname= 'ADMINISTRATION'
 group by dno;
 dbms_output.put_line('DEPT no = '||dp.ssn||' total no. of employees  = '||dp.count);
 exception
 when too_many_rows then
dbms_output.put_line('There are more than one department with that name');
 end;
 /
 
output:
DEPT no = 10 total no. of employees  = 7

Statement processed.


3.Write  plsql query to retrieve the total amount in rupees of orders that a employees handles with ssn = 1
declare
type rec1 is record 
(
 name varchar(20),
amt number(9,2)
 );
 bp rec1;
 begin 
 select  fname,sum(tot_amount) into bp
 from order_details o ,handles h ,employee  
 where o.order_id = h.order_id and h.hssn= ssn and ssn = 1
 group by fname,ssn;
 dbms_output.put_line('Employee = '||bp.name||' total amount  = '||bp.amt);
 exception
 when too_many_rows then
dbms_output.put_line('Too many rows returned');
 end;
 /
 
output:
Employee = SAGAR total amount  = 42000

Statement processed.

4.Write  plsql query to retrieve the total salary that should be given their employees by 'SALES' department
 declare
type rec1 is record 
(
name varchar(20),
amt number(9,2)
 );
 bp rec1;
 begin 
 select  dname,sum(salary) into bp
 from department ,employee  
 where dno = dnum and dname = 'SALES'
 group by dname,dno;
 dbms_output.put_line('department name  = '||bp.name||' total amount  = '||bp.amt);
 exception
 when too_many_rows then
dbms_output.put_line('Too many rows returned');
 end;
 /
 
output:
department name  = SALES total amount  = 77500

Statement processed.


5.Write  plsql query to retrieve the company details associated with maximum distance order
declare
type rec1 is record 
(
id varchar(20),
name varchar(20),
distance number
 );
 bp rec1;
 begin 
 select comp_name,comp_id  , o1.distance into bp
 from  order_details o1,customer,order_details o2
 where o1.customer_id = comp_id
 group by  comp_name,comp_id,o1.distance
 having o1.distance = max(o2.distance);
 dbms_output.put_line('company name  = '||bp.name||' company id  = '||bp.id||' distance  = '||bp.distance );
 exception
 when too_many_rows then
dbms_output.put_line('Too many rows returned');
 end;
 /

output:
company name  = C6 company id  = SHARDA CROPCHEM distance  = 980

Statement processed.

###PROCEDURE

1`write a procedure,enter employee number, that will return Employee name
create or replace procedure propra(x in number) as enm varchar(25);
begin
select fname into enm from employee where ssn=x;
dbms_output.put_line('Employee Name is '||enm);
end;
/

output
SQL> execute propra('18');
Employee Name is SHERYA
---------------------------------------------------------------------------------------------------------------

2.write a procedure,enter company name, that will return company city 

create or replace procedure propra(x in varchar) as addcity varchar(25);
begin
select city into addcity from customer where comp_name=x;
dbms_output.put_line('Located in City '||addcity);
end;
/

output
SQL> execute propra('TATA SPONGE');
Located in City GHAZIABAD
---------------------------------------------------------------------------------------------------------------

3.write a procedure,enter order id, that will return total amount of order

create or replace procedure propra(x in varchar) as amt number;
begin
select tot_amount into amt from order_details where order_id=x;
dbms_output.put_line('Total order amount is  '||amt);
end;
/

output
SQL> execute propra('O08');
Total order amount is  56000

---------------------------------------------------------------------------------------------------------------

4.write a procedure that will update the tot_vehicle to entered number x

create or replace procedure propra(x in number) as amt number;
begin
update order_details set tot_vehicles=x where tot_vehicles=0;
dbms_output.put_line('updated');
end;
/

output:
SQL> execute propra(1);
updated
SQL> select order_id,tot_vehicles from order_details;


ORDER_ID             TOT_VEHICLES
-------------------- ------------
O01                             2
O02                             5
O03                             1
O04                             5
O05                             1
O06                             4
O07                             1
O08                             1
O09                             1
O10                             1
O11                             1

ORDER_ID             TOT_VEHICLES
-------------------- ------------
O12                             2
O13                             2
O21                             2
O22                             4
O23                             3
O24                             1
O25                             3
O26                             4
O27                             2
O28                             1
O29                             1

ORDER_ID             TOT_VEHICLES
-------------------- ------------
O30                             1
O31                             1
O32                             1
O33                             1
O34                             1
O35                             1
O36                             1
O37                             3
O38                             1
O39                             2
O40                             1
---------------------------------------------------------------------------------------------------------------

5.write a procedure that will update the total amount of an order by entered x percent


create or replace procedure propra(x in number) as amt number;
begin
update order_details set tot_amount=(tot_amount*(1+x/100) );
dbms_output.put_line('updated');
end;
/


output:

SQL> execute propra(20);
updated

SQL> select order_id,tot_amount from order_details where;

BEFORE
select order_id,tot_amount from order_details;


ORDER_ID             TOT_AMOUNT
-------------------- ----------
O01                        6000
O02                        6000
O03                        6000
O04                        6000
O05                        7000
O06                        5000
O07                       10000
O08                       56000
O09                        4000
O10                       20000
O11                       40000

ORDER_ID             TOT_AMOUNT
-------------------- ----------
O12                        2000
O13                       25000
O21                        6000
O22                        4500
O23                       10000
O24                       17000
O25                        7000
O26                        3000
O27                        2000
O28                       21000
O29                       10000

ORDER_ID             TOT_AMOUNT
-------------------- ----------
O30                       15000
O31                        5000
O32                        5000
O33                       15000
O34                       10000
O35                        3000
O36                        5000
O37                        4000
O38                        9800
O39                        4700
O40                       16000


AFTER

ORDER_ID             TOT_AMOUNT
-------------------- ----------
O01                        7200
O02                        7200
O03                        7200
O04                        7200
O05                        8400
O06                        6000
O07                       12000
O08                       67200
O09                        4800
O10                       24000
O11                       48000

ORDER_ID             TOT_AMOUNT
-------------------- ----------
O12                        2400
O13                       30000
O21                        7200
O22                        5400
O23                       12000
O24                       20400
O25                        8400
O26                        3600
O27                        2400
O28                       25200
O29                       12000

ORDER_ID             TOT_AMOUNT
-------------------- ----------
O30                       18000
O31                        6000
O32                        6000
O33                       18000
O34                       12000
O35                        3600
O36                        6000
O37                        4800
O38                       11760
O39                        5640
O40                       19200

###CURSORS

1.TO RETRIVE THE FIRST NAME AND STATE OF EMPLOYEE WHO HAVE SALARY BELOW 3500.
DECLARE
CURSOR C1 IS SELECT FNAME,STATE_NAME FROM EMPLOYEE WHERE SALARY>3500;
NAM EMPLOYEE.FNAME%TYPE;
LOC EMPLOYEE.STATE_NAME%TYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO NAM,LOC;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(NAM||'      '||LOC);
END LOOP;
CLOSE C1;
END;
/

OUTPUT:
SAGAR      KARNATAKA
VEDANTH      KARNATAKA
ABDUL      KARNATAKA
ANUSHA      KARNATAKA
PRAMOD      KARNATAKA
SUDEEP      KARNATAKA
HARISH      KARNATAKA
MOHAN      KARNATAKA
BALAJI      KARNATAKA
SANGEETA      KARNATAKA
RAHIM      KARNATAKA
SHANKAR      KARNATAKA
VINAYAK      KARNATAKA
SHERYA      KARNATAKA
UMESH      KARNATAKA
SATVIK      KARNATAKA

Statement processed.


2.TO RETRIVE THE CUSTOMER ID AND NAME WHICH ARE FROM MAHARASTRA.
DECLARE
CURSOR C1 IS SELECT COMP_ID,COMP_NAME FROM CUSTOMER WHERE STATE_NAME='MAHARASTRA';
ID CUSTOMER.COMP_ID%TYPE;
NAME CUSTOMER.COMP_NAME%TYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO ID,NAME;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('CUSTOMER ID='||ID||' CUSTOMER NAME='||NAME);
END LOOP;
CLOSE C1;
END;
/

OUTPUT:
CUSTOMER ID=C6 CUSTOMER NAME=SHARDA CROPCHEM
CUSTOMER ID=C12 CUSTOMER NAME=LAKSHMI VILAS BANK
CUSTOMER ID=C13 CUSTOMER NAME=UFLEX
CUSTOMER ID=C19 CUSTOMER NAME=J.B.CHEMICALS

Statement processed.

3.UPDATING THE EMPLOYEE SALARY BY 500 AND DISPLAYIGNG THE SALRY BEFORE AND AFTER UPDATAION.
DECLARE  
TOTAL_ROWS NUMBER(5); 
CURSOR C1 IS SELECT SALARY FROM EMPLOYEE;
CURSOR C2 IS SELECT SALARY FROM EMPLOYEE;
SAL EMPLOYEE.SALARY%TYPE;
BEGIN 
OPEN C2;
DBMS_OUTPUT.PUT_LINE('SALARY BEFORE UPDATATION');
LOOP
FETCH C2 INTO SAL;
EXIT WHEN C2%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(SAL);
END LOOP;
CLOSE C2;
UPDATE EMPLOYEE 
SET SALARY = SALARY + 500; 
IF SQL%NOTFOUND THEN 
DBMS_OUTPUT.PUT_LINE('no customers selected'); 
ELSIF SQL%FOUND THEN 
TOTAL_ROWS := SQL%ROWCOUNT;
DBMS_OUTPUT.PUT_LINE( TOTAL_ROWS || ' customers selected '); 
END IF;
OPEN C1;
DBMS_OUTPUT.PUT_LINE('SALARY AFTER UPDATATION');
LOOP
FETCH C1 INTO SAL;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(SAL);
END LOOP;
CLOSE C1;
COMMIT; 
END;

OUTPUT:
SALARY BEFORE UPDATATION
20000
11000
40000
10000
2000
15000
15000
3000
20000
6000
6000
15000
5000
15000
15000
5000
6000
9000
18 customers selected 
SALARY AFTER UPDATATION
20500
11500
40500
10500
2500
15500
15500
3500
20500
6500
6500
15500
5500
15500
15500
5500
6500
9500

Statement processed.


4.TO RETRIVE THE VEHICLE NO WHICH ARE TANK OR FROM FORD COMAPANY.
DECLARE
CURSOR C1 IS SELECT VEHICLE_NO FROM VEHICLE WHERE TYPE='TANK'OR MODEL='FORD';
VEL VEHICLE.TYPE%TYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO VEL;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(VEL); 
END LOOP;
CLOSE C1;
COMMIT;
END;

OUTPUT:
VEC32
VEC33
VEC43
VEC44
VEC54
VEC55
VEC03
VEC11
VEC14

Statement processed.

5.TO RETRIVE THE ORDER DATE AND ORDER ID AND THE CUSTOMER WHO ORDERED IT.
DECLARE
CURSOR C1 IS SELECT ORD_DATE,ORDER_ID,CUSTOMER_ID  FROM ORDER_DETAILS;
DATE ORDER_DETAILS.ORD_DATE%TYPE;
ID ORDER_DETAILS.ORDER_ID%TYPE;
CUS ORDER_DETAILS.CUSTOMER_ID%TYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO DATE,ID,CUS;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(ID||'   '||DATE||'   '||CUS); 
END LOOP;
CLOSE C1;
END;
/

OUTPUT:
O01   24-SEP-19   C1
O02   21-DEC-19   C5
O03   24-SEP-19   C1
O04   24-SEP-19   C2
O05   01-JAN-19   C1
O06   06-MAY-19   C3
O07   24-SEP-19   C2
O08   02-FEB-19   C2
O09   06-MAY-19   C4
O10   08-APR-19   C1
O11   06-MAY-19   C1
O12   28-FEB-20   C2
O13   06-MAY-19   C6
O21   24-SEP-19   C11
O22   21-DEC-19   C15
O23   14-OCT-19   C19
O24   25-SEP-19   C20
O25   01-JAN-19   C11
O26   26-MAY-19   C13
O27   24-SEP-19   C14
O28   02-FEB-19   C12
O29   06-MAY-19   C14
O30   08-APR-19   C18
O31   30-JUN-19   C16
O32   27-FEB-20   C17
O33   10-MAR-20   C11
O34   27-SEP-19   C15
O35   11-AUG-19   C14
O36   07-JUL-19   C11
O37   08-JUL-19   C12
O38   31-JAN-19   C12
O39   24-SEP-19   C13
O40   26-NOV-19   C14

Statement processed.
