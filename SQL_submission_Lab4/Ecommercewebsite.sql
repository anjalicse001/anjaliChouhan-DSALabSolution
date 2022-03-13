create database great_learning_codes;
Use great_learning_codes;
drop table Supplier;
drop table Customer;
create table Supplier(
SUPP_ID int ,
SUPP_NAME varchar(50),
SUPP_CITY varchar(50),
SUPP_PHONE bigint);
create table Customer(
CUS__ID int,
CUS_NAME varchar(50),
CUS_PHONE bigint,
CUS_CITY varchar(50),
CUS_GENDER char);
create table Category(
CAT_ID int ,
CAT_NAME varchar(50));
create table Product(
PRO_ID int,
PRO_NAME varchar(50),
PRO_DESC varchar(50),
CAT_ID int);
create table ProductDetails(
PROD_ID int,
PRO_ID int,
SUPP_ID int,
PRICE int);
create table Order_table(
ORD_ID int,
ORD_AMOUNT int,
ORD_DATE date,
CUS_ID int,
PROD_ID int);
create table Rating(
RAT_ID int,
CUS_ID int,
SUPP_ID int,
RAT_RATSTARS int);
insert into  Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
values (1,"Rajesh Retails","Delhi",1234567890),
	(2,"Appario Ltd.","Mumbai",2589631470),
(3,"Knome products","Banglore",9785462315),
(4,"Bansal Retails","Kochi",8975463285),
(5,"Mittal Ltd.","Lucknow",7898456532);
insert into Customer(CUS__ID ,CUS_NAME ,CUS_PHONE ,CUS_CITY ,CUS_GENDER )
values
(1,"AAKASH",9999999999,"DELHI",'M'),
(2,"AMAN",9785463215,"NOIDA",'M'),
(3,"NEHA",9999999999,"MUMBAI",'F'),
(4,"MEGHA",9994562399,"KOLKATA",'F'),
(5,"PULKIT",7895999999,"LUCKNOW",'M');
insert into Category(CAT_ID,CAT_NAME)
values
(1,"BOOKS"),
(2,"GAMES"),
(3,"GROCERIES"),
(4,"ELECTRONICS"),
(5,"CLOTHES");
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
values 
(1,"GTA V","DFJDJFDJFDJFDJFJF",2),
(2,"TSHIRT","DFDFJDFJDKFD",5),
(3,"ROG LAPTOP","DFNTTNTNTERND",4),
(4,"OATS","REURENTBTOTH",3),
(5,"HARRY POTTER","NBEMCTHTJTH",1);



insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)
values
(1,1,2,1500),
(2,3,5,30000),
(3,5,1,3000),
(4,2,3,2500),
(5,4,1,1000);

insert into Order_table(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)
values
(20,1500,'2021-10-12',3,5),
(25,30500,'2021-09-16',5,2),
(26,2000,'2021-10-05',1,1),
(30,3500,'2021-08-16',4,3),
(50,2000,'2021-10-06',2,1);

	insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)
 values    
 (1,2,2,4),
(2,3,4,3),
(3,5,1,5),
(4,1,3,2),
(5,4,5,4);
/*3)	Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.
*/
SELECT count(*),Customer.CUS_GENDER  
FROM Customer   
INNER JOIN Order_table  
ON Customer.CUS__ID = Order_table.CUS_ID where Order_table.ORD_AMOUNT >= 3000 group by Customer.CUS_GENDER;

/*4)	Display all the orders along with the product name ordered by a customer having Customer_Id=2.
*/
select Customer.CUS__ID,B.PRO_NAME ,B.PROD_ID from Customer Inner Join (select A.PRO_NAME,Order_table.CUS_ID,A.PROD_ID from Order_table
Inner join 
(select Product.PRO_ID,ProductDetails.PROD_ID,Product.PRO_NAME from Product inner join ProductDetails 
ON Product.PRO_ID=ProductDetails.PRO_ID) as A on Order_table.PROD_ID=A.PROD_ID) as B on Customer.CUS__ID=B.CUS_ID where Customer.CUS__ID=2 ;

/*5)	Display the Supplier details who can supply more than one product.
*/
select Supplier.SUPP_ID , Supplier.SUPP_NAME , Supplier.SUPP_CITY ,Supplier.SUPP_PHONE from 
 (select count(*) as abc , SUPP_ID from ProductDetails  group by SUPP_ID ) as B inner join Supplier on B.SUPP_ID=Supplier.SUPP_ID where B.abc>1;
 
 
/*6)	Find the category of the product whose order amount is minimum.
*/
select MIN(Order_table.ORD_AMOUNT),Order_table.PROD_ID,B.CAT_ID,B.CAT_NAME from Order_table inner join 
(select ProductDetails.PROD_ID , A.PRO_ID , A.CAT_ID , A.CAT_NAME from ProductDetails inner join 
(select Category.CAT_ID , Category.CAT_NAME , Product.PRO_ID from Category inner join Product on Category.CAT_ID=Product.CAT_ID) as A on ProductDetails.PRO_ID = A.PRO_ID) as B
on Order_table.PROD_ID=B.PROD_ID ;

/*7)	Display the Id and Name of the Product ordered after “2021-10-05”.
*/
select A.PROD_ID,A.PRO_NAME , Order_table.ORD_DATE from Order_table inner join
 (select Product.PRO_ID,Product.PRO_NAME ,ProductDetails.PROD_ID from Product inner join ProductDetails on Product.PRO_ID=ProductDetails.PRO_ID) as A on 
 Order_table.PROD_ID=A.PROD_ID where Order_table.ORD_DATE >= '2021-10-05' ; 
 
 /*	8)	Display customer name and gender whose names start or end with character 'A'.
 */
 select CUS_NAME,CUS_GENDER from Customer where CUS_NAME like 'A%' or CUS_NAME like '%A';
 
 /*9)	Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.
 */
 select Supplier.SUPP_NAME,Supplier.SUPP_ID ,Rating.RAT_RATSTARS,
 case
 when RAT_RATSTARS>4 then "Geniun Supplier"
 when RAT_RATSTARS>2 then "average supplier"
 else "Supplier should not be considered"
 end as Verdict
 from Supplier inner join Rating on Supplier.SUPP_ID=Rating.SUPP_ID ;
