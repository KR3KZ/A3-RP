/**
* A3-RP
* Server-side
* file: select_buildings_owned_by_player.sqf
* desc: Select buildings owned by a player in database
*/

private _player_id = param [0, 0, [0]];

if (_player_id == 0) exitWith {};

private _res = [
	["building_directory", "building_key", "building_owned"],
	["building_owned.id", "building_directory.classname", "building_owned.pos_atl_x", "building_owned.pos_atl_y", "building_owned.pos_atl_z", "building_owned.name"],
	["building_owned.building_directory_id = building_directory.id", "building_key.building_id = building_owned.id", format["building_key.player_id = '%1'", _player_id]],
	"",
	true
] call DB_fnc_select;

_res