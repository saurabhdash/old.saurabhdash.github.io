# -*- encoding: utf-8 -*-
# stub: csl 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "csl"
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sylvester Keil"]
  s.date = "2020-01-07"
  s.description = "A Ruby parser and full API for the Citation Style Language (CSL),\nan open XML-based language to describe the formatting of citations\nand bibliographies.\n"
  s.email = ["http://sylvester.keil.or.at"]
  s.homepage = "https://github.com/inukshuk/csl-ruby"
  s.licenses = ["AGPL-3.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2")
  s.rubygems_version = "2.5.2.1"
  s.summary = "A Ruby CSL parser and library"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<namae>, ["~> 1.0"])
    else
      s.add_dependency(%q<namae>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<namae>, ["~> 1.0"])
  end
end
