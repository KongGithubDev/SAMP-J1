#include <YSI_Coding\y_hooks>
#include <GZ_ShapesYSI>

new gzone = 0;
new rzone = 1;
new bzone = 2;

stock CreateGreenZone()
{
    GZ_ShapeCreate(CIRCLE, 1760.8866,-2542.8342, 90);
    foreach (new i:Player){
        GZ_ShapeShowForPlayer(i,0, 0x00FF00FF);
    }
}

stock CreateRedZone()
{
    GZ_ShapeCreate(CIRCLE, 1431.5370,1463.6014, 90);
    foreach (new i:Player){
        
        GZ_ShapeShowForPlayer(i,1, 0x0000FFFF);
    }
}

stock CreateBlueZone()
{
    GZ_ShapeCreate(CIRCLE, -1329.1659,-33.2564, 90);
    foreach (new i:Player){
        GZ_ShapeShowForPlayer(i,2, 0xFF3300FF);
    }
}

