class Task
  attr_reader :id
  attr_accessor :title, :description, :done
  def initialize(attributes = {})
    @id = attributes[:id] || attributes['id']
    @title = attributes[:title] || attributes['title']
    @description = attributes[:description] || attributes['description']
    @done = attributes[:done] || attributes['done'] || false
  end

  def self.find(id)
    # query the data base for specific task
    result = DB.execute("SELECT * FROM tasks WHERE id = ?", id).first
    # this returns an array of hashes
    Task.new(result) if result
    # we want to grab the first hash in the array of hashes
    # we want an instance
  end

  def self.all
    results = DB.execute('SELECT * FROM tasks')
    results.map do |task_hash|
      Task.new(task_hash)
    end
  end

  def save
    id ? update : create
  end

  # task.destroy
  def destroy
    DB.execute('DELETE FROM tasks WHERE id = ?', id)
  end

  def self.destroy_all
    DB.execute('DELETE FROM tasks')
  end

  private

  def update
    DB.execute('UPDATE tasks SET title = ?, description = ? WHERE id = ?', title, description, id)
  end

  def create
    DB.execute("INSERT INTO tasks (title, description) VALUES (?, ?)", title, description)
    @id = DB.last_insert_row_id
  end
end
