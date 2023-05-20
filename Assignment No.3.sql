create table time_slot(
	time_slot_id int unique,
    day_ varchar(10),
    start_time time,
    end_time time,
    primary key(time_slot_id, day_, start_time)
);

create table classroom(
	building varchar(20) unique,
    room_number int unique,
    capacity int,
    primary key(building, room_number)
);

create table department(
	dept_name varchar(20) unique,
    building varchar(20),
    budget decimal(10, 2),
    primary key(dept_name)
);

create table prereq(
	course_id varchar(6) unique,
    prereq_id int unique,
    primary key(course_id, prereq_id)
);

create table course(
	course_id varchar(20) unique,
    title varchar(20),
    dept_name varchar(20),
    credits int,
    primary key(course_id)
);

create table section (
	course_id varchar(6),
    sec_id varchar(6) unique,
    semester int unique,
    year_ int unique,
    building varchar(20),
    room_number int,
    time_slot_id int,
    primary key(course_id, sec_id, semester, year_),
	foreign key (course_id) references course (course_id),
    foreign key (building) references classroom (building),
	foreign key (room_number) references classroom (room_number),
    foreign key (time_slot_id) references time_slot(time_slot_id)
);

create table student(
	id int auto_increment,
    name_ varchar(30),
    dept_name varchar(20),
    tot_cred int,
    primary key(id),
    foreign key (dept_name) references department(dept_name)
);

create table instructor(
	id int auto_increment,
    name_ varchar(30),
    dept_name varchar(20),
    salary decimal(10, 2),
    primary key (id),
    foreign key (dept_name) references department(dept_name) 
);

create table teaches(
	id int,
    course_id varchar(6),
    sec_id varchar(6),
    semester int,
    year_ int,
    primary key(id, course_id, sec_id, semester, year_),
    foreign key (id) references instructor(id),
    foreign key (course_id) references section(course_id),
	foreign key (sec_id) references section(sec_id),
    foreign key (semester) references section(semester),
    foreign key (year_) references section(year_)
);

create table advisor(
	s_id int,
    i_id int,
    primary key(s_id),
    foreign key (s_id) references student(id),
    foreign key (i_id) references instructor(id)
);
create table takes(
	id int,
    course_id varchar(6),
    sec_id varchar(6),
    semester int,
    year_ int,
    grade varchar(2),
    primary key(id, course_id, sec_id, semester, year_),
	foreign key (id) references student(id),
    foreign key (course_id) references section(course_id),
	foreign key (sec_id) references section(sec_id),
    foreign key (semester) references section(semester),
    foreign key (year_) references section(year_)
);