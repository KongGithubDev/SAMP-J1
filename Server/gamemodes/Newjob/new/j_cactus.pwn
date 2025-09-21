#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_CACTUS       	9
#define     CACTUSOBJECT       	15084
#define     CACTUSTEXT           "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บ"
#define     CACTUSNAME           "กระบองเพชร"

static CactusTake[MAX_PLAYERS];
enum CACTUS_DATA{
    cactusID,
    cactusObject,
    Float: cactusPos[3],
    Text3D: cactus3D,
    cactus3DMSG[80],
    cactusOn
};

new const cactusData[MAX_CACTUS][CACTUS_DATA] ={
	{ 0, CACTUSOBJECT, { 1122.908447, 740.548706, 9.818805 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 1, CACTUSOBJECT, { 1109.271118, 740.355407, 9.818805 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 2, CACTUSOBJECT, { 1096.723876, 740.177429, 9.818805 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 3, CACTUSOBJECT, { 1096.605712, 750.853576, 9.820312 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 4, CACTUSOBJECT, { 1096.785522, 761.176452, 9.820312 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 5, CACTUSOBJECT, { 1109.616699, 759.996582, 9.820312 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 6, CACTUSOBJECT, { 1109.531860, 751.021667, 9.820312 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 7, CACTUSOBJECT, { 1122.838012, 749.292480, 9.820312 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 },
	{ 8, CACTUSOBJECT, { 1122.420654, 758.801269, 9.820312 }, Text3D: INVALID_3DTEXT_ID, CACTUSTEXT, 0 }

};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(cactusData); i++){
		cactusData[i][cactusID] = CreateDynamicObject(cactusData[i][cactusObject], cactusData[i][cactusPos][0], cactusData[i][cactusPos][1], cactusData[i][cactusPos][2], 0.0, 0.0, 0.0);
		cactusData[i][cactus3D] = CreateDynamic3DTextLabel(cactusData[i][cactus3DMSG], COLOR_GREEN, cactusData[i][cactusPos][0], cactusData[i][cactusPos][1], cactusData[i][cactusPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	CactusTake[playerid] = 0;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof cactusData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(cactusData[i][cactusID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(cactusData[i][cactusID])){
					if(CactusTake[playerid] == 0){
                       
						new ammo = Inventory_Count(playerid, "กระบองเพชร");
                    	if(Inventory_Count(playerid, "กระบองเพชร") >= 50) //  คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

	                    cactusData[i][cactusOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerCactusUnfreeze[10*1000](playerid, i);
						CactusTake[playerid] = 1;
                        StartProgress(playerid, 100, 0, 0);
		                return 1;
	                }
	                else {
	                    //SendClientMessage(playerid, COLOR_RED, "[[ระบบ]] Error CactusJob Please wait."); //DeBug
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLCACTUS(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "กระบองเพชร");
				new price = ammo*priceCactus;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี กระบองเพชร อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย กระบองเพชร {00FF00}%d {FFFFFF}ชิ้น", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "กระบองเพชร" , ammo);
		    }
		}
	}
	return 1;
}

ptask CactusJob[1000](playerid){
	if(CactusTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerCactusUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	CactusTake[playerid] = 0;
	DestroyDynamicObject(cactusData[number][cactusID]);
	DestroyDynamic3DTextLabel(cactusData[number][cactus3D]);
	cactusData[number][cactusOn] = 0;
	defer CreateCactusObject(number);
	new ammo = Inventory_Count(playerid, "กระบองเพชร");
    if(Inventory_Count(playerid, "กระบองเพชร") >= 50) // คือจะให้มันตันเท่าไหร่ ปรับเอาเลย
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
	new id = Inventory_Add(playerid, "กระบองเพชร", 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}กระบองเพชร +1");
    return 1;
}

timer CreateCactusObject[10000](number){
	cactusData[number][cactusID] = CreateDynamicObject(cactusData[number][cactusObject], cactusData[number][cactusPos][0], cactusData[number][cactusPos][1], cactusData[number][cactusPos][2], 0.0, 0.0, 0.0);
	cactusData[number][cactus3D] = CreateDynamic3DTextLabel(cactusData[number][cactus3DMSG], COLOR_GREEN, cactusData[number][cactusPos][0], cactusData[number][cactusPos][1], cactusData[number][cactusPos][2] + 1.5, 5.0);
}
