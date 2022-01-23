# Summarizer (FastAPI and Postgres Example App)
[![Summarizer CI/CD](https://github.com/bobbywatson3/summarizer/actions/workflows/main.yml/badge.svg)](https://github.com/bobbywatson3/summarizer/actions/workflows/main.yml)


## Running Locally for Development

- Bring the environment up:
    `docker-compose up -d`
- Run db migrations:
    ` docker-compose exec web aerich upgrade`
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

## Testing
Run the included `run_all_tests.sh` to bring up the application via docker-compose to run all of the tests.
### Running unit tests locally (and quickly in parallel)
```bash
docker-compose up -d
docker-compose exec web pytest -k "unit" -n auto
```