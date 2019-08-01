#x,y = width & height of field

def draw(x,y, pos_x, pos_y, current_direction, display_field)
    pos_x = pos_x.to_i
    pos_y = pos_y.to_i

    if display_field
    (0..x).each {|i|
        subStr = ''
        (0..y).each {|j|
            if (i == pos_y && j == pos_x)
                subStr += 'X'
            else
                subStr += '*'
            end
        }
        puts subStr
    }
    end
    
    #### validFunc ####

    def checkMoveValidity(x, y, new_pos_x, new_pos_y, cd)
        case cd
        when 'UP'
            new_pos_y -= 1
        when 'DOWN'
            new_pos_y +=1
        when 'LEFT'
            new_pos_x -= 1
        when 'RIGHT'
            new_pos_x += 1
        end

        if (new_pos_x < 0 || new_pos_y < 0 || new_pos_x-1 > x || new_pos_y-1 > y)
            {
                :bool => false
            }
        else
            {
                :bool => true,
                :x => new_pos_x,
                :y => new_pos_y
            }
        end
    end

    #### ######### ####

    input = gets.chomp

    if input[0..4] == 'PLACE'
        indexes = input[-3..-1].split(' ')
        draw(x, y, indexes[0], indexes[1], current_direction, true)
    elsif input == 'LEFT'
        if current_direction == 'DOWN'
            current_direction = 'RIGHT'
        elsif 
            current_direction == 'RIGHT'
            current_direction = 'UP'
        elsif 
            current_direction == 'UP'
            current_direction = 'LEFT'
        elsif
            current_direction == 'LEFT'
            current_direction = 'DOWN'
        end
        draw(x, y, pos_x, pos_y, current_direction, false)
    elsif input == 'RIGHT'
        if current_direction == 'DOWN'
            current_direction = 'LEFT'
        elsif
            current_direction == 'LEFT'
            current_direction = 'UP'
        elsif
            current_direction == 'UP'
            current_direction = 'RIGHT'
        elsif
            current_direction == 'RIGHT'
            current_direction = 'DOWN'
        end
        draw(x, y, pos_x, pos_y, current_direction, false)
    elsif  input == 'MOVE'
        move_info = checkMoveValidity(x, y, pos_x, pos_y, current_direction)
        if move_info[:bool]
            draw(x, y, move_info[:x], move_info[:y], current_direction, true)
        else
            puts 'It\'s dangerous move! Try some other direction!'
            draw(x, y, pos_x, pos_y, current_direction, false)
        end
    elsif
        input == 'REPORT'
        puts "Robot's location: x = #{pos_x} | y = #{pos_y}"
        draw(x, y, pos_x, pos_y, current_direction, false)
    else 
        puts "Enter correct command, please!(e.g > PLACE x y | LEFT | RIGHT | MOVE | REPORT"
        draw(x, y, pos_x, pos_y, current_direction, false)
    end
end

draw(5,6,-1,-1, 'DOWN', true)