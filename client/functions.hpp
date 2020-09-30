class Authentification {
	tag = "auth";
	class Functions {
		file = "auth";
		class ask_account {};
		class ask_players {};
		class on_client_account_id {};
		class on_players_list {};
		class update_player {};
	};
};

class General {
	tag = "client";
	class Functions {
		file = "general\functions";
		class log_me {};
		class cam_intro {};
	};
	class Main {
		file = "general\main";
	};
	class Player_list {
		file = "dialog\players_list";
		class players_list_play {};
		class players_list_set_index {};
		class players_list_set_ctrl {};
		class players_list_on_load {};
	};
	class Spawn_menu {
		file = "dialog\spawn_menu";
		class spawn_menu_on_load {};
	};
};