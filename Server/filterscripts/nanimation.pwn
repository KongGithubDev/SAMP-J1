#include <a_samp>
#include <Pawn.cmd>
#include <n_animations>

CMD:anims(playerid,params[])
{
	return ShowAnimsDialog(playerid);
}

CMD:stopanims(playerid,params[])
{
	return ClearAnimations(playerid, 1);
}
