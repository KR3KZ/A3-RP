/**
* A3-RP
* Server-side
* file: on_insert_house.sqf
* desc: Call insert house in database
*/

params [
	["_player", objNull, [objNull]],
	["_house", objNull, [objNull]]
];

private _client_player_id 	= _player getVariable "client_player_id";
private _house_classname 	= typeOf _house;
private _house_pos			= getPosATL _house;

private _res 				= [_house_classname, _house_pos] call SRV_fnc_insert_house;

private _house_id 			= _res select 0;

[_house_id, _client_player_id] call SRV_fnc_insert_house_key;

_house_id