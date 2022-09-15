class Authentification {
	tag = "auth";
	class Functions {
		file = "auth";
		class ask_account {};
		class ask_players {};
		class on_client_account_id {};
		class on_players_list {};
		class on_player_created {};
		class update_player {};
	};
};

class General {
	tag = "client";
	class EventHandler {
		file = "eventhandler";
		class init_eventhandler {};
		class cameraView {};
		class FiredNear {};
		class HandleRating {};
		class InventoryClosed{};
		class Killed{};
		class Respawn{};
	};
	class Functions {
		file = "general\functions";
		class bad_name {};
		class bad_side {};
		class log_me {};
		class cam_intro {};
	};
	class Gear {
		file = "general\gear";
		class load_gear {};
	};
	class Player {
		file = "general\player";
		class init_player {};
	};
	class Building {
		file = "general\building";
		class buy_building {};
	};
	class Player_list {
		file = "dialog\players_list";
		class players_list_play {};
		class players_list_set_index {};
		class players_list_set_ctrl {};
		class players_list_on_load {};
		class players_list_create {};
	};
	class Spawn {
		file = "general\spawn";
		class get_spawns {};
		class get_spawn_position {};
	};
	class Spawn_menu {
		file = "dialog\spawn_menu";
		class spawn_menu_on_load {};
		class spawn_menu_onLbSelChanged_building {};
		class spawn_menu_onLbSelChanged_spawn {};
		class spawn_menu_set_buildings {};
		class spawn_menu_spawn {};
	};
	class Vehicle {
		file = "general\vehicle";
		class init_vehicle {};
	};
};