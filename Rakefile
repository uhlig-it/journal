# frozen_string_literal: true

namespace :dev do
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
  RSpec::Core::RakeTask.new
end

namespace :db do
  require 'sequel'

  desc 'Run database migrations'
  task :migrate, [:version] do |_, args|
    Sequel.extension :migration

    if args[:version].nil?
      puts 'Migrating to latest'
      Sequel::Migrator.run(db, File.join(__dir__, 'db/migrations'))
    else
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(
        db,
        File.join(__dir__, 'db/migrations'),
        target: args[:version].to_i
      )
    end
  end

  def db
    @db ||= Sequel.connect(ENV.fetch('DB'))
  end
end

task default: ['dev:rubocop', 'dev:spec']
