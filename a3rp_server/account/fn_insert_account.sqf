/**
* A3-RP
* Server-side
* file: insert_account.sqf
* desc: Insert account in database
*/

private _player_uid = param [0, "", [""]];

if (_player_uid == "") exitWith {};

private _res = [
	"account",
	["steam_id"],
	[
		format["'%1'",
		_player_uid]
	]
] call DB_fnc_insert;

_res