/*
* A3-RP
* Client-side
* file: init_player.sqf
* desc: Initialize player
*/

/**
* Variables used by server
*/
player setVariable ["client_player_id", client_player get "player.id", 2];

if (client_player get "player.alive" == 1) then {
	/**
	* Load gear
	*/
	call client_fnc_load_gear;
	waitUntil {client_player_gear_loaded};

	/**
	* Apply ace medical state
	*/
	[player, client_player get "player.state"] call ace_medical_fnc_deserializeState;

	/**
	* Set player cash
	*/
	player setVariable ["client_cash", client_player get "player.cash", 2];

	/**
	* Teleport player at his position
	*/
	[player, [client_player get "player.pos_atl_x", client_player get "player.pos_atl_y", client_player get "player.pos_atl_z"], client_player get "player.dir"] remoteExec ["SRV_fnc_teleport_me", 2];
} else {
	/**
	* Set player cash
	*/
	player setVariable ["client_cash", 0, 2];

	/**
	* Spawn selection
	*/
	createDialog "A3RP_spawn_menu";
	waitUntil {client_player_spawn_selected};

	/**
	* Update 'alive' field in database to 1
	*/
	[player] remoteExec ["SRV_fnc_on_player_alive", 2];
};