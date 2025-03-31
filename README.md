# My Movie API

My Movie API é uma API desenvolvida em Ruby on Rails para gerenciar filmes assistidos, permitindo cadastrar, classificar e avaliar filmes. A API funciona como um Letterboxd pessoal.

## Tecnologias Utilizadas

- Ruby on Rails
- PostgreSQL
- JWT (para autenticação de usuários)
- RSpec (para testes automatizados)
- Docker (opcional, para ambiente de desenvolvimento)

## Instalação e Configuração

### 1. Clonar o Repositório
```bash
git clone https://github.com/raissarib/my-movie-api.git
cd my-movie-api
```

### 2. Instalar Dependências
```bash
bundle install
```

### 3. Configurar o Banco de Dados
```bash
rails db:create db:migrate db:seed
```

### 4. Rodar o Servidor
```bash
rails server
```
A API estará disponível em `http://localhost:3000`.

## Endpoints Principais

### Autenticação
- `POST /users/sign_up` - Cadastro de usuário
- `POST /users/sign_in` - Login de usuário

### Filmes
- `GET /movies` - Listar todos os filmes
- `POST /movies` - Adicionar um novo filme
- `GET /movies/:id` - Obter detalhes de um filme
- `PUT /movies/:id` - Atualizar informações de um filme
- `DELETE /movies/:id` - Remover um filme

### Avaliações
- `POST /movies/:id/reviews` - Avaliar um filme
- `GET /movies/:id/reviews` - Listar avaliações de um filme

Feito com ❤ por [Raissa Rib](https://github.com/raissarib).

