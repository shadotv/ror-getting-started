# README

Initial setup for a RoR application running with Docker.

## Inizialization

1. Clone ror-getting-started (https://github.com/shadotv/ror-getting-started) repository in your local
2. Create .env configuration from .env.example one
3. Create docker environment running command docker-compose up -d
4. In docker environment (docker-compose exec web bash) run rake db:create

## Execute

run docker-compose exec web rails s -b 0.0.0.0 to start RoR server and navigate http://localhost:3000