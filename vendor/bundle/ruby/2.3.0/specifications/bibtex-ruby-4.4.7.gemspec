# -*- encoding: utf-8 -*-
# stub: bibtex-ruby 4.4.7 ruby lib

Gem::Specification.new do |s|
  s.name = "bibtex-ruby"
  s.version = "4.4.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sylvester Keil"]
  s.date = "2018-06-01"
  s.description = "BibTeX-Ruby is the Rubyist's swiss-army-knife for all things BibTeX. It\nincludes a parser for all common BibTeX objects (@string, @preamble,\n@comment and regular entries) and a sophisticated name parser that\ntokenizes correctly formatted names; BibTeX-Ruby recognizes BibTeX string\nreplacements, joins values containing multiple strings or variables,\nsupports cross-references, and decodes common LaTeX formatting\ninstructions to unicode; if you are in a hurry, it also allows for easy\nexport/conversion to formats such as YAML, JSON, CSL, and XML (BibTeXML).\n"
  s.email = ["sylvester@keil.or.at"]
  s.homepage = "http://inukshuk.github.com/bibtex-ruby"
  s.licenses = ["GPL-3.0"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "A BibTeX parser, converter and API for Ruby."

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<latex-decode>, ["~> 0.0"])
    else
      s.add_dependency(%q<latex-decode>, ["~> 0.0"])
    end
  else
    s.add_dependency(%q<latex-decode>, ["~> 0.0"])
  end
end
