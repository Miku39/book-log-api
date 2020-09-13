# README

## Deployment instructions

```
$ heroku login
$ heroku container:login
$ heroku container:push web -a book-log-api
$ heroku container:release web -a book-log-api
$ heroku run rails db:migrate -a book-log-api
$ heroku run rails db:seed -a book-log-api
$ heroku open -a book-log-api
```
