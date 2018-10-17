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
    puts word_wrap( node['node_text'] )
    puts "\n#{ node['left_text'] }           #{ node['right_text'] }"
  end

  def self.display_item( item )
    self.clear
    puts "#{item['name']}     Value: #{item['value']}\n"
    puts word_wrap( item['legend'] )
  end

  private

    # borrowed from ActionView
    def self.word_wrap(text, line_width: 80, break_sequence: "\n")
      text.split("\n").collect! do |line|
        line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1#{break_sequence}").strip : line
      end * break_sequence
    end

end
