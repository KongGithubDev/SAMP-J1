#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_COAL        20
#define     COALOBJECT      3931 // โมเดลหินดำๆ ใช้แทนคาร์บอน
#define     COALTEXT        "{FFFFFF}กด {FFFF00}N {FFFFFF}เพื่อเก็บคาร์บอน"
#define     COALNAME        "คาร์บอน"

static CoalTake[MAX_PLAYERS];
enum COAL_DATA{
    coalID,
    coalObject,
    Float: coalPos[3],
    Text3D: coal3D,
    coal3DMSG[80],
    coalOn
};

new const coalData[20][COAL_DATA] = {
    { 0, COALOBJECT, { -310.4519,1852.1788,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 1, COALOBJECT, { -308.2424,1862.4330,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 2, COALOBJECT, { -295.1858,1867.3319,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 3, COALOBJECT, { -289.3022,1855.4457,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 4, COALOBJECT, { -295.3218,1837.2988,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 5, COALOBJECT, { -305.1264,1824.8983,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 6, COALOBJECT, { -326.0432,1832.3074,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 7, COALOBJECT, { -333.0406,1843.7843,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 8, COALOBJECT, { -342.9430,1839.5916,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    { 9, COALOBJECT, { -334.9084,1827.5571,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {10, COALOBJECT, { -298.6180,1859.6279,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {11, COALOBJECT, { -300.5592,1852.6418,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {12, COALOBJECT, { -304.4188,1844.1621,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {13, COALOBJECT, { -309.3204,1836.2283,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {14, COALOBJECT, { -325.9501,1840.6853,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {15, COALOBJECT, { -333.4872,1836.0037,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {16, COALOBJECT, { -341.5977,1831.3613,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {17, COALOBJECT, { -342.4232,1823.9482,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {18, COALOBJECT, { -330.6390,1820.9633,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 },
    {19, COALOBJECT, { -312.7606,1819.1488,42.2891 }, Text3D: INVALID_3DTEXT_ID, COALTEXT, 0 }
};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(coalData); i++){
		coalData[i][coalID] = CreateDynamicObject(coalData[i][coalObject], coalData[i][coalPos][0], coalData[i][coalPos][1], coalData[i][coalPos][2], 0.0, 0.0, 0.0);
		coalData[i][coal3D] = CreateDynamic3DTextLabel(coalData[i][coal3DMSG], COLOR_GREEN, coalData[i][coalPos][0], coalData[i][coalPos][1], coalData[i][coalPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	CoalTake[playerid] = 0;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof coalData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(coalData[i][coalID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(coalData[i][coalID])){
					if(CoalTake[playerid] == 0){
                       
						new ammo = Inventory_Count(playerid, COALNAME);
                    	if(ammo >= 50) 
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);

	                    coalData[i][coalOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerCoalUnfreeze[3*1000](playerid, i);
						CoalTake[playerid] = 1;
                        StartProgress(playerid, 30, 0, 0);
		                return 1;
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLCOAL(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, COALNAME);
				new price = ammo * priceCoal;

			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {FFFFFF}คุณไม่มี คาร์บอน อยู่ในตัวเลย");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKET ] {FFFFFF}คุณได้รับเงินจำนวน {00FF00}%s {FFFFFF}จากการขาย คาร์บอน {00FF00}%d {FFFFFF}ก้อน", FormatMoney(price), ammo);
				Inventory_Remove(playerid, COALNAME , ammo);
		    }
		}
	}
	return 1;
}

ptask CoalJob[1000](playerid){
	if(CoalTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerCoalUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	CoalTake[playerid] = 0;
	DestroyDynamicObject(coalData[number][coalID]);
	DestroyDynamic3DTextLabel(coalData[number][coal3D]);
	coalData[number][coalOn] = 0;
	defer CreateCoalObject[10000](number);
	new ammo = Inventory_Count(playerid, COALNAME);
    if(ammo >= 50) 
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 เต็มแล้ว", ammo);
	new id = Inventory_Add(playerid, COALNAME, 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ แจ้งเตือน ] {ffffff} ความจุของกระเป๋าไม่เพียงพอ");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ แจ้งเตือน ] {ffffff} คุณได้รับ {00FF00}คาร์บอน +1");
    return 1;
}

timer CreateCoalObject[10000](number){
	coalData[number][coalID] = CreateDynamicObject(coalData[number][coalObject], coalData[number][coalPos][0], coalData[number][coalPos][1], coalData[number][coalPos][2], 0.0, 0.0, 0.0);
	coalData[number][coal3D] = CreateDynamic3DTextLabel(coalData[number][coal3DMSG], COLOR_GREEN, coalData[number][coalPos][0], coalData[number][coalPos][1], coalData[number][coalPos][2] + 1.5, 5.0);
}
