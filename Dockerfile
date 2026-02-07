# =========================
# Base Image
# =========================
FROM python:3.11-slim

# =========================
# Environment
# =========================
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# =========================
# Workdir
# =========================
WORKDIR /app

# =========================
# Install system dependency
# =========================
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# =========================
# Install Python dependency
# =========================
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# =========================
# Copy source code
# =========================
COPY etl/ etl/

# =========================
# Default command
# =========================
CMD ["python", "-m", "etl.main"]
