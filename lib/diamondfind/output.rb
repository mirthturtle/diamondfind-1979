require 'colorize'

class Output

	def self.title
    puts "\n\nwolfOS presents:\n"
    puts "DIAMOND FIND: The Con Job\n\n"
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
    puts "\n\nPRESS ANY KEY\n".colorize( random_colour )
  end

  def self.display_node( node )
    self.clear
    puts word_wrap( node['node_text'] )
    puts "\n\n\n#{ node['left_text'] }".colorize( random_colour ) + "           #{ node['right_text'] }".colorize( random_colour )
  end

  def self.display_item( item )
    self.clear
    puts "#{item['name']}         #{ item['value'] > 0 ? ("Value: " + item['value'].to_s) : "" }\n\n"
    puts word_wrap( item['legend'] )
  end

  private

    # borrowed from ActionView
    def self.word_wrap(text, line_width: 80, break_sequence: "\n")
      text.split("\n").collect! do |line|
        line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1#{break_sequence}").strip : line
      end * break_sequence
    end

    def self.random_colour
      colours = [:red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan]
      colours[ Random.new.rand(colours.length) ]
    end

end
