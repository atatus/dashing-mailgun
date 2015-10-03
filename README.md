##Preview

## Description

This is a [Dashing](http://shopify.github.com/dashing) widget to display the email
information using the [Mailgun Ruby API](https://github.com/mailgun/mailgun-ruby).

## Dependencies

[mailgun-ruby](https://github.com/mailgun/mailgun-ruby)

Add it to dashing's gemfile:

gem 'mailgun-ruby'

And run

`bundle install`.


## Using the Mailgun widgets

To use this widget:

1. copy `mailgun.coffee`, `mailgun.html`, and `mailgun.scss` into the `/widgets/mailgun` directory of your Dashing app. This directory does not exist in new Dashing apps, so you may have to create it.

2. Copy the `mailgun.rb` file into your `/jobs` folder.

3. Now copy over the `mailgun.yml` into the root directory of your Dashing application. Be sure to replace the following options inside of the config file with your own Mailgun information:

    :api_key: "xxxxxxxxxxxxxxx"
    :domain: 'Your Domain'


To include the widget in a dashboard, add the following snippet to the dashboard layout file:


```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
   <div data-id="mailgun" data-view="Mailgun" data-title="Mailgun"></div>
</li>
```

## Customize responsive (color changing) widgets

You can customize the thresholds for the point at which the widgets change colours. This is done by changing the `data-green` and `data-yellow` attributes of the HTML you added to the dashboard above.

Any value between `data-green` and `data-yellow` will be yellow. If `data-green` is larger than `data-yellow`, then anything above `data-green` will be green, and anything below `data-yellow` will be red, and vice-versa.

