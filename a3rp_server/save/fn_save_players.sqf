/*
* A3-RP
* Server-side
* file: save_players.sqf
*/

{
	[_x] call SRV_fnc_on_update_player;
} forEach allPlayers;