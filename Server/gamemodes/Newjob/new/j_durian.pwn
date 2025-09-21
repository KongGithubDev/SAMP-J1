#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_DURIAN       	9
#define     DURIANOBJECT       	15085
#define     DURIANTEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     DURIANNAME           "ทุเรียน"

static DurianTake[MAX_PLAYERS];
enum DURIAN_DATA{
    durianID,
    durianObject,
    Float: durianPos[3],
    Text3D: durian3D,
    durian3DMSG[80],
    durianOn
};

new const durianData[MAX_DURIAN][DURIAN_DATA] ={
	{ 0, DURIANOBJECT, { -264.536865, -1449.018310, 5.362009 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 1, DURIANOBJECT, { -275.168273, -1449.618164, 6.246637 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 2, DURIANOBJECT, { -284.514190, -1449.294311, 7.800273 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 3, DURIANOBJECT, { -284.701049, -1437.756713, 10.132442 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 4, DURIANOBJECT, { -275.884094, -1437.666503, 9.248581 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 5, DURIANOBJECT, { -266.668609, -1437.803833, 8.088487 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 6, DURIANOBJECT, { -262.541595, -1460.745117, 3.783583 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 7, DURIANOBJECT, { -273.763214, -1461.884887, 3.450285 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 },
	{ 8, DURIANOBJECT, { -285.017761, -1459.698364, 5.587922 }, Text3D: INVALID_3DTEXT_ID, DURIANTEXT, 0 }

};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(durianData); i++){
		durianData[i][durianID] = CreateDynamicObject(durianData[i][durianObject], durianData[i][durianPos][0], durianData[i][durianPos][1], durianData[i][durianPos][2], 0.0, 0.0, 0.0);
		durianData[i][durian3D] = CreateDynamic3DTextLabel(durianData[i][durian3DMSG], COLOR_GREEN, durianData[i][durianPos][0], durianData[i][durianPos][1], durianData[i][durianPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	DurianTake[playerid] = 0;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof durianData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(durianData[i][durianID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(durianData[i][durianID])){
					if(DurianTake[playerid] == 0){
                       
						new ammo = Inventory_Count(playerid, "ทุเรียน");
                    	if(Inventory_Count(playerid, "ทุเรียน") >= 50) //  คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

	                    durianData[i][durianOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerDurianUnfreeze[10*1000](playerid, i);
						DurianTake[playerid] = 1;
                        StartProgress(playerid, 100, 0, 0);
		                return 1;
	                }
	                else {
	                    //SendClientMessage(playerid, COLOR_RED, "[[ระบบ]] Error DurianJob Please wait."); //DeBug
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLDURIAN(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "ทุเรียน");
				new price = ammo*priceDurian;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี ทุเรียน อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย ทุเรียน {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "ทุเรียน" , ammo);
		    }
		}
	}
	return 1;
}

ptask DurianJob[1000](playerid){
	if(DurianTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerDurianUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	DurianTake[playerid] = 0;
	DestroyDynamicObject(durianData[number][durianID]);
	DestroyDynamic3DTextLabel(durianData[number][durian3D]);
	durianData[number][durianOn] = 0;
	defer CreateDurianObject(number);
	new ammo = Inventory_Count(playerid, "ทุเรียน");
    if(Inventory_Count(playerid, "ทุเรียน") >= 50) // คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
	new id = Inventory_Add(playerid, "ทุเรียน", 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}ทุเรียน +1");
    return 1;
}

timer CreateDurianObject[10000](number){
	durianData[number][durianID] = CreateDynamicObject(durianData[number][durianObject], durianData[number][durianPos][0], durianData[number][durianPos][1], durianData[number][durianPos][2], 0.0, 0.0, 0.0);
	durianData[number][durian3D] = CreateDynamic3DTextLabel(durianData[number][durian3DMSG], COLOR_GREEN, durianData[number][durianPos][0], durianData[number][durianPos][1], durianData[number][durianPos][2] + 1.5, 5.0);
}
