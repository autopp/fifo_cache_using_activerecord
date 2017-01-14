A toy program to learn how to implement a FIFO cache using ActiveRecord

```
$ bundle install
$ bundle exec ruby migrate.rb
$ bundle exec ruby cache.rb add copper silver gold curse
$ bundle exec ruby cache.rb show
copper
silver
gold
curse
4 item(s)

$ bundle exec ruby cache.rb add estate duchy province
$ bundle exec ruby cache.rb show
gold
curse
estate
duchy
province
5 item(s)
```
