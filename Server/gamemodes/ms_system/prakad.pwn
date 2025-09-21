#include	<YSI_Coding\y_hooks>

new Text:prakad[1];

hook OnGameModeInit()
{
	prakad[0] = TextDrawCreate(235.000000, 11.000000, "asabuasabi:prakad");
	TextDrawFont(prakad[0], 4);
	TextDrawLetterSize(prakad[0], 0.600000, 2.000000);
	TextDrawTextSize(prakad[0], 161.000000, 36.500000);
	TextDrawSetOutline(prakad[0], 1);
	TextDrawSetShadow(prakad[0], 0);
	TextDrawAlignment(prakad[0], 1);
	TextDrawColor(prakad[0], -1);
	TextDrawBackgroundColor(prakad[0], 255);
	TextDrawBoxColor(prakad[0], 50);
	TextDrawUseBox(prakad[0], 0);
	TextDrawSetProportional(prakad[0], 1);
	TextDrawSetSelectable(prakad[0], 0);

}

task Helloplayer[30000*10]()
{
	TextDrawShowForAll(prakad[0]);
}
task Helloplayer1[30000*15]()
{
	 TextDrawHideForAll(prakad[0]);
}