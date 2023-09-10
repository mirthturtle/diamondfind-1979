Gem::Specification.new do |s|
  s.name         = 'diamondfind'
  s.version      = '0.3.0'
  s.date         = '2013-09-10'
  s.summary      = "Find diamonds on the command line!"
  s.description  = "A command-line client for Diamond Find."
  s.authors      = ["Mirth Turtle Media"]
  s.email        = 'christian@mirthturtle.com'
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "*.md"]
  s.require_path = 'lib'
  s.homepage     = "https://www.diamondfind.ca/"
  s.executables  << 'diamondfind'
end
