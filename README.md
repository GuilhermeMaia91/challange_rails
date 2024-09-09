Projetinho baseado na linguagem Ruby on Rails com testes em RSpec e Docker.

### Instruções

* No diretório do projeto execute o comando para subir o container
```
docker-compose up
```
* Para acessar o bash do container
```
docker exec -it challange_rails_api_1 bash
```

#### Dicas para alguns erros ao subir o container pela primera vez

* Pode ser que aconteça de nos logs do container da api apareça o erro no mysql ao tentar configurar o banco de `test` (usado pelo rspec), para resolver esse problema é só acessar o container do banco e executar os comandos abaixo:
```
docker-compose exec db sh -c 'mysql -uroot -p${MYSQL_ROOT_PASSWORD}'
# Conceder as permissões ao usuário configurado no Dockerfile
GRANT ALL PRIVILEGES ON *.* TO 'development'@'%';
FLUSH PRIVILEGES;
```

### Collections Postman

Para testar a API via Postman tem o arquivo `Challange API.postman_collection.json` e é só importar no seu POSTMAN