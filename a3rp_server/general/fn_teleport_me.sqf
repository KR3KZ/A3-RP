/*
* A3-RP
* Server-side
* file: teleport_me.sqf
* desc: Someone asked to be teleported
*/

params [
	["_object", objNull, [objNull]],
	["_pos", [], [[]]],
	["_dir", 0, [0]]
];

if (_object isKindOf "Man") then {
	if (_dir != 0) then {
		_object setDir _dir;
	};
	[format["[fn_teleport_me]: [%1] [%2] [%3] asked to be teleported at [%4] near [%5]", getPlayerUid _object, side _object, name _object, _pos, text(nearestLocation [_pos, "NameCityCapital"])]] call SRV_fnc_log_me;
	_object setPos _pos;
};