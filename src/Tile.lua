--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{__includes = Particles}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
    self.points = variety * 50

    self.special = false
    self.shiny =  math.random(1, 20) == 1
    self.horizontalMatch = false
    self.verticalMatch = false

    if self.shiny then
      self:initParticles()
    end
end


function Tile:update(dt)
  if self.shiny then
      self:hitParticles(1, 1)
      self:updateParticles(dt)
  end
end

function Tile:render(x, y)

    if self.special then
        -- draw shadow
        love.graphics.setColor(34, 32, 52, 255)
        love.graphics.draw(gTextures['special-tiles'], gFrames['specialTiles'][1][1],
            self.x + x + 2, self.y + y + 2)

        -- draw tile itself
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(gTextures['special-tiles'], gFrames['specialTiles'][1][1],
            self.x + x, self.y + y)
    else    
        -- draw shadow
        love.graphics.setColor(34, 32, 52, 255)
        love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
            self.x + x + 2, self.y + y + 2)

        -- draw tile itself
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
            self.x + x, self.y + y)
    end
end

function Tile:drawTile(x, y)
  if self.shiny then
      self:draw(x, y)
  end
end