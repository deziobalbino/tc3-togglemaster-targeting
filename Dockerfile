# Usa uma imagem oficial do Python, versão leve
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN opentelemetry-bootstrap -a install

COPY . .

EXPOSE 8003

CMD ["opentelemetry-instrument","gunicorn", "--bind", "0.0.0.0:8003", "app:app"]