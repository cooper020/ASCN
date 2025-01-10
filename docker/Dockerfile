FROM python:3.11.5

# Install PostgreSQL client (psql)
RUN apt-get update && apt-get install -y postgresql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Restante do Dockerfile
# Variables to set the timezone and noninteractive mode
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=US
ENV TZ=${TZ}

ENV SEED=true
# Set the timezone
RUN apt-get update && apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 
 
WORKDIR /moonshot 
COPY moonshot . 
COPY start.sh . 
RUN cp .env.example .env

RUN pip install -r requirements.txt
RUN chmod +x start.sh

EXPOSE 8000

CMD ["./start.sh"]
