#include    <a_samp>
#include	<YSI_Coding\y_hooks>
#include    <discord-connector>

//----LOG ATM----//
URLogAtmDEPOSIT(playerid,amount) //�ҡ�Թ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log ATM");
    format(str, sizeof str, "������  %s ��ҡ�Թ�ӹǹ %s ��Ҹ�Ҥ�� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`",GetPlayerNameEx(playerid),FormatMoney(amount), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x0BFA00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401849231442051082"), embed);
    return 1;
}

URLogAtmWITHDRAW(playerid,amount) // �͹�Թ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log ATM");
    format(str, sizeof str, "������  %s ��͹�Թ�ӹǹ %s �͡�ҡ��Ҥ�� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`",GetPlayerNameEx(playerid),FormatMoney(amount), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401849366888710224"), embed);
    return 1;
}

URLogAtmTRANSFER(playerid,amount) // �͹�Թ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log ATM");
    format(str, sizeof str, "������ %s ���͹�Թ�ӹǹ %s ���Ѻ  %s �͡�ҡ�ѭ��\n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`",GetPlayerNameEx(playerid), FormatMoney(amount), GetPlayerNameEx(playerData[playerid][pTransfer]), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401849410916454452"), embed);
    return 1;
}

//=================================================================================================//

//----LOG CRAFTING----//
//�����
UrLogknucklesucceed(playerid) //ʹѺ���
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ʹѺ��� ����� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634194295226488"), embed);
    return 1;
}

UrLogpoolsucceed(playerid) //�����
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ����� ����� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634323165089902"), embed);
    return 1;
}

UrLogbaseballsucceed(playerid) //�����
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ����� ����� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634444292653099"), embed);
    return 1;
}

UrLoggolfclubsucceed(playerid) //������
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ������ ����� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634535937933342"), embed);
    return 1;
}

UrLogKatanasucceed(playerid) //�ҵҹ�
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ �ҵҹ� ����� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFFFF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401634630754635886"), embed);
    return 1;
}
//=================================================================================================//

//----LOG CRAFTING----//
//�������
UrLogknucklefail(playerid) //ʹѺ���
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ʹѺ��� ������� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828529540304927"), embed);
    return 1;
}

UrLogpoolfail(playerid) //�����
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ����� ������� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828755198185553"), embed);
    return 1;
}

UrLogbaseballfail(playerid) //�����
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ����� ������� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828797879287868"), embed);
    return 1;
}

UrLoggolfclubfail(playerid) //������
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ ������ ������� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828825003982858"), embed);
    return 1;
}

UrLogKatanafail(playerid) //�ҵҹ�
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "Log Crafting");
    format(str, sizeof str, "������ %s ���ҿ �ҵҹ� ������� \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0xFF0000);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1401828847145455697"), embed);
    return 1;
}
//=================================================================================================//

//LOG SHOP DONATE
UrLogShopDonate1(playerid) //�ѵ��ô���ظ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : �ѵ��ô���ظ \n�ӹǹ  : 1 \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413939757544898753"), embed);
    return 1;
}

UrLogShopDonate2(playerid) //���ͧ�����ظv1
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : ���ͧ�����ظv1 \n�ӹǹ  : 1 \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413946196476559596"), embed);
    return 1;
}

UrLogShopDonate3(playerid) //�Ҫһͧ
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : �Ҫһͧ \n�ӹǹ  : 1 \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413946386151374899"), embed);
    return 1;
}

UrLogShopDonate4(playerid) //��Ѵ��¿��
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : ��Ѵ��¿�� \n�ӹǹ  : 1 \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413946663474561267"), embed);
    return 1;
}

UrLogShopDonate5(playerid) //�ͧ������
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : �ͧ������ \n�ӹǹ  : 1 \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413947009408434226"), embed);
    return 1;
}

UrLogShopDonate6(playerid) //ö�๷ BMW i8
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : BMW i8 \n�ӹǹ : 1 �ѹ \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949149627420682"), embed);
    return 1;
}

UrLogShopDonate7(playerid) //ö�๷ GTR R35
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : GTR R35 \n�ӹǹ : 1 �ѹ \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949396814397570"), embed);
    return 1;
}

UrLogShopDonate8(playerid) //ö�๷ McLaren 720s
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : McLaren 720s \n�ӹǹ : 1 �ѹ \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949475524706374"), embed);
    return 1;
}

UrLogShopDonate9(playerid) //ʡԹ ���ͧʡԹ193
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : ���ͧʡԹ193 \n�ӹǹ : 1  \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413949937879613606"), embed);
    return 1;
}

UrLogShopDonate10(playerid) //ʡԹ ���ͧʡԹ75
{
    new str[256], month, day, year, hour, minute;
    gettime(hour, minute);
	getdate(year, month, day);
    new DCC_Embed:embed = DCC_CreateEmbed();
    DCC_SetEmbedTitle(embed, "LOG ShopDonate");
    format(str, sizeof(str), "������ : %s\n�Թ��� : ���ͧʡԹ75 \n�ӹǹ : 1  \n\
	`�ѹ/���� : %02d:%02d - %02d/%02d/%04d`", GetPlayerNameEx(playerid), hour, minute, day, month, year);
	DCC_SetEmbedDescription(embed, str);
    DCC_SetEmbedColor(embed, 0x00FF00);
    DCC_SetEmbedThumbnail(embed, "https://img2.pic.in.th/pic/LOGO0f2189a16b0f7ee0.th.png");
    DCC_SendChannelEmbedMessage(DCC_FindChannelById("1413950016275349546"), embed);
    return 1;
}
///////////////////////////////////////////////////
