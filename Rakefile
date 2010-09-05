# encoding: UTF-8
require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rake/testtask'
require File.join(File.dirname(__FILE__), 'lib', 'devise_couch', 'version')

desc 'Default: run tests for all CouchDB ORM setups.'
task :default => :pre_commit

desc 'Run Devise tests for all CouchDB ORM setups.'
task :pre_commit do
  Dir[File.join(File.dirname(__FILE__), 'test', 'orm', '*.rb')].each do |file|
    orm = File.basename(file).split(".").first
    ENV['DEVISE_PATH'] ||= File.expand_path('../devise')
    system "rake test DEVISE_ORM=#{orm} DEVISE_PATH=#{ENV['DEVISE_PATH']}"
  end
end

desc 'Run Devise tests using CouchDB. Specify path to devise with DEVISE_PATH'
Rake::TestTask.new(:test) do |test|
  ENV['DEVISE_ORM'] ||= 'couchrest_model'
  ENV['DEVISE_PATH'] ||= File.expand_path('./')
  unless File.exist?(ENV['DEVISE_PATH'])
    puts "Specify the path to devise (e.g. rake DEVISE_PATH=/path/to/devise). Not found at #{ENV['DEVISE_PATH']}"
    exit
  end
  test.libs << 'lib' << 'test'
  test.libs << "#{ENV['DEVISE_PATH']}/lib"
  test.libs << "#{ENV['DEVISE_PATH']}/test"
  test.test_files = FileList["#{ENV['DEVISE_PATH']}/test/**/*_test.rb"] + FileList['test/**/*_test.rb']
  test.verbose = true
end

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'DeviseCouch'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

spec = Gem::Specification.new do |s|
  s.name = "devise_couch"
  s.summary = "CouchDB integration for Devise framework."
  s.description = "CouchDB integration for Devise framework."
  s.files =  FileList["[A-Z]*", "{app,config,lib}/**/*"]
  s.version = CouchrestModel::Devise::VERSION.dup
  s.email = "sbertel@mobithought.com"
  s.homepage = "http://github.com/shenoudab/devise_couch"
  s.author = 'Shenouda Bertel'
end

Rake::GemPackageTask.new(spec) do |pkg|
end

desc "Install the gem #{spec.name}-#{spec.version}.gem"
task :install do
  system("gem install pkg/#{spec.name}-#{spec.version}.gem --no-ri --no-rdoc")
end