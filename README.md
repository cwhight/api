# README

## This app is built using Ruby on rails with a PostgreSQL database

Ruby Version [installation guide](https://www.ruby-lang.org/en/downloads/)

ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]

With Ruby installed, install rails [installation guide](https://guides.rubyonrails.org/v5.0/getting_started.html)

``` gem install rails ```

To verify installation

``` rails --version ```

To initialize the database run

``` rails db:create db:migrate db:seed ```

To launch the server run

``` rails s ```

and go to localhost:/3000/documents

To launch the test suite - using rspec

Install:

``` rails generate rspec:install ```

Run:

``` rspec ```

