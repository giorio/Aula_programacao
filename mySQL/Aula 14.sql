use cadastro;

desc cursos;

desc gafanhotos;

alter table gafanhotos
add column cursoprerido int;

alter table gafanhotos
change cursoprerido cursopreferido int;


alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

select * from gafanhotos;

update gafanhotos
set cursopreferido = '6'
where id = '1';

delete from cursos
where idcurso = '28';

select nome, cursopreferido from gafanhotos;

select nome, ano from cursos;

select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

/*comando 'as' serve para colocar um apelido na tabela*/
/*quando usar o 'join' usar comando 'on' para demosntrar a relação*/