/**
* A3-RP
* Server-side
* file: insert_building_key.sqf
* desc: Insert building key in database
*/

params [
	["_building_id", 0, [0]],
	["_client_player_id", 0, [0]]
];

private _query = format ["
	INSERT INTO building_key
	(building_id, player_id)
	VALUES
	('%1', '%2')
", _building_id, _client_player_id];

private _res = [_query] call DB_fnc_execute;

_res