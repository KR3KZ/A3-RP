/*
* A3-RP
* Client-side
* file: load_gear.sqf
*/

if (client_player_gear_loaded) exitWith {};

private _gear = parseSimpleArray(client_player select 3);

player setUnitLoadout _gear;

["[fn_load_gear]: Loadout applied"] call client_fnc_log_me;

client_player_gear_loaded = true;