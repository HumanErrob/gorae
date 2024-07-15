FROM python:3.8-slim

RUN apt-get update
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip3 install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "./app.py"]
