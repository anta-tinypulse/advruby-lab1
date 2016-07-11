class Todo
  def initialize
    @title = "Todo"
    @items  = ["Decide supervisor and driver roles", "Implement Milestone 1"]
  end
end

class HtmlTodo < Todo
  def display
    str = "<html>
      <head>
        <title>#{@title}</title>
      </head>
      <body>
        <ul>\n"

    @items.each do |item|
      str << "          <li>#{item}</li>\n"
    end

    str << "        </ul>
      <body>
    </html>"
    puts str
  end
end

class PlainTodo < Todo
  def display
    str = "*** Todo ***\n"

    @items.each do |item|
      str << "- #{item}\n"
    end

    puts str
  end
end

# Pros:
# - no need for if else
# - seperate the logic into subclasses
# - when we need to add one more case, just need to add a class, no need to change existing classes
# Cons:
# - lengthier
#
#