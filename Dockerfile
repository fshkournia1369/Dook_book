# Doc_book/Dockerfile
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# ابزار کوچک برای انتظار DB (netcat)
RUN apt-get update && apt-get install -y --no-install-recommends \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# کل پروژه را بعداً کپی می‌کنیم تا کش نصب پکیج‌ها حفظ شود
COPY . /app/

# پورت برنامه
EXPOSE 8080

 
 