local Map = require 'core/map'
local Util = require 'core/util'
function love.load()
  map = Map:new(40, 40) -- Create a 5 x 5 map object named "map"
  love.window.setMode(830, 640)
  x = 400
  y = 300
  playerImg = love.graphics.newImage('assets-1/monster/demons/blue_devil.png')
  cobalt = love.graphics.newImage('assets-1/dungeon/floor/black_cobalt_12.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/stone_2_dark0.png')
  door = love.graphics.newImage('assets-1/dungeon/doors/vgate_runed_middle.png')
  block = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  sword = love.graphics.newImage('assets-1/item/weapon/greatsword_3_new.png')
  ex = 100
  ey = 100
  dir = 'left'
  enemyhp = 500
  foundsword = false
  gotsword = false
  --dir = 'right'
  enemyImg = love.graphics.newImage('assets-1/monster/undead/shadow.png')
  w = 64
  h = 64
  hp = 100

  ax = 100
  ay = 100
  aimg = love.graphics.newImage('assets-2/spells/fire/fireball.png')

  --Creates the map
  template = { --a 13 x 10 map with the altar texture in the middle
   {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
   {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, block, cobalt, cobalt, block, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, block, cobalt, cobalt, block, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
   {door, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, block, cobalt, cobalt, block, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, block, cobalt, cobalt, block, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
   {wall, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, cobalt, wall},
   {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  }

 walls = { --a 12 x 9 map with the altar texture in the middle
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', block, 'nil', 'nil', block, 'nil', 'nil', wall},
  {wall, 'nil', 'nil', block, 'nil', 'nil', block, 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {door, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', block, 'nil', 'nil', block, 'nil', 'nil', wall},
  {wall, 'nil', 'nil', block, 'nil', 'nil', block, 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', wall},
  {wall, wall, wall, wall, wall, wall, wall, wall, wall, wall},
   }

  map = Map:new(template)
  collision = Map:new(walls)
end

--Moves character up, down, left, and right
function love.update(dt)
  if love.keyboard.isDown('right') and x < 815 then   -- if the 'up' key is being pressed...
    if collision:cc(x+4, y, 32, 32) == false then
      x = x + 4
    end
  end
  if love.keyboard.isDown('down') and y < 750 then   -- if the 'up' key is being pressed...
    if collision:cc(x, y+4, 32, 32) == false then
      y = y + 4
    end
  end
  if love.keyboard.isDown('left') and x > 60 then   -- if the 'up' key is being pressed...
    if collision:cc(x-4, y, 32, 32) == false then
      x = x - 4
    end
  end
  if love.keyboard.isDown('up') and y > 75 then   -- if the 'up' key is being pressed...
    if collision:cc(x, y-4, 32, 32) == false then
      y = y - 4
    end
  end

if cc(x, y, 64, 64, 190, 260, 64, 64) == true then
  foundsword = true
end

if cc(x, y, 64, 64, 190, 260, 64, 64) == false then
  foundsword = false
end

  --Moves enemy left & right
  
  --Enemy movement stuff
  -- ex = ex + 1

  --Enemy movement stuff
  -- if ex < 500 then
  --   ex = ex - 1
  -- end

  --enemy movement stuff
  --ey = ey - 1

  --Attack movement stuff
   --if ey < 500 then
  if collision:cc(ax, ay, 32, 32) then
   ay=ey 
   ax = ex
  else
    ay = ay + 5
  end
   if ay > 400 then
    ay = ey
    ax = ex
   end
   --end

  -- x, y, w, h all represent the player's rectangle. The other values are a rectangle in the upper corner
  if cc(x, y, w, h,   0, 0, 64, 64) then  
    -- if true, decrease HP:
    hp = hp + 1
  end

  if dir == 'left' then
    ex = ex - 1
  end
  if dir == 'right' then
    ex = ex + 1
  end

  --Changes left & right
  if ex < 70 then
    dir = 'right'
  end
  if ex > 735 then
    dir = 'left'
  end

 --enemyhp = enemyhp - 1
  if love.keyboard.isDown('escape') then
    love.exitModule();
  end
  if enemyhp < 0 then
    love.exitModule();
  end

  if cc(x, y, 64, 64,   ax, ay, 64, 64) then
    -- What happens when the fireball hits the player
  end
end



function love.draw()
  map:draw()
  collision:draw()
  love.graphics.print(enemyhp, 0, 0)
  love.graphics.draw(playerImg, x, y)
  love.graphics.draw(enemyImg, ex, ey)
  love.graphics.draw(aimg, ax, ay)
 if gotsword == false then
  love.graphics.draw(sword, 190, 260, 0, 2)
 end
  love.graphics.rectangle('line', 0, 0, 64, 64)
end

function love.keypressed(key)
  if key == 'space' then
    if foundsword == true and gotsword == false then
      gotsword = true
    end
  end
end