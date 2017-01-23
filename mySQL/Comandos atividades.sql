use cadastro;

select * from cursos;
select * from gafanhotos;

desc cursos;

select * from cursos
order by nome;

select * from cursos
order by nome desc;

select nome, carga, ano from cursos
order by nome;

select ano, nome, carga from cursos
order by ano, nome;

select * from cursos
where ano = '2016'
order by nome;

select nome, descricao, carga from cursos
where ano = '2016'
order by nome;

select nome, descricao from cursos
where ano <= 2015
order by nome;

select nome, ano from cursos
where ano between 2014 and 2016
order by ano desc, nome;

select nome, descricao, ano from cursos
where ano in (2014, 2016, 2020)
order by ano;

select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30;

select * from cursos
where nome = 'PHP';

select * from cursos
where nome like 'P%';

select * from cursos
where nome like '%a';

select * from cursos
where nome not like '%A%';

update cursos set nome = 'POO' where idcurso ='9';

select * from cursos
where nome like	'PH%P';

select * from cursos
where nome like	'PH%P_';

select * from gafanhotos
where nome like '%Silva%';

select distinct carga from cursos;

select nacionalidade from gafanhotos;
select distinct nacionalidade from gafanhotos
order by nacionalidade;

select count(nome) from cursos;

select max(carga) from cursos;

select min(totaulas) from cursos where ano = '2016';

select sum(totaulas) from cursos where ano = '2016';

select avg(totaulas) from cursos where ano = '2016';

/*order by = Ordenar o Select; desc = Ordem descendente; asc = Ascendente*/
/*Aceita todos os operadores relacionais <, <=, <>, >=, >, !=(não igual), =*/
/*Like = Operador parecido - % Nenhum ou vários caractere(* do SAP)*/
/*_ - obriga ter um caractere onde está sinalizado*/
/*Função de agregação*/
/*count() conta a quantidade de registros considerando um criterio*/
/*Max() mostra o maior valor de um campo seguindo um criterio*/
/*min() mostra o menor valor de um campo seguindo um criterio*/
/*sun() - somatório*/
/*avg() - Média*/
/*having - commando de filtro possui ou tem uma condição no group by, obs. o campo do having tem que ser o mesmo usado no group by*/
/*Função de Agrupamento*/
/*group by - agrupa resultados iguais, utilizar o comando count() para contar a quantidade de registro*/


/*Atividades*/
select * from gafanhotos;
desc gafanhotos;
/*#1*/
select nome from gafanhotos
where sexo = 'F';
/*#2*/
select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31';
/*#3*/
select nome from gafanhotos
where sexo = 'M' and profissao = 'Programador';
/*#4*/
select * from gafanhotos
where nacionalidade = 'Brasil' and nome like 'J%';
/*#5*/
select nome, nacionalidade from gafanhotos
where nome like '%silva%'
and nacionalidade != 'Brasil'
and peso < 100;
/*#6*/
select max(altura) from gafanhotos
where sexo = 'M'
and nacionalidade = 'Brasil';
/*#7*/
select avg(peso) from gafanhotos;
/*#8*/
select min(peso) from gafanhotos
where sexo = 'F'
and nacionalidade <> 'Brasil'
and nascimento between '1990-01-01' and '2000-12-31';
/*#9*/
select count(nome) from gafanhotos
where sexo = 'F'and altura > 1.9;


/*Aula 13*/

use cadastro;

select carga from cursos
group by carga;

select carga, count(nome) from cursos
group by carga;

select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

select * from cursos
where totaulas = 12;

select carga, count(*) from cursos
where totaulas = 30
group by carga;

select ano, count(*) from cursos
group by ano
having count(ano) >= 5
order by count(*);

select ano, count(*) from cursos
where totaulas > 30
group by ano
having ano > 2013
order by count(*) desc;


select avg(carga) from cursos;

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);

/*Atividades da Aula 13*/

desc gafanhotos;

/*#1*/
select profissao, count(*) from gafanhotos
group by profissao
order by profissao;

/*#2*/
select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

/*#3*/ 
select nacionalidade, count(*) from gafanhotos
where nacionalidade not like 'Brasil'
group by nacionalidade
having count(nacionalidade) >= 3
order by nacionalidade desc;

/*#4*/
select altura, count(*) from gafanhotos
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos);

