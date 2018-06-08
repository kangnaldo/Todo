create table category(
	cano int primary key,
    caname varchar(50) not null
);
create table user (
	id varchar(50) primary key,
    name varchar(50) not null,
    password varchar(50) not null,
    email varchar(100) not null,
    addr varchar(255) not null
);
create table todo(
	todono int primary key auto_increment,
    id varchar(50) references user(id),
    todosubject varchar(50) not null,
    todocontent text,
    completion boolean default false,
    cano int references category(cano),
    createtododate timestamp default now(),
    todostartdate date not null,
    todoenddate date not null
);
select * from todo where id = 'kang';

insert into todo (id, todosubject,todocontent, cano, tododate) values('admin', 'd', 'dd', 2, date_format('2016-01-01', '%y-%m-%d'));
insert into category(cano, caname) values(1,'직장');
insert into category(cano, caname) values(2,'학업');
insert into category(cano, caname) values(3,'생활');

select * from category;
commit;
drop table user cascade;
drop table board;
drop table category;
drop table todo;
select * from todo;
select * from user;
select * from user where id = 'kang' AND password = '123';