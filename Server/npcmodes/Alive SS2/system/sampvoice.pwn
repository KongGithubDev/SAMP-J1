#include <YSI_Coding\y_hooks>

#include <a_samp>
#include <sampvoice>

#define cec_auto
#include <cec>

new VoiceToAll[MAX_PLAYERS];
new VoicePlayer = 0;

new SV_GSTREAM:gstream;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };
new SV_LSTREAM:phonestream[MAX_PLAYERS] = { SV_NULL, ... };

public SV_VOID:OnPlayerActivationKeyPress(
	SV_UINT:playerid,
	SV_UINT:keyid
) {
	if (keyid == 0x42)
	{
		if (VoicePlayer == 0)
		{
		    if (phonestream[playerid]) SvAttachSpeakerToStream(phonestream[playerid], playerid);
			if (lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
			return;
		}
		else
		{
			SendClientMessage(playerid, 0xFF0000FF, "[SAMPVOICE] :{FFFFFF} ��������Դ��������蹷ء�����Ǥ���");
		}
	}

	if (keyid == 0xBB)
	{
		if (VoiceToAll[playerid] == 1) //��
		{
			if (gstream) SvAttachSpeakerToStream(gstream, playerid);
			return;
		}
	}
}

public SV_VOID:OnPlayerActivationKeyRelease(
	SV_UINT:playerid,
	SV_UINT:keyid
) {
	if (keyid == 0x42)
	{
		if (VoicePlayer == 0)
		{
		    if (phonestream[playerid]) SvDetachSpeakerFromStream(phonestream[playerid], playerid);
			if (lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
		}
	}
	if (keyid == 0xBB)
	{
		if (VoiceToAll[playerid] == 1) //����»���
		{
			if (gstream) SvDetachSpeakerFromStream(gstream, playerid);
			return;
		}
	}
}

hook OnPlayerConnect(playerid) {

	if (!SvGetVersion(playerid)) SendClientMessage(playerid, 0xFFFFFFFF, "{FFFFFF}[{FBD308}�к�����{FFFFFF}] : ����������� {DB0822}�Դ��Ҵ (���ͧ�ҡ : �س�ѧ���ŧ���������к�����)");
	else if (!SvHasMicro(playerid)) SendClientMessage(playerid, -1, "{FFFFFF}[{FBD308}�к�����{FFFFFF}] : ����������� {DB0822}�Դ��Ҵ (���ͧ�ҡ : ��辺 Microphone)");
	else if ((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, 500, playerid, 0xff0000ff, "Local")))
	{
		SendClientMessage(playerid, 0xFFFFFFFF, "{FFFFFF}[{FBD308}�к�����{FFFFFF}] : ����������� {1FA008}����� {FFFFFF}!");
		if (gstream) SvAttachListenerToStream(gstream, playerid);
		SvAddKey(playerid, 0x42);
		SvAddKey(playerid, 0xBB);
	}

	VoiceToAll[playerid] = 0;
	return 1;

}

hook OnPlayerDisconnect(playerid, reason) {
	VoiceToAll[playerid] = 0;
	if (lstream[playerid]) {
		SvDeleteStream(lstream[playerid]);
		lstream[playerid] = SV_NULL;
	}

	return 1;

}


hook OnGamemodeInit() {

	SvDebug(SV_FALSE);

	gstream = SvCreateGStream(0xffff0000, "G"); // blue color
	return 1;

}

