# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rubocop/rake_task'
RuboCop::RakeTask.new

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

task default: 'ci'

desc 'Run ci tests'
task ci: ['rubocop', :spec]

desc 'Run tests'
RSpec::Core::RakeTask.new
