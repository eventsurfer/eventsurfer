require 'rdoc/task'

RDoc::Task.new :rdoc_dev do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.exclude("README.rdoc", "lib   /*.rb", "vendor/*", "tmp/*","coverage/*")
end