#include	<YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
    SetPlayerMapIcon(playerid, 0, 1469.0569, -1645.2090, 16.2469, 30, 0, MAPICON_GLOBAL); // สถานีตำรวจ
    SetPlayerMapIcon(playerid, 1, 1266.5504, -1337.7650, 13.3336, 22, 0, MAPICON_GLOBAL); // โรงพยาบาล 
    SetPlayerMapIcon(playerid, 2, 1273.0791, -1554.1975, 13.5452, 55, 0, MAPICON_GLOBAL); // ร้านขายรถ
	SetPlayerMapIcon(playerid, 3, 1003.7355,  264.0209,  29.8106, 63, 0, MAPICON_GLOBAL); // งานข้าว
	SetPlayerMapIcon(playerid, 4, -245.3150, -1452.0371, 4.6461, 62, 0, MAPICON_GLOBAL);   // งานทุเรียน
    SetPlayerMapIcon(playerid, 5, 1454.2629, -82.7367, 19.0866, 61, 0, MAPICON_GLOBAL);    // งานส้ม
    SetPlayerMapIcon(playerid, 6, 217.2756, -2012.5477, 5.0295, 60, 0, MAPICON_GLOBAL);   // งานตกปลา
    SetPlayerMapIcon(playerid, 7, 610.5164, 878.8968, -42.9609, 59, 0, MAPICON_GLOBAL);   // งานขุดแร่
    SetPlayerMapIcon(playerid, 8, -504.7569, -1522.9686, 10.4485, 58, 0, MAPICON_GLOBAL);  // งานรังผึ้ง
    SetPlayerMapIcon(playerid, 9, 594.9028, -1885.6313, 3.9308, 57, 0, MAPICON_GLOBAL);    // งานล็อบสเตอร์
    SetPlayerMapIcon(playerid, 10, 1129.1749, -1467.8772, 15.7356, 56, 0, MAPICON_GLOBAL); // ตลาดกลาง
    SetPlayerMapIcon(playerid, 11, 2882.4521, -1995.6956, 6.7748, 55, 0, MAPICON_GLOBAL); // งานเก็บหมึก
    SetPlayerMapIcon(playerid, 12, 1118.1722, 729.9680, 10.8203, 54, 0, MAPICON_GLOBAL);  // งานเก็บกระบองเพชร
    SetPlayerMapIcon(playerid, 13, 1933.2969, 85.4039, 30.0811, 53, 0, MAPICON_GLOBAL);   // งานผักกาด
    SetPlayerMapIcon(playerid, 14, 216.9036, -1825.0366, 4.5000, 52, 0, MAPICON_GLOBAL);  // การาจกลาง
    SetPlayerMapIcon(playerid, 15, 400.3205, -2068.3162, 7.8359, 51, 0, MAPICON_GLOBAL);  // AFK
    SetPlayerMapIcon(playerid, 16, 266.5693, -1816.9425, 4.9168, 50, 0, MAPICON_GLOBAL);  // วอโซน
    SetPlayerMapIcon(playerid, 17, 256.0540, -1801.7892, 4.8231, 49, 0, MAPICON_GLOBAL);  // บาคาร่า
    SetPlayerMapIcon(playerid, 18, 277.6329, -1801.2725, 4.9559, 48, 0, MAPICON_GLOBAL);  // ร้านสกิน
    SetPlayerMapIcon(playerid, 19, 2765.7522, -2426.3218, 13.4324, 47, 0, MAPICON_GLOBAL); // เลเบล
    SetPlayerMapIcon(playerid, 20, 2772.7227, -2442.5129, 13.6373, 46, 0, MAPICON_GLOBAL); // ตู้เซฟ
    return 1;
}