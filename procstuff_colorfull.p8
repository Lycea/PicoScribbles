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
act_dir = 0
dir_num = 0
change_c=20

runs = 0

function dist(x,y,x2,y2)
	return sqrt((x-x2)^2)+sqrt((y-y2)^2)
end

function dist_m(x1,y1,x2,y2)
 return max(abs(x1-x2),abs(y1-y2)) 
end

function _init()
 add(path,{x= 64,y=64})
 dir_num=flr(rnd(3)+1)
 act_dir =dirs[dir_num]
end


function _update60()
	local tmp={}
	local old = path[#path]
	
	--check if direction should change
	if rnd(100)<= change_c then
		dir_num =flr(rnd(100)+1)%4+1
		act_dir =dirs[dir_num]
		change_c = 20
	end
	
	tmp.x=old.x + act_dir[1]
	tmp.y=old.y + act_dir[2]	

	if dist_m(64,64,tmp.x,tmp.y)>63 then
		if dir_num%2 == 1 then
			dir_num +=1
			act_dir = dirs[dir_num]
		else
			dir_num -=1
			act_dir = dirs[dir_num]
		end
		change_c = 5
	end
	
	tmp.x=old.x + act_dir[1]
	tmp.y=old.y + act_dir[2]
	
	runs +=1
	add(path,tmp)
end

function _draw()
 cls()
 for k,v in pairs(path) do
  if k == #path then
  	pset(v.x,v.y,8)
  else
  	pset(v.x,v.y,7)
  end
 end
 --print(dir_num)
 
 color(8)
 print(runs)
end
