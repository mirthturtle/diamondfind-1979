#!/usr/bin/ruby
# DIAMOND FIND 1979

require_relative 'diamondfind/input'
require_relative 'diamondfind/output'
require_relative 'diamondfind/story_reader'

class DiamondFind

  def self.start_game
    Output.clear
    Output.title

    reader = StoryReader.new
    items = []
    pop_item = false
    total_score = 0

    if reader.up
      Output.press_any_key
      input = Input.get

      # show first node
      current_node = reader.get_first_node['node']
      Output.display_node( current_node )
      Output.press_any_key

      current_node = reader.move_to( current_node['linked_node'] )

      # Main Game Loop
      input = Input.get
      while ![Input.break, Input.reset].include?( input )

        if pop_item
          # display the item and make sure a node is displayed next
          pop_item = false
          Output.display_item( items[items.size - 1] )
          Output.press_any_key
        else
          # determine and display next current node
          if current_node['linked_node']
            current_node = reader.move_to( current_node['linked_node'] )
            Output.display_node( current_node )
          else
            # move to appropriate node
            if input == Input.left
              current_node = reader.move_to( current_node['left_link'] )
            elsif input == Input.right
              current_node = reader.move_to( current_node['right_link'] )
            end
            Output.display_node( current_node )
          end
          Output.press_any_key if current_node['linked_node']

          # if you found an item, make sure it's displayed next
          if current_node['item_found']
            pop_item = true
            items << current_node['item_found']
            total_score += current_node['item_found']['value']
          end
        end

        input = Input.get
      end

      Output.clear
      Output.exiting
    else
      Output.api_down
    end

    exit
  end

end
