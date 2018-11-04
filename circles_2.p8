pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
local cirs = {}

function new_circ()
	local tmp = {}
	tmp.x = rnd(100)+10
	tmp.y = rnd(100)+10
	tmp.col =rnd(8)+8
	tmp.rad =rnd(5)+5
	return tmp
end

function _init()
	cls()
	for i=0,10 do
		add(cirs,new_circ())
	end
end


function _draw()

--	color(1)
	
	for k,v in pairs(cirs) do
		circ(v.x,v.y,v.rad,v.col)
		circ(v.x,v.y-1,v.rad,v.col)
	end
	
	i=0
	while i< 300 do
		local x,y = rnd(128),rnd(128)
		col =pget(x,y)
		if col ~= 0 then
			--	circfill(x,y-2,1,col -1)
			if col <8 then
				--pset(x,y,0)
				circfill(x,y,1,0)
			else
				--pset(x,y-2,col-1)
				circfill(x,y-5,1,col-1)
				pset(x,y,0)
			end
			i=i+1
		
		end		
	end
	
end

function _update()
	for k,v in pairs(cirs) do
		 cirs[k].rad = cirs[k].rad -0.25
		 if cirs[k].rad <= 0 then
		 	cirs[k] = new_circ()
		 end
	end
end



