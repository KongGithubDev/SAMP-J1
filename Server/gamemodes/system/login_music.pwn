#include <YSI\y_hooks>
new MusicLinks[][] =
{
    "https://www.mboxdrive.com/SOUDFAMILY.mp3"
};

hook OnPlayerConnect(playerid)
{
    new rand = random(sizeof(MusicLinks));
    PlayAudioStreamForPlayer(playerid, MusicLinks[rand][0]);
}
