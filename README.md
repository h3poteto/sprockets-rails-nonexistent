# Sprockets::Rails::Nonexistent

Notify nonexsistent stylesheet or javascript through sprockets-rails.
When you use `stylesheet_link_tag` or `javascript_include_tag` in development  or test, rails continues rendering if those asset files don't exist.
But that cause error in production, for example `isn't precompiled`.

This gem can use in Rails4.x. If you want to use this gem in Rails3.x, please use [sprockets-helpers-nonexistent](https://github.com/h3poteto/sprockets-helpers-nonexistent).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sprockets-rails-nonexistent'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sprockets-rails-nonexistent

## Usage

You can use `stylesheet_link_tag` and `javascript_include_tag` same as before.
When sprockets can not find stylesheet or javascript, raise error in development and test.

## Contributing

1. Fork it ( https://github.com/h3poteto/sprockets-rails-nonexistent/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
