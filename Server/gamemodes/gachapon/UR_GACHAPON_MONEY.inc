/*
	GACHAPON V1
	UI/Design by M SHOP
	Coded by Ms X Filmx_ex.
*/

#include <YSI_Coding\y_hooks>

#define GM1 "UR_G_MONEY:G_MONEY_1" // 3000
#define GM2 "UR_G_MONEY:G_MONEY_2" // 4000
#define GM3 "UR_G_MONEY:G_MONEY_3" // 5000
#define GM4 "UR_G_MONEY:G_MONEY_4" // 5500
#define GM5 "UR_G_MONEY:G_MONEY_5" // 6000
#define GM6 "UR_G_MONEY:G_MONEY_6" // 7000
#define GM7 "UR_G_MONEY:G_MONEY_7" // 10000
#define GM8 "UR_G_MONEY:G_MONEY_8" // 3000
#define GM9 "UR_G_MONEY:G_MONEY_9" // 4000
#define GM10 "UR_G_MONEY:G_MONEY_10" // 3000
#define GM11 "UR_G_MONEY:G_MONEY_11" // 4000
#define GM12 "UR_G_MONEY:G_MONEY_12" // 10000

#define GACHAPON_GM1_MONEY   3000 
#define GACHAPON_GM2_MONEY   4000 
#define GACHAPON_GM3_MONEY   5000 
#define GACHAPON_GM4_MONEY   5500
#define GACHAPON_GM5_MONEY   6000 
#define GACHAPON_GM6_MONEY   7000 
#define GACHAPON_GM7_MONEY   10000 
#define GACHAPON_GM8_MONEY   3000 
#define GACHAPON_GM9_MONEY   4000
#define GACHAPON_GM10_MONEY   3000 
#define GACHAPON_GM11_MONEY   4000 
#define GACHAPON_GM12_MONEY   10000 

new bool:GachaponOn[MAX_PLAYERS] = false;
new PlayerText:Ms_G_MONEY[MAX_PLAYERS][16];
new GachaponSpinTimer[MAX_PLAYERS];
new GachaponSpinCount[MAX_PLAYERS];
new GachaponMaxSpin[MAX_PLAYERS];
new bool:GachaponSpinning[MAX_PLAYERS];

new g_GachaponItems[12][] =
{
    GM1, GM2, GM3, GM4, GM5, GM6, GM7, GM8, GM9, GM10, GM11, GM12
};

new g_GachaponItemNames[12][] =
{
    "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว", "เงินเขียว"
};

new const ItemChance[12] =
{
    10, // GM1  (3000)  10%
    10, // GM2  (4000)  10%
    10, // GM3  (5000)  10%
    5, // GM4  (5500)  5%
    5, // GM5  (6000)  5%
    5, // GM6  (7000)  5%
    4, // GM7  (10000)  4%
    10, // GM8  (3000)  10%
    10, // GM9  (4000)  10%
    20, // GM10 (3000)  5%
    10, // GM11 (4000)  5%
    1  // GM12 (10000) 1%
};

hook OnPlayerConnect(playerid)
{
    Ms_G_MONEY[playerid][0] = CreatePlayerTextDraw(playerid, 201.000000, 84.000000, "UR_G_MONEY:G_MONEY");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][0], 233.000000, 291.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][0], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][0], 0);

    Ms_G_MONEY[playerid][1] = CreatePlayerTextDraw(playerid, 285.000000, 354.000000, "Random");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][1], 0.262499, 1.450000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][1], 20.500000, 56.000000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][1], 2);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][1], 1);

    Ms_G_MONEY[playerid][2] = CreatePlayerTextDraw(playerid, 349.000000, 354.000000, "Exit");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][2], 0.262499, 1.450000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][2], 20.500000, 56.000000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][2], 2);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][2], 1);

    Ms_G_MONEY[playerid][3] = CreatePlayerTextDraw(playerid, 228.000000, 123.000000, "UR_G_MONEY:G_MONEY_1");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][3], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][3], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][3], 0);

    Ms_G_MONEY[playerid][4] = CreatePlayerTextDraw(playerid, 228.000000, 177.000000, "UR_G_MONEY:G_MONEY_2");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][4], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][4], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][4], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][4], 0);

    Ms_G_MONEY[playerid][5] = CreatePlayerTextDraw(playerid, 228.000000, 231.000000, "UR_G_MONEY:G_MONEY_3");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][5], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][5], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][5], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][5], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][5], 0);

    Ms_G_MONEY[playerid][6] = CreatePlayerTextDraw(playerid, 228.000000, 285.000000, "UR_G_MONEY:G_MONEY_4");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][6], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][6], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][6], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][6], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][6], 0);

    Ms_G_MONEY[playerid][7] = CreatePlayerTextDraw(playerid, 274.000000, 285.000000, "UR_G_MONEY:G_MONEY_5");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][7], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][7], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][7], 0);

    Ms_G_MONEY[playerid][8] = CreatePlayerTextDraw(playerid, 319.000000, 285.000000, "UR_G_MONEY:G_MONEY_6");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][8], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][8], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][8], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][8], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][8], 0);

    Ms_G_MONEY[playerid][9] = CreatePlayerTextDraw(playerid, 365.000000, 285.000000, "UR_G_MONEY:G_MONEY_7");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][9], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][9], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][9], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][9], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][9], 0);

    Ms_G_MONEY[playerid][10] = CreatePlayerTextDraw(playerid, 365.000000, 231.000000, "UR_G_MONEY:G_MONEY_8");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][10], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][10], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][10], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][10], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][10], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][10], 0);

    Ms_G_MONEY[playerid][11] = CreatePlayerTextDraw(playerid, 365.000000, 177.000000, "UR_G_MONEY:G_MONEY_9");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][11], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][11], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][11], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][11], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][11], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][11], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][11], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][11], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][11], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][11], 0);

    Ms_G_MONEY[playerid][12] = CreatePlayerTextDraw(playerid, 365.000000, 123.000000, "UR_G_MONEY:G_MONEY_10");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][12], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][12], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][12], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][12], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][12], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][12], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][12], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][12], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][12], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][12], 0);

    Ms_G_MONEY[playerid][13] = CreatePlayerTextDraw(playerid, 319.000000, 123.000000, "UR_G_MONEY:G_MONEY_11");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][13], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][13], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][13], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][13], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][13], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][13], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][13], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][13], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][13], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][13], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][13], 0);

    Ms_G_MONEY[playerid][14] = CreatePlayerTextDraw(playerid, 274.000000, 123.000000, "UR_G_MONEY:G_MONEY_12");
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][14], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][14], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][14], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][14], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][14], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][14], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][14], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][14], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][14], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][14], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][14], 0);

    Ms_G_MONEY[playerid][15] = CreatePlayerTextDraw(playerid, 274.000000, 177.000000, ""); //show
    PlayerTextDrawFont(playerid, Ms_G_MONEY[playerid][15], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_MONEY[playerid][15], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_MONEY[playerid][15], 86.500000, 103.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_MONEY[playerid][15], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_MONEY[playerid][15], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_MONEY[playerid][15], 1);
    PlayerTextDrawColor(playerid, Ms_G_MONEY[playerid][15], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_MONEY[playerid][15], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_MONEY[playerid][15], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_MONEY[playerid][15], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_MONEY[playerid][15], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_MONEY[playerid][15], 0);

    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if (clickedid == Text:INVALID_TEXT_DRAW) {
        if(GachaponSpinning[playerid])
        {
            SendClientMessage(playerid, 0xFF0000FF, "ไม่สามารถปิดกาชาปองได้ขณะกำลังหมุน!");
            SelectTextDraw(playerid, -1);
            return 1;
        }
        for (new i = 0; i < 16; i++) {
            PlayerTextDrawHide(playerid, Ms_G_MONEY[playerid][i]);
        }
    }
    return true;
}

stock UpdateGachaponDisplay(playerid)
{
    new currentIndex = GachaponSpinCount[playerid] % 12;
    for (new i = 0; i < 12; i++)
    {
        new itemIndex = (currentIndex + i) % 12;
        PlayerTextDrawSetString(playerid, Ms_G_MONEY[playerid][3 + i], g_GachaponItems[itemIndex]);
        PlayerTextDrawShow(playerid, Ms_G_MONEY[playerid][3 + i]);
    }
}

forward GachaponSpin(playerid);
public GachaponSpin(playerid)
{
    GachaponSpinCount[playerid]++;
    UpdateGachaponDisplay(playerid);
    StopAudioStreamForPlayer(playerid); 
    PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
    if (GachaponSpinCount[playerid] >= GachaponMaxSpin[playerid])
    {
        KillTimer(GachaponSpinTimer[playerid]);
        GachaponSpinning[playerid] = false;
        new finalIndex = (GachaponSpinCount[playerid] % 12);
        new itemIndexAt6 = (finalIndex + 3) % 12;

        StopAudioStreamForPlayer(playerid);
        PlayAudioStreamForPlayer(playerid,"http://191.96.92.236/sound-gachaV1.mp3");
        GiveItemToPlayer(playerid, itemIndexAt6);
        return 1;
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (GachaponSpinning[playerid])
    {
        KillTimer(GachaponSpinTimer[playerid]);
        GachaponSpinning[playerid] = false;
    }
    GachaponOn[playerid] = false;
    return 1;
}

stock GiveItemToPlayer(playerid, itemIndexAt6)
{
    new resultString[128];

    if (itemIndexAt6 == 0) 

    {
        playerData[playerid][pMoney] += GACHAPON_GM1_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[0], GACHAPON_GM1_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 1) 

    {
        playerData[playerid][pMoney] += GACHAPON_GM2_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[1], GACHAPON_GM2_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 2) 
    {
        playerData[playerid][pMoney] += GACHAPON_GM3_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[2], GACHAPON_GM3_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 3) 

    {
        playerData[playerid][pMoney] += GACHAPON_GM4_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[3], GACHAPON_GM4_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 4) 

    {
        playerData[playerid][pMoney] += GACHAPON_GM5_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[4], GACHAPON_GM5_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 5)

    {
        playerData[playerid][pMoney] += GACHAPON_GM6_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[5], GACHAPON_GM6_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 6)

    {
        playerData[playerid][pMoney] += GACHAPON_GM7_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[6], GACHAPON_GM7_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 7)

    {
        playerData[playerid][pMoney] += GACHAPON_GM8_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[7], GACHAPON_GM8_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 8)

    {
        playerData[playerid][pMoney] += GACHAPON_GM9_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[8], GACHAPON_GM9_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 9)

    {
        playerData[playerid][pMoney] += GACHAPON_GM10_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[9], GACHAPON_GM10_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 10)
    {
        playerData[playerid][pMoney] += GACHAPON_GM11_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[10], GACHAPON_GM11_MONEY);
        SendClientMessage(playerid, -1, resultString);
    }
    else if (itemIndexAt6 == 11)

    {
        playerData[playerid][pMoney] += GACHAPON_GM12_MONEY;
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-MONEY] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponItemNames[11], GACHAPON_GM12_MONEY);
        SendClientMessage(playerid, -1, resultString); 
    }

    
    PlayerTextDrawHide(playerid, Ms_G_MONEY[playerid][15]);
    PlayerTextDrawSetString(playerid, Ms_G_MONEY[playerid][15], g_GachaponItems[itemIndexAt6]);
    PlayerTextDrawShow(playerid, Ms_G_MONEY[playerid][15]);

    //format(resultString, sizeof(resultString), "DEBUG - GM: %s", g_GachaponItemNames[itemIndexAt6]);
    //SendClientMessage(playerid, 0xFFFFFFFF, resultString);

    return 1;
}

stock GetWeightedRandomMoney()
{
    new rand = random(100); // สุ่ม 0-99
    new sum = 0;

    for(new i = 0; i < sizeof(ItemChance); i++)
    {
        sum += ItemChance[i];
        if(rand < sum) return i;
    }
    return sizeof(ItemChance)-1;
}
