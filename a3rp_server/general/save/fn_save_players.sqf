/*
* A3-RP
* Server-side
* file: save_players.sqf
*/

private _all_players = call BIS_fnc_listPlayers;

{
	[_x] call SRV_fnc_on_update_player;
} forEach _all_players;