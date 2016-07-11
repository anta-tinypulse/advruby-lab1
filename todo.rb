class Todo
  def initialize
    @title = "Todo"
    @items  = ["Decide supervisor and driver roles", "Implement Milestone 1"]
  end

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
