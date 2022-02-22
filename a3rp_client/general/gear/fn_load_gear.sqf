/*
* A3-RP
* Client-side
* file: load_gear.sqf
* desc: Ask the server to set a gear on the player
*/

if (client_player_gear_loaded) exitWith {};

private _gear = parseSimpleArray(client_players_list get "player.gear" select client_players_list_index);

[player, _gear] remoteExec ["SRV_fnc_load_gear", 2];

client_player_gear_loaded = true;