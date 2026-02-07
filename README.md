# Project 1 – Batch ETL Pipeline (Dockerized)

## 📌 Overview
This project demonstrates a **Dockerized batch ETL pipeline** built with Python and PostgreSQL.

The pipeline ingests raw transactional CSV data, performs validation and transformation, and loads clean data into a PostgreSQL data warehouse schema. Analytical SQL queries are provided to generate business insights.

This project is designed as a **Data Engineer portfolio project** following industry best practices.

---

## 🏗 Architecture

All services run inside Docker containers using Docker Compose.

---

## 🛠 Tech Stack
- Python 3.10
- Pandas
- PostgreSQL
- Docker & Docker Compose
- SQL (Analytics & Data Quality)

---

## 📂 Project Structure
```
data/raw/ # Raw CSV data
docker/postgres/ # Postgres init script
etl/ # ETL pipeline code
sql/
├── analytics/ # Analytical queries
├── ddl/ # Table definitions
└── metrics/ # Data quality & metric
```

## ▶️ How to Run the Project

### 1. Clone Repository

git clone <your-repo-url>
cd PROJECT-1-BATCH-ETL

### 2. Start Services
docker compose up --build
This will:
- Start PostgreSQL
- Run the ETL pipeline automatically

### 3. Re-running ETL
- Modify CSV → restart ETL container
  docker compose restart etl
- Modify Python logic → rebuild ETL
  docker compose up --build etl