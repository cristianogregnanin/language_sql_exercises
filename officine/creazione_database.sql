-- create database officina;

create table dipendenti(
id int auto_increment primary key,
indirizzo varchar(30),
anni int,
telefono varchar(30),
cf varchar(30),
officina_id int
);

create table officine(
id int auto_increment primary key,
nome varchar(30),
indirizzo varchar(30),
anno_fondazione int,
numero_dipendenti int,
propietario_id int
);

create table riparazioni(
id int auto_increment primary key,
dataora datetime,
nome varchar(30),
indirizzo varchar(30),
officina_id int,
veicolo_id int
);

create table consegne(
id int auto_increment primary key,
dataora datetime,
riparazione_id int
);

create table veicoli(
id int auto_increment primary key,
modello varchar(30),
tipologia varchar(30),
targa varchar(30),
immatricolazione datetime,
proprietario_id int
);

create table proprietari(
id int auto_increment primary key,
indirizzo varchar(30),
n_telefono varchar(30),
cf varchar(30)
);

alter table dipendenti add foreign key (officina_id) references officine(id);

alter table officine add foreign key (propietario_id) references proprietari(id);

alter table riparazioni add foreign key (officina_id) references officine(id);
alter table riparazioni add foreign key (veicolo_id) references veicoli(id);

alter table consegne add foreign key (riparazione_id) references riparazioni(id);
alter table veicoli add foreign key (proprietario_id) references proprietari(id);