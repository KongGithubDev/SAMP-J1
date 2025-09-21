//KONG PROJECT

#include <YSI_Coding\y_hooks>
#include <progress2>

#define     AUTOFARM_ON

#define     AUTOFARM_MODE_NONE       0
#define     AUTOFARM_MODE_START      1

#define     AUTOFARM_STATUS_NONE     0
#define     AUTOFARM_STATUS_WALK     1
#define     AUTOFARM_STATUS_GRAB     2

#define     AUTOFARM_JOB_NONE        -1

//JOB SUPPORT
#define     JOB_SQUID               1
#define     JOB_HONEY               2
#define     JOB_ORANGE              3
#define     JOB_RICE                4
#define     JOB_DURIAN              5
#define     JOB_LOBSTER             6
#define     JOB_LETTUCE             7
#define     JOB_BANANA              8
#define     JOB_CACTUS              9

forward     OnAutoFarmStarted(playerid, jobid);
forward     OnAutoFarmStatusChanged(playerid, oldstatus, newstatus);
forward     OnAutoFarmJobChanged(playerid, newjob);

forward     OnAutoFarmWalk(playerid, jobid);

new PlayerText:AutoFarmTDP[MAX_PLAYERS][2];

new AutoFarmCountGrap[MAX_PLAYERS] = 0;
new Timer:AutoFarmTimer[MAX_PLAYERS];

enum AUTOFARM_DATA{
    AutoFarmName[128],
    Float: AutoFarmPos[3],
    Text3D: AutoFarm3D,
    AutoFarmPickup
};
new const autofarmData[9][AUTOFARM_DATA] ={
	{ "SQUID", { 2883.2524,-1982.8224,6.5609 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บปลาหมึก
    { "HONEY", { -511.1464,-1520.9863,10.2636 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บรังผึ้ง
    { "ORANGE", { 1462.1644,-26.8428,24.3267 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บส้ม
    { "RICE", { 40.6901,23.5921,2.8122 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บข้าว
    { "DURIAN", { -268.4162,-1429.1799,9.9633 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บทุเรียน
    { "LOBSTER", { 610.2725,-1885.0834,3.8997 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บกุ้งล็อบสเตอร์
    { "LETTUCE", { 1955.6882,107.2486,29.8493 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บผักกาด
    { "BANANA", { -977.0095,-576.1135,23.7036 }, Text3D: INVALID_3DTEXT_ID, -1 }, //เก็บกล้วย 
    { "CACTUS", { 1109.2083,727.8256,10.8203 }, Text3D: INVALID_3DTEXT_ID, -1 } //เก็บกระบองเพชร

};

hook OnGameModeInit(){
	for(new i = 0; i < sizeof(autofarmData); i++){
		autofarmData[i][AutoFarmPickup] = CreateDynamicPickup(1318, 23, autofarmData[i][AutoFarmPos][0], autofarmData[i][AutoFarmPos][1], autofarmData[i][AutoFarmPos][2]);

        new strtemp[256];
        format(strtemp, 256, "{FFFF00}AUTOFARM %s\n{FFFFFF}กดปุ่ม {FFFF00}'N' {FFFFFF}เพื่อเริ่มออโต้ฟาร์ม", autofarmData[i][AutoFarmName]);
		autofarmData[i][AutoFarm3D] = CreateDynamic3DTextLabel(strtemp, COLOR_WHITE, autofarmData[i][AutoFarmPos][0], autofarmData[i][AutoFarmPos][1], autofarmData[i][AutoFarmPos][2] + 0.5, 5.0);
	}
	return 1;
}

hook OnPlayerConnect(playerid) {
    AUTOFARM_RESET(playerid);
}

stock AUTOFARM_RESET(playerid) {
    AUTOFARM_CHANGEMODE(playerid, AUTOFARM_MODE_NONE);
    AUTOFARM_CHANGEJOB(playerid, AUTOFARM_JOB_NONE);
    AUTOFARM_CHANGESTATUS(playerid, AUTOFARM_STATUS_NONE);

    SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", -1);

    AutoFarmCountGrap[playerid] = 0;
    stop AutoFarmTimer[playerid];
    return 1;
}

stock AUTOFARM_CHANGESTATUS(playerid, newstatus) {
    if(newstatus > 2 || newstatus < 0)
        return 0;

    CallRemoteFunction("OnAutoFarmStatusChanged", "idd", playerid, GetPVarInt(playerid, "AUTOFARM_STATUS"), newstatus);
    return SetPVarInt(playerid, "AUTOFARM_STATUS", newstatus);
}

stock AUTOFARM_CHANGEMODE(playerid, newmode) {
    if(newmode > 1 || newmode < 0)
        return 0;

    return SetPVarInt(playerid, "AUTOFARM_MODE", newmode);
}

stock AUTOFARM_CHANGEJOB(playerid, jobid) {
    if(jobid < -1)
        return 0;

    CallRemoteFunction("OnAutoFarmJobChanged", "id", playerid, jobid);
    return SetPVarInt(playerid, "AUTOFARM_JOB_ID", jobid);
}

stock AUTOFARM_STARTED(playerid) {
    return GetPVarInt(playerid, "AUTOFARM_MODE");
}

stock AUTOFARM_GETSTATUS(playerid) {
    return GetPVarInt(playerid, "AUTOFARM_STATUS");
}

stock AUTOFARM_GETJOBID(playerid) {
    return GetPVarInt(playerid, "AUTOFARM_JOB_ID");
}

stock AUTOFARM_CANCELWITHREASON(playerid, reason[]) {
    SendClientMessageEx(playerid, COLOR_YELLOW, "[AUTOFARM] {FFFFFF}: ถูกยกเลิกเพราะ %s", reason);
    return AUTOFARM_CANCEL(playerid);
}

stock AUTOFARM_JOB_GRAB(playerid) {
    if(!AUTOFARM_STARTED(playerid)) {
        return 0;
    }

    SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", -1);

    return AUTOFARM_CHANGESTATUS(playerid, AUTOFARM_STATUS_GRAB);
}

stock AUTOFARM_JOB_Finish(playerid) {
    if(!AUTOFARM_STARTED(playerid)) {
        return 0;
    }

    AutoFarmCountGrap[playerid] ++;

    PlayerTextDrawSetString(playerid, AutoFarmTDP[playerid][1], sprintf("%d", AutoFarmCountGrap[playerid]));
    return AUTOFARM_CHANGESTATUS(playerid, AUTOFARM_STATUS_WALK);
}

stock AUTOFARM_CANCEL(playerid) {
    if(!AUTOFARM_STARTED(playerid)) {
        return 0;
    }

    SetPVarInt(playerid, "FIXBUG_AUTOFARM_FIND", -1);

    if(AUTOFARM_GETSTATUS(playerid) != AUTOFARM_STATUS_GRAB) {
        AutoFarm_StopWalkAnimation(playerid);
    }
    DestroyProgressAutoFarm(playerid);
    AUTOFARM_RESET(playerid);
    return 1;
}

stock AUTOFARM(playerid, jobid) {
    if(AUTOFARM_STARTED(playerid)) {
        return 0;
    }

    AUTOFARM_CHANGEMODE(playerid, AUTOFARM_MODE_START);
    AUTOFARM_CHANGEJOB(playerid, jobid);
    AUTOFARM_CHANGESTATUS(playerid, AUTOFARM_STATUS_WALK);

    CreateProgressAutoFarm(playerid, jobid);

    //LOOP
    stop AutoFarmTimer[playerid];
    AutoFarmTimer[playerid] = repeat AutoFarmUpdate(playerid, jobid);
    return 1;
}

timer AutoFarmUpdate[100](playerid, jobid) {
    if(AUTOFARM_GETSTATUS(playerid) == AUTOFARM_STATUS_WALK) {
	    CallLocalFunction("OnAutoFarmWalk", "dd", playerid, jobid);
    }
	return;
}

stock AutoFarm_WalkAnimation(playerid) {
    return ApplyAnimation(playerid, "PED", "RUN_CIVI", 4.0, 0, 1, 1, 1, 0, 1);
}

stock AutoFarm_StopWalkAnimation(playerid) {
    ApplyAnimation(playerid, "PED", "null", 4.0, 1, 0, 0, 0, 0, 1);
    return ClearAnimations(playerid, 1);
}

stock AUTOFARM_SetFacingAnglePostion(playerid, Float:x, Float:y)
{

    new Float:pX, Float:pY, Float:pZ;
    GetPlayerPos(playerid, pX, pY, pZ);

    new Float:angle;

    if( y > pY ) angle = (-acos((x - pX) / floatsqroot((x - pX)*(x - pX) + (y - pY)*(y - pY))) - 90.0);
    else if( y < pY && x < pX ) angle = (acos((x - pX) / floatsqroot((x - pX)*(x - pX) + (y - pY)*(y - pY))) - 450.0);
    else if( y < pY ) angle = (acos((x - pX) / floatsqroot((x - pX)*(x - pX) + (y - pY)*(y - pY))) - 90.0);

    if(x > pX) angle = (floatabs(floatabs(angle) + 180.0));
    else angle = (floatabs(angle) - 180.0);

    return SetPlayerFacingAngle(playerid, angle);
}

stock GetXYFromAngle(&Float:x, &Float:y, Float:a, Float:distance) 
{
    x += (distance*floatsin(-a,degrees));
    y += (distance*floatcos(-a,degrees));
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
	if (newkeys & KEY_NO){
        if(AUTOFARM_STARTED(playerid)) {
            if(AUTOFARM_GETSTATUS(playerid) == AUTOFARM_STATUS_GRAB) {
                SendClientMessageEx(playerid, COLOR_YELLOW, "[AUTOFARM] {FFFFFF}: คุณไม่สามารถปิดใช้งานในขณะที่เก็บอยู่ได้");
                return 0;
            }
            SendClientMessageEx(playerid, COLOR_YELLOW, "[AUTOFARM] {FFFFFF}: คุณปิดใช้งานระบบ AUTOFARM เรียบร้อยแล้ว");
            return AUTOFARM_CANCEL(playerid);
        } else {
            for(new i = 0; i < sizeof autofarmData; i++){   
                if(IsPlayerInRangeOfPoint(playerid, 2.5, autofarmData[i][AutoFarmPos][0], autofarmData[i][AutoFarmPos][1], autofarmData[i][AutoFarmPos][2])){
                    return AUTOFARM(playerid, i + 1);
                }
            }
        }
    }
    return 0;
}

CreateProgressAutoFarm(playerid, jobid){
	AutoFarmTDP[playerid][0] = CreatePlayerTextDraw(playerid, 543.000000, 150.000000, sprintf("UR_AUTOFARM:JOB_%d", jobid));
	PlayerTextDrawFont(playerid, AutoFarmTDP[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, AutoFarmTDP[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, AutoFarmTDP[playerid][0], 99.500000, 178.500000);
	PlayerTextDrawSetOutline(playerid, AutoFarmTDP[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, AutoFarmTDP[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, AutoFarmTDP[playerid][0], 1);
	PlayerTextDrawColor(playerid, AutoFarmTDP[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, AutoFarmTDP[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, AutoFarmTDP[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, AutoFarmTDP[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, AutoFarmTDP[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, AutoFarmTDP[playerid][0], 0);

	AutoFarmTDP[playerid][1] = CreatePlayerTextDraw(playerid, 593.000000, 285.000000, "");
	PlayerTextDrawFont(playerid, AutoFarmTDP[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, AutoFarmTDP[playerid][1], 0.204166, 1.000000);
	PlayerTextDrawTextSize(playerid, AutoFarmTDP[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, AutoFarmTDP[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, AutoFarmTDP[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, AutoFarmTDP[playerid][1], 2);
	PlayerTextDrawColor(playerid, AutoFarmTDP[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, AutoFarmTDP[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, AutoFarmTDP[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, AutoFarmTDP[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, AutoFarmTDP[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, AutoFarmTDP[playerid][1], 0);

    PlayerTextDrawShow(playerid, AutoFarmTDP[playerid][0]);
	PlayerTextDrawShow(playerid, AutoFarmTDP[playerid][1]);
    return 1;
}

DestroyProgressAutoFarm(playerid) {
    PlayerTextDrawDestroy(playerid, AutoFarmTDP[playerid][0]);
	PlayerTextDrawDestroy(playerid, AutoFarmTDP[playerid][1]);
    return 1;
}
