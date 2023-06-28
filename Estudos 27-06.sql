create table setor (
  nome varchar(50), 
  id_setor integer PRIMARY  key AUTOINCREMENT, 
  descricao varchar(15));
insert into  setor (nome, descricao)
VALUES ('Recursos Humanos', 'setor controle de pessoas');

INSERT INTO setor (nome, descricao)
VALUES ('Tecnologia', 'Setor de TI');

INSERT INTO setor (nome, descricao)
VALUES ('Administração', 'Setor de administração');

/*select *from Empresa;*/

/*tabela funcionarios*/
Create table dados(
  nome varchar(50), 
  idade int,
  salario double, 
  id_usuario integer PRIMARY KEY AUTOINCREMENT, 
  id_setor int, 
  CONSTRAINT fk_setor FOREIGN key (id_setor) REFERENCES Empresa (id_setor));
  /*
1-recursos humanos 
2-TI
3-ADM
*/
  insert into  dados (nome, idade, salario, id_setor)
  VALUES ('Matheus de Sousa pinho', 23, 12.000, 2),
         ('Bruno santos', 20, 4.000, 1), 
         ('Carla Marinno', 26, 10.000, 3), 
         ('Juliana Mores', 32, 12.000, 1);
         
 select *from dados;

delete from empresa 
where id_setor>3;

/*querys COM CASE THEN*/
select nome, id_usuario,salario, 
case when salario>= 10.000 then 'recebe mais' 
	when salario< 10.000 then 'recebe menos que 10k'
    else salario + 0
    end as recebeMais
    from dados


/*ATUALIZANDO OS SALARIOS COM CASE THEN*/
UPDATE dados set salario = 
       case 
           when id_setor = 1 then salario + 9000
           when id_setor = 2 then salario + 12000
           when id_setor = 3 then salario + 10000
       end;

select *from dados;

/*joins e junções de tabelas*/
SELECT a.id_usuario, a.nome , a.salario, b.nome, b.descricao
from dados a join setor b 
on a.id_setor = b.id_setor;

/*INNER JOIN- BOM POIS TRÁS APENAS OS DADOS QUE CORRESPONDEM A CONDIÇÃO PRÉ ESTABELCECIDA*/
