class A3RP_background
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	colorBackground[] = {0.054,0.07,0.078,0.9};
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	style = 0;
	text = "";
	colorText[] = {0,0,0,0};
	font = "PuristaLight";
	access = 0;
	
};
class A3RP_text_title
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	style = 192+2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaBold";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
	access = 0;
	shadow = 0;
	
};
class A3RP_frame
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	style = 64;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	access = 0;
	
};
class A3RP_div
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	colorBackground[] = {0.164,0.164,0.164,0.7};
	colorText[] = {0,0,0,0};
	font = "EtelkaMonospaceProBold";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	access = 0;
	
};
class A3RP_subtitle
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.713,0.713,0.713,1};
	font = "PuristaBold";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9);
	access = 0;
	
};
class A3RP_combo
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	style = 16;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
	colorBackground[] = {0.09,0.09,0.09,1};
	colorDisabled[] = {0.2,0.2,0.2,1};
	colorSelect[] = {0.372,0.462,0.4,1};
	colorSelectBackground[] = {0,0,0,1};
	colorText[] = {0.752,0.752,0.752,1};
	font = "EtelkaMonospacePro";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
	wholeHeight = 0.3;
	access = 0;
	class ComboScrollBar
	{
		
	};
	
};
class A3RP_slider
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	style = 1024;
	arrowEmpty = "\A3\ui_f\data\GUI\Cfg\Slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\Cfg\Slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\GUI\Cfg\Slider\border_ca.paa";
	color[] = {0,0,0,0};
	colorActive[] = {1,1,1,1};
	thumb = "\A3\ui_f\data\GUI\Cfg\Slider\thumb_ca.paa";
	access = 0;
	
};
class A3RP_text_big
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.956,0.956,0.956,1};
	font = "EtelkaMonospacePro";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
	access = 0;
	shadow = 0;
	
};
class A3RP_button
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	style = 2+192;
	text = "My button";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.7};
	colorBackgroundActive[] = {0,0,0,0.9};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBorder[] = {0,0,0,0};
	colorDisabled[] = {0.702,0.702,0.702,1};
	colorFocused[] = {0,0,0,0.9};
	colorShadow[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	offsetPressedX = 0.005;
	offsetPressedY = 0.005;
	offsetX = 0;
	offsetY = 0;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
	access = 0;
	shadow = 2;
	
};
class A3RP_edit
{
	idc = -1;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	autocomplete = "";
	colorBackground[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,1};
	colorSelection[] = {0,0,0,1};
	colorText[] = {0.752,0.752,0.752,1};
	font = "EtelkaMonospacePro";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7);
	access = 0;
	
};
class A3RP_text
{
	style = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	
};
class A3RP_structured_text
{
	text = "";
	size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .7);
	class Attributes
	{
		
	};
	
};
class A3RP_list_box
{
	colorBackground[] = {0.164,0.164,0.164,0.7};
	colorDisabled[] = {0,0,0,0};
	colorSelect[] = {0.8525,0.3843,0.3843,0.9};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	maxHistoryDelay = 0;
	rowHeight = 0;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
	class ListScrollBar
	{
		
	};
	
};
class A3RP_text_right : A3RP_text 
{
	style = 1;
	
};
class A3RP_text_left : A3RP_text 
{
	style = 0;
	
};
class A3RP_text_little : A3RP_text 
{
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * .8);
	
};
class A3RP_button_bold_text : A3RP_button 
{
	font = "PuristaBold";
	
};