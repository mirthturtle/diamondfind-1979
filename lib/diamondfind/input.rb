class Input

  def self.break; "q" end
  def self.reset; "r" end
  def self.left;  ["7", "z"] end
  def self.right; ["-", "x"] end

  def self.classic; "1" end
  def self.con; "2" end


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
