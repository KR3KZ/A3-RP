/**
* A3-RP
* Server-side
* file: insert_player.sqf
* desc: Insert player in database
*/

private _defaultHashMap = createHashMap;
private _players_infos 	= param [0, _defaultHashMap, [_defaultHashMap]];

if (
	_players_infos get "client_uid" == "" ||
	{ _players_infos get "client_side" == "" } ||
	{ _players_infos get "client_name" == "" }
) exitWith {};

private _res = [
	"player",
	[
		"account_id",
		"side_id",
		"name"
	],
	[
		format["(SELECT id FROM ACCOUNT WHERE steam_id = '%1')", _players_infos get "client_uid"],
		format["(SELECT id FROM side WHERE type = '%1')", _players_infos get "client_side"],
		format["'%1'", _players_infos get "client_name"]
	]
] call DB_fnc_insert;

_res