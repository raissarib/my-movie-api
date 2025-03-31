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
- `POST /register` - Cadastro de usuário
- `POST /login` - Login de usuário

### Usuários
- `GET /users` - Listar usuários
- `GET /users/:id` - Obter detalhes de um usuário
- `PATCH/PUT /users/:id` - Atualizar informações de um usuário
- `DELETE /users/:id` - Remover um usuário

### Filmes
- `GET /movies` - Listar todos os filmes
- `POST /movies` - Adicionar um novo filme
- `GET /movies/:id` - Obter detalhes de um filme
- `PATCH/PUT /movies/:id` - Atualizar informações de um filme
- `DELETE /movies/:id` - Remover um filme

### Avaliações
- `GET /reviews` - Listar todas as avaliações
- `POST /reviews` - Criar uma nova avaliação
- `GET /reviews/:id` - Obter detalhes de uma avaliação
- `PATCH/PUT /reviews/:id` - Atualizar uma avaliação
- `DELETE /reviews/:id` - Remover uma avaliação

---

Feito com ❤ por [Raissa Rib](https://github.com/raissarib).

