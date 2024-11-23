require 'gosu'

class Player
  def initialize(width,height)
    @image = Gosu::Image.new("Assets/Images/player.png")
    @game_width = width
    @game_height = height
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @highest_score = 0
    @score = 0
  end

  def turn_action(turn_angle)
    @angle = turn_angle
  end

  def draw(width,height)
    @image.draw_rot((@game_width/2).to_f().ceil, (@game_height/2).to_f().ceil, 1, @angle)
  end
end