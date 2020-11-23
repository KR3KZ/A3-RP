/**
* A3-RP
* Server-side
* file: remove_items_from_vehicle.sqf
* desc: Remove any item in the vehicle cargo
*/

private _vehicle = param [0, objNull, [objNull]];

if (isNull _vehicle) exitWith {};

clearBackpackCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;