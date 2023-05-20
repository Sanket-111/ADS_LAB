create user 'slave'@'10.40.16.56' identified by 'slave';
alter user 'slave'@'10.40.16.56' identified with mysql_native_password by 'slave';
grant all privileges on quiz.* to 'slave'@'10.40.16.56';
grant replication slave on *.* to 'slave'@'10.40.16.56';

select * from slave;
insert into slave values(12,'sanket');

update slave set name='somesh' where sid=12;

