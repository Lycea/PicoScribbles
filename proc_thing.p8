pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

dirs={
	{0,-1},
	{0,1},
	{-1,0},
	{1,0}
}

path={}
--act_dir =dirs[rnd(3)+1]
--change_c=20
function _init()
 add(path,{x= 64,y=64})
end


function _update()
	local tmp={}
	--print(#path)
	local old = path[#path]
	
	dir_ = flr(rnd(3))+1
	tmp.x=old.x + dirs[dir_][1]
	tmp.y=old.y + dirs[dir_][2]
	
	add(path,tmp)
end

function _draw()
 cls()
 for k,v in pairs(path) do
  pset(v.x,v.y,7)
 end
end
