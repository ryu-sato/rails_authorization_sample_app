# How to run

## Only execute when run at first

1. Clone Git repository
    ```
    git clone https://github.com/ryu-sato/rails_authorization_sample_app.git
    ```
1. Install GEMs
    ```
    cd rails_authorization_sample_app
    bundle install
    ```
1. Initialize DB
    ```
    rails db:create db:migrate db:seed
    ```

## Execute every time

1. Change current directory to top of local repository
1. (Only execute when Gemfile is updated) Initialize or update DB schema and seeds
    ```
    rails db:migrate db:seed
    ```
1. Execute Rails
    ```
    rails s
    ```

# User Account

|User name|Password|
| --- | --- |
|admin|"password"|
