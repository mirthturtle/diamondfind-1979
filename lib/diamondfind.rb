#!/usr/bin/ruby
# DIAMOND FIND 1979

require_relative 'diamondfind/input'
require_relative 'diamondfind/output'
require_relative 'diamondfind/story_reader'

class DiamondFind

  def self.start_game
    Output.clear

    # Choose DF version to play
    Output.please_choose_df
    input = Input.get

    while ![Input.classic, Input.con].include?( input )
      input = Input.get
    end
    Output.clear

    if input == Input.classic
      Output.orig_title
      reader = StoryReader.new(true)
    else
      Output.con_title
      reader = StoryReader.new(false)
    end

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

      input = Input.get

      # Main Game Loop
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
            if Input.left.include?( input )
              current_node = reader.move_to( current_node['left_link'] )
            elsif Input.right.include?( input )
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
    else
      Output.api_down
    end

  end

end
