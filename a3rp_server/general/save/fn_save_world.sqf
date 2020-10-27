/*
* A3-RP
* Server-side
* file: save_world.sqf
*/

while {true} do {
	sleep 60;
	["World saving..."] call SRV_fnc_log_me;

	[] call SRV_fnc_save_players;
	[] call SRV_fnc_save_vehicles;

	["World saved!"] call SRV_fnc_log_me;
};