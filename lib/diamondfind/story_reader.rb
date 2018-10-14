require 'httparty'

class StoryReader
  @@prod_story_base = "https://www.christiandewolf.com/"
  @@dev_story_base  = "http://localhost:3000/"

  @@story_path = "woods/stories/1/"
  @@up_path    = "woods/stories/up.json"

  def initialize(prod = false)
    @story_url = (prod ? @@prod_story_base : @@dev_story_base) + @@story_path
    @up_url    = (prod ? @@prod_story_base : @@dev_story_base) + @@up_path
    @session = nil
  end

  # checks if the service is up
  def up
    response = HTTParty.get( @up_url )
    response.code == 200
  end

  def get_first_node
    response = HTTParty.get( @story_url + "play.json" )
    @session = response.headers['set-cookie']
    JSON.parse( response.body )
  end

  def move_to( target_node )
    response = HTTParty.get( @story_url + "move_to.json?target_node=#{ target_node }",
                             headers: {cookie: @session } )
    JSON.parse( response.body )
  end

end
