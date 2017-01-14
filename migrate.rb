require 'active_record'
require_relative 'db/migrate/create_posts'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/queue.db')

CreateItems.up
