#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_HONEY       	9
#define     HONEYOBJECT       	15067
#define     HONEYTEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     HONEYNAME           "รังผึ่ง"

static HoneyTake[MAX_PLAYERS];
enum HONEY_DATA{
    honeyID,
    honeyObject,
    Float: honeyPos[3],
    Text3D: honey3D,
    honey3DMSG[80],
    honeyOn
}; 

new const honeyData[MAX_HONEY][HONEY_DATA] ={
	{ 0, HONEYOBJECT, {	-510.672607, -1530.934204, 8.423933 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 1, HONEYOBJECT, { -525.918518, -1530.639892, 7.949655 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 2, HONEYOBJECT, { -496.463165, -1531.169921, 9.201826 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 3, HONEYOBJECT, { -496.878936, -1546.414306, 8.108248 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 4, HONEYOBJECT, { -496.629058, -1560.025390, 6.839267 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 5, HONEYOBJECT, { -511.913970, -1559.583862, 6.079306 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 6, HONEYOBJECT, { -511.821136, -1545.632324, 7.185430 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 7, HONEYOBJECT, { -526.209777, -1546.395507, 6.995474 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 },
	{ 8, HONEYOBJECT, { -525.807800, -1559.544799, 6.106559 }, Text3D: INVALID_3DTEXT_ID, HONEYTEXT, 0 }
};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(honeyData); i++){
		honeyData[i][honeyID] = CreateDynamicObject(honeyData[i][honeyObject], honeyData[i][honeyPos][0], honeyData[i][honeyPos][1], honeyData[i][honeyPos][2], 0.0, 0.0, 0.0);
		honeyData[i][honey3D] = CreateDynamic3DTextLabel(honeyData[i][honey3DMSG], COLOR_GREEN, honeyData[i][honeyPos][0], honeyData[i][honeyPos][1], honeyData[i][honeyPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	HoneyTake[playerid] = 0;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof honeyData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(honeyData[i][honeyID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(honeyData[i][honeyID])){
					if(HoneyTake[playerid] == 0){
                       
						new ammo = Inventory_Count(playerid, "รังผึ่ง");
                    	if(Inventory_Count(playerid, "รังผึ่ง") >= 50) // คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

	                    honeyData[i][honeyOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerHoneyUnfreeze[10*1000](playerid, i);
						HoneyTake[playerid] = 1;
		                
                        StartProgress(playerid, 100, 0, 0);
		                return 1;
	                }
	                else {
	                    //SendClientMessage(playerid, COLOR_RED, "[[ระบบ]] Error HoneyJob Please wait."); //DeBug
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLHONEY(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "รังผึ่ง");
				new price = ammo*priceHoney;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี รังผึ่ง อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย รังผึ่ง {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "รังผึ่ง" , ammo);
		    }
		}
	}
	return 1;
}

ptask HoneyJob[1000](playerid){
	if(HoneyTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerHoneyUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	HoneyTake[playerid] = 0;
	DestroyDynamicObject(honeyData[number][honeyID]);
	DestroyDynamic3DTextLabel(honeyData[number][honey3D]);
	honeyData[number][honeyOn] = 0;
	defer CreateHoneyObject(number);
	new ammo = Inventory_Count(playerid, "รังผึ่ง");
    if(Inventory_Count(playerid, "รังผึ่ง") >= 50) // คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
	new id = Inventory_Add(playerid, "รังผึ่ง", 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[แจ้งเตือน] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}รังผึ่ง +1");
    return 1;
}

timer CreateHoneyObject[10000](number){
	honeyData[number][honeyID] = CreateDynamicObject(honeyData[number][honeyObject], honeyData[number][honeyPos][0], honeyData[number][honeyPos][1], honeyData[number][honeyPos][2], 0.0, 0.0, 0.0);
	honeyData[number][honey3D] = CreateDynamic3DTextLabel(honeyData[number][honey3DMSG], COLOR_GREEN, honeyData[number][honeyPos][0], honeyData[number][honeyPos][1], honeyData[number][honeyPos][2] + 1.5, 5.0);
}
