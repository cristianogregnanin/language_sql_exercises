create database films;

create table attori(
id int auto_increment primary key,
nome varchar(30),
anno_di_nascita varchar(30),
nazionalita varchar(30)
);

create table recite(
attore_id int,
film_id int
);

create table films(
id int auto_increment primary key,
anno_di_produzione varchar(30),
nazionalita varchar(30),
regista varchar(30),
genere varchar(30),
titolo varchar(30)
);

create table proiezioni(
id int auto_increment primary key,
film_id int,
sala_id int,
incasso int,
data_proiezione datetime
);

create table sale(
id int auto_increment primary key,
posti int,
nome varchar(30),
citta varchar(30)
);

alter table recite add foreign key (attore_id) references attori(id);
alter table recite add foreign key (film_id) references films(id);

alter table proiezioni add foreign key (film_id) references films(id);
alter table proiezioni add foreign key (sala_id) references sale(id);

insert into sale (posti, nome, citta) values (156, 'sala1', 'Pisa');
insert into sale (posti, nome, citta) values (16, 'sala2', 'Pisa');
insert into sale (posti, nome, citta) values (164, 'sala3', 'Pisa');
insert into sale (posti, nome, citta) values (123, 'sala1', 'Ferrara');
insert into sale (posti, nome, citta) values (151, 'sala1', 'Bologna');

insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 1', '1986', 'italiana', 'fellini', 'storico');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 2', '1986', 'giapponse', 'fellini', 'fantascienza');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 3', '1990', 'francese', 'tinto bras', 'storico');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 4', '1996', 'italiana', 'fellini', 'fantascienza');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 5', '1966', 'inglese', 'tarantino', 'storico');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 6', '1936', 'italiana', 'fellini', 'fantascienza');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 7', '1976', 'spagnola', 'spielberg', 'fantascienza');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 8', '1989', 'italiana', 'fellini', 'storico');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('film 9', '1945', 'italiana', 'leone', 'storico');
insert into films (titolo, anno_di_produzione,nazionalita, regista, genere)
values ('Casablanca', '1945', 'italiana', 'leone', 'storico');

insert into proiezioni (film_id, sala_id, incasso, data_proiezione)
values (3, 2, 1000, '2004-12-25');
insert into proiezioni (film_id, sala_id, incasso, data_proiezione)
values (3, 2, 1000, '2004.12.25');
insert into proiezioni (film_id, sala_id, incasso, data_proiezione)
values (3, 2, 1000, '2017/12/25');
insert into proiezioni (film_id, sala_id, incasso, data_proiezione)
values (2, 1, 1000, '2004/12/25');

select titolo from films where regista = (select regista from films where titolo = 'Casablanca');

select films.titolo, films.genere from films, proiezioni where  proiezioni.film_id = films.id and data_proiezione = '2004-12-25';






