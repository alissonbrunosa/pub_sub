require 'rake/testtask'
require 'rake'

Rake::TestTask.new do |t|
  t.libs << "../"
  t.test_files = FileList['tests/**/*_spec.rb']
  t.verbose = true
end