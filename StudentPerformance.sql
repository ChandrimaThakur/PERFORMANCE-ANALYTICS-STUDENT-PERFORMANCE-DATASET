create database sqlfinalproject;
use sqlfinalproject;

create table studper
(
 gender varchar(10),
 race varchar(10),
 ped varchar(30),
 lunch varchar(20), 
 tpc varchar(20),
 mscore int,
 rscore int,
 wscore int
 );
 
 /*
 load data local infile 'C:\\Users\\Hp\\Desktop\\need\\database-sql\\sqlfinal\\StudentsPerformance.csv'
into table studper fields terminated by  ','
enclosed by '"' lines terminated by '\r\n' IGNORE 1 Rows;
*/

select gender,count(gender)
from studper
group by gender; /* gender-wise count*/

select race,count(race)
from studper
group by race
order by race; /* Race wise cpunt */

select race
     , count( case when gender='female'
                   then 1 end ) as Female
     , count( case when gender='male'
                   then 1 end ) as male
 from studper
group by race
order by race; /* number of male and female in each race*/

select gender,avg(mscore+rscore+wscore) As TOTALAVG
from studper
group by gender
order by race;/* gender-wise performance */

select avg(mscore),avg(rscore),avg(wscore)
from studper; /* Average score in  subjects maths,readingand writing -subject-wise performance*/

select race,avg(mscore) as MathScoravg,avg(rscore) as Readingscoreavg,avg(wscore) as WritingScoreavg,avg(mscore+rscore+wscore) as Totalavg
from studper
group by race
order by race;/* race wise average performance*/

select tpc,avg(mscore+rscore+wscore) as Totalavg
from studper
group by tpc;/*  test preparation course performance*/

select tpc,count(tpc)
from studper
group by tpc;/* count of Test preparation Course*/


select tpc,gender,count(tpc)
from studper
group by tpc,gender
order by tpc; /* gender-wise test preparation course classification*/

select race,tpc,count(tpc)
from studper
where tpc="completed"
group by race
order by race; /* race-wise count of people completed test preparation course*/


select ped,avg(mscore+rscore+wscore) As TOTALAVG
from studper
group by ped;/* parental education wise performance*/

select lunch,avg(mscore+rscore+wscore) as Totalavg
from studper
group by lunch; /* lunch-wise performance*/