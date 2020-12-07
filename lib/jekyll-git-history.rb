require 'jekyll'
require 'jekyll-git-history/version'
class GitHistory < Liquid::Tag

  def initialize(tag_name, text, tokens)
    super
    @text = text
  end

  def render(content)
  end

  Liquid::Template.register_tag "git_history", self
end
