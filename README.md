# AngularStarterKit

Angular application starter kit including docker and workflow based on angular-cli, best pratices, angular styleguide, the community and my personal experience.


# Getting Started

You have three ways to start the project:

## Without Docker
Make sur you have Node, NPM and the Angular CLI installed globally. Then, you can run `npm install` and `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## With Docker
Install docker (see the official docs) and docker-compose. Then, go on docker-compose.yml and uncomment:
```
#docker-compose.yml

ports:
  - 100:4200
```

run `docker-compose up` and navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## With Docker and Nginx reverse proxy
Install docker (see the official docs) and docker-compose. Then, go on docker-compose.yml and uncomment:
```
#docker-compose.yml

#if you already have a started instance of jwilder/nginx-proxy. Bind to the appropriate network
networks:
  default:
    external:
      name: nginx-proxy #change it if you need

#if you do not have one
nginx-proxy:
  image: jwilder/nginx-proxy
  ports:
    - "80:80"
  volumes:
    - /var/run/docker.sock:/tmp/docker.sock:ro
```

Update your hosts files and add `127.0.0.1       angular.starter-kit.local`

run `docker-compose up` and navigate to `http://angular.starter-kit.local/`. The app will automatically reload if you change any of the source files.
