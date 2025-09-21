#include	<YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>

#define     MAX_LOBSTER       	9
#define     LOBSTEROBJECT       15086
#define     LOBSTERTEXT         "{FFFFFF}�� {FFFF00}N {FFFFFF}������"
#define     LOBSTERNAME         "�����ͺ�����"

static LobsterTake[MAX_PLAYERS];
enum LOBSTER_DATA{
    lobsterID,
    lobsterObject,
    Float: lobsterPos[3],
    Text3D: lobster3D,
    lobster3DMSG[80],
    lobsterOn
};

new const lobsterData[MAX_LOBSTER][LOBSTER_DATA] ={
	{ 0, LOBSTEROBJECT, { 618.527954, -1915.012451, 0.217311 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 1, LOBSTEROBJECT, { 607.757446, -1913.734497, 0.237424 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 2, LOBSTEROBJECT, { 595.995422, -1912.230346, 0.217693 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 3, LOBSTEROBJECT, { 596.308959, -1903.546020, 1.899529 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 4, LOBSTEROBJECT, { 609.206298, -1904.503051, 1.948367 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 5, LOBSTEROBJECT, { 619.551940, -1905.234741, 1.949454 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 6, LOBSTEROBJECT, { 619.991577, -1894.428588, 2.499464 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 7, LOBSTEROBJECT, { 609.878295, -1893.896606, 2.542868 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 },
	{ 8, LOBSTEROBJECT, { 596.501281, -1894.379394, 2.595707 }, Text3D: INVALID_3DTEXT_ID, LOBSTERTEXT, 0 }

};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(lobsterData); i++){
		lobsterData[i][lobsterID] = CreateDynamicObject(lobsterData[i][lobsterObject], lobsterData[i][lobsterPos][0], lobsterData[i][lobsterPos][1], lobsterData[i][lobsterPos][2], 0.0, 0.0, 0.0);
		lobsterData[i][lobster3D] = CreateDynamic3DTextLabel(lobsterData[i][lobster3DMSG], COLOR_GREEN, lobsterData[i][lobsterPos][0], lobsterData[i][lobsterPos][1], lobsterData[i][lobsterPos][2] + 1.5, 5.0);
	}
	return 1;
}

hook OnPlayerSpawn(playerid){
	LobsterTake[playerid] = 0;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid)){
        for(new i = 0; i < sizeof lobsterData; i++){   
			new Float:x, Float:y, Float:z;
            GetDynamicObjectPos(lobsterData[i][lobsterID], x, y, z);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)){
                if(IsValidDynamicObject(lobsterData[i][lobsterID])){
					if(LobsterTake[playerid] == 0){
                       
						new ammo = Inventory_Count(playerid, "�����ͺ�����");
                    	if(Inventory_Count(playerid, "�����ͺ�����") >= 50) //  ��ͨ�����ѹ�ѹ������� ��Ѻ������
                       		return SendClientMessageEx(playerid, COLOR_RED, "%d/50 �������", ammo);

	                    lobsterData[i][lobsterOn] = 1;
		                TogglePlayerControllable(playerid, false);
		                ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		                defer PlayerLobsterUnfreeze[10*1000](playerid, i);
						LobsterTake[playerid] = 1;
                        StartProgress(playerid, 100, 0, 0);
		                return 1;
	                }
	                else {
	                    //SendClientMessage(playerid, COLOR_RED, "[[�к�]] Error LobsterJob Please wait."); //DeBug
	                }
                }
            }
		}
    }
	return 1;
}

Dialog:DIALOG_SELLLOBSTER(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
			    new ammo = Inventory_Count(playerid, "�����ͺ�����");
				new price = ammo*priceLobster;
			   
			    if (ammo <= 0)
			        return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {FFFFFF}�س����� �����ͺ����� ����㹵�����");

		        GivePlayerMoneyEx(playerid, price);
				PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
		        SendClientMessageEx(playerid, COLOR_GREEN, "[ MARKRT ] {FFFFFF}�س���Ѻ�Թ�ӹǹ {00FF00}%s {FFFFFF}�ҡ��â�� �����ͺ����� {00FF00}%d {FFFFFF}���", FormatMoney(price), ammo);
				Inventory_Remove(playerid, "�����ͺ�����" , ammo);
		    }
		}
	}
	return 1;
}

ptask LobsterJob[1000](playerid){
	if(LobsterTake[playerid] == 1){
		TogglePlayerControllable(playerid, 0);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 1, 0, 0, 0, 0, 1);
		return 1;
	}
	return 1;
}

timer PlayerLobsterUnfreeze[1000](playerid, number){
	PlayerPlaySound(playerid,1083,0.0,0.0,0.0);
	TogglePlayerControllable(playerid, true);
	ClearAnimations(playerid);
	LobsterTake[playerid] = 0;
	DestroyDynamicObject(lobsterData[number][lobsterID]);
	DestroyDynamic3DTextLabel(lobsterData[number][lobster3D]);
	lobsterData[number][lobsterOn] = 0;
	defer CreateLobsterObject(number);
	new ammo = Inventory_Count(playerid, "�����ͺ�����");
    if(Inventory_Count(playerid, "�����ͺ�����") >= 50) // ��ͨ�����ѹ�ѹ������� ��Ѻ������
        return SendClientMessageEx(playerid, COLOR_RED, "%d/50 �������", ammo);
	new id = Inventory_Add(playerid, "�����ͺ�����", 1);
	if (id == -1) return SendClientMessage(playerid, COLOR_YELLOW, "[ ����͹ ] {ffffff} �����آͧ�����������§��");
	
    SendClientMessage(playerid, COLOR_GREEN, "[ ����͹ ] {ffffff} �س���Ѻ {00FF00}�����ͺ����� +1");
    return 1;
}

timer CreateLobsterObject[10000](number){
	lobsterData[number][lobsterID] = CreateDynamicObject(lobsterData[number][lobsterObject], lobsterData[number][lobsterPos][0], lobsterData[number][lobsterPos][1], lobsterData[number][lobsterPos][2], 0.0, 0.0, 0.0);
	lobsterData[number][lobster3D] = CreateDynamic3DTextLabel(lobsterData[number][lobster3DMSG], COLOR_GREEN, lobsterData[number][lobsterPos][0], lobsterData[number][lobsterPos][1], lobsterData[number][lobsterPos][2] + 1.5, 5.0);
}
