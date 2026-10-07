# Projeto de Banco de Dados - Insight Places

Este repositório contém o script de criação, estruturação e inserção de dados do banco de dados relacional para a plataforma **Insight Places** (aluguel de hospedagens por temporada), desenvolvido em MySQL.

---

## 📐 Estrutura do Banco de Dados (Modelo Físico)

### 1. Tabela: `proprietarios`
Armazena as informações dos donos dos imóveis.

| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_proprietario` | INT | Primary Key, Auto Increment |
| `nome` | VARCHAR(100) | Not Null |
| `cpf` | VARCHAR(14) | Not Null, Unique |
| `email` | VARCHAR(100) | Not Null, Unique |
| `telefone` | VARCHAR(20) | Null |

---

### 2. Tabela: `clientes`
Armazena os dados dos hóspedes da plataforma.

| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_cliente` | INT | Primary Key, Auto Increment |
| `nome` | VARCHAR(100) | Not Null |
| `cpf` | VARCHAR(14) | Not Null, Unique |
| `email` | VARCHAR(100) | Not Null, Unique |
| `telefone` | VARCHAR(20) | Null |

---

### 3. Tabela: `hospedagens`
Registra os imóveis disponíveis para aluguel.

| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_hospedagem` | INT | Primary Key, Auto Increment |
| `id_proprietario` | INT | Foreign Key (`proprietarios`) |
| `tipo` | ENUM | 'Apartamento', 'Casa', 'Quarto', 'Chácara' |
| `endereco` | VARCHAR(255) | Not Null |
| `cidade` | VARCHAR(100) | Not Null |
| `estado` | CHAR(2) | Not Null |
| `diaria` | DECIMAL(10,2) | Not Null |

---

### 4. Tabela: `reservas`
Gerencia os agendamentos realizados pelos clientes.

| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_reserva` | INT | Primary Key, Auto Increment |
| `id_hospedagem` | INT | Foreign Key (`hospedagens`) |
| `id_cliente` | INT | Foreign Key (`clientes`) |
| `data_checkin` | DATE | Not Null |
| `data_checkout` | DATE | Not Null |
| `valor_total` | DECIMAL(10,2) | Not Null |
| `status_reserva` | ENUM | Default: 'Confirmada' |

---

### 5. Tabela: `avaliacoes`
Registra o feedback dos hóspedes sobre as estadias.

| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_avaliacao` | INT | Primary Key, Auto Increment |
| `id_reserva` | INT | Foreign Key (`reservas`) |
| `nota` | INT | CHECK (1 a 5) |
| `comentario` | TEXT | Null |
| `data_avaliacao` | DATE | Not Null |

---

## 🛠️ Como Executar o Script

1. Abra o **MySQL Workbench** ou o terminal da sua preferência.
2. Execute o arquivo `insight_places.sql` presente neste repositório.
3. O script criará automaticamente o banco de dados `insight_places`, as tabelas e inserirá dados de teste.
