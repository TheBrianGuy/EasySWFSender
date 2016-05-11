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

Whenever someone submits the form, the message will be recorded in your database and forwarded to you as an email.

## Features

* Messages hosted on your server, manage your own database
* Unlimited messages
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

## Creators

**J Travis Lindsey**

* <a href="http://jtlindsey.com/" target="_blank">jtlindsey.com</a>
* <a href="https://github.com/jtlindsey" target="_blank">jtlindsey github</a>

This app was Inspired by <a href="https://github.com/formspree/formspree" target="_blank">formspree</a>

## License

[Click to read License information.](https://github.com/jtlindsey/EasyStaticWebsiteFormSender/blob/master/LICENSE "License")
