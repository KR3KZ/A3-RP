/**
* A3-RP
* Server-side
* file: insert_steam_profile.sqf
* desc: Insert steam_profile in database
*/

private _player_uid = param [0, "", [""]];

[format["INSERT INTO steam_profile (steam_id) VALUES (%1)", _player_uid]] call DB_fnc_execute;