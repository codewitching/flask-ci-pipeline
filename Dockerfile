FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install pytest

ENV PYTHONPATH=/app

CMD ["python", "app.py"]
