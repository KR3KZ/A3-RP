/*
* A3-RP
* Server-side
* file: select_account.sqf
* desc: Select account in database and return result
*/

/**
* Getting player UID from on_ask_account
*/
private _player_uid = param [0, "", [""]];

if (_player_uid == "") exitWith {};

private _res = [
	["account"],
	[
		"id",
		"steam_id",
		"CIV",
		"WEST",
		"GUER",
		"EAST"
	],
	[
		format["steam_id = '%1'",
		_player_uid]
	]
] call DB_fnc_select;

_res