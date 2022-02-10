create database DBAssignment;
use DBAssignment;
create table PASSENGER
 (Passenger_name varchar(20), 
  Category               varchar(20),
  Gender                 varchar(20),
  Boarding_City      varchar(20),
  Destination_City   varchar(20),
  Distance                int,
  Bus_Type             varchar(20)
);



create table PRICE
(
  Bus_Type   varchar(20),
  Distance    int,
  Price      int
          );
          
insert into passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into passenger values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into passenger values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into passenger values('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper');
insert into passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into passenger values('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper');
insert into passenger values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into price values('Sleeper',350,770);
insert into price values('Sleeper',500,1100);
insert into price values('Sleeper',600,1320);
insert into price values('Sleeper',700,1540);
insert into price values('Sleeper',1000,2200);
insert into price values('Sleeper',1200,2640);
insert into price values('Sleeper',350,434);
insert into price values('Sitting',500,620);
insert into price values('Sitting',500,620);
insert into price values('Sitting',600,744);
insert into price values('Sitting',700,868);
insert into price values('Sitting',1000,1240);
insert into price values('Sitting',1200,1488);
insert into price values('Sitting',1500,1860);

select min(Price) from PRICE where Bus_Type='Sleeper';

select Passenger_name from PASSENGER where Passenger_name like'S%';

select COUNT(CASE WHEN (Gender) = 'F' THEN 1 END)Female , COUNT(CASE WHEN (Gender) = 'M' THEN 1 END)Male FROM passenger WHERE Distance >=600;

select  PASSENGER.Passenger_name, PASSENGER.Boarding_City, PASSENGER.Destination_City, PASSENGER.Bus_Type, PRICE.Price from PASSENGER join PRICE where PASSENGER.Bus_Type= PRICE.Bus_Type and PASSENGER.Distance=PRICE.Distance;

select PASSENGER.Passenger_name, PRICE.Price from PASSENGER join PRICE  on (PASSENGER.Bus_Type= PRICE.Bus_Type and PASSENGER.Distance=PRICE.Distance) and PRICE.Distance=1000 and PRICE.Bus_Type='Sitting';

select PASSENGER.Passenger_name, PASSENGER.Boarding_city as Destination_city, PASSENGER.Destination_city as Boardng_city, PRICE.Bus_type, PRICE.Price FROM PASSENGER join PRICE on  PASSENGER.Distance = PRICE.Distance  WHERE Passenger_name = 'Pallavi' ;

select distinct(Distance) from PASSENGER order by Distance desc;

select Passenger_name, (Distance * 100/ (SELECT SUM(Distance) FROM passenger)) as Distance_in_Percentage FROM passenger ;

select Distance, Price,
CASE
WHEN Price>1000 THEN 'Expensive'
WHEN Price between 500 and 1000  THEN 'Average Cost'
ELSE 'Cheap'
END as Cost
From PRICE;





