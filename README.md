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

# Folder Structure Explanation
```ruby
src/
    app/
      configs/ #contains app settings and other predefined values
      core/ #contains everything where there's only one instance per application
          authentification/ #contains all the logic that handles authentication-cycle
          components/ #contains core components that are used in every page of the app like footer or header
          guards/ #To prevent re-importing the core module elsewhere, you should also add a guard for it in the core module’ constructor. It also contains all app guards like the ones that protect different routes
          http/ #contains servicces that calls apis
          interceptors/ #this allow us, using HttpIntereceptor, to catch and modify requests and responses from our API calls
          mocks/ #you can user mocks for tests but also to retrieve fictional data until the back is set up
          services/ # all additional singleton services are place in this folder
          core.module.ts #the CoreModule takes on the role of the root AppModule, but is not the one which get bootstrapped by Angular at run-time
          index.ts #used to export everything that needs to be used outside core module
      modules/ #contains pages and not shared components. It can look like:
          #home/
              #components/
                  #componentA/
                      #componentA.component.ts|html|css|spec
                  #componentB/
                      #componentB.component.ts|html|css|spec
              #home.component.ts|html|css|spec
              #home-routing.module.ts
              #home.module.ts
          #movies/
              #components/
              #pages/
                  #movies-list/
                      #movies-list.component.ts|html|css|spec
                  #movie-detail/
                      #movie-detail.component.ts|html|css|spec
              #movies-routing.module.ts
              #movies.module.ts
      shared/ #contains any shared feature
          components/
          directives/
          models/
          pipes/
          shared.module.ts
          index.ts
    assets/
        scss/
            partials/
            styles.scss
            variables.scss
```
