use sqlclass_db;

drop table if exists authors;
create table authors
	(author_id int not null,
	firstname varchar(20) not null,
	lastname varchar(20) not null,
	constraint pk_authors primary key(author_id)
	);
	
insert into authors (author_id, firstname, lastname)
values
(1, 'Paul', 'Deitel'),
(2, 'Harvey', 'Deitel'),
(3, 'Abbey', 'Deitel'),
(4, 'Dan', 'Quirk'),
(5, 'Michael', 'Morgano');

drop table if exists titles;
create table titles
	(isbn varchar(20) primary key not null,
	title varchar(100) not null, 
	edition_number int not null, 
	copyright varchar(4) not null
	);
	
insert into titles (isbn, title, edition_number, copyright)
values
('0132151006', 'Internet & World Wide Web How to Program', 5, '2012'),
('0133807800', 'Java How to Program', 10, '2015'),
('0132575655', 'Java How to Program, Late Objects Version', 10, '2015'),
('013299044X', 'C How to Program', 7, '2013'),
('0132990601', 'Simply Visual Basic 2010', 4, '2013'),
('0133406954', 'Visual Basic 2012 How to Program', 6, '2014'),
('0133379337', 'Visual C# 2012 How to Program', 5, '2014'),
('0136151574', 'Visual C++ How to Program', 2, '2008'),
('0133378713', 'C++ How to Program', 9, '2014'),
('0133764036', 'Android How to Program', 2, '2015'),
('0133570924', 'Android for Programmers: An App-Driven Approach, Volume 1', 2, '2014'),
('0132121360', 'Android for Programmers: An App-Driven Approach', 1, '2012');

drop table if exists author_isbn;
create table author_isbn
	(author_id int not null,
	isbn varchar(20) not null,
	foreign key(author_id) references authors(author_id),
	foreign key(isbn) references titles(isbn)
	);
	
insert into author_isbn (author_id, isbn)
values
(1, '0132151006'),
(2, '0132151006'),
(3, '0133807800'),
(1, '0132575655'),
(2, '013299044X'),
(1, '013299044X'),
(2, '0132575655'),
(1, '013299044X'), 
(2, '013299044X'),
(1, '0132990601'),
(2, '0132990601'),
(3, '0132990601'),
(1, '0133406954'),
(2, '0133406954'),
(3, '0133406954'),
(1, '0133379337'),
(2, '0133379337'),
(1, '0136151574'),
(2, '0136151574'),
(4, '0136151574'),
(1, '0133378713'),
(2, '0133378713'),
(1, '0133764036'),
(2, '0133764036'),
(3, '0133764036'),
(1, '0133570924'),
(2, '0133570924'),
(3, '0133570924'),
(1, '0132121360'),
(2, '0132121360'),
(3, '0132121360'),
(5, '0132121360');


# (1)
select title, edition_number, copyright from titles
where copyright >= '2013'
order by copyright desc;

# (2)
select author_id, firstname, lastname
from authors
where lastname like 'D%';

# (3)
select author_id, firstname, lastname
from authors
where position('o' in lastname) = 2;

# (4)
select author_id, firstname, lastname
from authors
order by lastname, firstname asc;

# (5)
select isbn, title, edition_number, copyright
from titles
where position('How to Program' in title) > 0
order by title asc;

# (6)
select a.firstname, a.lastname, ai.isbn
from authors as a
	inner join author_isbn as ai
	on a.author_id = ai.author_id
order by a.lastname, a.firstname asc;

# (7)
select ai.author_id, ai.isbn, t.title, t.edition_number, t.copyright
from author_isbn as ai
	inner join titles as t
	on ai.isbn = t.isbn
order by ai.isbn desc

# (8)
select a.firstname, a.lastname, t.title, ai.isbn, t.copyright
from authors as a
	inner join author_isbn as ai
	on a.author_id = ai.author_id
	inner join titles as t
	on ai.isbn = t.isbn
where lastname = 'Quirk';

# (9)
select a.firstname, a.lastname, t.title, ai.isbn, t.copyright
from authors as a
	inner join author_isbn as ai
	on a.author_id = ai.author_id
	inner join titles as t
	on ai.isbn = t.isbn
where (a.firstname = 'Paul' and a.lastname = 'Deitel') or (a.firstname = 'Harvey' and a.lastname = 'Deitel');

# (10)
select t.title, ai.isbn, t.copyright
from authors as a
	inner join author_isbn as ai
	on a.author_id = ai.author_id
	inner join titles as t
	on ai.isbn = t.isbn
where (a.firstname = 'Abbey' and a.lastname = 'Deitel')
intersect 
select t.title, ai.isbn, t.copyright
from authors as a
	inner join author_isbn as ai
	on a.author_id = ai.author_id
	inner join titles as t
	on ai.isbn = t.isbn
where (a.firstname = 'Harvey' and a.lastname = 'Deitel');
