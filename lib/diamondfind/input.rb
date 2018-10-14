class Input

  def self.break; "q" end
  def self.reset; "r" end
  def self.left;  "4" end
  def self.right; "6" end

  def self.get  # Get single character input
    begin
      system("stty raw -echo")
      str = STDIN.getc
    ensure
      system("stty -raw echo")
    end
    str
  end

end
