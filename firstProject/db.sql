show databases;  #데이터베이스 목록조회
create database testdb; #새로운 데이터베이스 생성
use testdb; #특정 데이터 베이스 사용선언
show tables; #테이블 목록 조회
create table users(
  id varchar(20) primary key,
  pw varchar(100) not null,
  name varchar(30) not null);
desc users;
select * from users;
insert into users values('user1', sha1('user1pw'), 'kim');
insert into users values('user2', sha1('user2pw'), 'park');
insert into users values('user3', sha1('user3pw'), 'hong');
insert into users values('hi', sha1('hipw'), 'youn'); 
insert into users values('h2', '1234', 'youn'); 
select * from users;

show databases;
use testdb;
show tables;
select * from testdb.users;
select name, id from testdb.users 
	where id = 'user1' and pw = sha1('userpw');    
update testdb.users set pw = sha1('newpw') where id = 'user1';
update testdb.users set name = 'abc' where id = 'user2';
update testdb.users set id = 'yjy' where id = 'hi';
delete from testdb.users where id = 'admin';
delete from testdb.users where id = 'user1';
delete from testdb.users where id = 'user2';
delete from testdb.users where id = 'user3';
delete from testdb.users where id = 'yjy';
update testdb.users set id = '30901' where id = 'h2';
select * from testdb.users;

# 방명록
# 제목, 내용, 작성일, 작성자
create table guestbook(
	no int auto_increment unique,
	title varchar(30) not null,
    contents text not null,
    date datetime not null,
    name varchar(20) not null
);
desc guestbook;

insert into guestbook values(1, 'test', '안녕하세요', now(), 'user1');
insert into guestbook (title, contents, date, name)
	values('hi', '반갑습니다', now(), 'user2'),
		('hi2', '잘 부탁드립니다', now(), 'user3');
delete from guestbook where no = 3;
delete from guestbook where no = 4;
update guestbook set title = 'hi2', contents = '왔다 갑니다', name = 'user3', no = 3 where no = 5;
update guestbook set title = 'hi3', contents = '안녕하세요', name = 'user4' where no = 6;
update guestbook set title = 'hi4', contents = '감사해요', name = 'happy1' where no = 7;
update guestbook set title = 'good night', contents = 'song', name = 'happy2' where no = 8;
insert into guestbook (title, contents, date, name) 
	values ('사랑합니다', '다시 만나요', now(), 'youn');
insert into guestbook values (4, '인사 드립니다', '번호 하나가 없는 것은 의도한 것임', now(), 'youn');
update guestbook set contents = '글 수정합니다' where no = 4;
select * from guestbook;