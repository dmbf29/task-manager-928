require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

# .find - test
# task = Task.find(1)
# puts "#{task.title} - #{task.description}"
# task = Task.find(100)
# puts task.nil?

# .save - test
# create
# p task = Task.new(title: 'Have a drink 🍻')
# task.save # Performing the CREATE action
# p task
# puts task.id

# update
# p task = Task.find(5)
# task.title = "Ask Adam to get me a 2nd beer"
# task.save
# puts task.title

# .all - test
# p tasks = Task.all
# tasks.each do |task|
#   puts puts "#{task.title} - #{task.description}"
# end

# .destroy
task = Task.find(5)
task.destroy

puts Task.find(5) == nil
