user = User.find_or_create_by!(email: "user@example.com") do |u|
  u.name = "Joe"
  u.password = "password"
end

links = [
  {
    title: "Bootstrap",
    url: "https://getbootstrap.com",
    description: "The most popular CSS framework for developing responsive, mobile-first websites.",
    tags: %w[css frontend]
  },
  {
    title: "Stimulus",
    url: "https://stimulus.hotwired.dev",
    description: "A modest JavaScript framework for the HTML you already have.",
    tags: %w[rails hotwire frontend javascript]
  },
  {
    title: "Pragmatic Programmers",
    url: "https://pragprog.com",
    description: "Publisher of practical books for software developers.",
    tags: %w[books learning]
  },
  {
    title: "Hotwire",
    url: "https://hotwired.dev",
    description: "HTML over the wire. An alternative approach to building modern web applications without much JavaScript.",
    tags: %w[rails hotwire frontend]
  },
  {
    title: "Hacker News",
    url: "https://news.ycombinator.com",
    description: "Social news for programmers and startup founders.",
    tags: %w[news community]
  },
  {
    title: "iOS Dev Weekly",
    url: "https://iosdevweekly.com",
    description: "A hand-picked round-up of the best iOS development links every week.",
    tags: %w[ios newsletter]
  },
  {
    title: "Ruby on Rails",
    url: "https://rubyonrails.org",
    description: "A web-app framework that includes everything needed to create database-backed web applications.",
    tags: %w[ruby rails framework]
  },
  {
    title: "Joe Masilotti",
    url: "https://newsletter.masilotti.com",
    description: "Helping Rails developers ship iOS and Android apps.",
    tags: %w[rails hotwire mobile newsletter]
  }
]

links.each do |attrs|
  link = user.links.find_or_create_by!(title: attrs[:title]) do |l|
    l.url = attrs[:url]
    l.description = attrs[:description]
  end

  attrs[:tags].each do |tag_name|
    tag = Tag.find_or_create_by!(name: tag_name)
    LinkTag.find_or_create_by!(link: link, tag: tag)
  end
end
