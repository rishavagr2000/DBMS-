create database supplierpart;
use supplierpart;


create table suppliers (sid integer primary key, sname varchar(20), city varchar(20));
create table parts (pid integer primary key, pname varchar(20), color varchar(20));
create table catalog(sid integer, pid integer, cost real,primary key(sid, pid), foreign key(sid) references SUPPLIERS(sid), foreign key(pid) references PARTS(pid));

insert into suppliers values(10001, 'Acme Widget','Bangalore');

insert into suppliers values(10002, 'Johns','Kolkata');

insert into suppliers values(10003, 'Vimal','Mumbai');

insert into suppliers values(10004, 'Reliance','Delhi');

insert into suppliers values(10005, 'Mahindra','Mumbai');

commit;

select* from suppliers;

insert into PARTS values(20001, 'Book','Red');

insert into PARTS values(20002, 'Pen','Red');

insert into PARTS values(20003, 'Pencil','Green');

insert into PARTS values(20004, 'Mobile','Green');

insert into PARTS values(20005, 'Charger','Black');

commit;

select* from parts;

insert into CATALOG values(10001, '20001','10');

insert into CATALOG values(10001, '20002','10');

insert into CATALOG values(10001, '20003','30');

insert into CATALOG values(10001, '20004','10');

insert into CATALOG values(10001, '20005','10');

insert into CATALOG values(10002, '20001','10');

insert into CATALOG values(10002, '20002','20');

insert into CATALOG values(10003, '20003','30');

insert into CATALOG values(10004, '20003','40');

commit;

select* from catalog;

(i)
SELECT DISTINCT P.pname FROM parts P, catalog C WHERE P.pid = C.pid;

(iii)
select distinct s.sname from suppliers s, CATALOG C, PARTS P WHERE P.color='Red' and C.pid=P.pid and C.sid=S.sid;

(iv)
select distinct p.pname from suppliers s,PARTS p,CATALOG c where s.sname='Acme Widget' and c.sid=s.sid;

(v)
SELECT DISTINCT C.sid FROM CATALOG C WHERE C.cost > ( SELECT AVG (C1.cost) FROM CATALOG C1 WHERE C1.pid = C.pid );

(vi)
SELECT P.pid, S.sname FROM PARTS P, suppliers S, CATALOG C WHERE C.pid = P.pid AND C.sid = S.sid AND C.cost = (SELECT MAX(C1.cost) FROM CATALOG C1 WHERE C1.pid = P.pid);

