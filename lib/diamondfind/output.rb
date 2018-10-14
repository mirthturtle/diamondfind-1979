class Output

	def self.title
    puts "\n\nwolfOS presents:"
    puts "DIAMOND FIND\n\n"
	end

  def self.clear
    system("clear")
  end

  def self.api_down
    puts "API cannot be reached. Check your connection and please try again later."
  end

  def self.exiting
    puts "Exiting game..."
  end

  def self.press_any_key
    puts "\nPRESS ANY KEY\n"
  end

  def self.display_node( node )
    self.clear
    puts node['node_text']
    puts "\n#{ node['left_text'] }      #{ node['right_text'] }"
  end

  def self.display_item( item )
    self.clear
    puts "#{item['name']}     Value: #{item['value']}\n"
    puts item['legend']
  end

end
