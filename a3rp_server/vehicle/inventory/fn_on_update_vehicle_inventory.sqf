/**
* A3-RP
* Server-side
* file: on_update_vehicle_inventory.sqf
* desc: Call the update vehicle inventory in database
*/

private _vehicle 	= param [0, objNull, [objNull]];

if (isNull _vehicle) exitWith {};

private _vehicle_id = _vehicle getVariable ["vehicle_id", 0];

if (_vehicle_id != 0) then {
	private _vehicle_backpacks = getBackpackCargo _vehicle;
	private _vehicle_items = getItemCargo _vehicle;
	private _vehicle_magazines = getMagazineCargo _vehicle;
	private _vehicle_weapons = getWeaponCargo _vehicle;

	[_vehicle_id, _vehicle_backpacks, _vehicle_items, _vehicle_magazines, _vehicle_weapons] call SRV_fnc_update_vehicle_inventory;
};