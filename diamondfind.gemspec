Gem::Specification.new do |s|
  s.name         = 'diamondfind'
  s.version      = '0.2.0'
  s.date         = '2018-10-14'
  s.summary      = "Find diamonds on the command line!"
  s.description  = "A command-line client for Diamond Find."
  s.authors      = ["Christian DeWolf"]
  s.email        = 'me@christiandewolf.com'
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "*.md"]
  s.require_path = 'lib'
  s.homepage     = "https://www.diamondfind.ca/"
  s.executables  << 'diamondfind'
end
