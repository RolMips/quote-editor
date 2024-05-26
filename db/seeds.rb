# frozen_string_literal: true

Rails.logger.debug "\n== Seeding the database with fixtures =="
system('bin/rails db:fixtures:load')
