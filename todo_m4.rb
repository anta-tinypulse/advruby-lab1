class Todo
  def initialize(formatter)
  	@formatter = formatter
    @title = "Todo"
    @items  = ["Decide supervisor and driver roles", "Implement Milestone 1"]
  end

  def display
	@formatter.display(@title, @items)
  end
end


class Formatter
  def display(title, items)
    raise "TO BE IMPLEMENTED"
  end
end

class HtmlFormatter < Formatter
  def display(title, items)
    str = "<html>
      <head>
        <title>#{title}</title>
      </head>
      <body>
        <ul>\n"

    items.each do |item|
      str << "          <li>#{item}</li>\n"
    end

    str << "        </ul>
      <body>
    </html>"

    puts str
  end
end

class PlainTextFormatter < Formatter
  def display(title, items)
    str = "*** #{title} ***\n"

    items.each do |item|
      str << "- #{item}\n"
    end

    puts str
  end
 
end