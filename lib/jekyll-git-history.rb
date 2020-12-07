require 'jekyll'
require 'jekyll-git-history/version'
class GitHistory < Liquid::Tag

  def initialize(tag_name, text, tokens)
    super
    @text = text
  end

  def render(context)
    site = context.registers[:site].config

    # Get git histories by git command
    filepath = context.registers[:page]["path"]
    cmd = "git log --format='%h %cI %s' #{filepath}"
    output = `#{cmd}`

    commit_page_url = nil
    if site['git_history'] && site['git_history']['repo']
      repo = site['git_history']['repo']
      # TODO: Support another services
      commit_page_url = "https://github.com/#{repo}/commit/" 
    end

    inner_html_list = [] 
    output.split("\n").each do |line|
      line.strip!

      # Convert short hash to link
      if commit_page_url && commit_page_url.size > 0
        line = line.gsub(/^([0-9a-z]{7})/) { %Q{<a href="#{commit_page_url}#{$1}">#{$1}</a>} }
      end

      inner_html_list.push(%Q{<li class="git-history">#{line}</li>})
    end

    <<"HTML"
<ul class="git-histories">
  #{inner_html_list.join("\n")}
</ul>
HTML
  end

  Liquid::Template.register_tag "git_history", self
end
