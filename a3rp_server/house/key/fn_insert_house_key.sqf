/**
* A3-RP
* Server-side
* file: insert_house_key.sqf
* desc: Insert house key in database
*/

params [
	["_house_id", 0, [0]],
	["_client_player_id", 0, [0]]
];

private _query = format ["
	INSERT INTO house_key
	(house_id, player_id)
	VALUES
	('%1', '%2')
", _house_id, _client_player_id];

private _res = [_query] call DB_fnc_execute;

_res