/**
* A3-RP
* Client-side
* file: cameraView.sqf
* desc: https://cbateam.github.io/CBA_A3/docs/files/events/fnc_addPlayerEventHandler-sqf.html
*/

["cameraView", {
		private _player 	= _this select 0;
		private _next_view 	= _this select 1;
		private _old_view 	= _this select 2;
		if (player getVariable "client_fighting") then {
			player switchCamera "Internal";
		};
	},
		true
] call CBA_fnc_addPlayerEventHandler;