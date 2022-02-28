# AlphaBlog - BlogsApp

## Introduction

AlphaBlog is a discussion or informational website, bloggers can often post/edit/delete articles tagging any category. Bloggers can follow any other blogger, so that they can get weekly newsletter emails. Users can signup and create their own profile and start creating new articles.


## Prerequisites
------------------------
The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.9](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [4.2.11.1](https://github.com/organization/project-name/blob/master/Gemfile#L12)
- Mysql [5.7.37]
- Redis server [6.2.6]
- Sideqik
- Elastic Search [6.0]

##### 1. Check out the repository

```bash
git clone git@github.com:organization/myapp.git
```

##### 2. Connect to mysql and Create `myapp_development` database
```bash
CREATE DATABASE 'myapp_development';
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:migrate
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle install
bundle exec rails s
```

##### 4. Start the Redis server

You can start the redis server using the command given below.

```redis
redis-server
```

##### 4. Start the Sidekiq server

You can start the Sidekiq server using the command given below.

```sidekiq
bundle exec sidekiq
```

And now you can visit the site with the URL http://localhost:3000