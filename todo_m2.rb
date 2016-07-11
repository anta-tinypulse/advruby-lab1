class Todo
  def initialize
    @title = "Todo"
    @items  = ["Decide supervisor and driver roles", "Implement Milestone 1"]
  end

  def display(type)
    if type == :html
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
    elsif type = :plain
      str = "*** Todo ***\n"

      @items.each do |item|
        str << "- #{item}\n"
      end
    end

    puts str
  end
end
