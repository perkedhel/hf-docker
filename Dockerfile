FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/daddylive  # pass to work dir

RUN git pull || git clone https://github.com/pigzillaaaaa/daddylive .

RUN pip install flask curl-cffi m3u8 gunicorn
RUN echo 'Rebuild at 2025-06-07 21:09:30' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 19:19:12' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 17:10:44' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 15:13:13' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 13:14:36' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 11:14:24' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 10:07:54' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 07:55:19' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 05:10:41' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 03:13:09' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-07 01:15:44' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-06 23:14:19' >> /app/rebuild.log
RUN echo 'Rebuild at 2025-06-06 21:52:50' >> /app/rebuild.log

RUN echo "Rebuild at $(date '+%Y-%m-%d %H:%M:%S')" >> /app/rebuild.log

EXPOSE 7860

CMD ["gunicorn", "--workers", "5", "--worker-class", "gthread", "--threads", "4", "--bind", "0.0.0.0:7860", "proxy:app"]
