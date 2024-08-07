# Creating the README.md file with the given content

content = """
# API de Coleta de Campo

## Descrição do Projeto

Este projeto é uma API desenvolvida em Ruby on Rails para gerenciar um sistema de coleta em campo. O objetivo é simular o fluxo de uma coleta, abrangendo entidades como Usuário, Visita, Formulário, Pergunta e Resposta. A API utiliza autenticação JWT para garantir a segurança dos dados.

## Tecnologias Utilizadas

- Ruby on Rails (API-only)
- PostgreSQL
- JWT para autenticação
- RSpec para testes
- Paranoia para soft delete
- Active Storage para manipulação de imagens

## Entidades do Sistema

### Usuário

- **Campos**: Nome, Senha, E-mail, CPF
- **Validações**:
  - Senha maior que seis dígitos variando entre números e letras
  - E-mail único
  - CPF único e válido

### Visita

- **Campos**: Data, Status (PENDENTE, REALIZANDO, REALIZADA), user_id, checkin_at, checkout_at
- **Validações**:
  - Data maior ou igual à data atual
  - checkin_at não pode ser maior ou igual que o dia atual e menor que a data de checkout
  - checkout_at precisa ser maior que o checkin_at
  - user_id deve ser válido

### Formulário

- **Campos**: Nome
- **Validações**:
  - Nome não pode ser repetido

### Pergunta

- **Campos**: Nome, formulary_id, Tipo de pergunta (Texto, Foto)
- **Validações**:
  - Nome único dentro do formulário

### Resposta

- **Campos**: content, formulary_id, question_id, visit_id, answered_at
- **Validações**:
  - question_id precisa existir
  - formulary_id precisa existir

## Instalação e Configuração

1. Clone o repositório:
   \`\`\`bash
   git clone <URL_DO_REPOSITORIO>
   cd campo_coleta
   \`\`\`

2. Instale as dependências:
   \`\`\`bash
   bundle install
   \`\`\`

3. Configure o banco de dados:
   \`\`\`bash
   rails db:create
   rails db:migrate
   \`\`\`

4. Configure as variáveis de ambiente:
   Crie um arquivo `.env` na raiz do projeto e adicione a seguinte linha:
   \`\`\`
   JWT_SECRET=your_secret_key
   \`\`\`

5. Inicie o servidor Rails:
   \`\`\`bash
   rails s
   \`\`\`

## Uso da API

### Autenticação

A autenticação é feita via JWT. Para obter um token, faça uma requisição POST para \`/api/v1/auth/login\` com as credenciais do usuário.

### Endpoints

- **Usuários**:
  - GET \`/api/v1/users\`
  - POST \`/api/v1/users\`
  - GET \`/api/v1/users/:id\`
  - PATCH/PUT \`/api/v1/users/:id\`
  - DELETE \`/api/v1/users/:id\`

- **Visitas**:
  - GET \`/api/v1/visits\`
  - POST \`/api/v1/visits\`
  - GET \`/api/v1/visits/:id\`
  - PATCH/PUT \`/api/v1/visits/:id\`
  - DELETE \`/api/v1/visits/:id\`

- **Formulários**:
  - GET \`/api/v1/formularies\`
  - POST \`/api/v1/formularies\`
  - GET \`/api/v1/formularies/:id\`
  - PATCH/PUT \`/api/v1/formularies/:id\`
  - DELETE \`/api/v1/formularies/:id\`

- **Perguntas**:
  - GET \`/api/v1/questions\`
  - POST \`/api/v1/questions\`
  - GET \`/api/v1/questions/:id\`
  - PATCH/PUT \`/api/v1/questions/:id\`
  - DELETE \`/api/v1/questions/:id\`

- **Respostas**:
  - GET \`/api/v1/answers\`
  - POST \`/api/v1/answers\`
  - GET \`/api/v1/answers/:id\`
  - PATCH/PUT \`/api/v1/answers/:id\`
  - DELETE \`/api/v1/answers/:id\`

### Exemplos de Uso

#### Criar Usuário

\`\`\`bash
curl -X POST http://localhost:3000/api/v1/users -d '{
  "user": {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
    "cpf": "12345678901"
  }
}' -H "Content-Type: application/json"
\`\`\`

#### Obter Token de Autenticação

\`\`\`bash
curl -X POST http://localhost:3000/api/v1/auth/login -d '{
  "email": "john@example.com",
  "password": "password123"
}' -H "Content-Type: application/json"
\`\`\`

#### Listar Usuários com Token JWT

\`\`\`bash
curl -H "Authorization: Bearer your_jwt_token_here" http://localhost:3000/api/v1/users
\`\`\`

## Rodando os Testes

Para rodar os testes, use o comando:

\`\`\`bash
bundle exec rspec
\`\`\`

Os testes cobrem as validações dos modelos, as respostas dos controladores e o método de autenticação.

## Estrutura do Projeto

- **Controllers**: Controladores estão localizados em \`app/controllers/api/v1/\`.
- **Models**: Modelos estão localizados em \`app/models/\`.
- **Views**: As views estão localizadas em \`app/views/\`, embora este projeto seja uma API e não utilize muitas views.
- **Services**: Serviços como \`AuthenticationTokenService\` estão localizados em \`app/services/\`.

## Conclusão

Esta API foi desenvolvida para simular um sistema de coleta em campo, permitindo a criação, edição e listagem de usuários, visitas, formulários, perguntas e respostas. A autenticação via JWT garante a segurança do acesso aos dados.
