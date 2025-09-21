/*
	Gachapon
	UI/Design by M SHOP
	Coded by Ms X Filmx_ex.
*/

#include    <YSI_Coding\y_hooks>

#define GF1 "UR_G_FASHION:G_FASHION_1" // เหรียญแฟชั่น
#define GF2 "UR_G_FASHION:G_FASHION_2" // เครื่องมือซ่อมรถ
#define GF3 "UR_G_FASHION:G_FASHION_3" // ผ้าพันแผล
#define GF4 "UR_G_FASHION:G_FASHION_4" // ปอมปอมปูริน
#define GF5 "UR_G_FASHION:G_FASHION_5" // แร่เขียว
#define GF6 "UR_G_FASHION:G_FASHION_6" // เหรียญแฟชั่น
#define GF7 "UR_G_FASHION:G_FASHION_7" // เป๋าปอมปอม
#define GF8 "UR_G_FASHION:G_FASHION_8" // แร่เหลือง
#define GF9 "UR_G_FASHION:G_FASHION_9" // เหรียญแฟชั่น
#define GF10 "UR_G_FASHION:G_FASHION_10" // แร่แดง
#define GF11 "UR_G_FASHION:G_FASHION_11" // แร่ฟ้า
#define GF12 "UR_G_FASHION:G_FASHION_12" // โปเชโกะ

#define GACHAPON_GF1_AMOUNT      1   // จำนวนเหรียญแฟชั่น (1)
#define GACHAPON_GF2_AMOUNT      2   // จำนวนเครื่องมือซ่อมรถ (2)
#define GACHAPON_GF3_AMOUNT      2   // จำนวนผ้าพันแผล (2)
#define GACHAPON_GF4_AMOUNT      1    // จำนวนปอมปอมปูริน (1 )
#define GACHAPON_GF5_AMOUNT      20   // จำนวนแร่เขียว (20)
#define GACHAPON_GF6_AMOUNT      2   // จำนวนเหรียญแฟชั่น (1)
#define GACHAPON_GF7_AMOUNT      1   // จำนวนเป๋าปอมปอม (1)
#define GACHAPON_GF8_AMOUNT      20   // จำนวนแร่เหลือง (20)
#define GACHAPON_GF9_AMOUNT      1   // จำนวนเหรียญแฟชั่น (1)
#define GACHAPON_GF10_AMOUNT      20   // จำนวนแร่แดง (20)
#define GACHAPON_GF11_AMOUNT      20   // จำนวนแร่ฟ้า (20)
#define GACHAPON_GF12_AMOUNT      1   // จำนวนโปเชโกะ (1)

new bool:GachaponFashOn[MAX_PLAYERS] = false;
new PlayerText:Ms_G_FASHION[MAX_PLAYERS][16]; 
new GachaponFashSpinTimer[MAX_PLAYERS];
new GachaponFashSpinCount[MAX_PLAYERS];
new GachaponFashMaxSpin[MAX_PLAYERS];
new bool:GachaponFashSpinning[MAX_PLAYERS];


new g_GachaponFashItems[12][] =
{
    GF1, GF2, GF3, GF4, GF5, GF6, GF7, GF8, GF9, GF10, GF11, GF12
};

new g_GachaponFashItemNames[12][] =
{
    "เหรียญแฟชั่น", "เครื่องมือซ่อมรถ", "ผ้าพันแผล", "ปอมปอมปูริน", "แร่เขียว", "เหรียญแฟชั่น", "เป๋าปอมปอม", "แร่เหลือง", "เหรียญแฟชั่น", "แร่แดง", "แร่ฟ้า", "โปเชโกะ"
};

new gachaFashRates[12] =
{
    70, // 0 - เหรียญแฟชั่น 70%
    70, // 1 - เครื่องมือซ่อมรถ 70%
    70,  // 2 - ผ้าพันแผล 70%
    5,  // 3 - ปอมปอมปูริน 5%
    70, // 4 - แร่เขียว 70%
    70,  // 5 - เหรียญแฟชั่น 70%
    5,  // 6 - เป๋าปอมปอม 5%
    70,  // 7 - แร่เหลือง 70%
    70,  // 8 - เหรียญแฟชั่น 70%
    70,  // 9 - แร่แดง 70%
    70,  // 10 - แร่ฟ้า 70%
    5   // 11 - โปเชโกะ 5%
};

hook OnPlayerConnect(playerid)
{
    Ms_G_FASHION[playerid][0] = CreatePlayerTextDraw(playerid, 201.000000, 84.000000, "UR_G_FASHION:G_FASHION");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][0], 233.000000, 291.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][0], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][0], 0);

    Ms_G_FASHION[playerid][1] = CreatePlayerTextDraw(playerid, 285.000000, 354.000000, "Random");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][1], 0.262499, 1.450000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][1], 20.500000, 56.000000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][1], 2);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][1], 1);

    Ms_G_FASHION[playerid][2] = CreatePlayerTextDraw(playerid, 349.000000, 354.000000, "Exit");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][2], 0.262499, 1.450000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][2], 20.500000, 56.000000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][2], 2);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][2], 1);

    Ms_G_FASHION[playerid][3] = CreatePlayerTextDraw(playerid, 228.000000, 123.000000, "UR_G_FASHION:G_FASHION_1");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][3], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][3], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][3], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][3], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][3], 0);

    Ms_G_FASHION[playerid][4] = CreatePlayerTextDraw(playerid, 228.000000, 177.000000, "UR_G_FASHION:G_FASHION_2");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][4], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][4], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][4], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][4], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][4], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][4], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][4], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][4], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][4], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][4], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][4], 0);

    Ms_G_FASHION[playerid][5] = CreatePlayerTextDraw(playerid, 228.000000, 231.000000, "UR_G_FASHION:G_FASHION_3");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][5], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][5], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][5], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][5], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][5], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][5], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][5], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][5], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][5], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][5], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][5], 0);

    Ms_G_FASHION[playerid][6] = CreatePlayerTextDraw(playerid, 228.000000, 285.000000, "UR_G_FASHION:G_FASHION_4");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][6], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][6], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][6], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][6], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][6], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][6], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][6], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][6], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][6], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][6], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][6], 0);

    Ms_G_FASHION[playerid][7] = CreatePlayerTextDraw(playerid, 274.000000, 285.000000, "UR_G_FASHION:G_FASHION_5");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][7], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][7], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][7], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][7], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][7], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][7], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][7], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][7], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][7], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][7], 0);

    Ms_G_FASHION[playerid][8] = CreatePlayerTextDraw(playerid, 319.000000, 285.000000, "UR_G_FASHION:G_FASHION_6");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][8], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][8], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][8], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][8], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][8], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][8], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][8], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][8], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][8], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][8], 0);

    Ms_G_FASHION[playerid][9] = CreatePlayerTextDraw(playerid, 365.000000, 285.000000, "UR_G_FASHION:G_FASHION_7");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][9], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][9], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][9], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][9], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][9], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][9], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][9], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][9], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][9], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][9], 0);

    Ms_G_FASHION[playerid][10] = CreatePlayerTextDraw(playerid, 365.000000, 231.000000, "UR_G_FASHION:G_FASHION_8");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][10], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][10], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][10], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][10], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][10], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][10], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][10], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][10], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][10], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][10], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][10], 0);

    Ms_G_FASHION[playerid][11] = CreatePlayerTextDraw(playerid, 365.000000, 177.000000, "UR_G_FASHION:G_FASHION_9");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][11], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][11], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][11], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][11], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][11], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][11], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][11], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][11], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][11], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][11], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][11], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][11], 0);

    Ms_G_FASHION[playerid][12] = CreatePlayerTextDraw(playerid, 365.000000, 123.000000, "UR_G_FASHION:G_FASHION_10");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][12], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][12], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][12], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][12], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][12], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][12], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][12], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][12], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][12], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][12], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][12], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][12], 0);

    Ms_G_FASHION[playerid][13] = CreatePlayerTextDraw(playerid, 319.000000, 123.000000, "UR_G_FASHION:G_FASHION_11");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][13], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][13], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][13], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][13], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][13], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][13], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][13], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][13], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][13], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][13], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][13], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][13], 0);

    Ms_G_FASHION[playerid][14] = CreatePlayerTextDraw(playerid, 274.000000, 123.000000, "UR_G_FASHION:G_FASHION_12");
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][14], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][14], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][14], 41.500000, 49.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][14], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][14], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][14], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][14], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][14], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][14], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][14], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][14], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][14], 0);

    Ms_G_FASHION[playerid][15] = CreatePlayerTextDraw(playerid, 274.000000, 177.000000, ""); //show
    PlayerTextDrawFont(playerid, Ms_G_FASHION[playerid][15], 4);
    PlayerTextDrawLetterSize(playerid, Ms_G_FASHION[playerid][15], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Ms_G_FASHION[playerid][15], 86.500000, 103.500000);
    PlayerTextDrawSetOutline(playerid, Ms_G_FASHION[playerid][15], 1);
    PlayerTextDrawSetShadow(playerid, Ms_G_FASHION[playerid][15], 0);
    PlayerTextDrawAlignment(playerid, Ms_G_FASHION[playerid][15], 1);
    PlayerTextDrawColor(playerid, Ms_G_FASHION[playerid][15], -1);
    PlayerTextDrawBackgroundColor(playerid, Ms_G_FASHION[playerid][15], 255);
    PlayerTextDrawBoxColor(playerid, Ms_G_FASHION[playerid][15], 50);
    PlayerTextDrawUseBox(playerid, Ms_G_FASHION[playerid][15], 1);
    PlayerTextDrawSetProportional(playerid, Ms_G_FASHION[playerid][15], 1);
    PlayerTextDrawSetSelectable(playerid, Ms_G_FASHION[playerid][15], 0);

    return 1;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid) {
    if (clickedid == Text:INVALID_TEXT_DRAW) {
        if(GachaponFashSpinning[playerid])
        {
            SendClientMessage(playerid, 0xFF0000FF, "ไม่สามารถปิดกาชาปองได้ขณะกำลังหมุน!");
            SelectTextDraw(playerid, -1);
            return 1;
        }
        for (new i = 0; i < 16; i++) {
            PlayerTextDrawHide(playerid, Ms_G_FASHION[playerid][i]);
        }
    }
    return true;
}


stock UpdateGachaponFashDisplay(playerid)
{
    new currentIndex = GachaponFashSpinCount[playerid] % 12;
    for(new i = 0; i < 12; i++)
    {
        new itemIndex = (currentIndex + i) % 12;
        PlayerTextDrawSetString(playerid, Ms_G_FASHION[playerid][3 + i], g_GachaponFashItems[itemIndex]);
        PlayerTextDrawShow(playerid, Ms_G_FASHION[playerid][3 + i]);
    }
}

forward GachaponFashSpin(playerid);
public GachaponFashSpin(playerid)
{
    GachaponFashSpinCount[playerid]++;
    UpdateGachaponFashDisplay(playerid);
    StopAudioStreamForPlayer(playerid); 
    PlayerPlaySound(playerid, 1135, 0.0, 0.0, 0.0);
    if (GachaponFashSpinCount[playerid] >= GachaponFashMaxSpin[playerid])
    {
        KillTimer(GachaponFashSpinTimer[playerid]);
        GachaponFashSpinning[playerid] = false;
        new finalIndex = (GachaponFashSpinCount[playerid] % 12);
        new itemIndexAt8 = (finalIndex + 4) % 12;

        StopAudioStreamForPlayer(playerid);
        PlayAudioStreamForPlayer(playerid,"http://85.203.4.121/sound-gachaV1.mp3");
        GiveItemGFToPlayer(playerid, itemIndexAt8);
        return 1;
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if(GachaponFashSpinning[playerid])
    {
        KillTimer(GachaponFashSpinTimer[playerid]);
        GachaponFashSpinning[playerid] = false;
    }
    GachaponFashOn[playerid] = false;
    return 1;
}
stock GiveItemGFToPlayer(playerid, itemIndexAt8)
{
    new resultString[128];

    if(itemIndexAt8 == 0)
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[0], GACHAPON_GF1_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[0], GACHAPON_GF1_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 1) 
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[1], GACHAPON_GF2_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[1], GACHAPON_GF2_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 2)
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[2], GACHAPON_GF3_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[2], GACHAPON_GF3_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 3) 
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[3], GACHAPON_GF4_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[3], GACHAPON_GF4_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 4) 
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[4], GACHAPON_GF5_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[4], GACHAPON_GF5_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 5) 
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[5], GACHAPON_GF6_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[5], GACHAPON_GF6_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 6) 
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[6], GACHAPON_GF7_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[6], GACHAPON_GF7_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 7)
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[7], GACHAPON_GF8_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[7], GACHAPON_GF8_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 8)
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[8], GACHAPON_GF9_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[8], GACHAPON_GF9_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 9)
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[9], GACHAPON_GF10_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[9], GACHAPON_GF10_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 10) 
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[10], GACHAPON_GF11_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[10], GACHAPON_GF11_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    else if(itemIndexAt8 == 11) 
    {
        Inventory_Add(playerid, g_GachaponFashItemNames[11], GACHAPON_GF12_AMOUNT);
        format(resultString, sizeof(resultString), "{FFFF00}[UR-GACHAPON-FASHION] {FFFFFF}คุณได้ '%s' จำนวน {00FF00}%d", g_GachaponFashItemNames[11], GACHAPON_GF12_AMOUNT);
        SendClientMessage(playerid, -1, resultString);
    }
    
    
    PlayerTextDrawHide(playerid, Ms_G_FASHION[playerid][15]);
    PlayerTextDrawSetString(playerid, Ms_G_FASHION[playerid][15], g_GachaponFashItems[itemIndexAt8]);
    PlayerTextDrawShow(playerid, Ms_G_FASHION[playerid][15]);

    //format(resultString, sizeof(resultString), "DEBUG - GB: %s", g_GachaponFashItemNames[itemIndexAt8]);
    //SendClientMessage(playerid, 0xFFFFFFFF, resultString);

    return 1;
}

stock GetWeightedRandomGFItem()
{
    new total = 0;
    for(new i = 0; i < sizeof(gachaFashRates); i++)
        total += gachaFashRates[i];

    if(total <= 0) return random(sizeof(gachaFashRates));

    new r = random(total);
    new sum = 0;
    for(new i = 0; i < sizeof(gachaFashRates); i++)
    {
        sum += gachaFashRates[i];
        if(r < sum) return i;
    }
    return 0;
}
