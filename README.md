# MiniUrl

This application will shorten URL’s. The application accept incoming HTTP requests to create mini urls from normal and store them securely in a the data base.

## Installation 

### Elixir/Phoenix
  * You can follow the [Phoenix](https://hexdocs.pm/phoenix/installation.html) installation guide to install all the required dependencies 

### Postgres & DB Setup

1. You will need PostgreSQL running in you local machine. If you are in an IOS environment homebrew is onw of the easiest ways to install by `brew install postgresql`. [Here] is a wiki link with more information about how to install PostgreSQL

2. Follow the homebrew install advice on how to run the database manually when needed, or for convenience, you can run it automatically on boot by running `brew services start postgresql` once.

3. Create a `postgres` user for the database: `createuser -s postgres` if needed 

4. Create and migrate your database with `mix ecto.setup`

5. Add a new user to your DB with `mix users.add`

6. Add some demo data your db by running:

### To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server` 

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Application Overview


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
