-- Q1
select e.nome as empregado, d.nome as dependente from empregado e join dependente d on e.id_empregado = d.id_empregado;


-- Q2
select e.nome as empregado, c.nome as cidade, f.nome as funcao from empregado e join cidade c on e.id_cidade = c.id_cidade left join funcao f on e.id_funcao = f.id_funcao;


-- Q3
select e.nome as empregado, c.nome as cidade from empregado e
join empregado_projeto ep on e.id_empregado = ep.id_empregado
join projeto p on ep.id_projeto = p.id_projeto
join cidade c on e.id_cidade = c.id_cidade
where p.nome = 'Site da Empresa' order by ep.data_cadastro; 


-- Q4
select d.nome as departamento , sum(f.salario) as salario_total from departamento d
join empregado e on d.id_departamento = e.id_departamento
join funcao f on e.id_funcao = f.id_funcao
where f.nome in ('Advogado', 'Administrador') group by d.nome;


-- Q5
select d.nome as departamento, count(e.id_empregado) as quantidade_empregados from departamento d
left join empregado e on d.id_departamento = e.id_departamento group by d.nome;


-- Q6
select c.nome as cidade, count(e.id_empregado) as quantidade_empregados from cidade c
join empregado e on c.id_cidade = e.id_cidade group by c.nome order by quantidade_empregados desc;


-- Q7 
select e.nome as empregado from empregado e
join departamento d on e.id_departamento = d.id_departamento
where e.id_cidade != d.id_cidade;
