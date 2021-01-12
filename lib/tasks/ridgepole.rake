namespace :ridgepole do
  desc 'Apply database schema'
  task apply: :environment do
    ActiveRecord::Schema.enable_extension(:pgcrypto)
    ridgepole('--apply', "--file #{schema_file}")
    Rake::Task['db:schema:dump'].invoke
  end

  desc 'Export database schema'
  task export: :environment do
    ridgepole('--export', "--output #{schema_file}")
  end

  private

  def schema_file
    Rails.root.join('db/Schemafile')
  end

  def config_file
    Rails.root.join('config/database.yml')
  end

  def ridgepole(*options)
    command = [
      'bundle exec ridgepole',
      "--config #{config_file}",
      '--dump-with-default-fk-name',
      '--allow-pk-change',
      "--env #{ENV['RAILS_ENV']}"
    ]
    system [command + options].join(' ')
  end
end
