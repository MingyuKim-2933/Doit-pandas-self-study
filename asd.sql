---------------------------------- customer 테이블 모든 행 출력 (SELECT)
select 
	* -- 모든 칼럼
from 
	CUSTOMER
;

---------------------------------- customer 테이블의 특정 칼럼만 출력
select --3
	A.FIRST_NAME, --4
	A.address_id,
	A.EMAIL
from --1
	CUSTOMER A--2 --테이블을 Alias 해준다. -- alias -> 코드의 가독성 -> SQL 성능 -- DBMS -> 옵티마이저 -> 최적화기 -> SQL -> 가장 빠르게, 가장 저비용, 실행 
;

---------------------------------- customer 테이블의 칼럼을 오름차순과 내림차순으로 정렬 (ORDER BY)
select
	a.first_name,
	a.last_name
from 
	customer a
order by
	first_name asc, -- 오름차순 --순차적
	last_name desc -- 내림차순 -- 역순 -- first_name이 같으면 last_name 역순으로 정렬한다.

--order by에 칼럼의 문자열을 적어주는 것이 유지보수적 측면과 가독성 측면에서 좋다.
	
---------------------------------- customer 테이블의 칼럼을 오름차순과 내림차순으로 정렬
select
	a.first_name,
	a.last_name
from 
	customer a
order by
	1 asc, -- 오름차순 --순차적 -- 1은 first_name
	2 desc -- 내림차순 -- 역순 -- first_name이 같으면 last_name 역순으로 정렬한다. --2는 last_name

---------------------------------- DISTINCT를 사용하면 중복 값을 제외한다.
drop table T1;
create table T1 (ID SERIAL not null primary key, BCOLOR VARCHAR, FCOLOR VARCHAR);

commit; -- 테이블 생성 -> DDL --> 치는 순간에 바로 적용

insert
	into T1 (BCOLOR, FCOLOR)
values
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue')
;

commit;

---------------------------------- 생성된 테이블 확인
select
	*
from 
	t1;

---------------------------------- distinct 사용, 칼럼 1개 (DISTINCT)
select 
	distinct bcolor
from 
	t1
order by
	bcolor --오름차순으로 정렬
;

---------------------------------- distinct 사용, 칼럼 2개
select 
	distinct bcolor, fcolor
from 
	t1
order by
	bcolor, fcolor 
;

---------------------------------- distinct on 사용(자주 사용되지는 않음)
select 
	distinct on (bcolor) bcolor, fcolor -- bcolor 기준 중복 제거된 값이 기준 집합이 됨
from 
	t1
order by
	bcolor, fcolor;
	
----------------------------------WHERE 절
select 
	last_name, --3
	first_name
from 
	customer --1
where
	first_name = 'Jamie' --2
;

----------------------------------WHERE 절에 AND를 사용하여 조건 추가
select
	last_name,
	first_name
from
	customer
where
	first_name = 'Jamie'
	and last_name = 'Rice' ;

-- DBeaver블럭 선택 후 ctrl + shift + F를 하면 자동 줄 맞춤을 실행한다. 	

----------------------------------WHERE 절에 OR을 사용하여 조건 추가
select
	customer_id,
	amount,
	payment_data
from
	payment
where
	amount <= 1
	or amount >= 8
