--Take the same system that as used in breakout CS50

Particles = Class{}

paletteColors = {
  [1] = { ['r'] = 255, ['g'] = 255, ['b'] = 255 },
  [2] = { ['r'] = 144, ['g'] = 214, ['b'] = 167 },
  [3] = { ['r'] = 42, ['g'] = 144, ['b'] = 64 },
  [4] = { ['r'] = 32, ['g'] = 70, ['b'] = 80 },
  [5] = { ['r'] = 68, ['g'] = 111, ['b'] = 146 },
  [6] = { ['r'] = 24, ['g'] = 65, ['b'] = 124 },
  [7] = { ['r'] = 80, ['g'] = 142, ['b'] = 255 },
  [8] = { ['r'] = 73, ['g'] = 124, ['b'] = 70 }}

function Particles:initParticles()
    self.psystem = love.graphics.newParticleSystem(gTextures['particle'], 11)

    self.width = gTextures['particle']:getWidth()
    self.height = gTextures['particle']:getHeight()

    self.psystem:setParticleLifetime(0.5, 1) -- (from, to) seconds
    self.psystem:setLinearAcceleration(-4, -4, 4, 4) --aceleracion en (x1, y1, x2, y2)
    self.psystem:setEmissionArea('normal', 2, 2)
end

function Particles:hitParticles(tier, color)
    self.psystem:setColors(
        paletteColors[color].r / 255,
        paletteColors[color].g / 255,
        paletteColors[color].b / 255,
        ((100 * (tier + 1)) / 255),
        paletteColors[color].r / 255,
        paletteColors[color].g / 255,
        paletteColors[color].b / 255,
        0)
        
    self.psystem:emit(5)
end

function Particles:updateParticles(dt)
    self.psystem:update(dt)
end

function Particles:draw(x, y)
    love.graphics.draw(self.psystem, self.x + x + 16, self.y + y + 16)
end