require 'active_record'
require_relative 'db/migrate/create_items'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/queue.db')

CreateItems.up
