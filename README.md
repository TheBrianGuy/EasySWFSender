## Status

...in progress
...production ready but consider improving message validation 
...To-Do: remove extra files and methods in user class, move setup and faq to wiki...

## Overview

Host your own form sender for all your static websites with EasySWFSender (Easy-Static-Website-Form-Sender). Fork this app and upload to Heroku and you'll have a form sender that you can use with all your static websites. 

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

### Privacy & Security

* Formroutes use an auto-generated unique key instead of email for added security. Now you can hide your email address from your form.
* Even with open-source projects you have no idea if the changes you see on github are the same as what's on the application server for the public application. Especially on multi user public applications. Email addresses could silently be used to create list based on messages and then resold. Protect your senders email and messages by sending them to your own server. 
* Anti-spam "honeypot" field to prevent spam from bots. The server will ignore the submission if field is not blank.

        <input type="text" name="funText" style="display:none" />

### Other Features

* Messages stored on your server. Missed a message? Login to your app and get it!
* Unlimited messages
* Easily add forms to your static websites without writing server-side code
* Use with multiple static websites
* Easily add and remove Formroutes
* Easy to follow code for upgrading or customizing
* Easily manage auto deleting old messages (coming soon)
* Download 1 or all messages from your application (coming soon)
* Form creation check box to enable plain-text or html(default) forwarding (coming soon)

## Pic's

...coming soon

## Documentation & Usage

...coming soon  
...simple instructions for adding additional fields to site forms and application processing also coming soon.

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
    EMAIL_HOST="example.com" # In production will be root url for devise links
    EMAIL_ADDRESS="smtp.email.com"
    EMAIL_DOMAIN="example.com"
    EMAIL_USERNAME="username"
    EMAIL_PASSWORD="password"
    EMAIL_AUTHENTICATION=plain
    # Devise config.mailer_sender
    APP_NAMED_EMAIL="EasySWFSender-noreply@example.com"
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


## Form Setup

...coming soon with html and ajax example

## Creators

**J Travis Lindsey**

* <a href="http://jtlindsey.com/" target="_blank">jtlindsey.com</a>
* <a href="https://github.com/jtlindsey" target="_blank">jtlindsey github</a>

This app was Inspired by <a href="https://github.com/formspree/formspree" target="_blank">formspree</a>. But this is 100% free, has unlimited messages and forms hosted on your server, has complete setup documentation for hosting on Heroku free dyno server, and is built with Ruby on Rails.

## License

[Click to read License information.](https://github.com/jtlindsey/EasyStaticWebsiteFormSender/blob/master/LICENSE "License")
