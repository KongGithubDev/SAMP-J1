/*
	Gachapon
	UI/Design by M SHOP
	Coded by Ms X Filmx_ex.
*/

#include    <YSI_Coding\y_hooks>

#define GB1 "UR_G_BLACK:G_BLACK_1" // ปูน
#define GB2 "UR_G_BLACK:G_BLACK_2" // แท่งเหล็ก
#define GB3 "UR_G_BLACK:G_BLACK_3" // สายไฟ
#define GB4 "UR_G_BLACK:G_BLACK_4" // โคเคน
#define GB5 "UR_G_BLACK:G_BLACK_5" // เงินแดง
#define GB6 "UR_G_BLACK:G_BLACK_6" // ปูน
#define GB7 "UR_G_BLACK:G_BLACK_7" // สายไฟ
#define GB8 "UR_G_BLACK:G_BLACK_8" // แท่งเหล็ก
#define GB9 "UR_G_BLACK:G_BLACK_9" // เงินแดง
#define GB10 "UR_G_BLACK:G_BLACK_10" // โคเคน
#define GB11 "UR_G_BLACK:G_BLACK_11" // เงินแดง
#define GB12 "UR_G_BLACK:G_BLACK_12" // สนับ

#define GACHAPON_GB1_AMOUNT      3   // จำนวนปูน (3)
#define GACHAPON_GB2_AMOUNT      3   // จำนวนแท่งเหล็ก (3)
#define GACHAPON_GB3_AMOUNT      4   // จำนวนสายไฟ (4)
#define GACHAPON_GB4_AMOUNT      4    // จำนวนโคเคน (4 )
#define GACHAPON_GB5_AMOUNT      200   // จำนวนเงินแดง (200)
#define GACHAPON_GB6_AMOUNT      4   // จำนวนปูน (4)
#define GACHAPON_GB7_AMOUNT      5   // จำนวนสายไฟ (5)
#define GACHAPON_GB8_AMOUNT      3   // จำนวนแท่งเหล็ก (3)
#define GACHAPON_GB9_AMOUNT      300   // จำนวนเงินแดง (300)
#define GACHAPON_GB10_AMOUNT      5   // จำนวนโคเคน (5)
#define GACHAPON_GB11_AMOUNT      500   // จำนวนเงินแดง (500)
#define GACHAPON_GB12_AMOUNT      1   // จำนวนสนับ (1)

new bool:GachaponBlackOn[MAX_PLAYERS] = false;
new PlayerText:Ms_G_BLACK[MAX_PLAYERS][16]; 
new GachaponBlackSpinTimer[MAX_PLAYERS];
new GachaponBlackSpinCount[MAX_PLAYERS];
new GachaponBlackMaxSpin[MAX_PLAYERS];
new bool:GachaponBlackSpinning[MAX_PLAYERS];


new g_GachaponBlackItems[12][] =
{
    GB1, GB2, GB3, GB4, GB5, GB6, GB7, GB8, GB9, GB10, GB11, GB12
};

new g_GachaponBlackItemNames[12][] =
{
    "ปูน", "แท่งเหล็ก", "สายไฟ", "โคเคน", "เงินแดง", "ปูน", "สายไฟ", "แท่งเหล็ก", "เงินแดง", "โคเคน", "เงินแดง", "สนับมือ"
};

new gachablackRates[12] =
{
    70, // 0 - ปูน 70%
    60, // 1 - แท่งเหล็ก 60%
    50,  // 2 - สายไฟ 50%
    50,  // 3 - โคเคน 50%
    50, // 4 - เงินแดง 50%
    50,  // 5 - ปูน 50%
    40,  // 6 - สายไฟ 40%
    30,  // 7 - แท่งเหล็ก 30%
    40,  // 8 - เงินแดง 40%
    60,  // 9 - โคเคน 60%
    49,  // 10 - เงินแดง 49%
    1   // 11 - สนับมือ 1%
};

hook OnPlayerConnect(playerid)
{
    Ms_G_BLACK[playerid][0] = CreatePlayerTextDraw(playerid, 201.000000, 84.000000, "UR_G_BLACK:G_BLACK");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][0], 233.000000, 291.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][0], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][0], 0);

    Ms_G_BLACK[playerid][1] = CreatePlayerTextDraw(playerid, 285.000000, 354.000000, "Random");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][1], 0.262499, 1.450000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][1], 20.500000, 56.000000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][1], 2);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][1], 1);

    Ms_G_BLACK[playerid][2] = CreatePlayerTextDraw(playerid, 349.000000, 354.000000, "Exit");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][2], 0.262499, 1.450000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][2], 20.500000, 56.000000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][2], 2);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][2], 1);

    Ms_G_BLACK[playerid][3] = CreatePlayerTextDraw(playerid, 228.000000, 123.000000, "UR_G_BLACK:G_BLACK_1");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][3], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][3], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][3], 0);

    Ms_G_BLACK[playerid][4] = CreatePlayerTextDraw(playerid, 228.000000, 177.000000, "UR_G_BLACK:G_BLACK_2");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][4], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][4], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][4], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][4], 0);

    Ms_G_BLACK[playerid][5] = CreatePlayerTextDraw(playerid, 228.000000, 231.000000, "UR_G_BLACK:G_BLACK_3");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][5], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][5], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][5], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][5], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][5], 0);

    Ms_G_BLACK[playerid][6] = CreatePlayerTextDraw(playerid, 228.000000, 285.000000, "UR_G_BLACK:G_BLACK_4");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][6], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][6], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][6], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][6], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][6], 0);

    Ms_G_BLACK[playerid][7] = CreatePlayerTextDraw(playerid, 274.000000, 285.000000, "UR_G_BLACK:G_BLACK_5");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][7], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][7], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][7], 0);

    Ms_G_BLACK[playerid][8] = CreatePlayerTextDraw(playerid, 319.000000, 285.000000, "UR_G_BLACK:G_BLACK_6");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][8], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][8], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][8], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][8], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][8], 0);

    Ms_G_BLACK[playerid][9] = CreatePlayerTextDraw(playerid, 365.000000, 285.000000, "UR_G_BLACK:G_BLACK_7");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][9], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][9], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][9], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][9], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][9], 0);

    Ms_G_BLACK[playerid][10] = CreatePlayerTextDraw(playerid, 365.000000, 231.000000, "UR_G_BLACK:G_BLACK_8");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][10], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][10], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][10], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][10], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][10], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][10], 0);

    Ms_G_BLACK[playerid][11] = CreatePlayerTextDraw(playerid, 365.000000, 177.000000, "UR_G_BLACK:G_BLACK_9");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][11], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][11], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][11], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][11], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][11], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][11], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][11], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][11], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][11], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][11], 0);

    Ms_G_BLACK[playerid][12] = CreatePlayerTextDraw(playerid, 365.000000, 123.000000, "UR_G_BLACK:G_BLACK_10");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][12], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][12], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][12], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][12], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][12], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][12], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][12], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][12], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][12], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][12], 0);

    Ms_G_BLACK[playerid][13] = CreatePlayerTextDraw(playerid, 319.000000, 123.000000, "UR_G_BLACK:G_BLACK_11");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][13], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][13], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][13], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][13], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][13], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][13], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][13], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][13], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][13], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][13], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][13], 0);

    Ms_G_BLACK[playerid][14] = CreatePlayerTextDraw(playerid, 274.000000, 123.000000, "UR_G_BLACK:G_BLACK_12");
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][14], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][14], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][14], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][14], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][14], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][14], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][14], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][14], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][14], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][14], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][14], 0);

    Ms_G_BLACK[playerid][15] = CreatePlayerTextDraw(playerid, 274.000000, 177.000000, ""); //show
    PlayerTextDrawFont(playerid, Ms_G_BLACK[playerid][15], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_BLACK[playerid][15], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_BLACK[playerid][15], 86.500000, 103.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_BLACK[playerid][15], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_BLACK[playerid][15], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_BLACK[playerid][15], 1);
    PlayerTextDrawColor(playerid, Ms_G_BLACK[playerid][15], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_BLACK[playerid][15], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_BLACK[playerid][15], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_BLACK[playerid][15], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_BLACK[playerid][15], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_BLACK[playerid][15], 0);

    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if (clickedid == Text:INVALID_TEXT_DRAW) {
        if(GachaponBlackSpinning[playerid])
        {
            SendClientMessage(playerid, 0xFF0000FF, "ไม่สามารถปิดกาชาปองได้ขณะกำลังหมุน!");
            SelectTextDraw(playerid, -1);
            return 1;
        }
        for (new i = 0; i < 16; i++) {
            PlayerTextDrawHide(playerid, Ms_G_BLACK[playerid][i]);
        }
    }
    return true;
}

stock UpdateGachaponBlackDisplay(playerid)
{
    new currentIndex = GachaponBlackSpinCount[playerid] % 12;
    for(new i = 0; i < 12; i++)
    {
        new itemIndex = (currentIndex + i) % 12;
        PlayerTextDrawSetString(playerid, Ms_G_BLACK[playerid][3 + i], g_GachaponBlackItems[itemIndex]);
        PlayerTextDrawShow(playerid, Ms_G_BLACK[playerid][3 + i]);
    }
}

forward GachaponBlackSpin(playerid);
public GachaponBlackSpin(playerid)
{
    GachaponBlackSpinCount[playerid]++;
    UpdateGachaponBlackDisplay(playerid);
    StopAudioStreamForPlayer(playerid); 
    PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
    if (GachaponBlackSpinCount[playerid] >= GachaponBlackMaxSpin[playerid])
    {
        KillTimer(GachaponBlackSpinTimer[playerid]);
        GachaponBlackSpinning[playerid] = false;
        new finalIndex = (GachaponBlackSpinCount[playerid] % 12);
        new itemIndexAt8 = (finalIndex + 4) % 12;

        StopAudioStreamForPlayer(playerid);
        PlayAudioStreamForPlayer(playerid,"http://85.203.4.121/sound-gachaV1.mp3");
        GiveItemGBToPlayer(playerid, itemIndexAt8);
        return 1;
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if(GachaponBlackSpinning[playerid])
    {
        KillTimer(GachaponBlackSpinTimer[playerid]);
        GachaponBlackSpinning[playerid] = false;
    }
    GachaponBlackOn[playerid] = false;
    return 1;
}
stock GiveItemGBToPlayer(playerid, itemIndexAt8)
{
    new resultString[128];

    if(itemIndexAt8 == 0)
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[0], GACHAPON_GB1_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[0], GACHAPON_GB1_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 1) 
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[1], GACHAPON_GB2_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[1], GACHAPON_GB2_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 2)
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[2], GACHAPON_GB3_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[2], GACHAPON_GB3_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 3) 
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[3], GACHAPON_GB4_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[3], GACHAPON_GB4_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 4) 
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[4], GACHAPON_GB5_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[4], GACHAPON_GB5_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 5) 
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[5], GACHAPON_GB6_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[5], GACHAPON_GB6_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 6) 
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[6], GACHAPON_GB7_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[6], GACHAPON_GB7_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 7)
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[7], GACHAPON_GB8_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[7], GACHAPON_GB8_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 8)
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[8], GACHAPON_GB9_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[8], GACHAPON_GB9_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 9)
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[9], GACHAPON_GB10_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[9], GACHAPON_GB10_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 10) 
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[10], GACHAPON_GB11_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[10], GACHAPON_GB11_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 11) 
    {
        Inventory_Add(playerid, g_GachaponBlackItemNames[11], GACHAPON_GB12_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-BLACK] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponBlackItemNames[11], GACHAPON_GB12_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    
    
    PlayerTextDrawHide(playerid, Ms_G_BLACK[playerid][15]);
    PlayerTextDrawSetString(playerid, Ms_G_BLACK[playerid][15], g_GachaponBlackItems[itemIndexAt8]);
    PlayerTextDrawShow(playerid, Ms_G_BLACK[playerid][15]);

    //format(resultString, sizeof(resultString), "DEBUG - GB: %s", g_GachaponBlackItemNames[itemIndexAt8]);
    //SendClientMessage(playerid, 0xFFFFFFFF, resultString);

    return 1;
}

stock GetWeightedRandomGBItem()
{
    new total = 0;
    for(new i = 0; i < sizeof(gachablackRates); i++)
        total += gachablackRates[i];

    if(total <= 0) return random(sizeof(gachablackRates));

    new r = random(total);
    new sum = 0;
    for(new i = 0; i < sizeof(gachablackRates); i++)
    {
        sum += gachablackRates[i];
        if(r < sum) return i;
    }
    return 0;
}
