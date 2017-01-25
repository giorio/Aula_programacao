use cadastro;

select * from cursos;
select * from gafanhotos;


select * from cursos
order by nome;								/*Ordenar o Select*/

select * from cursos
order by nome desc;							/*desc = Ordem descendente; asc = Ascendente*/

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
where ano <= 2015							/*Aceita todos os operadores relacionais <, <=, <>, >=, >, !=(não igual), =*/
order by nome;

select nome, ano from cursos
where ano between 2014 and 2016
order by ano desc, nome;

select nome, descricao, ano from cursos
where ano in (2014, 2016, 2020)
order by ano;

select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30;
