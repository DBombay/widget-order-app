Widget Order Form
===

Basic Rails 6 application satisfying the initial requirements for the challenge
[here](https://gist.github.com/barendt/4dbfeeda803fc47677be).

Details
---
*Ruby Version:* **2.5.5**
*Rails Version:* **6.0.0**

Setup
---
1. `git clone` the repository and `cd` into it
2. run `bundle install` to install dependencies (may need to run `gem install bundler`
  to install bundler globally on your machine)
3. run `rake db:create` to create local database on your machine (may need to install postgresql
  on your machine. Instructions for that [here](http://www.postgresqltutorial.com/install-postgresql/))
4. run `rake db:migrate` to run migrations and build schema
5. navigate to `localhost:3000` to test the application locally

Testing
---
Running either `rake` or `rails test` will run the testing suite.
