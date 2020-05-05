# -*- encoding: utf-8 -*-
# stub: csl-styles 1.0.1.10 ruby lib

Gem::Specification.new do |s|
  s.name = "csl-styles"
  s.version = "1.0.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sylvester Keil"]
  s.date = "2020-01-08"
  s.description = "\n    The official Citation Style Language (CSL) styles and locale files.\n    "
  s.email = ["http://sylvester.keil.or.at"]
  s.homepage = "https://github.com/inukshuk/csl-styles"
  s.licenses = ["CC-BY-SA-3.0"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "CSL styles and locales"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<csl>, ["~> 1.0"])
    else
      s.add_dependency(%q<csl>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<csl>, ["~> 1.0"])
  end
end
