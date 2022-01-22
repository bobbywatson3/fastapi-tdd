# FastAPI

## Running Locally for Development

- Bring the environment up:
    `docker-compose up -d`
- Run db migrations:
    `docker-compose docker-compose exec web aerich upgrade`
- Bring environment down and remove persistent DB disk:
    `docker-compose down -v`

## Running in Heroku

```bash
heroku create
export APP_NAME=<name of the app>
heroku container:login
heroku addons:create heroku-postgresql:hobby-dev --app ${APP_NAME}
docker buildx build --load --platform linux/amd64 -f project/Dockerfile.prod -t registry.heroku.com/${APP_NAME}/web ./project
docker push registry.heroku.com/${APP_NAME}/web:latest
heroku container:release web --app ${APP_NAME}
heroku run aerich upgrade --app ${APP_NAME}
```