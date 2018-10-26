require 'colorize'

class Output

	def self.title
    d_col = random_colour
    f_col = random_colour
    puts "wolfOS presents:\n\n"
    puts ' ____ ___    _    __  __  ___  _   _ ____  '.colorize(d_col) + '  _____ ___ _   _ ____  '.colorize(f_col) + "\n"
    puts '|  _ \_ _|  / \  |  \/  |/ _ \| \ | |  _ \ '.colorize(d_col) + ' |  ___|_ _| \ | |  _ \ '.colorize(f_col) + "\n"
    puts '| | | | |  / _ \ | |\/| | | | |  \| | | | |'.colorize(d_col) + ' | |_   | ||  \| | | | |'.colorize(f_col) + "\n"
    puts '| |_| | | / ___ \| |  | | |_| | |\  | |_| |'.colorize(d_col) + ' |  _|  | || |\  | |_| |'.colorize(f_col) + "\n"
    puts '|____/___/_/   \_\_|  |_|\___/|_| \_|____/ '.colorize(d_col) + ' |_|   |___|_| \_|____/ '.colorize(f_col) + "\n"
    puts "                                                       THE CON JOB\n\n"
    puts "A mini-sequel to the original diamond-finding adventure, DIAMOND FIND\n"
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
    puts "\nPRESS ANY BUTTON\n".colorize( random_colour )
  end

  def self.display_node( node )
    self.clear
    puts word_wrap( node['node_text'] ).gsub('—', '--')
    puts "\n\n\n#{ node['left_text'] }".colorize( random_colour ) + "                #{ node['right_text'] }".colorize( random_colour )
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
      colours = [:red, :light_red, :green, :light_green, :yellow, :light_yellow, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan]
      colours[ Random.new.rand(colours.length) ]
    end

end
