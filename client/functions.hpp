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
	class Functions {
		file = "general\functions";
		class bad_name {};
		class log_me {};
		class cam_intro {};
	};
	class Gear {
		file = "general\gear";
		class load_gear {};
	};
	class Spawn {
		file = "general\spawn";
		class get_spawns {};
		class get_spawn_position {};
	};
	class Vehicle {
		file = "general\vehicle";
		class insert_vehicle {};
	};
	class Player_list {
		file = "dialog\players_list";
		class players_list_play {};
		class players_list_set_index {};
		class players_list_set_ctrl {};
		class players_list_on_load {};
		class players_list_create {};
	};
	class Spawn_menu {
		file = "dialog\spawn_menu";
		class spawn_menu_on_load {};
		class spawn_menu_spawn {};
		class spawn_menu_onLbSelChanged {};
	};
};