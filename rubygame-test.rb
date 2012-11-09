require 'rubygame'

include Rubygame

class Sprite
  def Sprite.load_spritesheet name
    Surface.load("spritesheets/" + name + ".png")
  end

  include Sprites::Sprite

  def initialize name, width, frames_number
    super()

    @spritesheet = Sprite.load_spritesheet name
    
    @frames = []
    
    frames_number.times do |i|
      frame = Surface.new [width, @spritesheet.h], @spritesheet.depth
      @spritesheet.blit frame, [0,0], [width * i, 0, width, @spritesheet.h]
      @frames.push frame
    end

    @image = @frames[0]
    @rect = @image.make_rect
  end
end
