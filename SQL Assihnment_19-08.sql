create table technology (
id int,
technology varchar(20));
insert into technology values (1,"SQL"),(1,"Tableau"),(1,"Datascience"),(2,"R"),(2,"PowerBI"),(1,"Python");
select * from technology; 

## Option 1
SELECT id
FROM technology
WHERE technology IN ('SQL', 'Python', 'Datascience')
GROUP BY id
HAVING COUNT(DISTINCT technology) = 3;

## Option 2
select id from technology where technology= 'SQL'
AND id in (select id from technology where technology = 'Python')
AND id in (select id from technology where technology = 'Datascience');

## Ecomerce website
create table product_info (
prod_id int,
product_name varchar(20),
primary key (prod_id));

insert into product_info values (1001,"Blog"),(1002,"Youtube"),(1003,"Education");
set SQL_SAFE_UPDATES = 0;
delete from product_info;
select * from product_info;
insert into product_info values (1001,"Blog"),(1002,"Youtube"),(1003,"Education"),(1004,"Facebook"),(1005,"Instagram");
create table product_info_likes (
user_id int,
prod_id int,
like_date date,
foreign key (prod_id) references product_info(prod_id));

insert into product_info_likes values (1,1001,"2023-08-19"),(2,1003,"2023-08-18");

select prod_id from product_info left join product_info_likes using (prod_id) where like_date is NULL;


