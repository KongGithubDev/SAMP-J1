/* 

  
    > TODO FCNPC_Spawn(npcid, skinid, Float:x, Float:y, Float:z);
    skinid คือ ไอดี NPC ที่เราจะให้มัน spawn

    /peton เปิดให้ NPC เดินตาม
    /petoff ปิดให้ NPC เดินตาม


    ถ้า NPC ตายให้ /petoff แล้วก็ /peton เพื่อเรียก NPC สามารถนำไปดัดแปลงได้

*/

#if defined _inc_impl
	#undef _inc_impl
#endif

#define            MAX_NPCS         300

#include    <FCNPC>
#include    <mapandreas>

new FcnpcTimer[MAX_PLAYERS];
new PetNPC[MAX_PLAYERS], Text3D:PetNPCLabel[MAX_PLAYERS];

hook OnGameModeInit() {
    MapAndreas_Init(MAP_ANDREAS_MODE_FULL);
    return true;
}

public peton(playerid)
{
    new Float:x, Float:y, Float:z, str[128];
    GetPlayerPos(playerid, Float:x, Float:y, Float:z);

    PetNPC[playerid] = FCNPC_Create("FCNPC");
    format(str, sizeof (str), "{F1411E}สัตว์เลี้ยงของ:\n{ffffff}%s", GetPlayerNameEx(playerid));
    
    PetNPCLabel[playerid] = CreateDynamic3DTextLabel(str, 0xFFFFFFFF, 0.0, 0.0, 0.12, 8.0, PetNPC[playerid], INVALID_VEHICLE_ID, 1);
    
    FCNPC_Spawn(PetNPC[playerid], 252, x, y, z);
    FcnpcTimer[playerid] = SetTimerEx("NpcUpdate", 1000, true, "dd", playerid, PetNPC[playerid]);
    return 1;
}

public petoff(playerid)
{
    DestroyDynamic3DTextLabel(PetNPCLabel[playerid]);
    FCNPC_Destroy(PetNPC[playerid]);
    KillTimer(FcnpcTimer[playerid]);
}

forward NpcUpdate(playerid, npcid);
public NpcUpdate(playerid, npcid)
{
	new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, Float:x, Float:y, Float:z);
    if (IsPlayerNearPlayer(playerid, npcid, 1.0))
    {
        return 0;
    } else {
        FCNPC_GoToPlayer(npcid, playerid, FCNPC_MOVE_TYPE_AUTO, FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_AUTO, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
    }

    if(IsPlayerInAnyVehicle(playerid))
    {
        DestroyDynamic3DTextLabel(PetNPCLabel[playerid]);
        FCNPC_Destroy(PetNPC[playerid]);
        KillTimer(FcnpcTimer[playerid]);
    }
	return 1;
}
