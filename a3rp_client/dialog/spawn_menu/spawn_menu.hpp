class A3RP_spawn_menu
{
	idd = 1100;
	onLoad = "[] spawn client_fnc_spawn_menu_on_load;";
	
	class ControlsBackground
	{
		class title : A3RP_text_title 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.02888889;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.03666667;
			text = "$STR_spawn_menu_title";
			
		};
		class sub_title : A3RP_text 
		{
			type = 0;
			idc = 1104;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.07777778;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.03666667;
			text = "$STR_spawn_menu_select_a_spawn";
			
		};
		class sub_title_spawn_available : A3RP_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.63125;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.125;
			h = safeZoneH * 0.025;
			style = 0;
			text = "$STR_spawn_available";
			colorBackground[] = {0.164,0.164,0.164,0.8};
			
		};
		class sub_title_properties_list : A3RP_text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.63125;
			y = safeZoneY + safeZoneH * 0.475;
			w = safeZoneW * 0.125;
			h = safeZoneH * 0.025;
			style = 0;
			text = "$STR_spawn_properties";
			colorBackground[] = {0.164,0.164,0.164,0.8};
			
		};
		
	};
	class Controls
	{
		class map : A3RP_RscMapControl 
		{
			idc = 1101;
			x = safeZoneX + safeZoneW * 0.24375;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.3875;
			h = safeZoneH * 0.55;
			
		};
		class spawns_list : A3RP_list_box 
		{
			type = 5;
			idc = 1102;
			x = safeZoneX + safeZoneW * 0.63125;
			y = safeZoneY + safeZoneH * 0.225;
			w = safeZoneW * 0.125;
			h = safeZoneH * 0.25;
			onLBSelChanged = "call client_fnc_spawn_menu_onLbSelChanged;";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class btn_spawn : A3RP_button_bold_text 
		{
			type = 1;
			idc = 1103;
			x = safeZoneX + safeZoneW * 0.41875;
			y = safeZoneY + safeZoneH * 0.77;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			text = "$STR_spawn_menu_spawn";
			onButtonClick = "[] call client_fnc_spawn_menu_spawn;";
			
		};
		class spawns_list_house : A3RP_list_box 
		{
			type = 5;
			idc = 1102;
			x = safeZoneX + safeZoneW * 0.63125;
			y = safeZoneY + safeZoneH * 0.5;
			w = safeZoneW * 0.125;
			h = safeZoneH * 0.25;
			onLBSelChanged = "call client_fnc_spawn_menu_onLbSelChanged;";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		
	};
	
};
