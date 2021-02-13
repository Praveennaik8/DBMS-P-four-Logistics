                            DBMS COURSE PROJECT

LOGISTICS DATABASE MANAGEMENT SYSTEM


TEAM MEMEBERS:
PRAVEEN NAIK 178
PRASAD PATIL 173
PRAJWAL GOULI 172
PRASHANT ROY 175

UNDER GUIDANCE OF:
Prof.KARIBASAPPA K G,
Asst. Prof. SHASHIDHARA VYAKARANAL

===================TABLE CREATION COMMANDS========================

CREATE TABLE COMPANY 
(REG_NO VARCHAR(5) NOT NULL PRIMARY KEY, 
CNAME VARCHAR(25) NOT NULL, 
 CEO_FNAME VARCHAR(25) NOT NULL, 
 PHONE_NUMBER NUMBER(10) NOT NULL, 
 STREET VARCHAR(30) NOT NULL, 
 CITY VARCHAR(25) NOT NULL, 
 STATE_NAME VARCHAR(20) NOT NULL, 
 ZIPCODE NUMBER(8) NOT NULL 
  
);

CREATE TABLE EMPLOYEE 
( SSN NUMBER(5) PRIMARY KEY, 
 FNAME VARCHAR(25) NOT NULL, 
 MNAME VARCHAR(15), 
 LNAME VARCHAR(25) NOT NULL, 
 DNO INTEGER NOT NULL, 
 SEX CHAR, 
 SALARY INTEGER, 
 STREET VARCHAR(30) NOT NULL, 
 CITY VARCHAR(20) NOT NULL, 
 STATE_NAME VARCHAR(20) NOT NULL, 
 ZIPCODE NUMBER(6) NOT NULL 
);

CREATE TABLE DEPARTMENT 
(DNUM INTEGER PRIMARY KEY, 
 DMGR_SSN NUMBER(5) NOT NULL, 
 REGNO VARCHAR(15) REFERENCES COMPANY(REG_NO) NOT NULL, 
 DNAME VARCHAR(20), 
 D_LOCATION VARCHAR2(30) NOT NULL  
);

ALTER TABLE EMPLOYEE ADD CONSTRAINTS FKEMP FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DNUM);

CREATE TABLE DEPENDENT 
( ESSN NUMBER(5) REFERENCES EMPLOYEE(SSN), 
 FNAME VARCHAR(25) NOT NULL, 
 MNAME VARCHAR(4), 
 LNAME VARCHAR(4) NOT NULL,   
  SEX CHAR, 
 STREET VARCHAR(30) NOT NULL, 
 CITY VARCHAR(25) NOT NULL, 
 STATE_NAME VARCHAR(20) NOT NULL, 
 ZIPCODE NUMBER(6) NOT NULL 
);

CREATE TABLE CUSTOMER 
(COMP_ID VARCHAR(10) PRIMARY KEY, 
COMP_NAME VARCHAR2(30), 
CONTACTNO NUMBER(10) NOT NULL, 
 STREET VARCHAR(30) NOT NULL, 
 CITY VARCHAR(25) NOT NULL, 
 STATE_NAME VARCHAR(20) NOT NULL, 
 ZIPCODE NUMBER(6) NOT NULL 
);

CREATE TABLE ORDER_DETAILS 
(ORDER_ID VARCHAR2(20) NOT NULL, 
CUSTOMER_ID VARCHAR (20) REFERENCES CUSTOMER(COMP_ID),  
PARCEL_MATERIAL VARCHAR2(20), 
TOT_VEHICLES INTEGER, 
TOT_AMOUNT INTEGER, 
ORD_DATE DATE NOT NULL, 
ACTUAL_DATE DATE NOT NULL, 
SOURCE_LOC varchar(20) NOT NULL, 
DEST_LOC varchar(20) NOT NULL, 
DISTANCE NUMBER(9,2) not null, 
PRIMARY KEY(ORDER_ID) 
);

CREATE TABLE VEHICLE 
(  
VEHICLE_NO VARCHAR2(20) PRIMARY KEY,MODEL VARCHAR2(20), 
TYPE VARCHAR2(20), 
MAX_CAPACITY VARCHAR2(10) 
);

CREATE TABLE HANDLES 
( HSSN NUMBER(5) REFERENCES EMPLOYEE(SSN), 
ORDER_ID VARCHAR2(20) REFERENCES ORDER_DETAILS(ORDER_ID) 
);

CREATE TABLE CONSISTS 
( VEHICLENO VARCHAR2(20) REFERENCES VEHICLE(VEHICLE_NO), 
ORDER_ID VARCHAR2(20) REFERENCES ORDER_DETAILS(ORDER_ID) 
);


=================DATA INSERTION COMMANDS===========================

INSERT INTO COMPANY VALUES('COMP1','AXON CARGOS','PRASADJWALVEENHANT',994756825,'JAYANAGR','BENGALURU','KARNATAKA',583001);

INSERT INTO DEPARTMENT VALUES(10,001,'COMP1','ADMINISTRATION','JAYANAGAR');
INSERT INTO DEPARTMENT VALUES(20,006,'COMP1','SALES','JAYANAGAR');
INSERT INTO DEPARTMENT VALUES(30,008,'COMP1','R D','JAYANAGAR');

=============================================================================================================================================
INSERT INTO EMPLOYEE VALUES(001,'SAGAR','M','H',10,'M',20000,'JAYANAGAR','BENGALURU','KARNATAKA',580001);
INSERT INTO EMPLOYEE VALUES(002,'VEDANTH','M','U',20,'M',11000,'KEMPEGOWDA ROAD','BENGALURU','KARNATAKA',580501);
INSERT INTO EMPLOYEE VALUES(003,'ABDUL','A','A',10,'M',40000,'J.P.PARK','BENGALURU','KARNATAKA',580021);
INSERT INTO EMPLOYEE VALUES(004,'ANUSHA','U','T',20,'F',10000,'ANJANAPURA','BENGALURU','KARNATAKA',586001);
INSERT INTO EMPLOYEE VALUES(005,'ARUN','M','N',30,'M',2000,'BEGUR','BENGALURU','KARNATAKA',585001);
INSERT INTO EMPLOYEE VALUES(006,'PRAMOD','R','A',20,'F',15000,'SARAKI','BENGALURU','KARNATAKA',583001);
INSERT INTO EMPLOYEE VALUES(007,'SUDEEP','W','T',10,'M',15000,'MADIWALA','BENGALURU','KARNATAKA',580301);
INSERT INTO EMPLOYEE VALUES(008,'SHREYA','M','K',30,'F',3000,'KARISANDA','BENGALURU','KARNATAKA',580021);
INSERT INTO EMPLOYEE VALUES(011,'HARISH','M','H',10,'M',20000,'JAYANAGAR','BENGALURU','KARNATAKA',580001);
INSERT INTO EMPLOYEE VALUES(012,'MOHAN','M','U',20,'M',6000,'KEMPEGOWDA ROAD','BENGALURU','KARNATAKA',580501);
INSERT INTO EMPLOYEE VALUES(013,'BALAJI','A','A',10,'M',6000,'J.P.PARK','BENGALURU','KARNATAKA',580021);
INSERT INTO EMPLOYEE VALUES(014,'SANGEETA','U','T',20,'F',15000,'ANJANAPURA','BENGALURU','KARNATAKA',586001);
INSERT INTO EMPLOYEE VALUES(015,'RAHIM','M','N',30,'M',5000,'BEGUR','BENGALURU','KARNATAKA',585001);
INSERT INTO EMPLOYEE VALUES(016,'SHANKAR','R','A',20,'M',15000,'SARAKI','BENGALURU','KARNATAKA',583001);
INSERT INTO EMPLOYEE VALUES(017,'VINAYAK','W','T',10,'M',15000,'MADIWALA','BENGALURU','KARNATAKA',580301);
INSERT INTO EMPLOYEE VALUES(018,'SHERYA','M','K',30,'F',5000,'JAYANAGAR','BENGALURU','KARNATAKA',580001);
INSERT INTO EMPLOYEE VALUES(019,'UMESH','G','C',10,'M',6000,'BTM LAYOUT','BENGALURU','KARNATAKA',585001);
INSERT INTO EMPLOYEE VALUES(020,'SATVIK','M','K',30,'M',9000,'JALAHALLI','BENGALURU','KARNATAKA',585051);



INSERT INTO DEPENDENT VALUES(001,'NAYANA','M','H','F','JAYANAGAR','BANGALORU','KARNATAKA',580001);
INSERT INTO DEPENDENT VALUES(001,'JAYASHREE','M','H','F','JAYANAGAR','BANGALORU','KARNATAKA',580001);
INSERT INTO DEPENDENT VALUES(001,'RAHUL','M','H','M','JAYANAGAR','BANGALORU','KARNATAKA',580001);
INSERT INTO DEPENDENT VALUES(002,'JAGADISH','M','U','M','KEMPEGOWDA ROAD','BANGALORU','KARNATAKA',580501);
INSERT INTO DEPENDENT VALUES(002,'ESHWARI','M','U','F','KEMPEGOWDA ROAD','BANGALORU','KARNATAKA',580501);
INSERT INTO DEPENDENT VALUES(002,'HEMANT','M','U','M','KEMPEGOWDA ROAD','BANGALORU','KARNATAKA',580501);
INSERT INTO DEPENDENT VALUES(002,'VRUSHAB','M','U','M','KEMPEGOWDA ROAD','BANGALORU','KARNATAKA',580501);
INSERT INTO DEPENDENT VALUES(003,'AMISHA','A','A','F','J.P.PARK','BANGALORU','KARNATAKA',580021);
INSERT INTO DEPENDENT VALUES(003,'BALU','A','A','M','J.P.PARK','BANGALORU','KARNATAKA',580021);
INSERT INTO DEPENDENT VALUES(004,'SANGMESH','U','T','M','ANJANAPURA','BANGALORU','KARNATAKA',586001);
INSERT INTO DEPENDENT VALUES(005,'SABA','M','N','F','BEGUR','BANGALORU','KARNATAKA',585001);
INSERT INTO DEPENDENT VALUES(005,'AISHA','M','N','F','BEGUR','BANGALORU','KARNATAKA',585001);
INSERT INTO DEPENDENT VALUES(006,'VAISHNAVI','R','A','F','SARAKI','BANGALORU','KARNATAKA',583001);
INSERT INTO DEPENDENT VALUES(007,'DEEPA','W','T','F','MADIWALA','BANGALORU','KARNATAKA',580301);
INSERT INTO DEPENDENT VALUES(007,'SHRI','W','T','F','MADIWALA','BANGALORU','KARNATAKA',580301);
INSERT INTO DEPENDENT VALUES(008,'GANESH','G','C','M','BTM LAYOUT','BANGALORU','KARNATAKA',585001);
INSERT INTO DEPENDENT VALUES(011,'SATVIK','M','K','M','JALAHALLI','BANGALORU','KARNATAKA',585051);
INSERT INTO DEPENDENT VALUES(011,'ANIL','V','H','M','BANASWADI','BANGALORU','KARNATAKA',586001);
INSERT INTO DEPENDENT VALUES(012,'MEGHA','M','B','F','KUMARSWAMI LAYOUT','BANGALORU','KARNATAKA',582001);
INSERT INTO DEPENDENT VALUES(012,'SEEMA','M','B','F','KUMARSWAMI LAYOUT','BANGALORU','KARNATAKA',582001);
INSERT INTO DEPENDENT VALUES(013,'AMIT','A','C','M','SANGAY NAGR','BANGALORU','KARNATAKA',583001);
INSERT INTO DEPENDENT VALUES(014,'TANESH','D','A','M','NAGAVAR','BANGALORU','KARNATAKA',582001);
INSERT INTO DEPENDENT VALUES(015,'JAYA','F','T','M','MADIWALA','BANGALORU','KARNATAKA',580301);





INSERT INTO CUSTOMER VALUES('C1','AXON',9975647821,'ANANDNAGAR','BADAMI','KARNATAKA',587201);
INSERT INTO CUSTOMER VALUES('C2','KLE',9124878571,'VIDYANAGAR','HUBLI','KARNATAKA',580031);
INSERT INTO CUSTOMER VALUES('C3','ORIlAME',7945798468,'HAZRATGANJ','LUCKNOW','UTTAR PRADESH',587381);
INSERT INTO CUSTOMER VALUES('C4','SOLAR',7815496855,'BANNERGHATTTA','BENGALURU','KARNATAKA',560076);
INSERT INTO CUSTOMER VALUES('C5','GESCL',7168468795,'TEKARA','AHMEDABAD','GUJARAT',380008);
INSERT INTO CUSTOMER VALUES('C6','SHARDA CROPCHEM',7892587456,'ANDHRI','MUMBAI','MAHARASTRA',400053);
INSERT INTO CUSTOMER VALUES('C11','UNICHEM',9475687131,'MAMOOR','CHENNAI','TAMIL NADU',600003);
INSERT INTO CUSTOMER VALUES('C12','LAKSHMI VILAS BANK',7545647821,'AMARTH ADAN','MUMBAI','MAHARASTRA',400080);
INSERT INTO CUSTOMER VALUES('C13','UFLEX',9975472321,'KOTHRUD','PUNE','MAHARASTRA',400021);
INSERT INTO CUSTOMER VALUES('C14','CLUB MAHINDRA',7875647821,'PURANIMANDI','AGRA','UTTAR PRADESH',282002);
INSERT INTO CUSTOMER VALUES('C15','NATCO',7775647825,'GOMINAGAR','LUCKNOW','UTTAR PRADESH',226010);
INSERT INTO CUSTOMER VALUES('C16','TATA SPONGE',9885648621,'VASUNDARA NAGAR','GHAZIABAD','UTTAR PRADESH',201012);
INSERT INTO CUSTOMER VALUES('C17','POLARIS',9975647821,'MUGAPPAIR','CHENNAI','TAMIL NADU',400015);
INSERT INTO CUSTOMER VALUES('C18','INFOEDGE',9974758234,'JEE RAOD','KOLKATTA','WEST BENGAL',557326);
INSERT INTO CUSTOMER VALUES('C19','J.B.CHEMICALS',9975600041,'ANDERI','MUMBAI','MAHARASTRA',400053);
INSERT INTO CUSTOMER VALUES('C20','McLEOD',7660056457,'VIHARI','DELHI','DELHI',110015);
INSERT INTO CUSTOMER VALUES('C21','PROTEUS',7661050457,'JAYANAGAR','BENGALURU','KARNATAKA',580001);
INSERT INTO CUSTOMER VALUES('C22','SAP',7660156450,'JAYANAGAR','BENGALURU','KARNATAKA',580001);





INSERT INTO ORDER_DETAILS VALUES('O01','C1','FRUITS',0,15000,'24 SEP 2019','24 SEP 2019','WHITEFIELD','ANANDNAGAR',330);
INSERT INTO ORDER_DETAILS VALUES('O02','C5','VEGETABLES',0,1000,'21 DEC 2019','21 DEC 2019','PEENYA','AHMEDABAD',445);
INSERT INTO ORDER_DETAILS VALUES('O03','C1','FRUITS',0,6000,'24 SEP 2019','14 OCT 2019','ANANDNAGAR','MYSORE',620);
INSERT INTO ORDER_DETAILS VALUES('O04','C2','FURNITURE',0,8000,'24 SEP 2019','26 SEP 2019','VIDYANAGAR','MYSORE',440);
INSERT INTO ORDER_DETAILS VALUES('O05','C1','ELECTRONIC',0,7000,'01 JAN 2019','02 JAN 2019','YASHWANTPUR','ANANDNAGAR',340);
INSERT INTO ORDER_DETAILS VALUES('O06','C3','VEGETABLES',0,5000,'06 MAY 2019','26 MAY 2019','YASHWANTPUR','LUCKNOW',550);
INSERT INTO ORDER_DETAILS VALUES('O07','C2','FRUITS',0,10000,'24 SEP 2019','24 SEP 2019','VIDYANAGAR','TUMKUR',460);
INSERT INTO ORDER_DETAILS VALUES('O08','C2','FURNITURE',0,56000,'02 FEB 2019','04 FEB 2019','YASHWANTPUR','VIDYANAGAR',540);
INSERT INTO ORDER_DETAILS VALUES('O09','C4','FRUITS',0,4000,'06 MAY 2019','06 MAY 2019','BANNERGHATTTA','KORAMANGALA',40);
INSERT INTO ORDER_DETAILS VALUES('O10','C1','ELECTRONIC',0,20000,'08 APR 2019','09 APR 2019','VIJAYNAGAR','ANANDNAGAR',200);
INSERT INTO ORDER_DETAILS VALUES('O11','C1','VEGETABLES',0,40000,'06 MAY 2019','08 MAY 2019','ANANDNAGAR','VIJAYNAGAR',200);
INSERT INTO ORDER_DETAILS VALUES('O12','C2','ELECTRONIC',0,2000,'28 FEB 2020','29 FEB 2020','VIDYANAGAR','MYSORE',540);
INSERT INTO ORDER_DETAILS VALUES('O13','C6','FRUITS',0,25000,'06 MAY 2019','07 MAY 2019','WHITEFIELD','MUMBAI',980);
INSERT INTO ORDER_DETAILS VALUES('O21','C11','FRUITS',0,6000,'24 SEP 2019','26 SEP 2019','CHENNAI','BENGALURU',30);
INSERT INTO ORDER_DETAILS VALUES('O22','C15','VEGETABLES',0,4500,'21 DEC 2019','25 DEC 2019','LUCKNOW','BENGALURU',45);
INSERT INTO ORDER_DETAILS VALUES('O23','C19','FRUITS',0,10000,'14 OCT 2019','17 OCT 2019','MUMBAI','MYSORE',120);
INSERT INTO ORDER_DETAILS VALUES('O24','C20','FURNITURE',0,17000,'25 SEP 2019','27 SEP 2019','DELHI','MUMBAI',140);
INSERT INTO ORDER_DETAILS VALUES('O25','C11','ELECTRONIC',0,7000,'01 JAN 2019','03 JAN 2019','CHENNAI','HYDERABAD',120);
INSERT INTO ORDER_DETAILS VALUES('O26','C13','VEGETABLES',0,3000,'26 MAY 2019','26 MAY 2019','PUNE','MUMBAI',50);
INSERT INTO ORDER_DETAILS VALUES('O27','C14','FRUITS',0,2000,'24 SEP 2019','24 SEP 2019','AGRA','LUCKNOW',30);
INSERT INTO ORDER_DETAILS VALUES('O28','C12','FURNITURE',0,21000,'02 FEB 2019','04 FEB 2019','MUMBAI','HUBLI',80);
INSERT INTO ORDER_DETAILS VALUES('O29','C14','FRUITS',0,10000,'06 MAY 2019','06 MAY 2019','AGRA','LUCKNOW',30);
INSERT INTO ORDER_DETAILS VALUES('O30','C18','ELECTRONIC',0,15000,'08 APR 2019','11 APR 2019','KOLKATTA','HYDERABAD',200);
INSERT INTO ORDER_DETAILS VALUES('O31','C16','VEGETABLES',0,5000,'30 JUNE 2019','30 JUNE 2019','GHAZIABAD','AGRA',40);
INSERT INTO ORDER_DETAILS VALUES('O32','C17','ELECTRONIC',0,5000,'27 FEB 2020','29 FEB 2020','CHENNAI','BENGALURU',140);
INSERT INTO ORDER_DETAILS VALUES('O33','C11','FRUNITURE',0,15000,'10 MAR 2020','13 MAR 2020','CHENNAI','BENGALURU',140);
INSERT INTO ORDER_DETAILS VALUES('O34','C15','ELECTRONIC',0,10000,'27 SEP 2019','30 SEP 2019','LUCKNOW','HUBLI',400);
INSERT INTO ORDER_DETAILS VALUES('O35','C14','VEGETABLES',0,3000,'11 AUG 2019','12 AUG 2019','BENGALURU','HUBLI',405);
INSERT INTO ORDER_DETAILS VALUES('O36','C11','FRUITS',0,5000,'07 JULY 2019','07 JULY 2019','HYDERABAD','HUBLI',380);
INSERT INTO ORDER_DETAILS VALUES('O37','C12','ELECTRONICS',0,4000,'08 JULY 2019','08 JULY 2019','MUMBAI','BENGALURU',450);
INSERT INTO ORDER_DETAILS VALUES('O38','C12','FRUITS',0,9800,'31 JAN 2019','01 FEB 2019','AGRA','MUMBAI',80);
INSERT INTO ORDER_DETAILS VALUES('O39','C13','FURNITURE',0,4700,'24 SEP 2019','25 SEP 2019','BENGALURU','HUBLI',120);
INSERT INTO ORDER_DETAILS VALUES('O40','C14','VEGETABLES',0,16000,'26 NOV 2019','26 NOV 2019','HYDERABAD','CHENNAI',70);



INSERT INTO VEHICLE VALUES('VEC31','ASHOK LAYLAND','SEMI-TRAILER','800KG');
INSERT INTO VEHICLE VALUES('VEC32','TOYOTA','TANK','10000L');
INSERT INTO VEHICLE VALUES('VEC33','FORD','FLAT BED','600KG');
INSERT INTO VEHICLE VALUES('VEC34','DOBGE','PANEL','600KG');
INSERT INTO VEHICLE VALUES('VEC35','TAHOE','SEMI-TRAILER','860KG');
INSERT INTO VEHICLE VALUES('VEC36','AVALANCHE','BOX','850KG');
INSERT INTO VEHICLE VALUES('VEC37','HONDA','MINIVAN','300 KG');
INSERT INTO VEHICLE VALUES('VEC38','DAKOTA','REFRIGERATOR','600KG');
INSERT INTO VEHICLE VALUES('VEC39','TACOMA','DUMP','300KG');
INSERT INTO VEHICLE VALUES('VEC40','CHEVROLET ','LUV','500KG');
INSERT INTO VEHICLE VALUES('VEC41','BLAZER','PANEL','600KG');
INSERT INTO VEHICLE VALUES('VEC42','ASHOK LAYLAND','SEMI-TRAILER','800KG');
INSERT INTO VEHICLE VALUES('VEC43','TOYOTA','TANK','10000L');
INSERT INTO VEHICLE VALUES('VEC44','FORD','FLAT BED','600KG');
INSERT INTO VEHICLE VALUES('VEC45','DOBGE','PANEL','600KG');
INSERT INTO VEHICLE VALUES('VEC46','TAHOE','SEMI-TRAILER','860KG');
INSERT INTO VEHICLE VALUES('VEC47','AVALANCHE','BOX','850KG');
INSERT INTO VEHICLE VALUES('VEC48','HONDA','MINIVAN','300 KG');
INSERT INTO VEHICLE VALUES('VEC49','DAKOTA','REFRIGERATOR','600KG');
INSERT INTO VEHICLE VALUES('VEC50','TACOMA','DUMP','300KG');
INSERT INTO VEHICLE VALUES('VEC51','CHEVROLET ','LUV','500KG');
INSERT INTO VEHICLE VALUES('VEC52','BLAZER','PANEL','600KG');
INSERT INTO VEHICLE VALUES('VEC53','ASHOK LAYLAND','SEMI-TRAILER','800KG');
INSERT INTO VEHICLE VALUES('VEC54','TOYOTA','TANK','10000L');
INSERT INTO VEHICLE VALUES('VEC55','FORD','FLAT BED','600KG');
INSERT INTO VEHICLE VALUES('VEC56','DOBGE','PANEL','600KG');
INSERT INTO VEHICLE VALUES('VEC57','TAHOE','SEMI-TRAILER','860KG');
INSERT INTO VEHICLE VALUES('VEC58','AVALANCHE','BOX','850KG');
INSERT INTO VEHICLE VALUES('VEC59','HONDA','MINIVAN','300 KG');
INSERT INTO VEHICLE VALUES('VEC60','DAKOTA','REFRIGERATOR','600KG');
INSERT INTO VEHICLE VALUES('VEC01','ASHOK LAYLAND','CARRIER','800KG');
INSERT INTO VEHICLE VALUES('VEC02','TOYOTA','LORRY','10000KG');
INSERT INTO VEHICLE VALUES('VEC03','FORD','LORRY','600KG');
INSERT INTO VEHICLE VALUES('VEC04','TOYOTA','PANEL','600KG');
INSERT INTO VEHICLE VALUES('VEC05','TACOMA','CARRIER','860KG');
INSERT INTO VEHICLE VALUES('VEC06','TOYOTA','LORRY','850KG');
INSERT INTO VEHICLE VALUES('VEC07','HONDA','MINIVAN','300KG');
INSERT INTO VEHICLE VALUES('VEC08','ASHOK LAYLAND','MINIVAN','600KG');
INSERT INTO VEHICLE VALUES('VEC09','TACOMA','MINIVAN','300KG');
INSERT INTO VEHICLE VALUES('VEC10','FORD ','LUV','500KG');
INSERT INTO VEHICLE VALUES('VEC11','FORD','CARRIER','600KG');
INSERT INTO VEHICLE VALUES('VEC12','ASHOK LAYLAND','CARRIER','800KG');
INSERT INTO VEHICLE VALUES('VEC13','TOYOTA','CARRIER','10000KG');
INSERT INTO VEHICLE VALUES('VEC14','FORD','LORRY','600KG');
INSERT INTO VEHICLE VALUES('VEC15','TOYOTA','CARRIER','600KG');
INSERT INTO VEHICLE VALUES('VEC16','TACOMA','CARRIER','860KG');
INSERT INTO VEHICLE VALUES('VEC17','TOYOTA','LORRY','850KG');
INSERT INTO VEHICLE VALUES('VEC18','HONDA','MINIVAN','300KG');
INSERT INTO VEHICLE VALUES('VEC19','ASHOK LAYLAND','MINIVAN','600KG');
INSERT INTO VEHICLE VALUES('VEC20','TACOMA','MINIVAN','300KG');


INSERT INTO HANDLES VALUES(002,'O01');
INSERT INTO HANDLES VALUES(004,'O02');
INSERT INTO HANDLES VALUES(001,'O03');
INSERT INTO HANDLES VALUES(001,'O04');
INSERT INTO HANDLES VALUES(002,'O05');
INSERT INTO HANDLES VALUES(006,'O06');
INSERT INTO HANDLES VALUES(002,'O07');
INSERT INTO HANDLES VALUES(002,'O08');
INSERT INTO HANDLES VALUES(001,'O09');
INSERT INTO HANDLES VALUES(001,'O10');
INSERT INTO HANDLES VALUES(002,'O11');
INSERT INTO HANDLES VALUES(004,'O12');
INSERT INTO HANDLES VALUES(006,'O13');
INSERT INTO HANDLES VALUES(007,'O01');
INSERT INTO HANDLES VALUES(008,'O01');
INSERT INTO HANDLES VALUES(004,'O01');
INSERT INTO HANDLES VALUES(004,'O04');
INSERT INTO HANDLES VALUES(005,'O04');
INSERT INTO HANDLES VALUES(005,'O04');
INSERT INTO HANDLES VALUES(007,'O04');
INSERT INTO HANDLES VALUES(007,'O11');
INSERT INTO HANDLES VALUES(012,'O21');
INSERT INTO HANDLES VALUES(014,'O22');
INSERT INTO HANDLES VALUES(011,'O23');
INSERT INTO HANDLES VALUES(015,'O24');
INSERT INTO HANDLES VALUES(012,'O25');
INSERT INTO HANDLES VALUES(016,'O26');
INSERT INTO HANDLES VALUES(012,'O27');
INSERT INTO HANDLES VALUES(020,'O28');
INSERT INTO HANDLES VALUES(013,'O29');
INSERT INTO HANDLES VALUES(013,'O30');
INSERT INTO HANDLES VALUES(020,'O31');
INSERT INTO HANDLES VALUES(018,'O32');
INSERT INTO HANDLES VALUES(016,'O33');
INSERT INTO HANDLES VALUES(019,'O34');
INSERT INTO HANDLES VALUES(017,'O35');
INSERT INTO HANDLES VALUES(014,'O36');
INSERT INTO HANDLES VALUES(017,'O37');
INSERT INTO HANDLES VALUES(016,'O38');
INSERT INTO HANDLES VALUES(011,'O39');
INSERT INTO HANDLES VALUES(017,'O40');



TRIGGER
drop trigger UPDATECOUNT;
drop trigger COUNTUP;

CREATE OR REPLACE TRIGGER COUNTUP
AFTER INSERT ON CONSISTS
FOR EACH ROW
BEGIN
 UPDATE ORDER_DETAILS 
 SET  TOT_VEHICLES = TOT_VEHICLES+1
 WHERE :NEW.ORDER_ID= ORDER_DETAILS.ORDER_ID;
END;



INSERT INTO CONSISTS VALUES('VEC01','O01');
INSERT INTO CONSISTS VALUES('VEC02','O02');
INSERT INTO CONSISTS VALUES('VEC03','O03');
INSERT INTO CONSISTS VALUES('VEC04','O04');
INSERT INTO CONSISTS VALUES('VEC05','O05');
INSERT INTO CONSISTS VALUES('VEC06','O06');
INSERT INTO CONSISTS VALUES('VEC07','O07');
INSERT INTO CONSISTS VALUES('VEC08','O08');
INSERT INTO CONSISTS VALUES('VEC09','OO9');
INSERT INTO CONSISTS VALUES('VEC10','O10');
INSERT INTO CONSISTS VALUES('VEC11','O11');
INSERT INTO CONSISTS VALUES('VEC12','O12');
INSERT INTO CONSISTS VALUES('VEC13','O12');
INSERT INTO CONSISTS VALUES('VEC14','O13');
INSERT INTO CONSISTS VALUES('VEC15','O13');
INSERT INTO CONSISTS VALUES('VEC16','O02');
INSERT INTO CONSISTS VALUES('VEC17','O06');
INSERT INTO CONSISTS VALUES('VEC18','O02');
INSERT INTO CONSISTS VALUES('VEC19','O02');
INSERT INTO CONSISTS VALUES('VEC20','O02');
INSERT INTO CONSISTS VALUES('VEC01','O04');
INSERT INTO CONSISTS VALUES('VEC02','O06');
INSERT INTO CONSISTS VALUES('VEC01','O04');
INSERT INTO CONSISTS VALUES('VEC02','O04');
INSERT INTO CONSISTS VALUES('VEC01','O04');
INSERT INTO CONSISTS VALUES('VEC02','O06');
INSERT INTO CONSISTS VALUES('VEC31','O21');
INSERT INTO CONSISTS VALUES('VEC32','O22');
INSERT INTO CONSISTS VALUES('VEC33','O23');
INSERT INTO CONSISTS VALUES('VEC34','O26');
INSERT INTO CONSISTS VALUES('VEC35','O27');
INSERT INTO CONSISTS VALUES('VEC36','O22');
INSERT INTO CONSISTS VALUES('VEC37','O28');
INSERT INTO CONSISTS VALUES('VEC38','O26');
INSERT INTO CONSISTS VALUES('VEC39','O25');
INSERT INTO CONSISTS VALUES('VEC40','O29');
INSERT INTO CONSISTS VALUES('VEC41','O36');
INSERT INTO CONSISTS VALUES('VEC42','O37');
INSERT INTO CONSISTS VALUES('VEC43','O26');
INSERT INTO CONSISTS VALUES('VEC44','O33');
INSERT INTO CONSISTS VALUES('VEC45','O23');
INSERT INTO CONSISTS VALUES('VEC46','O22');
INSERT INTO CONSISTS VALUES('VEC47','O38');
INSERT INTO CONSISTS VALUES('VEC48','O39');
INSERT INTO CONSISTS VALUES('VEC49','O37');
INSERT INTO CONSISTS VALUES('VEC50','O34');
INSERT INTO CONSISTS VALUES('VEC51','O26');
INSERT INTO CONSISTS VALUES('VEC52','O25');
INSERT INTO CONSISTS VALUES('VEC53','O27');
INSERT INTO CONSISTS VALUES('VEC54','O22');
INSERT INTO CONSISTS VALUES('VEC55','O21');
INSERT INTO CONSISTS VALUES('VEC56','O23');
INSERT INTO CONSISTS VALUES('VEC57','O37');
INSERT INTO CONSISTS VALUES('VEC58','O39');
INSERT INTO CONSISTS VALUES('VEC59','O30');
INSERT INTO CONSISTS VALUES('VEC60','O25');

update ORDER_DETAILS set PARCEL_MATERIAL='ELECTRONICS' where PARCEL_MATERIAL='ELECTRONIC';


===================================================================================================================================

==============================QUERIES==============================================


###DIFFERENT CLAUSES AND FUNCTIONS

1.To retrieve the client name having more than 2 order

select comp_name,count(*)
from customer,order_details
where comp_id = customer_id
group by comp_name,comp_id
having count(*)>2;

output:
COMP_NAME                        COUNT(*)
------------------------------ ----------
UNICHEM                                 4
LAKSHMI VILAS BANK                      3
CLUB MAHINDRA                           4
AXON                                    5
KLE                                     4


2.To retrieve the employees who manages more than 2 orders 

select fname,count(*)
from order_details o,employee,handles h
where hssn=ssn and h.order_id =  o.order_id
group by fname,ssn
having count(*)>2;

output:
FNAME                       COUNT(*)
------------------------- ----------
SUDEEP                             3
MOHAN                              3
VEDANTH                            5
VINAYAK                            3
ANUSHA                             4
SAGAR                              4
SHANKAR                            3


3.To retrieve the customer company name whose order contains more than 2 vehicles

select comp_name,count(*)
from customer c,order_details o,consists cs,vehicle v
where c.comp_id= o.customer_id and o.order_id = cs.order_id and cs.vehicleno = vehicle_no
group by comp_name,comp_id
having count(*)>2;

output:
COMP_NAME                        COUNT(*)
------------------------------ ----------
UNICHEM                                 7
NATCO                                   5
LAKSHMI VILAS BANK                      5
J.B.CHEMICALS                           3
CLUB MAHINDRA                           3
GESCL                                   6
UFLEX                                   6
ORIlAME                                 4
AXON                                    5
KLE                                     9


4.To retrieve the male employees whose salary is greater than average salary 

select e1.fname
from employee e1,employee e2
where e1.sex='M'
group by e1.fname,e1.ssn,e1.salary
having e1.salary>avg(e2.salary);

output:

FNAME
-------------------------
ABDUL
HARISH
SAGAR
VINAYAK
SUDEEP
SHANKAR



5.To retrieve the customer names along with total amount of order ordered by them
select comp_id,comp_name,sum(tot_amount) as total_amount
from customer,order_details
where customer_id = comp_id
group by comp_name,comp_id
order by total_amount;

output:


COMP_ID    COMP_NAME                      TOTAL_AMOUNT
---------- ------------------------------ ------------
C5         GESCL                                  1000
C4         SOLAR                                  4000
C3         ORIlAME                                5000
C16        TATA SPONGE                            5000
C17        POLARIS                                5000
C13        UFLEX                                  7700
C19        J.B.CHEMICALS                         10000
C15        NATCO                                 14500
C18        INFOEDGE                              15000
C20        McLEOD                                17000
C6         SHARDA CROPCHEM                       25000

COMP_ID    COMP_NAME                      TOTAL_AMOUNT
---------- ------------------------------ ------------
C14        CLUB MAHINDRA                         31000
C11        UNICHEM                               33000
C12        LAKSHMI VILAS BANK                    34800
C2         KLE                                   76000
C1         AXON                                  88000

6. To retrieve the total orders which are ordered at least a day prior to the actual day

select distinct comp_id, comp_name
from order_details,customer
where comp_id = customer_id and actual_date-ord_date >= 1;

output:
COMP_ID    COMP_NAME
---------- ------------------------------
C15        NATCO
C1         AXON
C2         KLE
C6         SHARDA CROPCHEM
C12        LAKSHMI VILAS BANK
C17        POLARIS
C20        McLEOD
C11        UNICHEM
C18        INFOEDGE
C13        UFLEX
C3         ORIlAME

COMP_ID    COMP_NAME
---------- ------------------------------
C19        J.B.CHEMICALS
C14        CLUB MAHINDRA


###MULTIPLE ROW NESTED QUERIES

1. To retrieve the employees who handles the order that transports fruits
select distinct *
from employee 
where ssn in(select h.hssn
             from handles h,order_details o
             where h.hssn=ssn and o.order_id = h.order_id and parcel_material = 'FRUITS');
             
output:
SSN	FNAME	MNAME	LNAME	DNO	SEX	SALARY	STREET	CITY	STATE_NAME	ZIPCODE
2	VEDANTH	M	U	20	M	11000	KEMPEGOWDA ROAD	BENGALURU	KARNATAKA	580501
4	ANUSHA	U	T	20	F	10000	ANJANAPURA	BENGALURU	KARNATAKA	586001
6	PRAMOD	R	A	20	F	15000	SARAKI	BENGALURU	KARNATAKA	583001
12	MOHAN	M	U	20	M	6000	KEMPEGOWDA ROAD	BENGALURU	KARNATAKA	580501
1	SAGAR	M	H	10	M	20000	JAYANAGAR	BENGALURU	KARNATAKA	580001
8	SHREYA	M	K	30	F	3000	KARISANDA	BENGALURU	KARNATAKA	580021
7	SUDEEP	W	T	10	M	15000	MADIWALA	BENGALURU	KARNATAKA	580301
11	HARISH	M	H	10	M	20000	JAYANAGAR	BENGALURU	KARNATAKA	580001
13	BALAJI	A	A	10	M	6000	J.P.PARK	BENGALURU	KARNATAKA	580021
14	SANGEETA	U	T	20	F	15000	ANJANAPURA	BENGALURU	KARNATAKA	586001
16	SHANKAR	R	A	20	M	15000	SARAKI	BENGALURU	KARNATAKA	583001


2. To retrieve the department details  whose employees has at most 11000 salary
select *from department
where dnum in(select e1.dno
               from employee e1,employee e2
               having max(e1.salary)<11000
               group by e1.salary,e1.ssn,e1.dno);


output:
DNUM	DMGR_SSN	REGNO	DNAME	D_LOCATION
30	8	COMP1	R D	JAYANAGAR
20	6	COMP1	SALES	JAYANAGAR
10	1	COMP1	ADMINISTRATION	JAYANAGAR

3.To retrieve the names of clients ,order id ,orderdate where more than 3 order is placed in a day.

select comp_name,order_id,ord_date
from customer,order_details
where comp_id = customer_id and ord_date in(select ord_date
                                             from order_details
                                             group by ord_date
                                             having count(*)>3);
output:
COMP_NAME                      ORDER_ID             ORD_DATE
------------------------------ -------------------- ---------
AXON                           O01                  24-SEP-19
AXON                           O03                  24-SEP-19
KLE                            O04                  24-SEP-19
KLE                            O07                  24-SEP-19
UNICHEM                        O21                  24-SEP-19
CLUB MAHINDRA                  O27                  24-SEP-19
UFLEX                          O39                  24-SEP-19
ORIlAME                        O06                  06-MAY-19
SOLAR                          O09                  06-MAY-19
AXON                           O11                  06-MAY-19
SHARDA CROPCHEM                O13                  06-MAY-19

COMP_NAME                      ORDER_ID             ORD_DATE
------------------------------ -------------------- ---------
CLUB MAHINDRA                  O29                  06-MAY-19



4.To retrieve all the vehicles number with actual date who transports fruits from 'WHITEFIELD'
select vehicle_no,actual_date
from order_details o,consists c,vehicle v
where o.order_id=c.order_id and vehicleno=vehicle_no and o.order_id in(select order_id 
                                                                        from order_details
                                                                        where source_loc='WHITEFIELD' and parcel_material='FRUITS' );

output:

VEHICLE_NO           ACTUAL_DA
-------------------- ---------
VEC01                24-SEP-19
VEC14                07-MAY-19
VEC15                07-MAY-19


5.To retrieve employee details who manages the order which contains either lorry or carrier
select fname ,count(*)
from employee e,handles h,order_details o,consists c
where e.ssn = h.hssn and h.order_id = o.order_id and o.order_id=c.order_id and c.vehicleno in(select vehicle_no
                                                                                                from vehicle
                                                                                                where type in ('LORRY','CARRIER'))
                                                                                                group by fname;

output:
FNAME                       COUNT(*)
------------------------- ----------
SAGAR                              5
SUDEEP                             6
ANUSHA                             9
VEDANTH                            3
PRAMOD                             6
ARUN                               8
SHREYA                             1



###correlated nested queries
1.To retrieve the manager details who have salary greater than average salary of all the managers
select *from employee
where ssn in(select ssn 
             from department 
             where ssn=dmgr_ssn and salary >(select avg(e1.salary)
                                              from employee e1,department 
                                              where e1.ssn=dmgr_ssn));

output:
SSN	FNAME	MNAME	LNAME	DNO	SEX	SALARY	STREET	CITY	STATE_NAME	ZIPCODE
1	SAGAR	M	H	10	M	20000	JAYANAGAR	BENGALURU	KARNATAKA	580001
6	PRAMOD	R	A	20	F	15000	SARAKI	BENGALURU	KARNATAKA	583001



2.To retrieve the second highest salary of the employee
select distinct salary
from employee e1
where 2=(select count(distinct salary)
         from employee e2
         where e1.salary <=e2.salary);

output:
    SALARY
----------
     20000
         
3.To retrieve the companies who orders that worth greater than average amount of all orders
select distinct comp_name
from customer,order_details o1
where comp_id=o1.customer_id and o1.order_id in (select o1.order_id
                                                from order_details o2
                                                having o1.tot_amount<avg(o2.tot_amount)
                                                group by o1.order_id, o1.tot_amount);

output:
COMP_NAME
------------------------------
GESCL
NATCO
UFLEX
CLUB MAHINDRA
LAKSHMI VILAS BANK
UNICHEM
J.B.CHEMICALS
POLARIS
SOLAR
TATA SPONGE
KLE

COMP_NAME
------------------------------
ORIlAME
AXON

                               
4.To retrieve the  employees name who all handles the order with maximum no. of vehicle
select distinct fname,o1.tot_vehicles
from employee,handles h,order_details o1
where ssn=hssn and o1.order_id = h.order_id  and o1.order_id = (select o1.order_id
                                                                from order_details o2
                                                                having o1.tot_vehicles=max(o2.tot_vehicles)
                                                                group by o1.order_id,o1.tot_vehicles);

output:
FNAME                     TOT_VEHICLES
------------------------- ------------
SUDEEP                               5
SAGAR                                5
ARUN                                 5
ANUSHA                               5


5.to retrieve order details which contains  vehicle with least capacity
select *from order_details o2
where o2.order_id in (select o.order_id
                   from order_details o,consists c,vehicle v1
                   where o.order_id = c.order_id and c.vehicleno =v1.vehicle_no and v1.vehicle_no in(select v1.vehicle_no
                                                                                                      from vehicle v2
                                                                                                      having v1.max_capacity=min(v2.max_capacity)
                                                                                                      group by v1.vehicle_no,v1.max_capacity));

output:
ORDER_ID	CUSTOMER_ID	PARCEL_MATERIAL	TOT_VEHICLES	TOT_AMOUNT	ORD_DATE	ACTUAL_DATE	SOURCE_LOC	DEST_LOC	DISTANCE
O02	C5	VEGETABLES	5	1000	21-DEC-19	21-DEC-19	PEENYA	AHMEDABAD	445
O04	C2	FURNITURE	5	8000	24-SEP-19	26-SEP-19	VIDYANAGAR	MYSORE	440
O06	C3	VEGETABLES	4	5000	06-MAY-19	26-MAY-19	YASHWANTPUR	LUCKNOW	550
O12	C2	ELECTRONICS	2	2000	28-FEB-20	29-FEB-20	VIDYANAGAR	MYSORE	540


###VIEWS
1.To retrieve the company which gives maximum amount of order
create or replace view amt as
select comp_id,comp_name,sum(tot_amount) as totalamt
from customer,order_details
where comp_id=customer_id
group by comp_id,comp_name;

select a1.comp_id,a1.comp_name ,a1.totalamt
from amt a1,amt a2
having max(a2.totalamt)=a1.totalamt
group by a1.comp_id,a1.comp_name ,a1.totalamt;

output:

COMP_ID    COMP_NAME                        TOTALAMT
---------- ------------------------------ ----------
C1         AXON                                88000


2.To retrieve the department which offers the least salary using
create or replace view least_sal
as select dnum,dname,min(salary) as least_salary
from employee,department
where dnum=dno
group by dnum,dname
order by least_salary asc;

select l1.dnum,l1.dname,l1.least_salary
from least_sal l1,least_sal l2
having min(l2.least_salary)=l1.least_salary
group by l1.dnum,l1.dname,l1.least_salary;
    or
select dnum,dname, least_salary
from least_sal
where rownum=1;

output:

      DNUM DNAME                LEAST_SALARY
---------- -------------------- ------------
        30 R D                          2000


3.To retrieve the employee who handles more  than 2 orders and works for  ADMINISTRATION department

create or replace view view2 as
select ssn,fname,dno ,count(*) as no_of_orders
from employee e,handles h
where e.ssn=h.hssn
group by fname,ssn,dno
having count(*)>2;

select ssn,fname , no_of_orders
from view2,department
where dno = dnum and dname = 'ADMINISTRATION';

output:
       SSN FNAME                     NO_OF_ORDERS
---------- ------------------------- ------------
        17 VINAYAK                              3
         7 SUDEEP                               3
         1 SAGAR                                4

4.To retrieve the customer details who totally ordered vehicle to travel more thann 5000 km and at least ordered once between '1-jan-19' and '15-aug-19'

create or replace view view4 as
select comp_name,customer_id,sum(distance) as tot_distance
from customer,order_details
where comp_id = customer_id
group by  customer_id,comp_name;

select distinct comp_name , tot_distance
from view4 v,order_details o
where v.customer_id = o.customer_id and tot_distance >500 and  ord_date between '1-jan-19' and '15-aug-19' ;

output:

COMP_NAME                      TOT_DISTANCE
------------------------------ ------------
UNICHEM                                 670
CLUB MAHINDRA                           535
AXON                                   1690
KLE                                    1980
ORIlAME                                 550
LAKSHMI VILAS BANK                      610
SHARDA CROPCHEM                         980


5.To retrieve the vehicles that travelled more than 400 km 

create or replace view view5 as
select vehicleno,sum(distance) as distance
from order_details o,consists c
where o.order_id=c.order_id
group by vehicleno;

select *from view5;

select *from view5
where distance >400
order by distance asc;

output:

VEHICLENO              DISTANCE
-------------------- ----------
VEC04                       440
VEC18                       445
VEC20                       445
VEC19                       445
VEC16                       445
VEC57                       450
VEC42                       450
VEC49                       450
VEC07                       460
VEC08                       540
VEC12                       540

VEHICLENO              DISTANCE
-------------------- ----------
VEC13                       540
VEC06                       550
VEC17                       550
VEC03                       620
VEC14                       980
VEC15                       980
VEC01                      1650
VEC02                      1985

###Arithmetic & Logical operators


1.To retrieve the client name having more than 2 order
select comp_name,count(*)
from customer,order_details
where comp_id = customer_id
group by comp_name,comp_id
having count(*)>2;

output:
COMP_NAME                        COUNT(*)
------------------------------ ----------
UNICHEM                                 4
LAKSHMI VILAS BANK                      3
CLUB MAHINDRA                           4
AXON                                    5
KLE                                     4


2.Display the employee name and the customer name from their respective tables for which employee zipcode and the customer zipcode are equal.
select fname , comp_name , e.zipcode
from employee e,customer c
where e.zipcode=c.zipcode;

output:

FNAME                     COMP_NAME                         ZIPCODE
------------------------- ------------------------------ ----------
SHERYA                    PROTEUS                            580001
HARISH                    PROTEUS                            580001
SAGAR                     PROTEUS                            580001
SHERYA                    SAP                                580001
HARISH                    SAP                                580001
SAGAR                     SAP                                580001


3.DISPLAY THE COUNT OF EMPLOYEES GETTING MORE THAN THE AVERAGE SALARY OF ALL THE EMPLOYEES

SELECT count(SSN)
FROM EMPLOYEE
WHERE  SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE)

output:
COUNT(SSN)
----------
         9

4.Find the day difference between the order date and the delivery date for all the orders placed.
SELECT ORDER_DETAILS.ORDER_ID,
       ORDER_DETAILS.ORD_DATE,
       ORDER_DETAILS.ACTUAL_DATE,
       (ORDER_DETAILS.ACTUAL_DATE - ORDER_DETAILS.ORD_DATE)
FROM ORDER_DETAILS;

output:
ORDER_ID	ORD_DATE	ACTUAL_DATE	(ORDER_DETAILS.ACTUAL_DATE-ORDER_DETAILS.ORD_DATE)
O01	24-SEP-19	24-SEP-19	0
O02	21-DEC-19	21-DEC-19	0
O03	24-SEP-19	14-OCT-19	20
O04	24-SEP-19	26-SEP-19	2
O05	01-JAN-19	02-JAN-19	1
O06	06-MAY-19	26-MAY-19	20
O07	24-SEP-19	24-SEP-19	0
O08	02-FEB-19	04-FEB-19	2
O09	06-MAY-19	06-MAY-19	0
O10	08-APR-19	09-APR-19	1
O11	06-MAY-19	08-MAY-19	2
O12	28-FEB-20	29-FEB-20	1
O13	06-MAY-19	07-MAY-19	1
O21	24-SEP-19	26-SEP-19	2
O22	21-DEC-19	25-DEC-19	4
O23	14-OCT-19	17-OCT-19	3
O24	25-SEP-19	27-SEP-19	2
O25	01-JAN-19	03-JAN-19	2
O26	26-MAY-19	26-MAY-19	0
O27	24-SEP-19	24-SEP-19	0
O28	02-FEB-19	04-FEB-19	2
O29	06-MAY-19	06-MAY-19	0
O30	08-APR-19	11-APR-19	3
O31	30-JUN-19	30-JUN-19	0
O32	27-FEB-20	29-FEB-20	2
O33	10-MAR-20	13-MAR-20	3
O34	27-SEP-19	30-SEP-19	3
O35	11-AUG-19	12-AUG-19	1
O36	07-JUL-19	07-JUL-19	0
O37	08-JUL-19	08-JUL-19	0
O38	31-JAN-19	01-FEB-19	1
O39	24-SEP-19	25-SEP-19	1
O40	26-NOV-19	26-NOV-19	0

5.Retrieve the order id for which the day difference between the order date and the delivery date is equal to or exceeds 3.
SELECT ORDER_DETAILS.ORDER_ID,(ORDER_DETAILS.ACTUAL_DATE - ORDER_DETAILS.ORD_DATE)
FROM ORDER_DETAILS
Where (ORDER_DETAILS.ACTUAL_DATE - ORDER_DETAILS.ORD_DATE)>=3;

output:

ORDER_ID             (ORDER_DETAILS.ACTUAL_DATE-ORDER_DETAILS.ORD_DATE)
-------------------- --------------------------------------------------
O03                                                                  20
O06                                                                  20
O22                                                                   4
O23                                                                   3
O30                                                                   3
O33                                                                   3
O34                                                                   3

6.retrieve customer id and customer name who have this contact no starting with '997'.
SELECT comp_id, comp_name 
FROM customer
WHERE contactno like '%997%';  

output:

COMP_ID    COMP_NAME
---------- ------------------------------
C1         AXON
C13        UFLEX
C17        POLARIS
C18        INFOEDGE
C19        J.B.CHEMICALS

###Multiple table join operations

1.Retrieve all EMPLOYEE names along with the ORDER_ID and PARCEL_MATERIAL they HANDEL.
SELECT FNAME,h.ORDER_ID,PARCEL_MATERIAL
FROM EMPLOYEE ,HANDLES h ,ORDER_DETAILS o
WHERE  SSN=HSSN AND o.ORDER_ID=h.ORDER_ID;

output:

FNAME                     ORDER_ID             PARCEL_MATERIAL
------------------------- -------------------- --------------------
SAGAR                     O01                  FRUITS
ANUSHA                    O01                  FRUITS
SHREYA                    O01                  FRUITS
SUDEEP                    O01                  FRUITS
VEDANTH                   O01                  FRUITS
ANUSHA                    O02                  VEGETABLES
SAGAR                     O03                  FRUITS
SUDEEP                    O04                  FURNITURE
ARUN                      O04                  FURNITURE
ARUN                      O04                  FURNITURE
ANUSHA                    O04                  FURNITURE

FNAME                     ORDER_ID             PARCEL_MATERIAL
------------------------- -------------------- --------------------
SAGAR                     O04                  FURNITURE
VEDANTH                   O05                  ELECTRONICS
PRAMOD                    O06                  VEGETABLES
VEDANTH                   O07                  FRUITS
VEDANTH                   O08                  FURNITURE
SAGAR                     O09                  FRUITS
SAGAR                     O10                  ELECTRONICS
SUDEEP                    O11                  VEGETABLES
VEDANTH                   O11                  VEGETABLES
ANUSHA                    O12                  ELECTRONICS
PRAMOD                    O13                  FRUITS

FNAME                     ORDER_ID             PARCEL_MATERIAL
------------------------- -------------------- --------------------
MOHAN                     O21                  FRUITS
SANGEETA                  O22                  VEGETABLES
HARISH                    O23                  FRUITS
RAHIM                     O24                  FURNITURE
MOHAN                     O25                  ELECTRONICS
SHANKAR                   O26                  VEGETABLES
MOHAN                     O27                  FRUITS
SATVIK                    O28                  FURNITURE
BALAJI                    O29                  FRUITS
BALAJI                    O30                  ELECTRONICS
SATVIK                    O31                  VEGETABLES

FNAME                     ORDER_ID             PARCEL_MATERIAL
------------------------- -------------------- --------------------
SHERYA                    O32                  ELECTRONICS
SHANKAR                   O33                  FRUNITURE
UMESH                     O34                  ELECTRONICS
VINAYAK                   O35                  VEGETABLES
SANGEETA                  O36                  FRUITS
VINAYAK                   O37                  ELECTRONICS
SHANKAR                   O38                  FRUITS
HARISH                    O39                  FURNITURE
VINAYAK                   O40                  VEGETABLES


2.DISPLAY THE VEHICLE DETAILS OF THE ORDER WHOSE ORDER NO IS OD22 IS BEING TRANSPORTED.
SELECT VEHICLE_NO , MODEL , TYPE 
FROM VEHICLE , CONSISTS
WHERE VEHICLENO=VEHICLE_NO AND ORDER_ID='O22';

output:
VEHICLE_NO           MODEL                TYPE
-------------------- -------------------- --------------------
VEC32                TOYOTA               TANK
VEC36                AVALANCHE            BOX
VEC46                TAHOE                SEMI-TRAILER
VEC54                TOYOTA               TANK

3.Fetch the ORDER DETAILS which is HANDELED by EMPLOYEES LIVING IN locality pincode as ‘580001’ and living at the locality named ‘JAYANAGAR’.
Select o.ORDER_ID,PARCEL_MATERIAL,fname
FROM handles h, EMPLOYEE,order_details o
WHERE SSN=HSSN and h.order_id =o.order_id
and ZIPCODE=580001 and STREET='JAYANAGAR';

output:
ORDER_ID             PARCEL_MATERIAL      FNAME
-------------------- -------------------- -------------------------
O01                  FRUITS               SAGAR
O03                  FRUITS               SAGAR
O04                  FURNITURE            SAGAR
O09                  FRUITS               SAGAR
O10                  ELECTRONICS          SAGAR
O23                  FRUITS               HARISH
O32                  ELECTRONICS          SHERYA
O39                  FURNITURE            HARISH

4.To retrieve the ORDER DETAILS OF CUSTOMER WHOSE COMP_ID IS 011
SELECT COMP_NAME,ORDER_ID,PARCEL_MATERIAL,TOT_AMOUNT,SOURCE_LOC,DEST_LOC
FROM ORDER_DETAILS , CUSTOMER
WHERE COMP_ID=CUSTOMER_ID AND CUSTOMER_ID='C11';

output:
COMP_NAME	ORDER_ID	PARCEL_MATERIAL	TOT_AMOUNT	SOURCE_LOC	DEST_LOC
UNICHEM	O21	FRUITS	6000	CHENNAI	BENGALURU
UNICHEM	O25	ELECTRONICS	7000	CHENNAI	HYDERABAD
UNICHEM	O33	FRUNITURE	15000	CHENNAI	BENGALURU
UNICHEM	O36	FRUITS	5000	HYDERABAD	HUBLI

5.To retrieve the employee name who handles the least worth order

select fname
from employee e,handles h,order_details o1,order_details o2
where e.ssn=h.hssn and h.order_id = o1.order_id
having o1.tot_amount = min( o2.tot_amount )
group by fname,ssn,o1.tot_amount;

output:
FNAME
-------------------------
ANUSHA

********************************************************************************************************************************************************
###Single Row Nested query

1.DISPLAY THE ORDER DETAILS OF THE ORDER WHICH PAYS THE MAXIMUM TO THE TRANSFER OF THE PARCEL.
SELECT  COMP_NAME,ORDER_ID,PARCEL_MATERIAL,TOT_AMOUNT,SOURCE_LOC,DEST_LOC
FROM  ORDER_DETAILS , CUSTOMER
WHERE COMP_ID=CUSTOMER_ID AND TOT_AMOUNT = (SELECT MAX(TOT_AMOUNT) 
                                             FROM ORDER_DETAILS);

output:
COMP_NAME	ORDER_ID	PARCEL_MATERIAL	TOT_AMOUNT	SOURCE_LOC	DEST_LOC
KLE	O08	FURNITURE	56000	YASHWANTPUR	VIDYANAGAR

2.Display the order details of the order whose total amount is greater than the total amount of order whose order date is 14-oct-2019. 
SELECT order_id,tot_amount,ord_date,customer_id
FROM order_details
WHERE tot_amount>
(SELECT AVG(tot_amount)
FROM order_details
WHERE ord_date='14-oct-2019');

output:
ORDER_ID             TOT_AMOUNT ORD_DATE  CUSTOMER_ID
-------------------- ---------- --------- --------------------
O08                       56000 02-FEB-19 C2
O10                       20000 08-APR-19 C1
O11                       40000 06-MAY-19 C1
O13                       25000 06-MAY-19 C6
O24                       17000 25-SEP-19 C20
O28                       21000 02-FEB-19 C12
O30                       15000 08-APR-19 C18
O33                       15000 10-MAR-20 C11
O40                       16000 26-NOV-19 C14

3.Retrieve the number of orders the employee '017' handles along with average amount he getsfrom the orders.

SELECT AVG(tot_amount),COUNT(h.order_id),hssn
FROM order_details o,handles h
where o.order_id = h.order_id
GROUP BY hssn
HAVING AVG(tot_amount)=
(SELECT AVG(tot_amount) 
FROM  order_details o,handles h
where o.order_id = h.order_id and hssn= 017);

output:

AVG(TOT_AMOUNT) COUNT(H.ORDER_ID)       HSSN
--------------- ----------------- ----------
     7666.66667                 3         17

4.Retrieve the customer details from the customer table whose name is 'NATCO'

SELECT comp_id, comp_name , contactno ,street , city , state_name , zipcode 
FROM customer
WHERE comp_id = 
(SELECT comp_id 
FROM customer
WHERE comp_name = 'NATCO');

output:
COMP_ID	COMP_NAME	CONTACTNO	STREET	CITY	STATE_NAME	ZIPCODE
C15	NATCO	7775647825	GOMINAGAR	LUCKNOW	UTTAR PRADESH	226010

 
