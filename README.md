# **Fullstack / SPA Hybrid Example**

## **Get Up and Running**
Choose your own adventure: **Classic** or **Docker**. Either way, it runs on [localhost:3000](http://localhost:3000).

### **Classic**

#### **Pre-requisites:**
You'll need to have Ruby, Node, and Yarn installed on your machine. I recommend going with [RVM](https://rvm.io/) and [NVM](https://github.com/nvm-sh/nvm) but you do you.

#### **Install Homebrew:**
[Get it here](https://brew.sh/)

#### **Install and Setup Postgresql:**
```sh
$ brew install postgresql
$ brew services start postgresql
$ createuser -s postgres
```

#### **Install Gems/Packages:**
```
$ ./bin/bundle
$ yarn install
```

#### **Setup the Database:**
```
$ ./bin/rails db:setup
```

#### **Run the App:**
In one terminal window:
```sh
$ ./bin/dev
```

#### **Run the Specs**
```sh
$ ./bin/rspec
```

### **Docker**
#### **Install Docker:**
[Docker for Desktop](https://docs.docker.com/desktop/mac/install/)

#### **Setup the Database:**
```
$ docker-compose run --rm fullstack_example rails db:setup
```

#### **Run Everything:**
```sh
$ docker-compose up
```

#### **Run the Specs**
```sh
$ docker-compose run --rm fullstack_example rspec
```

## **CI/CD**
Not implemented, but I recommend [CircleCI](https://circleci.com).

## **Secrets**
If you ever need to add/update secrets you'll need to get `/config/credentials/staging.key` and `/config/credentials/production.key` from wherever they're kept. The development/test environment key is in `/config/master.key` (and no, it doesn't work for staging or production).

Once you have them you can easily update the secrets with a few helper tasks:
```sh
$ rails credentials:edit_local
$ rails credentials:edit_staging
$ rails credentials:edit_production
```
