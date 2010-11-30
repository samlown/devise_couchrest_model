# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'devise_couchrest_model'
 
Gem::Specification.new do |s|
  s.name    = "devise_couchrest_model"
  s.summary = "CouchDB integration for Devise framework"
  s.description = "CouchDB integration for Devise authentication framework"
  s.version = DeviseCouchrestModel::VERSION
  s.email = "sbertel@mobithought.com"
  s.homepage = "http://github.com/shenoudab/devise_couch"
  s.author = 'Shenouda Bertel'
  s.files        = Dir.glob("{lib,test}/**/*") + %w(MIT-LICENSE README.markdown Gemfile Rakefile devise_couchrest_model.gemspec)
  s.require_path = 'lib'
end
