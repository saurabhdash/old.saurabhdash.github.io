# -*- encoding: utf-8 -*-
# stub: jekyll-avatar 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-avatar"
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ben Balter"]
  s.date = "2019-08-12"
  s.email = ["ben.balter@github.com"]
  s.homepage = "https://github.com/benbalter/jekyll-avatar"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "A Jekyll plugin for rendering GitHub avatars"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>, ["< 5.0", ">= 3.0"])
      s.add_development_dependency(%q<bundler>, ["< 3.0", "> 1.0"])
      s.add_development_dependency(%q<rake>, ["~> 12.3"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-html-matchers>, ["~> 0.9"])
      s.add_development_dependency(%q<rubocop-jekyll>, ["~> 0.10.0"])
    else
      s.add_dependency(%q<jekyll>, ["< 5.0", ">= 3.0"])
      s.add_dependency(%q<bundler>, ["< 3.0", "> 1.0"])
      s.add_dependency(%q<rake>, ["~> 12.3"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rspec-html-matchers>, ["~> 0.9"])
      s.add_dependency(%q<rubocop-jekyll>, ["~> 0.10.0"])
    end
  else
    s.add_dependency(%q<jekyll>, ["< 5.0", ">= 3.0"])
    s.add_dependency(%q<bundler>, ["< 3.0", "> 1.0"])
    s.add_dependency(%q<rake>, ["~> 12.3"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rspec-html-matchers>, ["~> 0.9"])
    s.add_dependency(%q<rubocop-jekyll>, ["~> 0.10.0"])
  end
end
