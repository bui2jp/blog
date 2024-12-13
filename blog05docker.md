# docker コマンド

## docker ps -a
## docker run -it --rm ubuntu
## docker exec -it [containerid] bash
## docker stop [containerid]
## docker rm

## docker images
## docker rmi [imageid]
## docker build -t myapp:v1 .
## docker build -t myapp:v1 --no-cache .
## Dockerfile
```
cat Dockerfile
FROM python:3.11-bullseye

WORKDIR /app

COPY ./ /app

RUN python -m pip install -r requirements.txt

RUN python -m pip install gunicorn

CMD ["python3", "-m", "gunicorn", "-b", "0.0.0.0:8000", "main:app"]
```
