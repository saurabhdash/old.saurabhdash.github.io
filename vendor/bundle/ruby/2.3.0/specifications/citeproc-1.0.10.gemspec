# -*- encoding: utf-8 -*-
# stub: citeproc 1.0.10 ruby lib

Gem::Specification.new do |s|
  s.name = "citeproc"
  s.version = "1.0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sylvester Keil"]
  s.date = "2020-01-07"
  s.description = "A cite processor interface for Citation Style Language (CSL) styles."
  s.email = ["sylvester@keil.or.at"]
  s.homepage = "https://github.com/inukshuk/citeproc"
  s.licenses = ["AGPL-3.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3")
  s.rubygems_version = "2.5.2.1"
  s.summary = "A cite processor interface."

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
