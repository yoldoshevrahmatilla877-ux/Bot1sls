FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

# ffmpeg (video ishlash) va Node.js + pm2 (bola-botlarni ishga tushirish) uchun
RUN apt-get update && apt-get install -y --no-install-recommends \
        ffmpeg nodejs npm gcc libpq-dev \
    && npm install -g pm2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY server.py .

CMD ["python", "server.py"]
