# BOOK-LOG-API

RESTful API for my book logs.

- get book log list

```
[GET] /books
```

- get book log detail

```
[GET] /books/<id>
```

- register book log

```
[POST] /books

{
    isbn: <isbn>
}
```

## Tech Stack

- Ruby on Rails
- Docker
- PostgreSQL
- Heroku

## Development

```
docker-compose build
docker-compose up
docker-compose exec web bash
rails db:migrate
rails db:seed
```

See `docker-compose.yml` for DB settings.

## Deployment instructions

```
heroku login
heroku container:login
heroku container:push web -a book-log-api
heroku container:release web -a book-log-api
heroku run rails db:seed -a book-log-api
heroku open -a book-log-api
```
