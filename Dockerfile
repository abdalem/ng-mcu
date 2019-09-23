FROM node:12.10.0

# install chrome for protractor tests
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
RUN mkdir /var/www
WORKDIR /var/www

ENV PATH /var/www/node_modules/.bin:$PATH

# install and cache app dependencies
RUN npm install -g @angular/cli@8.3.5
COPY ./package.json /var/www/package.json
COPY ./package-lock.json /var/www/package-lock.json
RUN npm install

# add app
COPY ./ /var/www

# start app
CMD ng serve --host 0.0.0.0 --publicHost angular.starter-kit.local