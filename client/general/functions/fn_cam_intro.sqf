/*
* A3-RP
* Client-side
* file: cam_intro.sqf
* desc: Handle cam introduction & dialog
*/

if (player getVariable ["client_cam_intro_running", false] isEqualTo false) then {
	[] spawn {
		player setVariable ["client_cam_intro_running", true];
		private _speed_cam = 13;
		private _speed_fade = 2;
		private _max_altitude = 50;

		while {player getVariable "client_cam_intro_running" isEqualTo true} do {
			_randomPos = (call BIS_fnc_randomPos) vectorAdd [0, 0, 5 + random _max_altitude];
			waitUntil {preloadCamera _randomPos};

			0 cutText ["", "BLACK IN", _speed_fade];

			_cam = "camera" camCreate _randomPos;
			_cam cameraEffect ["internal", "back"];
			_cam camPrepareFov 1;
			_cam camCommitPrepared 0;
			cameraEffectEnableHUD false;

			_randomPos = _randomPos vectorAdd [random 10, random 10, 0];

			_cam camPreparePos _randomPos;
			_cam camCommitPrepared _speed_cam;
			waitUntil {camCommitted _cam};
			0 cutText ["", "BLACK OUT", _speed_fade];

			sleep _speed_fade * 1.5;
			if (player getVariable "client_cam_intro_running" isEqualTo false) then {
				_cam cameraEffect ["terminate", "back"];
				camDestroy _cam;
			};
		};
		cameraEffectEnableHUD true;
		0 cutText ["", "BLACK IN", _speed_fade];
	};
};