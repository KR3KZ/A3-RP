/*
* A3-RP
* Server-side
* file: save_players.sqf
*/

private _all_players = call BIS_fnc_listPlayers;

{
	private _player = _x;
	
} forEach _all_players;