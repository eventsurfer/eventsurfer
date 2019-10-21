# frozen_string_literal: true

namespace :db do
  desc "DB drop, create, migrate, seed"
  task rebuild: :environment do
    p "drop databases"
    Rake::Task["db:drop"].invoke
    p "create databases"
    Rake::Task["db:create"].invoke
    p "migrate"
    Rake::Task["db:migrate"].invoke
    p "create data"
    Rake::Task["db:seed"].invoke
  end
end
