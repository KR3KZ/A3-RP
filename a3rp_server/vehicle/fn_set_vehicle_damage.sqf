/**
* A3-RP
* Server-side
* file: set_vehicle_damage.sqf
* desc: Set vehicle damage
*/

params [
	["_vehicle", objNull, [objNull]],
	["_damage", [], [[]]]
];

private _vehicle_hit_point_names = getAllHitPointsDamage _vehicle select 0;

{
	_vehicle setHitPointDamage [_x, _damage select _forEachIndex, false];
} forEach _vehicle_hit_point_names;