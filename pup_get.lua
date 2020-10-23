local get = {}

get.maneuvers = {
	fire = {'Fire Maneuver'},
	ice = {'Ice Maneuver'},
	wind = {'Wind Maneuver'},
	earth = {'Earth Maneuver'},
	thunder = {'Thunder Maneuver'},
	water = {'Water Maneuver'},
	light = {'Light Maneuver'},
	dark = {'Dark Maneuver'},
	}

function get.maneuver_list(maneuvers)
	local list = {}
	for k,v in pairs(maneuvers) do
		list[k] = v
	end
	return list
end

-- Takes maneuver short name and returns the long name for the maneuver (in proper case) as .enl and JA id to .id
function get.maneuver(name)
	name = string.lower(name)
	-- ids from pup_ids.lua
	for k,v in pairs(ids.maneuvers) do
		if k ~= 'n' and string.lower(v) == name then
			return {id=k,enl=v}
		end
	end
	return nil
end

function get.buffs(curbuffs)
	local buffs = {}
	for i,v in pairs(curbuffs) do
		if res.buffs[v] and res.buffs[v].english then
			buffs[res.buffs[v].english:lower()] = (buffs[res.buffs[v].english:lower()] or 0) + 1
		end
	end
	return buffs
end

return get
