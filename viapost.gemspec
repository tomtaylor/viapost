Gem::Specification.new do |s|
  s.name = %q{viapost}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Taylor"]
  s.date = %q{2009-01-18}
  s.description = %q{A Ruby library that wraps the Viapost SOAP API, providing an easy way of sending post (you know, real letter box post) from your applications.  The author, Tom Taylor, has no affiliation with Viapost other than thinking it's a useful service.}
  s.email = ["tom@tomtaylor.co.uk"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "documentation/ViaPostCustomer API v1.1.pdf", "lib/viapost.rb", "lib/viapost/interface.rb", "lib/viapost/letter.rb", "script/console", "script/destroy", "script/generate", "spec/spec.opts", "spec/spec_helper.rb", "spec/viapost/interface_spec.rb", "spec/viapost_spec.rb", "tasks/rspec.rake", "viapost.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://tomtaylor.co.uk/projects/viapost}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{viapost}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Ruby library that wraps the Viapost SOAP API, providing an easy way of sending post (you know, real letter box post) from your applications}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<soap4r>, [">= 1.5.8"])
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<soap4r>, [">= 1.5.8"])
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<soap4r>, [">= 1.5.8"])
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
