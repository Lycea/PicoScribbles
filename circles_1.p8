pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init()

end

function _draw()
	--cls()
	color(1)
	for i=1,1 do
		circfill(rnd(100)+20,rnd(100)+20,rnd(8)+8,rnd(8)+8)
	end
	
	for i=1,20 do
		x,y = rnd(100)+20,rnd(100)+20
		col = pget(x,y)
		if col >8 then
			circfill(x,y,2,col-8)
			--pset(x,y,col-8)
		else
			circfill(x,y,2,col+8)
			--pset(x,y,col+8)
		end
	end
end

function _update()

end

