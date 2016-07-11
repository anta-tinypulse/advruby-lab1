class Todo
  def initialize (&formatter)
    @title = "Todo"
    @items  = ["Decide supervisor and driver roles", "Implement Milestone 1"]

    @formatter = formatter
  end

  def display
    @formatter.call(self)
  end

  attr_accessor :title, :items
end

class HtmlTodo
  def display
    todo = Todo.new do |context|
      str = "<html>
      <head>
        <title>#{context.title}</title>
      </head>
      <body>
        <ul>\n"

      context.items.each do |item|
        str << "          <li>#{item}</li>\n"
      end

      str << "        </ul>
      <body>
    </html>"
      puts str
    end

    todo.display
  end
end

class PlainTodo
  def display
    todo = Todo.new do |context|
      str = "*** #{context.title} ***\n"

      context.items.each do |item|
        str << "- #{item}\n"
      end

      puts str
    end

    todo.display
  end
end