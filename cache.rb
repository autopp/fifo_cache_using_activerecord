require 'active_record'
require 'english'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/queue.db')

class Item < ActiveRecord::Base
  CACHE_SIZE = 5

  after_create do
    diff = Item.count - CACHE_SIZE
    Item.limit(diff).order(:created_at).each(&:destroy!) if diff > 0
  end
end

def add(texts)
  Item.transaction do
    texts.each do |text|
      Item.create!(text: text)
    end
  end
end

def show
  Item.all.each do |item|
    puts item.text
  end
  puts "#{Item.count} item(s)"
end

def clear
  Item.destroy_all
end

case ARGV.first
when 'add'
  add(ARGV.drop(1))
when 'show'
  show
when 'clear'
  clear
else
  $stderr.puts "Usage: #{$PROGRAM_NAME} [add|show|clear]"
end
