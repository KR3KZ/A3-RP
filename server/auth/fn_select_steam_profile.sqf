/*
* A3-RP
* Server-side
* file: select_steam_profile.sqf
* desc: Select steam_profile in database and return result
*/

/**
* Getting player UID from on_ask
*/
private _player_uid = param [0, "", [""]];

private _res = [format["SELECT * FROM steam_profile WHERE steam_id = %1", _player_uid]] call DB_fnc_select;

_res