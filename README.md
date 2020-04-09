# Jungle

A mini e-commerce application built with Rails 4.2.

## Features

- Users can sign up for an account, log in and log out
- Visitors and registered users can see all the products, or filter by category
- Visitors and registered users can add and remove items to/from their cart, and pay using a Stripe account
- Admins can access the dashboard that lists the inventory, and can add/remove products
- Admins can add new categories

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Screenshots

### Signup form

!["Signup form"](https://github.com/shuchitama/jungle-rails/blob/master/docs/signup_form.png?raw=true)

### Home Page

!["Home page"](https://github.com/shuchitama/jungle-rails/blob/master/docs/home_page.png?raw=true)

### Cart View

!["Cart View"](https://github.com/shuchitama/jungle-rails/blob/master/docs/cart_view.png?raw=true)

### Admin products view

!["Admin products view"](https://github.com/shuchitama/jungle-rails/blob/master/docs/admin_products_view.png?raw=true)

###

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
