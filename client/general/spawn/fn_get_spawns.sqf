/*
* A3-RP
* Client-side
* file: get_spawns.sqf
*/

private _spawns_config = missionConfigFile >> "A3RP_Spawns" >> worldName >> str(side player);
private _spawns 			= [];

for "_i" from 0 to (count(_spawns_config) - 1) do {
	private _spawn 			= [];
	private _spawnCfg 		= _spawns_config select _i;
	private _name 			= getText(_spawnCfg >> "name");
	private _radius 		= getNumber(_spawnCfg >> "radius");
	private _marker_name 	= getText(_spawnCfg >> "marker_name");
    private _conditions 	= getText(_spawnCfg >> "conditions");
	private _price 			= getNumber(_spawnCfg >> "price");
	_spawn = [_name, _radius, _marker_name, _conditions, _price];
	_spawns pushBack (_spawn);
	[format ["[%1]", _spawn]] call client_fnc_log_me;
};

_spawns