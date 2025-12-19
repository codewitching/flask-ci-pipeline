# ======================
# Stage 1: Test stage
# ======================
FROM python:3.12-slim AS test

WORKDIR /app

# THIS LINE FIXES EVERYTHING
ENV PYTHONPATH=/app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt pytest

COPY . .

CMD ["pytest"]



# ======================
# Stage 2: Production stage
# ======================
FROM python:3.12-slim AS production

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
COPY app.py .

CMD ["python", "app.py"]
