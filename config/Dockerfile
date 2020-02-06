FROM python:3.7-slim

RUN apt-get update && apt-get install -y netcat

ARG PROJECT_DIR

# Set working directory
WORKDIR $PROJECT_DIR

# Install Project requirements
COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

CMD bash docker/run.sh