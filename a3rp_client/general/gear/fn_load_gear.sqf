/*
* A3-RP
* Client-side
* file: load_gear.sqf
*/

if (client_player_gear_loaded) exitWith {};

private _gear = parseSimpleArray(client_player select 3);

[player, _gear] remoteExec ["SRV_fnc_load_gear", 2];

client_player_gear_loaded = true;