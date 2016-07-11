class Task
  attr_reader :name
  def initialize(name)
    @name = name
  end

  # an empty default for a subclass to implement
  def get_time_required
    0 # number of minutes
  end

  def total_number_basic_tasks
    1
  end
end

class ReadingTask < Task
  def initialize
    super('Read the task out loud')
  end

  def get_time_required
    1
  end
end

class CodingTask < Task
  def initialize
    super('Coding')
  end

  def get_time_required
    15
  end
end

class ProofingTask < Task
  def initialize
    super("Double check to make sure things look good")
  end

  def get_time_required
    5
  end
end

class CompositeTask < Task
  def initialize
    super('Milestone')
    @sub_tasks = []
  end

  def total_number_basic_tasks
    @sub_tasks.inject(0) {|sum, t| sum + t.total_number_basic_tasks}
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    # Calculate based on the time taken for sub tasks
    @sub_tasks.inject(0){|sum, t| sum + t.get_time_required }
  end

  def <<(task)
    add_sub_task(task)
  end

  def [](index)
    @sub_tasks[index]
  end
end

class MilestoneTask < CompositeTask
  def initialize
    super
    add_sub_task ReadingTask.new
    add_sub_task CodingTask.new
    add_sub_task ProofingTask.new
  end
end

task = MilestoneTask.new
puts task.get_time_required
