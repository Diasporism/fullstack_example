FROM ruby:3.1.2-alpine AS base

RUN apk update -qq && apk add --no-cache build-base git nodejs postgresql-dev yarn

WORKDIR /fullstack_example

COPY ./Gemfile ./Gemfile.lock ./
COPY ./package.json ./yarn.lock ./
COPY ./bin/bundle ./bin/
RUN yarn install
RUN ./bin/bundle config set --local frozen 'true' deployment 'true' clean 'true'
RUN ./bin/bundle install --no-cache && ./bin/bundle clean --force

# --no-cache is currently broken
RUN rm -rf /usr/local/bundle/cache

FROM ruby:3.1.2-alpine

RUN apk update -qq && apk add --no-cache postgresql-client tzdata yarn

WORKDIR /fullstack_example

COPY . .
COPY --from=base /usr/local/bundle/ /usr/local/bundle/
COPY --from=base /fullstack_example/node_modules/ /fullstack_example/node_modules/

EXPOSE 3000
CMD ["./bin/dev"]
