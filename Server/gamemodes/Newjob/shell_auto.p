#include    <YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>


#define		SHELL_TIMERS		  5             //--> เวลา/วินาที
#define     SHELL_LIMITS         15            //--> จุดงานสูงสุด
#define     SHELL_COUNTS         60            //--> ไอเท็มสูงสุด
#define     SHELL_MODELS         11756         //--> ปรับโมเดลงาน
#define     SHELL_N_ITEM         "หอย"    //--> เปลี่ยนชื่อไอเท็ม

Float:GetSHEDistance2D(Float:x1, Float:y1, Float:x2, Float:y2) 
{
	return floatsqroot(
		((x1 - x2) * (x1 - x2)) +
		((y1 - y2) * (y1 - y2))
	);
}

Float:GetSHEAbsoluteAngle(Float:angle) 
{
	while(angle < 0.0) {
		angle += 360.0;
	}
	while(angle > 360.0) {
		angle -= 360.0;
	}
	return angle;
}

Float:GetAngleSHEToPoint(Float:fPointX, Float:fPointY, Float:fDestX, Float:fDestY) 
{
	return GetSHEAbsoluteAngle(-(
		90.0 - (
			atan2(
				(fDestY - fPointY),
				(fDestX - fPointX)
			)
		)
	));
}
enum SHELL_DATAEX
{
    ShellID,
    ShellModels,
    ShellTakeOn,
    Float: ShellPosX,
	Float: ShellPosY,
	Float: ShellPosZ,
    Float: ShellRotX,
	Float: ShellRotY,
	Float: ShellRotZ
};

new ShellTake[MAX_PLAYERS], 
    Autofarm_Shell[MAX_PLAYERS], 
    Autofarm_ShellST[MAX_PLAYERS], 
    Timer:ShellTimer[MAX_PLAYERS]; 

new PlayerText:ShellTD[MAX_PLAYERS][2];

new const ShellData[SHELL_LIMITS][SHELL_DATAEX] =
{
	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 223.74760, -1831.30542, 3.09385, 0.000000, 0.000000, 0.000000 },
	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 232.23083, -1831.21216, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 241.02051, -1831.37146, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 249.14497, -1831.56982, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 256.69559, -1832.51880, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 255.51846, -1841.75330, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 246.84247, -1841.84827, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 239.91534, -1841.02893, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 230.96651, -1840.09900, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 222.54027, -1839.82947, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 221.62270, -1850.19324, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 229.06412, -1850.64685, 3.09385, 0.000000, 0.000000, 0.000000 },
	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 239.20743, -1849.98059, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 246.60522, -1850.76770, 3.09385, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, SHELL_MODELS, 0, 255.70271, -1850.22778, 3.09385, 0.000000, 0.000000, 0.000000 }
};

hook OnGameModeInit() 
{
	for(new i = 0; i < sizeof(ShellData); i++)
	{
		ShellData[i][ShellID] = CreateDynamicObject(ShellData[i][ShellModels], ShellData[i][ShellPosX], ShellData[i][ShellPosY], ShellData[i][ShellPosZ], ShellData[i][ShellRotX], ShellData[i][ShellRotY], ShellData[i][ShellRotZ]);
	}
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
  	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        if (IsPlayerInRangeOfPoint(playerid, 50.0, 239.9153, -1841.0289, 3.0939))
        {
            if (Autofarm_ShellST[playerid] == 0)
            {
                Loaded_Shell(playerid);
            }
            else
            {
                Destroy_Shell(playerid);
            }
        }
    }  
    return 1;
}

timer Update_Shell[1000](playerid)
{
    if(Autofarm_ShellST[playerid] == 1)
    {
        new 
            Float:PPos_X, Float:PPos_Y, Float:PPos_Z, Float:PPAngle;

        GetPlayerPos(playerid, PPos_X, PPos_Y, PPos_Z);

        PPAngle = (GetAngleSHEToPoint(PPos_X, PPos_Y, ShellData[Autofarm_Shell[playerid]][ShellPosX], ShellData[Autofarm_Shell[playerid]][ShellPosY]));

        if(GetSHEDistance2D(ShellData[Autofarm_Shell[playerid]][ShellPosX], ShellData[Autofarm_Shell[playerid]][ShellPosY], PPos_X, PPos_Y) >= 5.0)
        {
            GetXYFromAngle(PPos_X, PPos_Y, PPAngle, 0.3);
            ApplyAnimation(playerid, "ped", "run_civi", 4.1, 1, 1, 1, 1, 0);
            SetFacingPoint(playerid, ShellData[Autofarm_Shell[playerid]][ShellPosX], ShellData[Autofarm_Shell[playerid]][ShellPosY]);
        }
        else if(GetSHEDistance2D(ShellData[Autofarm_Shell[playerid]][ShellPosX], ShellData[Autofarm_Shell[playerid]][ShellPosY], PPos_X, PPos_Y) <= 3.0)
        {
            ClearAnimations(playerid);

            for(new i = 0; i < sizeof ShellData; i++)
            {
                GetDynamicObjectPos(ShellData[i][ShellID], ShellData[i][ShellPosX], ShellData[i][ShellPosY], ShellData[i][ShellPosZ]);

                if(IsPlayerInRangeOfPoint(playerid, 5.0, ShellData[i][ShellPosX], ShellData[i][ShellPosY], ShellData[i][ShellPosZ] + 0.5))
                {
                    if(IsValidDynamicObject(ShellData[i][ShellID]) && ShellData[i][ShellTakeOn] == 0)
                    {
                        if (Inventory_Count(playerid, SHELL_N_ITEM) >= SHELL_COUNTS) 
                            return SendClientMessageEx(playerid, 0xFF2847FF, "[ออโต้ฟาร์ม] {FFFFFF}แร่ของคุณเต็มกระเป๋าแล้ว ไม่สามารถเก็บได้อีก {FF2847}%d/%d", Inventory_Count(playerid, SHELL_N_ITEM), SHELL_COUNTS);

                        StartAutoProgress(playerid, 70, 0, i);
                        ShellData[i][ShellTakeOn] = 1;
                        stop ShellTimer[playerid];
                        ShellTake[playerid] = 1;
                        break;
                    }
                }
            }
            
        }
    }
    return 1;
}

Loaded_Shell(playerid)
{
    new strcts[64], value = random(SHELL_LIMITS-1);

    AutoFBAR[playerid] = CreatePlayerProgressBar(playerid, 18.000000, 252.000000, 93.000000, 15.500000, 0xFF00D1AA, 100.000000, 0);

    ShellTD[playerid][0] = CreatePlayerTextDraw(playerid, 2.000000, 121.000000, "autofarm:shellEx");
    PlayerTextDrawFont(playerid, ShellTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, ShellTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, ShellTD[playerid][0], 123.000000, 186.500000);
    PlayerTextDrawSetOutline(playerid, ShellTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, ShellTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, ShellTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, ShellTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, ShellTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, ShellTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, ShellTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, ShellTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, ShellTD[playerid][0], 0);


    ShellTD[playerid][1] = CreatePlayerTextDraw(playerid, 62.000000, 224.800003, "0/100");
    PlayerTextDrawFont(playerid, ShellTD[playerid][1], 2);
    PlayerTextDrawLetterSize(playerid, ShellTD[playerid][1], 0.158333, 0.899999);
    PlayerTextDrawTextSize(playerid, ShellTD[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, ShellTD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, ShellTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, ShellTD[playerid][1], 2);
    PlayerTextDrawColor(playerid, ShellTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, ShellTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, ShellTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, ShellTD[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, ShellTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, ShellTD[playerid][1], 0);

    format(strcts, sizeof(strcts), "%d/%d", Inventory_Count(playerid, SHELL_N_ITEM), SHELL_COUNTS);
    PlayerTextDrawSetString(playerid, ShellTD[playerid][1], strcts);

    PlayerTextDrawShow(playerid, ShellTD[playerid][0]);
    PlayerTextDrawShow(playerid, ShellTD[playerid][1]);
    ShowPlayerProgressBar(playerid, AutoFBAR[playerid]);

    ShellTimer[playerid] = repeat Update_Shell(playerid);
    Autofarm_Shell[playerid] = value;
    Autofarm_ShellST[playerid] = 1;
    return 1;
}

Destroy_Shell(playerid)
{
    Autofarm_ShellST[playerid] = 0;
    Autofarm_Shell[playerid] = 0;

    stop ShellTimer[playerid];

    if (ShellTake[playerid] == 1)
    {
        StopAutoProgress(playerid); 
    }

    PlayerTextDrawHide(playerid, ShellTD[playerid][0]);
    PlayerTextDrawDestroy(playerid, ShellTD[playerid][1]);

    
    RemovePlayerAttachedObject(playerid, 1);
    HidePlayerProgressBar(playerid, AutoFBAR[playerid]);
    DestroyPlayerProgressBar(playerid, AutoFBAR[playerid]);
    ClearAnimations(playerid);
    return 1;
}

Unfreeze_ShellFinish(playerid, number)
{
    new strcts[64];

	ClearAnimations(playerid);

	ShellTake[playerid] = 0;
	ShellData[number][ShellTakeOn] = 0;

    if (Autofarm_Shell[playerid] >= SHELL_LIMITS-1)
    {
        Autofarm_Shell[playerid] = 0;
    }
    if (Autofarm_Shell[playerid] <= SHELL_LIMITS-1)
    {
        Autofarm_Shell[playerid]++;
    }
    if (IsValidDynamicObject(ShellData[number][ShellID])) 
    {
        DestroyDynamicObject(ShellData[number][ShellID]);
        ShellData[number][ShellID] = INVALID_OBJECT_ID;
    }

	defer Shell_ShellObject(number);
	Inventory_Add(playerid, SHELL_N_ITEM, 1);
	ShellTimer[playerid] = repeat Update_Shell(playerid);

    format(strcts, sizeof(strcts), "%d/%d", Inventory_Count(playerid, SHELL_N_ITEM), SHELL_COUNTS);
    PlayerTextDrawSetString(playerid, ShellTD[playerid][1], strcts);
	return 1;
}

timer Shell_ShellObject[SHELL_TIMERS*1000](i) 
{
	ShellData[i][ShellTakeOn] = 0;
	ShellData[i][ShellID] = CreateDynamicObject(ShellData[i][ShellModels], ShellData[i][ShellPosX], ShellData[i][ShellPosY], ShellData[i][ShellPosZ], ShellData[i][ShellRotX], ShellData[i][ShellRotY], ShellData[i][ShellRotZ]);
}

hook OnPlayerAutoFinish(playerid, objectid)
{
	if(ShellTake[playerid] == 1)
	{
    	Unfreeze_ShellFinish(playerid, objectid);
    }
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnPlayerAutoUpdate(playerid, progress, objectid)
{
	if(ShellTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if (ShellTake[playerid] == 1)
	{
		StopAutoProgress(playerid);
	}
    if (Autofarm_ShellST[playerid] == 1)
    {
        Destroy_Shell(playerid);
    }
	return 1;
}
hook OnPlayerConnect(playerid) 
{
    Autofarm_Shell[playerid] = 0;
    Autofarm_ShellST[playerid] = 0;
    ShellTake[playerid] = 0;
    return 1;
}