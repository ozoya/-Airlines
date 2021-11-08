create database airlines;
use airlines;

-- Tables
create table customer(customer_id int ,first_name varchar(30),last_name varchar(30),gender varchar(7),age int,
phone_number varchar(20),email_address varchar(40),password varchar(50),primary key(customer_id) );

create table admin(admin_id int ,first_name varchar(30),last_name varchar(30),gender varchar(7),age int,
phone_number varchar(20),email_address varchar(40),password varchar(50),primary key(admin_id) );

create table destination(destination_id int,destination_name varchar(30),country varchar(30),
primary key(destination_id) );

create table fleet(fleet_number int,fleet_name varchar(20),primary key(fleet_number));
 

create table ticket(ticket_number int,customer_id int,flight_date date,departure_time time,arrival_time time,
destination_id int,fleet_number int,primary key(ticket_number),
foreign key(customer_id) references customer(customer_id),
foreign key(destination_id) references destination(destination_id),
foreign key(fleet_number) references fleet(fleet_number));

create table booking(booking_id int,customer_id int,admin_id int,ticket_number int,booking_date date,
sit_number int,travel_date date, primary key(booking_id),
foreign key(customer_id) references customer(customer_id),
foreign key(admin_id) references admin(admin_id),
foreign key(ticket_number) references ticket(ticket_number) );

create table payment(transaction_id int,transaction_date date,customer_id int,amount float,
primary key(transaction_id),
foreign key(customer_id) references customer(customer_id) );

create table report(report_id int,transaction_id int,booking_id int,report_date date,
primary key(report_id),foreign key(transaction_id) references payment(transaction_id),
foreign key(booking_id) references booking(booking_id) );
