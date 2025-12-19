# ======================
# Stage 1: Test stage
# ======================
FROM python:3.12-slim AS test

WORKDIR /app

ENV PYTHONPATH=/app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt pytest

COPY . .

# Run tests here
RUN pytest


# ======================
# Stage 2: Runtime stage
# ======================
FROM python:3.12-slim AS runtime

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
