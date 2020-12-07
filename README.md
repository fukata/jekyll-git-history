# Jekyll Git History 

This Jekyll plugin displays git histories.

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-git-history"
end
```

And then execute:

    $ bundle

Alternatively install the gem yourself as:

    $ gem install jekyll-git-history

and put this in your ``_config.yml`` 

```yaml
git_history:
  repo: 'YOUR GITHUB REPO ex) fukata/www.fukata.dev'
plugins: [jekyll-git-history]
 # This will require each of these gems automatically.
```

## Usage

```
 {% git_history %}
```