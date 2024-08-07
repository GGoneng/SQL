use sqlclass_db;

drop table if exists string_tbl;
create table string_tbl
(char_fld char(30),
vchar_fld varchar(30),
text_fld text
);

insert into string_tbl (char_fld, vchar_fld, text_fld)
values ('This is char data',
		'This is varchar data',
		'This is text data');

select * from string_tbl;

# varchar 타입이여도 지정한 크기보다 긴 문자열 저장 시 오류
update string_tbl
set vchar_fld = 'This is a piece of extremely long varchar data';

select @@session.sql_mode;
set sql_mode = 'ansi';

select @@session.sql_mode;

update string_tbl
set vchar_fld = 'This is a piece of extremely long varchar data';

select vchar_fld from string_tbl; 


delete from string_tbl;

insert into string_tbl(char_fld, vchar_fld, text_fld)
values ('This string is 28 characters',
		'This string is 28 characters',
		'This string is 28 characters');
	
select length(char_fld) as char_length,
length(vchar_fld) as varchar_length,
length(text_fld) as text_length
from string_tbl;


# 인덱스 1부터 시작, 문자열을 찾을 수 없는 경우 0 반환
select position('characters' in vchar_fld)
from string_tbl;

# 시작 위치부터 문자열 검색
select locate('is', vchar_fld, 5)
from string_tbl;

select locate('is', vchar_fld, 1)
from string_tbl;


delete from string_tbl;

insert into string_tbl(vchar_fld)
values ('abcd'),
	   ('xyz'),
	   ('QRSTUV'),
	   ('qrstuv'),
	   ('12345');
	  
select vchar_fld from string_tbl order by vchar_fld;

select strcmp('12345', '12345') 12345_12345,
	   strcmp('abcd', 'xyz') abcd_xyz,
	   strcmp('abcd', 'QRSTUV') abcd_QRSTUV,
	   strcmp('qrstuv', 'QRSTUV') qrstuv_QRSTUV,
	   strcmp('12345', 'xyz') 12345_xyz,
	   strcmp('xyz', 'qrstuv') xyz_qrstuv;

use sakila;

select name, name like '%y' as ends_in_y
from category;

select name, name regexp 'y$' as ends_in_y
from category;

use sqlclass_db;
delete from string_tbl;

insert into string_tbl (text_fld)
values ('This string was 29 characters');

update string_tbl
set text_fld = concat(text_fld, ', but now it is longer');

select text_fld from string_tbl;

use sakila;

select concat(first_name, ' ', last_name, 
' has been a customer since ', date(create_date)) as cust_narrative
from customer;

select insert('goodbye world', 9, 0, 'cruel ') as string;
select insert('goodbye world', 1, 7, 'hello') as string;

select replace('goodbye world', 'goodbye', 'hello') as replace_str;
select substr('goodbye cruel world', 9, 5);

select ceil(72.445), floor(72.445);	 
select round(72.0909, 1), round(72.0909, 2), round(72.0909, 3);
select truncate(72.0956, 1), truncate(72.0956, 2), truncate(72.0956, 3);


select cast('2019-09-17 15:30:00' as datetime);
select cast('2019-09-17' as date) date_field,
	   cast('108:17:57' as time) time_field;
	   
select cast('20190917153000' as datetime);


select str_to_date('September 17, 2019', '%M %d, %Y') as return_date;

select str_to_date('04/30/2024', '%m/%d/%Y') as date1;
select str_to_date('01,5,2024', '%d,%m,%Y') as date2;
select str_to_date('15:35:00', '%H:%i:%s') as time1;	
