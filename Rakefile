# frozen_string_literal: true

RACK_ENV = ENV['RACK_ENV'].to_s

if RACK_ENV.empty? || RACK_ENV != 'production'
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new

  namespace :spec do
    desc 'Run all tests'
    task all: %w[rubocop:autocorrect unit acceptance]

    desc 'Run ci tests'
    task ci: ['rubocop', :unit]

    %w[unit acceptance].each do |type|
      desc "Run #{type} tests"
      RSpec::Core::RakeTask.new(type) do |t|
        t.pattern = "spec/#{type}/**/*_spec.rb"
      end
    end
  end
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

namespace :docker do
  desc 'Build the image'
  task :build do
    sh 'docker build -t suhlig/journal:latest .'
  end

  desc 'Publish the image'
  task push: [:build] do
    sh 'docker push suhlig/journal'
  end
end

task default: %w[rubocop spec:all]
