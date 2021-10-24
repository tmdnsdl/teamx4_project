1. member 테이블 생성
drop table teamx4_member;
create table teamx4_member(
user_num varchar2(20) primary key, 
user_name varchar2(20), 
user_image varchar2(200),
user_email varchar2(30),
user_gender varchar2(10),
user_type number,
user_review_list varchar2(200),
user_like_list varchar2(200),
user_diningName varchar2(60),
user_diningAddr varchar2(100),
user_diningReg varchar2(100),
user_diningHp varchar2(30)
);
2. review 테이블 생성
- sql developer로 review_table 임포트(테이블명은 review로 지정)
3. restaurant 테이블 생성
- sql developer로 restaurant_table 임포트(테이블명은 restaurant로 지정)