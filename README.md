# Spina::Blog

Blog module to add to Spina CMS.

## Usage

Just add the gem file and run the rake task to install the migrations... and then run the migrations, obviously.

This will add an extra section to the 'website' navigation.

### Justification

While blog posts are essentially just pages, they usually have a separate structure for date information. Rather than creating a bunch of pages, this plugin creates a scope called `blog` for the front-end, under which all the posts reside (using the standard `/:year/:month/:day/:slug` format).

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'spina', '~> 0.12'
gem 'spina_blog', github: 'mattr/spina_blog'
```

And then execute:
```bash
$ bundle
```

## Contributing
1. Fork it ( https://github.com/mattr/spina_blog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

In addition to contributing code, you can help to triage issues. This can include reproducing bug reports, or asking for vital information such as version numbers or reproduction instructions.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## TODO

1. Move the URL generation to use `materialized_path`.
2. Add configuration options to allow alternate namespaces (e.g. `news`).
3. Allow multiple instances (e.g. `news` and `blog`).