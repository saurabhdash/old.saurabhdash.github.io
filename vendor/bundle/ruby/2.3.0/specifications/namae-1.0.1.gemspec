# -*- encoding: utf-8 -*-
# stub: namae 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "namae"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sylvester Keil", "Dan Collis-Puro"]
  s.date = "2018-01-08"
  s.description = " Namae (\u{540d}\u{524d}) is a parser for human names. It recognizes personal names of various cultural backgrounds and tries to split them into their component parts (e.g., given and family names, honorifics etc.). "
  s.email = ["sylvester@keil.or.at", "dan@collispuro.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "https://github.com/berkmancenter/namae"
  s.licenses = ["AGPL-3.0"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "Namae (\u{540d}\u{524d}) parses personal names and splits them into their component parts."

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<racc>, ["~> 1.4"])
    else
      s.add_dependency(%q<racc>, ["~> 1.4"])
    end
  else
    s.add_dependency(%q<racc>, ["~> 1.4"])
  end
end
