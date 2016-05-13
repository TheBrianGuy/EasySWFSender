## Status

...in progress

## Overview

Host your own form sender for all your static websites with EasyStaticWebsiteFormSender. Fork this app and upload to Heroku and you'll have a form sender that you can use with all your static websites. 

Once you've got it up and running on your server, it's as easy as:

1. Sign into your application
2. Create a new formroute
3. Then setup your form on your static website.  

    Example assuming your application is at `https://YourHerokuApp.com`, and your Formroute key is `123456`.

        <form action="https://YourHerokuApp.com/form/123456">
            <input type="text" name="name">
            <input type="email" name="_replyto">
            <input type="submit" value="Send">
        </form>

4. Whenever someone submits the form, the message will be recorded in your database and forwarded to you as an email.

## Features

* Messages hosted on your server, manage your own database
* Unlimited messages
* Make custom forms for your static websites without writing server side code
* Use with multiple static websites
* Easily add and remove Formroutes
* Easy to follow code for upgrading or customizing

## Pic's

...coming soon

## Documentation & Usage

...coming soon

## Installation

To get started with this application on Heroku:

....needs to be updated

```bash
# 1. Fork this project and clone into project directory on your local machine
# 2. Setup [Heroku toolbelt](https://toolbelt.heroku.com/)
# 3. From your project directory, create an app on heroku for your project
heroku apps:create YourProjectName
# 4. Push your project to heroku
git push heroku
# 5. Run migrations for the postgresql database
heroku run rake db:migrate
# 6. Your app should now be running at `https://YourProjectName.herokuapp.com/`
```

## Configuration Local Machine and Heroku

Your configuration will depend on your email host. Check out the Action Mailer Configuration section at http://guides.rubyonrails.org/action_mailer_basics.html and your email providers documentation for more information.

1. Create a .env file in your root directory
2. Add .env to your .gitignore
3. Add your configurations to your .env

    ### Exmaple `.env`

    ```bash
    # For Email Message
    EMAIL_DEFAULT_FROM="from@example.com"
    EMAIL_HOST="example.com"
    EMAIL_ADDRESS="smtp.email.com"
    EMAIL_DOMAIN="example.com"
    EMAIL_USERNAME="username"
    EMAIL_PASSWORD="password"
    EMAIL_AUTHENTICATION=plain
    ```

4. Create the above variables in your heroku Config Variables.

5. Update your `developmenet.rb` and `production.rb` files:

    ### Example `development.rb`:

    ```bash
    ...
      # Mail logging and other settings
      config.action_mailer.default_url_options = { :host => "localhost:3000" }
      config.action_mailer.perform_deliveries = true
      config.action_mailer.raise_delivery_errors = true
      config.action_mailer.delivery_method = :smtp

      # Email Message
      config.action_mailer.delivery_method = :smtp
      config.action_mailer.smtp_settings = {
        address:              ENV['EMAIL_ADDRESS'],
        port:                 465,
        domain:               ENV['EMAIL_DOMAIN'],
        user_name:            ENV['EMAIL_USERNAME'],
        password:             ENV['EMAIL_PASSWORD'],
        authentication:       ENV['EMAIL_AUTHENTICATION'],
        enable_starttls_auto: true }
    ...
    ```


    ### Example `production.rb`:

    ```bash
    ...
      # Mail info for production
      config.action_mailer.default_url_options = { host: ENV['EMAIL_HOST'] }
      config.action_mailer.delivery_method = :smtp
      config.action_mailer.smtp_settings = {
        address:              ENV['EMAIL_ADDRESS'],
        port:                 465,
        domain:               ENV['EMAIL_DOMAIN'],
        user_name:            ENV['EMAIL_USERNAME'],
        password:             ENV['EMAIL_PASSWORD'],
        authentication:       ENV['EMAIL_AUTHENTICATION'],
        enable_starttls_auto: true,
        tls:                  true }
    ...
    ```

## Creators

**J Travis Lindsey**

* <a href="http://jtlindsey.com/" target="_blank">jtlindsey.com</a>
* <a href="https://github.com/jtlindsey" target="_blank">jtlindsey github</a>

This app was Inspired by <a href="https://github.com/formspree/formspree" target="_blank">formspree</a>

## License

[Click to read License information.](https://github.com/jtlindsey/EasyStaticWebsiteFormSender/blob/master/LICENSE "License")
