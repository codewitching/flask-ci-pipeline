# =========================
# Stage 1: Test stage
# =========================
FROM python:3.12-slim AS test

WORKDIR /app

COPY requirements.txt requirements-dev.txt ./

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir -r requirements-dev.txt

COPY . .

ENV PYTHONPATH=/app

CMD ["pytest"]

# =========================
# Stage 2: Production stage
# =========================
FROM python:3.12-slim AS runtime

WORKDIR /app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
COPY app.py ./

ENV PYTHONPATH=/app

EXPOSE 5000

CMD ["python", "app.py"]
