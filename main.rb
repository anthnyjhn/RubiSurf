require 'gosu'
require_relative 'player.rb'

class RubiSurf < Gosu::Window
  def initialize()
    super(680, 420)
    self.caption = "RubiSurf"
    
    @player = Player.new(width,height)

    @background_image = Gosu::Image.new("Assets/Images/waves.png", :tileable => true)
  end

  

  def update()
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_action(45) 
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_action(-45)
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @player.turn_action(0)
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @player.turn_action(180)
    end
  end

  def draw()
    image_width = @background_image.width
    image_height = @background_image.height

    num_tiles_x = (width / image_width.to_f).ceil
    num_tiles_y = (height / image_height.to_f).ceil

    for x in 0..num_tiles_x
      for y in 0..num_tiles_y 
        @background_image.draw(x * image_width, y * image_height, 0)
      end
    end

    @player.draw(width,height)

  end

end

RubiSurf.new().show()