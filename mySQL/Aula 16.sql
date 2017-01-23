use cadastro;

create table gafanhoto_assiste_curso (
	id int not null auto_increment,
	data date,
	idgafanhoto int,
	idcurso int,
	primary key (id),
	foreign key (idgafanhoto) references gafanhotos(id),
	foreign key (idcurso) references cursos(idcurso)
) default charset = utf8;

select * from gafanhoto_assiste_curso;
select * from gafanhotos;
select * from cursos;

insert into gafanhoto_assiste_curso values
(default,'2014-03-01','1','2'),
(default,'2016-11-20','62','1'),
(default,'2016-12-01','62','2'),
(default,'2016-12-15','62','6'),
(default,'2017-01-15','62','4'),
(default,'2017-01-15','62','9');

select g.nome, c.nome from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
join cursos c
on c.idcurso = a.idcurso
order by g.nome;