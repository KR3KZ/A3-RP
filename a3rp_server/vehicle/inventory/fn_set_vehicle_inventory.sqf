/**
* A3-RP
* Server-side
* file: set_vehicle_inventory.sqf
* desc: Set vehicle inventory
*/

params [
	["_vehicle", objNull, [objNull]],
	["_vehicle_inventory", [], [[]]]
];

private _vehicle_backpacks 	= parseSimpleArray(_vehicle_inventory select 0);
private _vehicle_items 		= parseSimpleArray(_vehicle_inventory select 1);
private _vehicle_magazines 	= parseSimpleArray(_vehicle_inventory select 2);
private _vehicle_weapons 	= parseSimpleArray(_vehicle_inventory select 3);

[format["_vehicle_backpacks: %1", _vehicle_backpacks]] call SRV_fnc_log_me;
[format["_vehicle_items: %1", _vehicle_items]] call SRV_fnc_log_me;
[format["_vehicle_magazines: %1", _vehicle_magazines]] call SRV_fnc_log_me;
[format["_vehicle_weapons: %1", _vehicle_weapons]] call SRV_fnc_log_me;

for "_i" from 0 to ((count (_vehicle_backpacks select 0)) - 1) do {
	_vehicle addBackpackCargoGlobal [((_vehicle_backpacks select 0) select _i), ((_vehicle_backpacks select 1) select _i)];
};

for "_i" from 0 to ((count (_vehicle_items select 0)) - 1) do {
	_vehicle addItemCargoGlobal [((_vehicle_items select 0) select _i), ((_vehicle_items select 1) select _i)];
};

for "_i" from 0 to ((count (_vehicle_magazines select 0)) - 1) do {
	_vehicle addMagazineCargoGlobal [((_vehicle_magazines select 0) select _i), ((_vehicle_magazines select 1) select _i)];
};

for "_i" from 0 to ((count (_vehicle_weapons select 0)) - 1) do {
	_vehicle addWeaponCargoGlobal [((_vehicle_weapons select 0) select _i), ((_vehicle_weapons select 1) select _i)];
};
