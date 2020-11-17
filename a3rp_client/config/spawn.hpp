class A3RP_Spawns {
	/**
	* class worldName (Altis/Stratis/Etc...)
	*/
	class Altis {
		/**
		* class side player (CIV, WEST, GUER, EAST)
		*/
		class CIV {
			/**
			class name_of_the_class {
				name			Name of the spawn
				radius			Radius in meters, which will be used to search for a building from the list (buildings_spawn[] in settings.hpp) in a radius around the marker_name
				marker_name		The marker is the center in which the building search is performed
				conditions		The condition to spawn here
				price			The price to spawn here
			};
			*/
			class Kavala {
				name = "Kavala";
				radius = 200;
				marker_name = "spawn_kavala";
				conditions = "";
				price = 0;
			};
			class Athira {
				name = "Athira";
				radius = 200;
				marker_name = "spawn_athira";
				conditions = "";
				price = 0;
			};
			class Pyrgos {
				name = "Pyrgos";
				radius = 200;
				marker_name = "spawn_pyrgos";
				conditions = "";
				price = 0;
			};
			class Rodopoli {
				name = "Rodopoli";
				radius = 200;
				marker_name = "spawn_rodopoli";
				conditions = "";
				price = 0;
			};
			class Therisa {
				name = "Therisa";
				radius = 200;
				marker_name = "spawn_therisa";
				conditions = "";
				price = 0;
			};
		};
		class WEST {

		};
		class GUER {

		};
		class EAST {

		};
	};
};