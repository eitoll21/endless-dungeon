local Map = require 'core/map'
function love.load()
collide = false
collide2 = false
collide3 = false
col = 1
  x = 385
  y = 60
  w = 38
  h = 60
  x2 = 730
  y2 = 68
  w2 = 64
  h2 = 64
  hp = 100
  playerImg = love.graphics.newImage('assets-1/player/base/gargoyle_male.png')

  floor = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_2.png')
  floor1 = love.graphics.newImage('assets-1/dungeon/floor/cobble_blood_12.png')
  lava = love.graphics.newImage('assets-2/dc-dngn/floor/lava0.png')
  wall = love.graphics.newImage('assets-1/dungeon/wall/catacombs_0.png')
  banner = love.graphics.newImage('assets-1/dungeon/wall/catacombs_1.png')
  wall1 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_3.png')
  wall2 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_7.png')
  wall3 = love.graphics.newImage('assets-1/dungeon/wall/catacombs_5.png')
  wall_enter = love.graphics.newImage('assets-1/dungeon/wall/catacombs_12.png')
  

    template = { 
      {wall, wall1, wall3, wall1, wall3, wall2, wall3, wall, wall},
      {wall1, floor1, floor1, floor, floor, floor, floor1, floor1, wall},
      {wall, floor1, floor, floor, floor, floor, floor, floor1, wall},
      {wall3, floor, floor, floor, floor, floor, floor1, floor, wall1},
      {wall1, floor, floor, floor, floor, floor, floor, floor, wall},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall3},
      {wall_enter, floor1, floor, floor, floor, floor, floor, floor, wall1},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall},
      {wall, floor, floor, floor, floor1, floor, floor, floor, wall1},
      {wall1, floor, floor, floor, floor, floor, floor, floor, wall2},
      {wall3, floor1, floor, floor, floor, floor, floor, floor1, wall1},
      {wall, floor1, floor, floor, floor, floor, floor1, floor, wall3},
      {wall3, wall1, wall1, wall3, wall1, wall, wall, wall, wall},
    }
    map = Map:new(template)
    
    template2 = { 
      {wall , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil', 'nil', 'nil', 'nil', lava , 'nil', 'nil', 'nil', 'nil'},
      {'nil', 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil', 'nil'},
      {'nil', 'nil', lava , lava , lava , lava , 'nil', 'nil', 'nil'},
      {'nil', 'nil', 'nil', lava , lava , 'nil', 'nil', lava , 'nil'},
      {'nil', lava , 'nil', lava , 'nil', 'nil', lava , lava , 'nil'},
      {'nil', 'nil', 'nil', lava , 'nil', lava , lava , lava , 'nil'},
      {'nil', lava , lava , lava , 'nil', lava , lava , lava , 'nil'},
      {'nil', lava , lava , lava , 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil', lava , lava , lava , lava , lava , lava , 'nil', 'nil'},
      {'nil', 'nil', 'nil', 'nil', lava , lava , lava , 'nil', 'nil'},
      {'nil', 'nil', lava , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    }
    map2 = Map:new(template2)

    template3 = { 
      {wall1 , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
      {'nil' , 'nil', 'nil', 'nil', lava , 'nil', 'nil', 'nil', 'nil'},
      {'nil' , 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil', 'nil'},
      {'nil' , 'nil', lava , lava , lava , lava , 'nil', 'nil', 'nil'},
      {'nil' , 'nil', 'nil', lava , lava , 'nil', 'nil', lava , 'nil'},
      {'nil' , lava , 'nil', lava , lava , lava , lava , lava , 'nil'},
      {'nil' , 'nil', 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil'},
      {'nil' , 'nil', lava , lava , 'nil', lava , 'nil', 'nil', 'nil'},
      {'nil' , 'nil', 'nil', 'nil', 'nil', lava , lava , 'nil', 'nil'},
      {'nil' , lava , lava , lava , lava , lava , 'nil', 'nil', 'nil'},
      {'nil' , lava , 'nil', 'nil', 'nil', lava , 'nil', lava , 'nil'},
      {'nil' , 'nil', 'nil', lava , 'nil', 'nil', 'nil', lava , 'nil'},
      {'nil' , 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil', 'nil'},
    }
    map3 = Map:new(template3)

    template = { 
      {wall, wall1, wall3, wall1, wall3, wall2, wall3, wall, wall},
      {wall1, floor1, floor1, floor, floor, floor, floor1, floor1, wall},
      {wall, floor1, floor, floor, floor, floor, floor, floor1, wall},
      {wall3, floor, floor, floor, floor, floor, floor1, floor, wall1},
      {wall1, floor, floor, floor, floor, floor, floor, floor, wall},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall3},
      {wall, floor1, floor, floor, floor, floor, floor, floor, wall1},
      {banner, floor, floor, floor, floor, floor, floor, floor, wall},
      {wall, floor, floor, floor, floor1, floor, floor, floor, wall1},
      {wall1, floor, floor, floor, floor, floor, floor, floor, wall2},
      {wall3, floor1, floor, floor, floor, floor, floor, floor1, wall1},
      {wall, floor1, floor, floor, floor, floor, floor1, floor, wall3},
      {wall3, wall1, wall1, wall3, wall1, wall, wall, wall, wall},
    }
    map = Map:new(template)
end




function love.update(dt)
  if love.keyboard.isDown('right') then 
    x = x + 2
  end
  if love.keyboard.isDown('left') then 
    x = x - 2
  end
  if love.keyboard.isDown('up') then 
    y = y - 2
  end
  if love.keyboard.isDown('down') then 
     y = y + 2
  end
if(x < 67)then 
    x = x + 2
end
if(x > 720)then 
  x = x - 2
end
if(y < 67)then 
  y = y + 2
end
if(y > 450)then 
  y = y - 2
end
if cc(x, y, w, h, x2, y2, w2, h2) == true then
 collide2 = true
 col = 2
end
if (collide == true and col == 1) then  
  hp = hp - 1
end
if (collide3 == true and col == 2) then  
  hp = hp - 1
end
if(hp < 0)then
  hp = 0
end
if map2:cc(x , y , w , h) == true then
  collide = true
else
  collide = false
end
if map3:cc(x , y , w , h) == true then
  collide3 = true
else
  collide3 = false
end
end






function love.draw()
  map:draw()
  map2:draw()
  if(collide2 == true)then 
    map:draw()
    map3:draw()
  end
  love.graphics.draw(playerImg, x, y)
  love.graphics.print(x, 1, 24)
  love.graphics.print(y, 1, 34)
  love.graphics.print(tostring(collide), 0, 0)
  love.graphics.print(tostring(collide2), 1, 12)
  love.graphics.print(hp, 30, 30)
end
