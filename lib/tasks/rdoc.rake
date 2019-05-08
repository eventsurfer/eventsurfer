# frozen_string_literal: true

require "rdoc/task"

RDoc::Task.new :rdoc_dev do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("lib   /*.rb", "app/*", "test/*.rb")
end
