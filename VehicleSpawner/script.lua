lastSpawned = ""

function onPlayerRespawn(peer_id)

	server.notify(peer_id, "Vehicle spawner loaded", "Type ?help for command list", 8)
	server.announce("Vehicle spawner loaded", "Type ?help for command list \nMade by Vulperion", peer_id)

end

function onCustomCommand(full_message, user_peer_id, is_admin, is_auth, command, vehicleName, spawnOffsetV ,spawnOffsetH)

	if (command == "?help") then

		server.announce("Vehicle spawner",
		"Command list:" ..
		"\n?help" ..
		"\n---shows this list" ..
		"\n" ..
		"\n?spawnV [vehicleName] [spawnOffsetV] [spawnOffsetH]" ..
		"\n-usage: ?spawnV helicopter 2 5" ..
		"\n---vehicleName - your saved vehicle name, without spaces" ..
		"\n---spawnOffsetV (optional) - horizontal offset of spawning vehicle" ..
		"\n---spawnOffsetH (optional) - vertical offset of spawning vehicle" ..
		"\n---if both not specified or set to 0, vehicle will spawn inside you" ..
		"\n" ..
		"\n?despawnV [vehicleID]" ..
		"\n-usage: ?despawnV 621" ..
		"\n---vehicleID (optional) - ID of a vehicle you want to despawn. If not specified you need to seat in vehicle you want to despawn" ..
		"\n"
		, user_peer_id
		)
	
	end

	if (command == "?spawnV") then
		

		if (vehicleName == nil or vehicleName == "") then
		
			server.notify(user_peer_id, "Info", "Enter saved vehicle name", 8)
			server.announce("Vehicle spawner", "Enter saved vehicle name", user_peer_id)

			do return end
			
		end
		
		if (spawnOffsetV == nil) then
		
			spawnOffsetV = 0
			
		end

		if (spawnOffsetH == nil) then
		
			spawnOffsetH = 0
			
		end
		
		if (vehicleName == "last") then
			
			vehicleName = lastSpawned
			
		else
		
			lastSpawned = vehicleName
			
		end

		plrPos = server.getPlayerPos(user_peer_id)
		local x, y, z = matrix.position(plrPos)
		
		x = x + spawnOffsetV
		y = y + spawnOffsetH
		
		spawnPos = matrix.translation(x,y,z)
		is_success = server.spawnVehicle(spawnPos, vehicleName)
		server.notify(user_peer_id, "Vehicle Spawned", 
		"Vehicle name: " .. vehicleName ..
		"\nVehicle ID: " .. is_success
		, 4)
		server.announce("Vehicle spawner", "Vehicle Spawned" ..
		"\nVehicle name: " .. vehicleName ..
		"\nVehicle ID: " .. is_success
		, user_peer_id)
	
	end

	if (command == "?despawnV") then

		if (vehicleName == nil or vehicleName == "") then
			
			plrObject = server.getPlayerCharacterID(user_peer_id)
			toDespawn = server.getCharacterVehicle(plrObject)
			
			if (toDespawn == nil or toDespawn == 0) then
			
				server.notify(user_peer_id, "Info", "Seat in vehicle to despawn it", 8)
				server.announce("Vehicle spawner", "Seat in vehicle to despawn it", user_peer_id)

				do return end
			
			end

		else
			
			toDespawn = vehicleName

			if (server.getVehicleName(toDespawn) == nil or server.getVehicleName(toDespawn) == "") then
	
				server.notify(user_peer_id, "Error", "Vehicle with this ID doesn't exist", 2)
				server.announce("Vehicle spawner", "Vehicle with this ID doesn't exist", user_peer_id)
	
				do return end
	
			end

		end

		server.despawnVehicle(toDespawn, true)
		server.notify(user_peer_id, "Vehicle Despawned", 
		"Vehicle name: " .. server.getVehicleName(toDespawn)..
		"\nVehicle ID: " .. toDespawn
		, 4)
		server.announce("Vehicle spawner", "Vehicle Despawned" ..
		"\nVehicle name: " .. server.getVehicleName(toDespawn)..
		"\nVehicle ID: " .. toDespawn, user_peer_id)

	end

end
