#include    <YSI_Coding\y_hooks>
#include 	<YSI_Coding\y_timers>


#define		EGG_TIMERS		  5             //--> เวลา/วินาที
#define     EGG_LIMITS         15            //--> จุดงานสูงสุด
#define     EGG_COUNTS         60            //--> ไอเท็มสูงสุด
#define     EGG_MODELS         11757         //--> ปรับโมเดลงาน
#define     EGG_N_ITEM         "ไข่"    //--> เปลี่ยนชื่อไอเท็ม

Float:GetEggDistance2D(Float:x1, Float:y1, Float:x2, Float:y2) 
{
	return floatsqroot(
		((x1 - x2) * (x1 - x2)) +
		((y1 - y2) * (y1 - y2))
	);
}

Float:GetEGGbsoluteAngle(Float:angle) 
{
	while(angle < 0.0) {
		angle += 360.0;
	}
	while(angle > 360.0) {
		angle -= 360.0;
	}
	return angle;
}

Float:GetAngleEGGToPoint(Float:fPointX, Float:fPointY, Float:fDestX, Float:fDestY) 
{
	return GetEGGbsoluteAngle(-(
		90.0 - (
			atan2(
				(fDestY - fPointY),
				(fDestX - fPointX)
			)
		)
	));
}
enum EGG_DATAEX
{
    EgglID,
    EggModels,
    EggTakeOn,
    Float: EggPosX,
	Float: EggPosY,
	Float: EggPosZ,
    Float: EggRotX,
	Float: EggRotY,
	Float: EggRotZ
};

new EggTake[MAX_PLAYERS], 
    Autofarm_Egg[MAX_PLAYERS], 
    Autofarm_EggST[MAX_PLAYERS], 
    Timer:EggTimer[MAX_PLAYERS]; 

new PlayerText:EggTD[MAX_PLAYERS][2];

new const EggData[EGG_LIMITS][EGG_DATAEX] =
{
	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2369.27661, -644.00897, 126.31129, 0.000000, 0.000000, 0.000000 },
	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2368.80371, -656.74738, 126.77690, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2380.28491, -656.94202, 126.78929, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2382.58057, -640.33545, 125.82542, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2376.32935, -649.01306, 126.21484, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2393.11035, -647.99591, 126.08128, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2401.62158, -657.33051, 126.46338, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2401.62695, -640.29407, 125.52501, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2387.02026, -671.22217, 126.66769, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2402.77734, -671.56116, 126.52818, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2390.49341, -629.87103, 124.31236, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2405.68311, -632.18207, 124.13515, 0.000000, 0.000000, 0.000000 },
	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2391.73096, -660.86115, 126.68901, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2392.74951, -640.09058, 125.59032, 0.000000, 0.000000, 0.000000 },
 	{ INVALID_STREAMER_ID, EGG_MODELS, 0, 2397.26318, -624.14301, 123.39008, 0.000000, 0.000000, 0.000000 }
};

hook OnGameModeInit() 
{
	for(new i = 0; i < sizeof(EggData); i++)
	{
		EggData[i][EgglID] = CreateDynamicObject(EggData[i][EggModels], EggData[i][EggPosX], EggData[i][EggPosY], EggData[i][EggPosZ], EggData[i][EggRotX], EggData[i][EggRotY], EggData[i][EggRotZ]);
	}
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
  	if (newkeys & KEY_NO && !IsPlayerInAnyVehicle(playerid))
	{
        if (IsPlayerInRangeOfPoint(playerid, 50.0, 2393.1104, -647.9959, 126.0813))
        {
            if (Autofarm_EggST[playerid] == 0)
            {
                Loaded_Egg(playerid);
            }
            else
            {
                Destroy_Egg(playerid);
            }
        }
    }  
    return 1;
}

timer Update_Egg[1000](playerid)
{
    if(Autofarm_EggST[playerid] == 1)
    {
        new 
            Float:PPos_X, Float:PPos_Y, Float:PPos_Z, Float:PPAngle;

        GetPlayerPos(playerid, PPos_X, PPos_Y, PPos_Z);

        PPAngle = (GetAngleEGGToPoint(PPos_X, PPos_Y, EggData[Autofarm_Egg[playerid]][EggPosX], EggData[Autofarm_Egg[playerid]][EggPosY]));

        if(GetEggDistance2D(EggData[Autofarm_Egg[playerid]][EggPosX], EggData[Autofarm_Egg[playerid]][EggPosY], PPos_X, PPos_Y) >= 5.0)
        {
            GetXYFromAngle(PPos_X, PPos_Y, PPAngle, 0.3);
            ApplyAnimation(playerid, "ped", "run_civi", 4.1, 1, 1, 1, 1, 0);
            SetFacingPoint(playerid, EggData[Autofarm_Egg[playerid]][EggPosX], EggData[Autofarm_Egg[playerid]][EggPosY]);
        }
        else if(GetEggDistance2D(EggData[Autofarm_Egg[playerid]][EggPosX], EggData[Autofarm_Egg[playerid]][EggPosY], PPos_X, PPos_Y) <= 3.0)
        {
            ClearAnimations(playerid);

            for(new i = 0; i < sizeof EggData; i++)
            {
                GetDynamicObjectPos(EggData[i][EgglID], EggData[i][EggPosX], EggData[i][EggPosY], EggData[i][EggPosZ]);

                if(IsPlayerInRangeOfPoint(playerid, 5.0, EggData[i][EggPosX], EggData[i][EggPosY], EggData[i][EggPosZ] + 0.5))
                {
                    if(IsValidDynamicObject(EggData[i][EgglID]) && EggData[i][EggTakeOn] == 0)
                    {
                        if (Inventory_Count(playerid, EGG_N_ITEM) >= EGG_COUNTS) 
                            return SendClientMessageEx(playerid, 0xFF2847FF, "[ออโต้ฟาร์ม] {FFFFFF}แร่ของคุณเต็มกระเป๋าแล้ว ไม่สามารถเก็บได้อีก {FF2847}%d/%d", Inventory_Count(playerid, EGG_N_ITEM), EGG_COUNTS);

                        StartAutoProgress(playerid, 70, 0, i);
                        EggData[i][EggTakeOn] = 1;
                        stop EggTimer[playerid];
                        EggTake[playerid] = 1;
                        break;
                    }
                }
            }
            
        }
    }
    return 1;
}

Loaded_Egg(playerid)
{
    new strcts[64], value = random(EGG_LIMITS-1);

    AutoFBAR[playerid] = CreatePlayerProgressBar(playerid, 18.000000, 252.000000, 93.000000, 15.500000, 0xFF0000AA, 100.000000, 0);

    EggTD[playerid][0] = CreatePlayerTextDraw(playerid, 2.000000, 121.000000, "autofarm:EggEx");
    PlayerTextDrawFont(playerid, EggTD[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, EggTD[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, EggTD[playerid][0], 123.000000, 186.500000);
    PlayerTextDrawSetOutline(playerid, EggTD[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, EggTD[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, EggTD[playerid][0], 1);
    PlayerTextDrawColor(playerid, EggTD[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, EggTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, EggTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, EggTD[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, EggTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, EggTD[playerid][0], 0);


    EggTD[playerid][1] = CreatePlayerTextDraw(playerid, 62.000000, 224.800003, "0/100");
    PlayerTextDrawFont(playerid, EggTD[playerid][1], 2);
    PlayerTextDrawLetterSize(playerid, EggTD[playerid][1], 0.158333, 0.899999);
    PlayerTextDrawTextSize(playerid, EggTD[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, EggTD[playerid][1], 0);
    PlayerTextDrawSetShadow(playerid, EggTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, EggTD[playerid][1], 2);
    PlayerTextDrawColor(playerid, EggTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, EggTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, EggTD[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, EggTD[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, EggTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, EggTD[playerid][1], 0);

    format(strcts, sizeof(strcts), "%d/%d", Inventory_Count(playerid, EGG_N_ITEM), EGG_COUNTS);
    PlayerTextDrawSetString(playerid, EggTD[playerid][1], strcts);

    PlayerTextDrawShow(playerid, EggTD[playerid][0]);
    PlayerTextDrawShow(playerid, EggTD[playerid][1]);
    ShowPlayerProgressBar(playerid, AutoFBAR[playerid]);

    EggTimer[playerid] = repeat Update_Egg(playerid);
    Autofarm_Egg[playerid] = value;
    Autofarm_EggST[playerid] = 1;
    return 1;
}

Destroy_Egg(playerid)
{
    Autofarm_EggST[playerid] = 0;
    Autofarm_Egg[playerid] = 0;

    stop EggTimer[playerid];

    if (EggTake[playerid] == 1)
    {
        StopAutoProgress(playerid); 
    }

    PlayerTextDrawHide(playerid, EggTD[playerid][0]);
    PlayerTextDrawDestroy(playerid, EggTD[playerid][1]);

    
    RemovePlayerAttachedObject(playerid, 1);
    HidePlayerProgressBar(playerid, AutoFBAR[playerid]);
    DestroyPlayerProgressBar(playerid, AutoFBAR[playerid]);
    ClearAnimations(playerid);
    return 1;
}

Unfreeze_EggFinish(playerid, number)
{
    new strcts[64];

	ClearAnimations(playerid);

	EggTake[playerid] = 0;
	EggData[number][EggTakeOn] = 0;

    if (Autofarm_Egg[playerid] >= EGG_LIMITS-1)
    {
        Autofarm_Egg[playerid] = 0;
    }
    if (Autofarm_Egg[playerid] <= EGG_LIMITS-1)
    {
        Autofarm_Egg[playerid]++;
    }
    if (IsValidDynamicObject(EggData[number][EgglID])) 
    {
        DestroyDynamicObject(EggData[number][EgglID]);
        EggData[number][EgglID] = INVALID_OBJECT_ID;
    }

	defer Egg_ShellObject(number);
	Inventory_Add(playerid, EGG_N_ITEM, 1);
	EggTimer[playerid] = repeat Update_Egg(playerid);

    format(strcts, sizeof(strcts), "%d/%d", Inventory_Count(playerid, EGG_N_ITEM), EGG_COUNTS);
    PlayerTextDrawSetString(playerid, EggTD[playerid][1], strcts);
	return 1;
}

timer Egg_ShellObject[EGG_TIMERS*1000](i) 
{
	EggData[i][EggTakeOn] = 0;
	EggData[i][EgglID] = CreateDynamicObject(EggData[i][EggModels], EggData[i][EggPosX], EggData[i][EggPosY], EggData[i][EggPosZ], EggData[i][EggRotX], EggData[i][EggRotY], EggData[i][EggRotZ]);
}

hook OnPlayerAutoFinish(playerid, objectid)
{
	if(EggTake[playerid] == 1)
	{
    	Unfreeze_EggFinish(playerid, objectid);
    }
	return Y_HOOKS_CONTINUE_RETURN_0;
}

hook OnPlayerAutoUpdate(playerid, progress, objectid)
{
	if(EggTake[playerid] == 1)
	{
		ApplyAnimation(playerid, "BOMBER", "BOM_PLANT_LOOP", 4.0, 1, 0, 0, 0, 0, 1);
		return Y_HOOKS_BREAK_RETURN_1;
	}
	return Y_HOOKS_CONTINUE_RETURN_0;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if (EggTake[playerid] == 1)
	{
		StopAutoProgress(playerid);
	}
    if (Autofarm_EggST[playerid] == 1)
    {
        Destroy_Egg(playerid);
    }
	return 1;
}
hook OnPlayerConnect(playerid) 
{
    Autofarm_Egg[playerid] = 0;
    Autofarm_EggST[playerid] = 0;
    EggTake[playerid] = 0;
    return 1;
}