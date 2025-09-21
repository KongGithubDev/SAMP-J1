#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_SQUID       	9
#define     SQUIDOBJECT       	15065
#define     SQUIDTEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     SQUIDNAME           "ปลาหมึก"

static SquidTake[MAX_PLAYERS];
enum SQUID_DATA{
    squidID,
    squidObject,
    Float: squidPos[3],
    Text3D: squid3D,
    squid3DMSG[80],
    squidOn
};

new const squidData[MAX_SQUID][SQUID_DATA] ={
	{ 0, SQUIDOBJECT, { 2913.134765, -1965.528076, 0.192872 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 1, SQUIDOBJECT, { 2913.003662, -1982.931030, 0.118001 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 2, SQUIDOBJECT, { 2913.124267, -1998.249023, 0.146059 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 3, SQUIDOBJECT, { 2901.762207, -1998.212036, 1.998935 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 4, SQUIDOBJECT, { 2902.312988, -1982.129638, 1.720637 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 5, SQUIDOBJECT, { 2902.570556, -1964.530151, 1.643463 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 6, SQUIDOBJECT, { 2892.323730, -1964.467041, 3.771721 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 7, SQUIDOBJECT, { 2892.536621, -1982.563598, 3.824063 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 },
	{ 8, SQUIDOBJECT, { 2893.075439, -1998.792724, 3.662057 }, Text3D: INVALID_3DTEXT_ID, SQUIDTEXT, 0 }
};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(squidData); i++){
		squidData[i][squidID] = CreateDynamicObject(squidData[i][squidObject], squidData[i][squidPos][0], squidData[i][squidPos][1], squidData[i][squidPos][2], 0.0, 0.0, 0.0);
		squidData[i][squid3D] = CreateDynamic3DTextLabel(squidData[i][squid3DMSG], COLOR_GREEN, squidData[i][squidPos][0], squidData[i][squidPos][1], squidData[i][squidPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	SquidTake[playerid] = 0;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof squidData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(squidData[i][squidID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(squidData[i][squidID])){
					if(SquidTake[playerid] == 0){
                       
						new ammo = Inventory_Count(playerid, "ปลาหมึก");
                    	if(Inventory_Count(playerid, "ปลาหมึก") >= 50) //  คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

	                    squidData[i][squidOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerSquidUnfreeze[10*1000](playerid, i);
						SquidTake[playerid] = 1;
                        StartProgress(playerid, 100, 0, 0);
		                return 1;
	                }
	                else {
	                    //SendClientMessage(playerid, COLOR_RED, "[[ระบบ]] Error SquidJob Please wait."); //DeBug
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLSQUID(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "ปลาหมึก");
				new price = ammo*priceSquid;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ปลาหมึก อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ปลาหมึก {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ปลาหมึก" , ammo);
		    }
		}
	}
	return 1;
}

ptask SquidJob[1000](playerid){
	if(SquidTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerSquidUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	SquidTake[playerid] = 0;
	DestroyDynamicObject(squidData[number][squidID]);
	DestroyDynamic3DTextLabel(squidData[number][squid3D]);
	squidData[number][squidOn] = 0;
	defer CreateSquidObject(number);
	new ammo = Inventory_Count(playerid, "ปลาหมึก");
    if(Inventory_Count(playerid, "ปลาหมึก") >= 50) // คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
	new id = Inventory_Add(playerid, "ปลาหมึก", 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ปลาหมึก +1");
    return 1;
}

timer CreateSquidObject[10000](number){
	squidData[number][squidID] = CreateDynamicObject(squidData[number][squidObject], squidData[number][squidPos][0], squidData[number][squidPos][1], squidData[number][squidPos][2], 0.0, 0.0, 0.0);
	squidData[number][squid3D] = CreateDynamic3DTextLabel(squidData[number][squid3DMSG], COLOR_GREEN, squidData[number][squidPos][0], squidData[number][squidPos][1], squidData[number][squidPos][2] + 1.5, 5.0);
}
