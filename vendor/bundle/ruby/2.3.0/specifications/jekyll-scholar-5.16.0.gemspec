# -*- encoding: utf-8 -*-
# stub: jekyll-scholar 5.16.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-scholar"
  s.version = "5.16.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sylvester Keil"]
  s.date = "2019-08-07"
  s.description = " Jekyll-Scholar is for all the academic bloggers out there. It is a set of extensions for Jekyll the awesome, blog aware, static site generator; it formats your BibTeX bibliographies for the web using CSL citation styles and generally gives your blog posts citation super-powers.' "
  s.email = "http://sylvester.keil.or.at"
  s.homepage = "http://github.com/inukshuk/jekyll-scholar"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "Jekyll extensions for the academic blogger."

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>, ["~> 3.0"])
      s.add_runtime_dependency(%q<citeproc-ruby>, ["~> 1.0"])
      s.add_runtime_dependency(%q<csl-styles>, ["~> 1.0"])
      s.add_runtime_dependency(%q<bibtex-ruby>, [">= 4.0.13", "~> 4.0"])
    else
      s.add_dependency(%q<jekyll>, ["~> 3.0"])
      s.add_dependency(%q<citeproc-ruby>, ["~> 1.0"])
      s.add_dependency(%q<csl-styles>, ["~> 1.0"])
      s.add_dependency(%q<bibtex-ruby>, [">= 4.0.13", "~> 4.0"])
    end
  else
    s.add_dependency(%q<jekyll>, ["~> 3.0"])
    s.add_dependency(%q<citeproc-ruby>, ["~> 1.0"])
    s.add_dependency(%q<csl-styles>, ["~> 1.0"])
    s.add_dependency(%q<bibtex-ruby>, [">= 4.0.13", "~> 4.0"])
  end
end
