create database ecommerce;
use ecommerce;

create table supplier (
SUPP_ID int,
SUPP_NAME varchar(50) not null,
SUPP_CITY varchar(50) not null,
SUPP_PHONE varchar(50) not null, 
constraint sid_pk primary key(SUPP_ID)
);

create table customer (
CUS_ID int,
CUS_NAME varchar(20) not null,
CUS_PHONE varchar(10) not null,
CUS_CITY varchar(30) not null,
CUS_GENDER char, 
constraint cusid_pk primary key(CUS_ID)
);

create table category (
CAT_ID int,
CAT_NAME varchar(20) not null, 
constraint catid_pk primary key(CAT_ID)
);

create table product (
PRO_ID int,
PRO_NAME varchar(20) not null default "Dummy",
PRO_DESC varchar(60),
CAT_ID int, 
constraint prod_id_pk primary key (PRO_ID),
constraint catid_fk foreign key (CAT_ID) references category(CAT_ID)
);

create table supplier_pricing (
PRICING_ID int,
PRO_ID int,
SUPP_ID int,
SUPP_PRICE int default 0, 
constraint pricing_id_pk primary key(PRICING_ID),
constraint prod_id_fk foreign key (PRO_ID) references product(PRO_ID),
constraint supp_id_fk foreign key (SUPP_ID) references supplier(SUPP_ID)
);

create table order1 (
ORD_ID int,
ORD_AMOUNT int not null,
ORD_DATE date not null,
CUS_ID int,
PRICING_ID int,
constraint ord_id_pk primary key(ORD_ID),
constraint cus_id_fk foreign key (CUS_ID) references customer(CUS_ID),
constraint pricing_id_fk foreign key (PRICING_ID) references supplier_pricing(PRICING_ID)
);

create table rating (
RAT_ID int,
ORD_ID int,
RAT_RATSTARS int not null,
constraint rat_id_pk primary key(RAT_ID),
constraint ord_id_fk foreign key (ORD_ID) references order1(ORD_ID)
);

INSERT INTO supplier VALUES(1,'Rajesh Retails','Delhi','1234567890');
INSERT INTO supplier VALUES(2,'Appario Ltd.','Mumbai','2589631470');
INSERT INTO supplier VALUES(3,'Knome products','Banglore','9785462315');
INSERT INTO supplier VALUES(4,'Bansal Retails','Kochi','8975463285');
INSERT INTO supplier VALUES(5,'Mittal Ltd.','Lucknow','7898456532');

INSERT INTO customer VALUES(1,'AAKASH','9999999999','DELHI','M');
INSERT INTO customer VALUES(2,'AMAN','9785463215','NOIDA','M');
INSERT INTO customer VALUES(3,'NEHA','9999999999','MUMBAI','F');
INSERT INTO customer VALUES(4,'MEGHA','9994562399','KOLKATA','F');
INSERT INTO customer VALUES(5,'PULKIT','7895999999','LUCKNOW','M');

INSERT INTO category VALUES( 1,'BOOKS');
INSERT INTO category VALUES(2,'GAMES');
INSERT INTO category VALUES(3,'GROCERIES');
INSERT INTO category VALUES (4,'ELECTRONICS');
INSERT INTO category VALUES(5,'CLOTHES');

INSERT INTO product VALUES(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
INSERT INTO product VALUES(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
INSERT INTO product VALUES(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
INSERT INTO product VALUES(4,'OATS','Highly Nutritious from Nestle',3);
INSERT INTO product VALUES(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
INSERT INTO product VALUES(6,'MILK','1L Toned MIlk',3);
INSERT INTO product VALUES(7,'Boat EarPhones','1.5Meter long Dolby Atmos',4);
INSERT INTO product VALUES(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
INSERT INTO product VALUES(9,'Project IGI','compatible with windows 7 and above',2);
INSERT INTO product VALUES(10,'Hoodie','Black GUCCI for 13 yrs and above',5);
INSERT INTO product VALUES(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
INSERT INTO product VALUES(12,'Train Your Brain','By Shireen Stephen',1);

INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(2,3,5,30000);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

INSERT INTO order1 VALUES (101,1500,'2021-10-06',2,1);
INSERT INTO order1 VALUES(102,1000,'2021-10-12',3,5);
INSERT INTO order1 VALUES(103,30000,'2021-09-16',5,2);
INSERT INTO order1 VALUES(104,1500,'2021-10-05',1,1);
INSERT INTO order1 VALUES(105,3000,'2021-08-16',4,3);
INSERT INTO order1 VALUES(106,1450,'2021-08-18',1,9);
INSERT INTO order1 VALUES(107,789,'2021-09-01',3,7);
INSERT INTO order1 VALUES(108,780,'2021-09-07',5,6);
INSERT INTO order1 VALUES(109,3000,'2021-09-10',5,3);
INSERT INTO order1 VALUES(110,2500,'2021-09-10',2,4);
INSERT INTO order1 VALUES(111,1000,'2021-09-15',4,5);
INSERT INTO order1 VALUES(112,789,'2021-09-16',4,7);
INSERT INTO order1 VALUES(113,31000,'2021-09-16',1,8);
INSERT INTO order1 VALUES(114,1000,'2021-09-16',3,5);
INSERT INTO order1 VALUES(115,3000,'2021-09-16',5,3);
INSERT INTO order1 VALUES(116,99,'2021-09-17',2,14);

INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5);
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,0);

select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from 
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from 
(select order1.*, customer.cus_gender, customer.cus_name from order1 inner join customer where order1.cus_id=customer.cus_id having order1.ord_amount>=3000)
as t1  group by t1.cus_id) as t2 group by t2.cus_gender;

select product.pro_name, order1.* from order1, supplier_pricing, product 
where order1.cus_id=2 and 
order1.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;

select supplier.* from supplier where supplier.supp_id in 
	(select supp_id from supplier_pricing group by supp_id having 
	count(supp_id)>1) 
	group by supplier.supp_id;
    
select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join  
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

select product.pro_id,product.pro_name from order1 inner join 
supplier_pricing on supplier_pricing.pricing_id=order1.pricing_id inner join 
product on product.pro_id=supplier_pricing.pro_id where order1.ord_date>"2021-10-05";

select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';


/*Creation of a stored procedure*/
USE `ecommerce`;
DROP procedure IF EXISTS `proc`;

DELIMITER $$
USE `ecommerce`$$
CREATE PROCEDURE `proc` ()
BEGIN

select report.supp_id,report.supp_name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
    	WHEN report.Average >4 THEN 'Good Service'
    	WHEN report.Average >2 THEN 'Average Service'
    	ELSE 'Poor Service'
END AS Type_of_Service from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select order1.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from order1 inner join rating on rating.ord_id = order1.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) 
as test2 group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report ;

END$$

DELIMITER ;

call ecommerce.proc();

