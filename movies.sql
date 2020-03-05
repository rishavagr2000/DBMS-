create table ACTOR (Act_id integer primary key, Act_Name varchar(30), Act_Gender varchar(3));
desc ACTOR;
create table director(Dir_id integer primary key, Dir_Name varchar(30), Dir_Phone varchar(10));
desc director;
create table movies(Mov_id integer primary key, Mov_Title varchar(30), Mov_Year date, Mov_Lang varchar(10),Dir_id integer,foreign key(Dir_id) references director(Dir_id));
desc movies;
create table movie_cast(Act_id integer primary key, Mov_id integer, role varchar(10),foreign key(Mov_id) references movies(Mov_id));
desc movie_cast;
create table rating (Mov_id integer, Rev_Stars integer);
desc rating;
insert into actor values('&Act_id', '&Act_Name', '&Act_Gender');
commit;
select * from actor;
insert into director values('&Dir_id', '&Dir_Name', '&Dir_Phone');
commit;
select* from director;
insert into movies values('&Mov_id','&Mov_Title', '&Mov_Year', '&Mov_Lang', '&Dir_id');
commit;
select* from movies;
insert into movie_cast values('&Act_id','&Mov_id','&role');
commit;
select * from movie_cast;
insert into rating values('&Mov_id','&Rev_Stars');
commit;
select * from rating;

SELECT MOV_TITLE FROM MOVIES WHERE DIR_ID IN (SELECT DIR_ID FROM DIRECTOR WHERE
DIR_NAME = 'HITCHCOCK');

SELECT MOV_TITLE FROM MOVIES M, MOVIE_CAST MV WHERE M.MOV_ID=MV.MOV_ID AND
ACT_ID IN (SELECT ACT_ID FROM MOVIE_CAST GROUP BY ACT_ID HAVING COUNT (ACT_ID)>1)
GROUP BY MOV_TITLE HAVING COUNT (*)>1;

SELECT ACT_NAME, MOV_TITLE, MOV_YEAR FROM ACTOR A JOIN MOVIE_CAST C ON
A.ACT_ID=C.ACT_ID JOIN MOVIES M ON C.MOV_ID=M.MOV_ID WHERE M.MOV_YEAR NOT
BETWEEN 2000 AND 2015;

SELECT MOV_TITLE, MAX (REV_STARS) FROM MOVIES INNER JOIN RATING USING (MOV_ID) GROUP
BY MOV_TITLE HAVING MAX (REV_STARS)>0 ORDER BY MOV_TITLE; 

UPDATE RATING SET REV_STARS=5 WHERE MOV_ID IN (SELECT MOV_ID FROM MOVIES WHERE
DIR_ID IN (SELECT DIR_ID FROM DIRECTOR WHERE DIR_NAME = 'STEVEN SPIELBERG'));


