# Spina::Blog
[![Build Status](https://travis-ci.org/mattr/spina_blog.svg?branch=master)](https://travis-ci.org/mattr/spina_blog)

Blog module to add to Spina CMS.

## Usage

Just add the gem file and run the rake task to install the migrations... and then run the migrations, obviously.

This will add an extra section to the 'website' navigation.

### Justification

While blog posts are basically just pages, they are frequently date oriented. As such, maintaing a URL structure for them can quickly become tedious if manually creating the
containing pages. Of course, there's no reason you can't just do this with custom pages in Spina.

This solution allows you to define date-based pages within a namespace (e.g. `/news` or `/blog`).


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

There is a generator `spina_blog:install` which will set up the `spina_blog.rb` initalizer and copy the migrations. The initializer will allow you to register the namespace (or namespaces) you wish to use for blogging. For example, to register a `blog` section, you would have:
```ruby
# config/initializer/spina_blog.rb
::SpinaBlog::Blog.register do |blog|
  blog.name = "Blog"
  blog.namespace = "blog"
end
```

This will hijack any routes beginning with `/blog` on your site. If you are using Spina's navigation generation, you can create a regular page whose materialized path will be the same as the namespace. Due to the route hijacking, the content for this page will never be seen, instead directing to the root of your blog.

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