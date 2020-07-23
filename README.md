## Ambiente 

 Aplicação funciona com JRE8 e JRE9 no Apache Tomcat 7, 8, 9
 
## MySQL

O projeto usa MySQL e deve se chamar no banco `casadocodigo` (tem que alterar a senha do banco na classe `JPAConfiguration`). As tabelas são geradas automaticamente.

## URL e inicialização

Ao rodar no Eclipse pelo  Tomcat acesse: http://localhost:8080/casadocodigo

Ao acessar /login vai aparecer um fomulário de autenticação, usando os comandos sql abaixo você será capaz de fazer login com o usuário `admin@casadocodigo.com.br` e senha `123456`
	
## Segue uns comandos SQL para popular o banco

```
insert into Role values ('ROLE_ADMIN');
insert into Role values ('ROLE_USER');
insert into Role values ('ROLE_COMERCIAL');
insert into Usuario (email, nome, senha, confirmaSenha) values ('admin@casadocodigo.com.br', 'Administrador', '$2a$04$qP517gz1KNVEJUTCkUQCY.JzEoXzHFjLAhPQjrg5iP6Z/UmWjvUhq', '$2a$04$qP517gz1KNVEJUTCkUQCY.JzEoXzHFjLAhPQjrg5iP6Z/UmWjvUhq');
insert into Usuario_Role(email, role_nome) values ('admin@casadocodigo.com.br', 'ROLE_ADMIN');
insert into produto(titulo, dataLancamento, paginas, sumarioPath, descricao) values('Livro de Spring','2018-07-04 03:00:00',211,'arquivos-sumario/sping-leaf.jpg','Aprenda o framework mais famoso do java');
insert into produto(titulo, dataLancamento, paginas, sumarioPath, descricao) values('Python Games','2019-07-04 03:00:00',245,'arquivos-sumario/sping-leaf.jpg','Aprenda a criar seus próprios jogos em python');
insert into produto_precos(produto_id, tipo, valor) values(1,0,19.90);
insert into produto_precos(produto_id, tipo, valor) values(1,1,29.90);
insert into produto_precos(produto_id, tipo, valor) values(1,2,39.90);
insert into produto_precos(produto_id, tipo, valor) values(2,0,19.99);
insert into produto_precos(produto_id, tipo, valor) values(2,1,29.99);
insert into produto_precos(produto_id, tipo, valor) values(2,2,39.99);
``` 
