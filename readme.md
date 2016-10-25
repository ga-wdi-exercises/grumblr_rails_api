# Welcome to the API for Grumblr

Once setup, you can access your Grumblr api at `http://localhost:3000`.

## Setup

1. Install dependencies, setup db

  ```bash
  $ cd grumblr_rails_api
  $ bundle install
  $ rails db:drop db:create db:migrate db:seed
  ```

2. Start your server

  ```sh
  $ rails s
  ```

3. Your api is now available at `http://localhost:3000`
