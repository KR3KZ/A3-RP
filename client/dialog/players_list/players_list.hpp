class A3RP_player_list
{
	idd = 1000;
	onLoad = "[] spawn client_fnc_players_list_on_load;"
	
	class ControlsBackground
	{
		class background : A3RP_background 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.22444445;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.52555556;
			colorBackground[] = {0.2,0.2,0.2,0.8};
			
		};
		class title : A3RP_text_title 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.02888889;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.03666667;
			text = "$STR_player_list_title";
			
		};
		class sub_title : A3RP_text 
		{
			type = 0;
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.07777778;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.03666667;
			text = "";
			
		};
		class player_name : A3RP_text 
		{
			type = 0;
			idc = 1001;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.06111112;
			style = 2;
			text = "";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			
		};
		class player_cash : A3RP_text 
		{
			type = 0;
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.46888889;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.06111112;
			style = 2;
			text = "";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			
		};
		class player_location : A3RP_text 
		{
			type = 0;
			idc = 1003;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.64;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.06111112;
			text = "";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			
		};
		class frame_name : A3RP_frame 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.24888889;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.13444445;
			colorText[] = {0.7,0.9,0.9,0.5};
			
		};
		class frame_cash : A3RP_frame 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.13444445;
			colorText[] = {0.7,0.7,0.9,0.5};
			
		};
		class frame_city : A3RP_frame 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.59111112;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.13444445;
			colorText[] = {0.9,0.9,0.9,0.5};
			
		};
		class bg_name : A3RP_text_uppercase 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.24888889;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.03666667;
			text = "$STR_player_name";
			colorBackground[] = {0.7,0.9,0.9,0.5};
			
		};
		class bg_cash : A3RP_text_uppercase 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.03666667;
			text = "$STR_player_cash";
			colorBackground[] = {0.7,0.7,0.9,0.5};
			
		};
		class bg_city : A3RP_text_uppercase 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39375;
			y = safeZoneY + safeZoneH * 0.59111112;
			w = safeZoneW * 0.2125;
			h = safeZoneH * 0.03666667;
			text = "$STR_player_city";
			colorBackground[] = {0.9,0.9,0.9,0.5};
			
		};
		
	};
	class Controls
	{
		class btn_play : A3RP_button_bold_text 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.78666667;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.03666667;
			text = "$STR_player_play";
			onButtonClick = "[] call client_fnc_players_list_play;";
			
		};
		class btn_next : A3RP_button_bold_text 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.78666667;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03666667;
			text = ">";
			onButtonClick = "[true] call client_fnc_players_list_set_index;";
			
		};
		class btn_prev : A3RP_button_bold_text 
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.36875;
			y = safeZoneY + safeZoneH * 0.78666667;
			w = safeZoneW * 0.0625;
			h = safeZoneH * 0.03666667;
			text = "<";
			onButtonClick = "[false] call client_fnc_players_list_set_index;";
			
		};
		
	};
	
};
