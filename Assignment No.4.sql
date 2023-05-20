create database quiz;

create table student(
	prn varchar(14) primary key not null,
    name varchar(50) not null,
    pass varchar(15) not null,
    branch varchar(10) not null
);


create table teacher(
	t_id int primary key not null auto_increment,
    name varchar(50) not null,
    pass varchar(15) not null,
    dept varchar(10) not null
);

create table quiz(
	quiz_id int not null,
    quiz_timer int,
    q_id int not null auto_increment unique,
    question varchar(255) not null,
    opt_a varchar(255) not null,
    opt_b varchar(255) not null,
    opt_c varchar(255) not null,
    opt_d varchar(255) not null,
    answer char
);



create table takes_quiz(
	t_id int,
    quiz_id int,
    foreign key (t_id) references teacher(t_id)
);

create table result (
	prn varchar(14) not null,
    quiz_id int not null,
    marks int not null,
    out_of int not null
);




create table attempted_students (
	id int primary key auto_increment,
	prn varchar(14) not null,
    quiz_id int not null,
    ip_addr varchar(15) not null,
    country varchar(50) not null,
    region_name varchar(50),
    city varchar(50),
    isp varchar(255) not null,
    lat varchar(10) not null,
    lon varchar(10) not null,
    ts datetime default current_timestamp
);	

