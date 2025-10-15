# Use official lightweight Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Prevent Python from writing .pyc files and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install build dependencies (if any) and pip
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . /app

# Expose port
EXPOSE 5000

# Use gunicorn for production; fallback to flask if gunicorn missing
CMD ["sh", "-c", "exec gunicorn --bind 0.0.0.0:5000 'app:app' --workers 2 --threads 2"]
