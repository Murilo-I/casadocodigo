## Ambiente 

 Aplicação foi testado com JRE8 e JRE9 no Apache Tomcat 7, 8 e 9.
 
## MySQL

O projeto usa MySQL e deve existir já o banco `casadocodigo` (a senha do seu banco deve ser auterada no método `dataSource` da classe `JPAConfiguration`). O JPA foi configurado para gerar e atualizar as tables automaticamente ao iniciar (utilizando o mapeamento `update` no método `additionalProperties` da classe `JPAConfiguration`).

## Compilação

 Para compilar immporte o projeto no Eclipse (*Import as Maven Projeto*) ou compile na linha de comando usando Maven:

	mvn clean package

## Profile DEV

O projeto sobe automaticamente ativando o profile "dev". Isso foi configurado através da classe ServletSpringMVC no método onStartup(..).

	servletContext.setInitParameter("spring.profiles.active", "dev");

Para não usar o profile "dev" basta comentar o InitParameter, no entanto é preciso um paramentro de inicialização no Tomcat (dentro das "Run Configurations...")

	 "-Dspring.profiles.active=dev"

## URL e Inicialização

Ao rodar no Eclipse pelo  Tomcat acesse:

	http://localhost:8080/casadocodigo
	
Execute a "URL Mágica" para cadastrar produtos e um usuario padrão (Login: admin@casadocodigo.com.br, Senha: 123456)
A url se encontra na classe `SecurityConfiguration`.
