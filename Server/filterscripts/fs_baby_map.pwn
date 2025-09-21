// SA-MP include
#include <a_samp>
#include <streamer>

public OnFilterScriptInit()
{
	// --> Red Garage

	/*new Mechanic = CreateObject(19325, 1823.1446, -1438.8256, 17.8744, -0.1998, 0.0000, 179.9742);
	SetObjectMaterialText(Mechanic, "Mechanic", 0, 50, "Arial", 30, 1, -15066598, 0, 1);

	new Garage = CreateObject(19325, 1823.1446, -1426.6662, 17.7358, -0.4999, 0.0000, 179.8941);
	SetObjectMaterialText(Garage, "Garage", 0, 50, "Arial", 30, 1, -65536, 0, 1);

	new mehcrno = CreateDynamicObject(19454, 1823.03503, -1425.72974, 11.43320,   90.00000, 0.00000, 0.00000);
	new mehcrno1 = CreateDynamicObject(19454, 1823.03503, -1420.96484, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehcrno2 = CreateDynamicObject(19362, 1823.03503, -1424.40735, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehcrno3 = CreateDynamicObject(19362, 1823.03503, -1427.87512, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehcrno4 = CreateDynamicObject(19362, 1823.03503, -1430.89551, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehcrno5 = CreateDynamicObject(19377, 1818.29724, -1422.74036, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehcrno6 = CreateDynamicObject(19377, 1805.17078, -1427.45313, 14.19180,   0.00000, 0.00000, 0.00000);
	new mehcrno7 = CreateDynamicObject(19377, 1809.93774, -1422.74036, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehcrno8 = CreateDynamicObject(19377, 1805.17419, -1427.80505, 14.19180,   0.00000, 0.00000, 0.00000);
	new mehcrno9 = CreateDynamicObject(19391, 1823.03503, -1416.36853, 14.29590,   0.00000, 0.00000, 0.00000);
	new mehcrno10 = CreateDynamicObject(19454, 1823.03503, -1424.41040, 11.43321,   90.00000, 0.00000, 0.00000);
	new mehcrno11 = CreateDynamicObject(19454, 1823.03503, -1419.67761, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehcrno12 = CreateDynamicObject(19454, 1823.03503, -1413.08435, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehcrno13 = CreateDynamicObject(19454, 1823.03503, -1411.83960, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehcrno14 = CreateDynamicObject(19435, 1823.03503, -1409.33948, 14.28710,   0.00000, 0.00000, 0.00000);
	new mehcrno15 = CreateDynamicObject(19377, 1818.25208, -1408.60779, 10.78580,   0.00000, 0.00000, 90.00000);
	new mehcrno16 = CreateDynamicObject(19377, 1818.26917, -1413.79468, 15.98210,   0.00000, 90.00000, 90.00000);
	new mehcrno17 = CreateDynamicObject(19377, 1813.51123, -1413.34766, 10.78580,   0.00000, 0.00000, 0.00000);
	new mehcrno18 = CreateDynamicObject(19377, 1813.51123, -1417.85156, 10.78580,   0.00000, 0.00000, 0.00000);
	new mehcrno19 = CreateDynamicObject(19377, 1818.26917, -1417.44714, 15.98210,   0.00000, 90.00000, 90.00000);
	new mehcrno20 = CreateDynamicObject(19377, 1810.39648, -1427.78503, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrno21 = CreateDynamicObject(19377, 1810.39648, -1427.50500, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrno22 = CreateDynamicObject(19377, 1817.78223, -1427.78503, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrno23 = CreateDynamicObject(19377, 1817.78223, -1427.50500, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrno24 = CreateDynamicObject(19362, 1823.68530, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
	new mehcrno25 = CreateDynamicObject(19362, 1823.20532, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
	new mehcrno26 = CreateDynamicObject(19362, 1823.36536, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
	new mehcrno27 = CreateDynamicObject(19362, 1823.52539, -1412.42297, 11.47590,   0.00000, 0.00000, 0.00000);
	new mehcrno28 = CreateDynamicObject(1297, 1833.91675, -1414.39209, 18.10580,   30.00000, -80.00000, 180.00000);
	new mehcrno29 = CreateDynamicObject(1297, 1833.91675, -1417.85913, 18.10580,   -30.00000, -80.00000, 180.00000);

	SetDynamicObjectMaterial(mehcrno, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno1, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno2, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno3, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno4, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno5, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno6, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno7, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno8, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno9, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno10, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno11, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno12, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno13, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno14, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno15, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno16, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno17, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno18, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno19, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno20, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno21, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno22, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno23, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno24, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno25, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno26, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno27, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno28, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcrno29, 0, 2361, "shopping_freezers", "white", 0xFF1A1A1A);

	new grotti = CreateDynamicObject(3354, 1823.11292, -1432.60730, 17.74190,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(grotti, 0, 6337, "sunset02_law2", "SunBillB08", 0);

	new mehcrveno = CreateDynamicObject(19454, 1823.03503, -1440.89795, 11.43320,   90.00000, 0.00000, 0.00000);
	new mehcrveno1 = CreateDynamicObject(19454, 1823.03503, -1439.43225, 11.43320,   90.00000, 0.00000, 0.00000);
	new mehcrveno2 = CreateDynamicObject(19362, 1823.03503, -1434.37402, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehcrveno3 = CreateDynamicObject(19362, 1823.03503, -1440.88538, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehcrveno4 = CreateDynamicObject(19362, 1823.03503, -1437.64282, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehcrveno5 = CreateDynamicObject(19377, 1818.30676, -1442.57776, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehcrveno6 = CreateDynamicObject(19377, 1809.93774, -1442.57776, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehcrveno7 = CreateDynamicObject(19377, 1805.17078, -1437.43542, 14.19180,   0.00000, 0.00000, 0.00000);
	new mehcrveno8 = CreateDynamicObject(19377, 1805.17078, -1437.83423, 14.19180,   0.00000, 0.00000, 0.00000);
	new mehcrveno9 = CreateDynamicObject(19377, 1817.78223, -1437.41541, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrveno10 = CreateDynamicObject(19377, 1810.39648, -1437.41541, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrveno11 = CreateDynamicObject(19377, 1817.78223, -1437.79541, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrveno12 = CreateDynamicObject(19377, 1810.39648, -1437.79541, 19.40020,   0.00000, 90.00000, 0.00000);
	new mehcrveno13 = CreateDynamicObject(1223, 1828.51904, -1418.47351, 12.43320,   0.00000, 0.00000, 0.00000);
	new mehcrveno14 = CreateDynamicObject(1223, 1834.14978, -1413.32275, 12.43320,   0.00000, 0.00000, 180.00000);

	SetDynamicObjectMaterial(mehcrveno, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno1, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno2, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno3, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno4, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno5, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno6, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno7, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno8, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno9, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno10, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno11, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno12, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno13, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehcrveno14, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

	new mehgarage = CreateDynamicObject(3037, 1822.96338, -1432.60852, 17.15933,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(mehgarage, 0, 3354, "ce_burbhouse", "ws_garagedoor3_whiteMaterial", 0xFF8F8F8F);

	new mehbelo = CreateDynamicObject(19377, 1818.18225, -1441.22217, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehbelo1 = CreateDynamicObject(19377, 1810.01196, -1423.92712, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehbelo2 = CreateDynamicObject(19377, 1810.03381, -1441.22217, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehbelo3 = CreateDynamicObject(19377, 1808.19019, -1428.05676, 14.19180,   0.00000, 0.00000, 0.00000);
	new mehbelo4 = CreateDynamicObject(19377, 1818.12830, -1423.92712, 14.19180,   0.00000, 0.00000, 90.00000);
	new mehbelo5 = CreateDynamicObject(19377, 1808.19019, -1437.14758, 14.19180,   0.00000, 0.00000, 0.00000);
	new mehbelo6 = CreateDynamicObject(19454, 1822.93433, -1425.72144, 14.57724,   90.00000, 0.00000, 0.00000);
	new mehbelo7 = CreateDynamicObject(19454, 1822.93433, -1439.43225, 14.57720,   90.00000, 0.00000, 0.00000);
	new mehbelo8 = CreateDynamicObject(19362, 1822.93433, -1429.14063, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehbelo9 = CreateDynamicObject(19362, 1822.93433, -1432.52002, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehbelo10 = CreateDynamicObject(19362, 1822.93433, -1435.94043, 17.83410,   90.00000, 0.00000, 0.00000);
	new mehbelo11 = CreateDynamicObject(19377, 1808.19019, -1428.05676, 14.19180,   0.00000, 0.00000, 0.00000);
	new mehbelo12 = CreateDynamicObject(19377, 1813.25818, -1436.48645, 7.34810,   0.00000, 0.00000, 0.00000);
	new mehbelo13 = CreateDynamicObject(19377, 1813.25818, -1428.62097, 7.34814,   0.00000, 0.00000, 0.00000);
	new mehbelo14 = CreateDynamicObject(19377, 1813.59119, -1417.85156, 10.78580,   0.00000, 0.00000, 0.00000);
	new mehbelo15 = CreateDynamicObject(19377, 1813.59119, -1413.34766, 10.78580,   0.00000, 0.00000, 0.00000);
	new mehbelo16 = CreateDynamicObject(19435, 1822.93506, -1409.33948, 14.28710,   0.00000, 0.00000, 0.00000);
	new mehbelo17 = CreateDynamicObject(19454, 1822.93506, -1413.08435, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehbelo18 = CreateDynamicObject(19454, 1822.93506, -1411.83960, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehbelo19 = CreateDynamicObject(19391, 1822.93506, -1416.36853, 14.29590,   0.00000, 0.00000, 0.00000);
	new mehbelo20 = CreateDynamicObject(19454, 1822.93506, -1420.96484, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehbelo21 = CreateDynamicObject(19454, 1823.03503, -1419.67761, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehbelo22 = CreateDynamicObject(19377, 1818.25208, -1408.60779, 10.78580,   0.00000, 0.00000, 90.00000);
	new mehbelo23 = CreateDynamicObject(19377, 1818.20361, -1422.59680, 7.44777,   0.00000, 0.00000, 90.00000);
	new mehbelo24 = CreateDynamicObject(19454, 1822.93506, -1419.67761, 8.40790,   90.00000, 0.00000, 0.00000);
	new mehbelo25 = CreateDynamicObject(19454, 1810.85510, -1428.64478, 18.18910,   0.00000, 90.00000, 0.00000);
	new mehbelo26 = CreateDynamicObject(19454, 1810.85510, -1437.15710, 18.18910,   0.00000, 90.00000, 0.00000);
	new mehbelo27 = CreateDynamicObject(19454, 1808.80615, -1428.68958, 18.18910,   0.00000, 90.00000, 0.00000);
	new mehbelo28 = CreateDynamicObject(19454, 1808.80615, -1437.15710, 18.18910,   0.00000, 90.00000, 0.00000);

	SetDynamicObjectMaterial(mehbelo, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo1, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo2, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo3, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo4, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo5, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo6, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo7, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo8, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo9, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo10, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo11, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo12, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo13, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo14, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo15, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo16, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo17, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo18, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo19, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo20, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo21, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo22, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo23, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo24, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo25, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo26, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo27, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbelo28, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);

	new ormar = CreateDynamicObject(1742, 1809.00549, -1440.23096, 12.55500,   0.00000, 0.00000, -40.00000);
	SetDynamicObjectMaterial(ormar, 2, 10282, "michgar", "tool_store", 0);

	new ormar2 = CreateDynamicObject(1742, 1809.00549, -1440.23096, 12.55500,   0.00000, 0.00000, -40.00000);
	SetDynamicObjectMaterial(ormar2, 2, 10282, "michgar", "tool_store", 0);

	new ormar3 = CreateDynamicObject(2087, 1810.73145, -1424.14832, 12.46910,   0.00000, 0.00000, 0.00000);
	new ormar4 = CreateDynamicObject(1742, 1808.75122, -1434.22827, 12.55500,   0.00000, 0.00000, -90.00000);
	new ormar5 = CreateDynamicObject(1742, 1809.79333, -1424.33936, 12.55500,   0.00000, 0.00000, 180.00000);
	new ormar6 = CreateDynamicObject(1742, 1808.75122, -1434.22827, 12.55500,   0.00000, 0.00000, -90.00000);
	new ormar7 = CreateDynamicObject(1742, 1809.79333, -1424.69934, 12.55500,   0.00000, 0.00000, 180.00000);

	SetDynamicObjectMaterial(ormar3, 0, 10282, "michgar", "tool_store", 0);
	SetDynamicObjectMaterial(ormar4, 2, 10282, "michgar", "tool_store", 0);
	SetDynamicObjectMaterial(ormar5, 2, 10282, "michgar", "tool_store", 0);
	SetDynamicObjectMaterial(ormar6, 2, 10282, "michgar", "tool_store", 0);
	SetDynamicObjectMaterial(ormar7, 2, 10282, "michgar", "tool_store", 0);

	new mehbeton = CreateDynamicObject(19377, 1818.12183, -1437.35486, 12.49670,   0.00000, 90.00000, 90.00000);
	new mehbeton1 = CreateDynamicObject(19377, 1818.12183, -1426.86023, 12.49670,   0.00000, 90.00000, 90.00000);

	SetDynamicObjectMaterial(mehbeton, 0, 9495, "vict_sfw", "concretebigb256128", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehbeton1, 0, 9495, "vict_sfw", "concretebigb256128", 0xFFDEDEDE);

	new mehcigle = CreateDynamicObject(19454, 1811.43970, -1427.53967, 12.48240,   0.00000, 90.00000, 0.00000);
	new mehcigle1 = CreateDynamicObject(19454, 1811.43970, -1437.17358, 12.48240,   0.00000, 90.00000, 0.00000);
	new mehcigle2 = CreateDynamicObject(19454, 1807.94104, -1427.53967, 12.48240,   0.00000, 90.00000, 0.00000);
	new mehcigle3 = CreateDynamicObject(19454, 1807.94104, -1437.17358, 12.48240,   0.00000, 90.00000, 0.00000);
	new mehcigle4 = CreateDynamicObject(19377, 1817.79395, -1437.65784, 18.21760,   0.00000, 90.00000, 0.00000);
	new mehcigle5 = CreateDynamicObject(19377, 1817.79395, -1428.06445, 18.21760,   0.00000, 90.00000, 0.00000);

	SetDynamicObjectMaterial(mehcigle, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcigle1, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcigle2, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcigle3, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcigle4, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehcigle5, 0, 5810, "lawnstripm", "sl_lavicdtwall1", 0xFF1A1A1A);

	new mehalat = CreateDynamicObject(2204, 1808.69556, -1435.65295, 11.68770,   0.00000, 0.00000, -90.00000);
	SetDynamicObjectMaterial(mehalat, 0, 10282, "michgar", "tool_store2", 0);

	new mehshop = CreateDynamicObject(2434, 1815.96655, -1413.13330, 12.60420,   0.00000, 0.00000, 90.00000);
	new mehshop1 = CreateDynamicObject(2435, 1815.96655, -1415.91846, 12.60420,   0.00000, 0.00000, 90.00000);
	new mehshop2 = CreateDynamicObject(2435, 1814.83545, -1412.96753, 12.60420,   0.00000, 0.00000, 180.00000);
	new mehshop3 = CreateDynamicObject(2435, 1815.96655, -1414.99146, 12.60420,   0.00000, 0.00000, 90.00000);
	new mehshop4 = CreateDynamicObject(2435, 1815.96655, -1414.06201, 12.60420,   0.00000, 0.00000, 90.00000);
	new mehshop5 = CreateDynamicObject(2434, 1815.80103, -1417.05188, 12.60420,   0.00000, 0.00000, 0.00000);
	new mehshop6 = CreateDynamicObject(2435, 1814.87061, -1417.05090, 12.60420,   0.00000, 0.00000, 0.00000);

	SetDynamicObjectMaterial(mehshop, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);//0 drska
	SetDynamicObjectMaterial(mehshop1, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehshop2, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehshop3, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehshop4, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehshop5, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehshop6, 0, 2361, "shopping_freezers", "white", 0xFFDEDEDE);

	SetDynamicObjectMaterial(mehshop, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);//1 dole
	SetDynamicObjectMaterial(mehshop1, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehshop2, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehshop3, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehshop4, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehshop5, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehshop6, 1, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

	SetDynamicObjectMaterial(mehshop, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);//2 sredina
	SetDynamicObjectMaterial(mehshop1, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehshop2, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehshop3, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehshop4, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehshop5, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehshop6, 2, 2361, "shopping_freezers", "white", 0xFF1A1A1A);

	new Michelin = CreateObject(19329, 1808.2811, -1429.1574, 16.5324, 0.1000, -0.0999, 90.0708);
	SetObjectMaterialText(Michelin, "Michelin", 0, 40, "Arial", 30, 1, -1, -16776961, 1);

	new BFGoodrich = CreateObject(19329, 1817.0158, -1441.1131, 16.8204, -1.4000, -31.1000, -0.6351);
	SetObjectMaterialText(BFGoodrich, "BFGoodrich", 0, 50, "Verdana", 24, 1, -16730675, 0, 1);

	new Tigar = CreateObject(19329, 1817.3315, -1424.0202, 15.6215, 0.0000, 21.7999, -0.1533);
	SetObjectMaterialText(Tigar, "TIGAR", 0, 20, "Beckett", 24, 1, -16468988, 0, 1);

	new premium = CreateObject(19329, 1833.8264, -1416.1945, 15.6215, 0.0000, 0.0000, -89.9407);
	SetObjectMaterialText(premium, "Premium", 0, 50, "Verdana", 24, 1, -16776961, 0, 1);

	new evrodizel = CreateObject(19329, 1828.9138, -1416.0230, 15.6315, 0.0000, 0.0000, -89.9159);
	SetObjectMaterialText(evrodizel, "Evro Dizel", 0, 50, "Verdana", 24, 1, -65536, 0, 1);

	new grottishop = CreateObject(19325, 1813.7138, -1415.0430, 14.5585, 0.0000, 0.0000, 179.9476);
	SetObjectMaterialText(grottishop, "Grotti", 0, 50, "Diploma", 30, 1, -65536, 0, 1);

	new goregrotti = CreateObject(19325, 1837.0590, -1416.0830, 18.3625, 0.0000, 0.0000, -179.9923);
	SetObjectMaterialText(goregrotti, "GROTTI", 0, 60, "Arial", 29, 1, -1, 0, 1);

	new mehpod1 = CreateDynamicObject(19454, 1818.22583, -1413.80750, 12.54260,   0.00000, 90.00000, 90.00000);
	new mehpod2 = CreateDynamicObject(19454, 1818.22583, -1417.29346, 12.54260,   0.00000, 90.00000, 90.00000);
	new mehpod3 = CreateDynamicObject(19454, 1818.22583, -1420.77234, 12.54260,   0.00000, 90.00000, 90.00000);
	new mehpod4 = CreateDynamicObject(19454, 1818.22583, -1410.31238, 12.54260,   0.00000, 90.00000, 90.00000);

	SetDynamicObjectMaterial(mehpod1, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehpod2, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehpod3, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehpod4, 0, 3262, "privatesign", "ws_metalpanel1", 0xFFDEDEDE);

	new mehulje = CreateDynamicObject(1650, 1823.44727, -1413.52502, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje1 = CreateDynamicObject(1650, 1823.44727, -1413.30505, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje2 = CreateDynamicObject(1650, 1823.44727, -1413.08508, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje3 = CreateDynamicObject(1650, 1823.44727, -1412.86511, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje4 = CreateDynamicObject(1650, 1823.44727, -1412.64514, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje5 = CreateDynamicObject(1650, 1823.44727, -1412.42505, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje6 = CreateDynamicObject(1650, 1823.44727, -1412.20496, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje7 = CreateDynamicObject(1650, 1823.44727, -1411.98499, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje8 = CreateDynamicObject(1650, 1823.44727, -1411.76501, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje9 = CreateDynamicObject(1650, 1823.44727, -1411.54504, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje10 = CreateDynamicObject(1650, 1823.44727, -1411.32495, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje11 = CreateDynamicObject(1650, 1823.44727, -1411.10498, 13.53020,   0.00000, 0.00000, 0.00000);

	SetDynamicObjectMaterial(mehulje, 0, 2361, "shopping_freezers", "white", 0xCC6873E3);
	SetDynamicObjectMaterial(mehulje1, 0, 2361, "shopping_freezers", "white", 0xCC6873E3);
	SetDynamicObjectMaterial(mehulje2, 0, 2361, "shopping_freezers", "white", 0xAA6873E3);
	SetDynamicObjectMaterial(mehulje3, 0, 2361, "shopping_freezers", "white", 0xAA6873E3);

	SetDynamicObjectMaterial(mehulje4, 0, 2361, "shopping_freezers", "white", 0xCC4CAD2B);
	SetDynamicObjectMaterial(mehulje5, 0, 2361, "shopping_freezers", "white", 0xCC4CAD2B);
	SetDynamicObjectMaterial(mehulje6, 0, 2361, "shopping_freezers", "white", 0xAA4CAD2B);
	SetDynamicObjectMaterial(mehulje7, 0, 2361, "shopping_freezers", "white", 0xAA4CAD2B);

	SetDynamicObjectMaterial(mehulje8, 0, 2361, "shopping_freezers", "white", 0xCCC9571E);
	SetDynamicObjectMaterial(mehulje9, 0, 2361, "shopping_freezers", "white", 0xCCC9571E);
	SetDynamicObjectMaterial(mehulje10, 0, 2361, "shopping_freezers", "white", 0xAAC9571E);
	SetDynamicObjectMaterial(mehulje11, 0, 2361, "shopping_freezers", "white", 0xAAC9571E);

	new mehulje12 = CreateDynamicObject(1650, 1823.44727, -1413.52502, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje13 = CreateDynamicObject(1650, 1823.44727, -1413.30505, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje14 = CreateDynamicObject(1650, 1823.44727, -1413.08508, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje15 = CreateDynamicObject(1650, 1823.44727, -1412.86511, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje16 = CreateDynamicObject(1650, 1823.44727, -1412.64514, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje17 = CreateDynamicObject(1650, 1823.44727, -1412.42505, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje18 = CreateDynamicObject(1650, 1823.44727, -1412.20496, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje19 = CreateDynamicObject(1650, 1823.44727, -1411.98499, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje20 = CreateDynamicObject(1650, 1823.44727, -1411.76501, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje21 = CreateDynamicObject(1650, 1823.44727, -1411.54504, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje22 = CreateDynamicObject(1650, 1823.44727, -1411.32495, 13.53020,   0.00000, 0.00000, 0.00000);
	new mehulje23 = CreateDynamicObject(1650, 1823.44727, -1411.10498, 13.53020,   0.00000, 0.00000, 0.00000);

	SetDynamicObjectMaterial(mehulje12, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje13, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje14, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje15, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje16, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje17, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje18, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje19, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje20, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje21, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje22, 0, 1649, "wglass", "carshowwin2", 0xFF000000);
	SetDynamicObjectMaterial(mehulje23, 0, 1649, "wglass", "carshowwin2", 0xFF000000);

	new mehstub = CreateDynamicObject(2960, 1815.29785, -1432.81494, 14.57020,   0.00000, 90.00000, 0.00000);
	new mehstub1 = CreateDynamicObject(2960, 1818.63440, -1432.83484, 14.57020,   0.00000, 90.00000, 0.00000);
	new mehstub2 = CreateDynamicObject(2960, 1815.29785, -1426.86047, 14.57020,   0.00000, 90.00000, 0.00000);
	new mehstub3 = CreateDynamicObject(2960, 1818.63440, -1426.86047, 14.57020,   0.00000, 90.00000, 0.00000);
	new mehstub4 = CreateDynamicObject(2960, 1815.29785, -1431.15442, 14.57020,   0.00000, 90.00000, 0.00000);
	new mehstub5 = CreateDynamicObject(2960, 1818.63440, -1431.15442, 14.57020,   0.00000, 90.00000, 0.00000);
	new mehstub6 = CreateDynamicObject(2960, 1815.29785, -1437.09802, 14.57020,   0.00000, 90.00000, 0.00000);
	new mehstub7 = CreateDynamicObject(2960, 1818.63196, -1437.09802, 14.57020,   0.00000, 90.00000, 0.00000);

	new mehdizalica = CreateDynamicObject(19435, 1818.69617, -1436.34875, 12.54790,   0.00000, 90.00000, 0.00000);
	new mehdizalica1 = CreateDynamicObject(19435, 1815.19543, -1433.58594, 12.54790,   0.00000, 90.00000, 0.00000);
	new mehdizalica2 = CreateDynamicObject(19435, 1818.69617, -1433.58594, 12.54790,   0.00000, 90.00000, 0.00000);
	new mehdizalica3 = CreateDynamicObject(19435, 1815.19543, -1427.57898, 12.54790,   0.00000, 90.00000, 0.00000);
	new mehdizalica4 = CreateDynamicObject(19435, 1818.69617, -1427.57898, 12.54790,   0.00000, 90.00000, 0.00000);
	new mehdizalica5 = CreateDynamicObject(19435, 1815.19543, -1430.33691, 12.54790,   0.00000, 90.00000, 0.00000);
	new mehdizalica6 = CreateDynamicObject(19435, 1818.69617, -1430.33691, 12.54790,   0.00000, 90.00000, 0.00000);
	new mehdizalica7 = CreateDynamicObject(19435, 1815.19543, -1436.34875, 12.54790,   0.00000, 90.00000, 0.00000);

	SetDynamicObjectMaterial(mehstub, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehstub1, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehstub2, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehstub3, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehstub4, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehstub5, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehstub6, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehstub7, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

	SetDynamicObjectMaterial(mehdizalica, 0, 13131, "cunte_blockammo", "metpat64", 0);
	SetDynamicObjectMaterial(mehdizalica1, 0, 13131, "cunte_blockammo", "metpat64", 0);
	SetDynamicObjectMaterial(mehdizalica2, 0, 13131, "cunte_blockammo", "metpat64", 0);
	SetDynamicObjectMaterial(mehdizalica3, 0, 13131, "cunte_blockammo", "metpat64", 0);
	SetDynamicObjectMaterial(mehdizalica4, 0, 13131, "cunte_blockammo", "metpat64", 0);
	SetDynamicObjectMaterial(mehdizalica5, 0, 13131, "cunte_blockammo", "metpat64", 0);
	SetDynamicObjectMaterial(mehdizalica6, 0, 13131, "cunte_blockammo", "metpat64", 0);
	SetDynamicObjectMaterial(mehdizalica7, 0, 13131, "cunte_blockammo", "metpat64", 0);

	new mehgas = CreateDynamicObject(18452, 1831.40356, -1415.95642, 15.50220,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(mehgas, 3, 2361, "shopping_freezers", "white", 0xFFDEDEDE);
	SetDynamicObjectMaterial(mehgas, 1, 2361, "shopping_freezers", "white", 0xFF1A1A1A);
	SetDynamicObjectMaterial(mehgas, 2, 2361, "shopping_freezers", "white", 0xFFAD0A0A);
	SetDynamicObjectMaterial(mehgas, 0, 2361, "shopping_freezers", "white", 0xFFAD0A0A);

	CreateDynamicObject(1886, 1828.34851, -1412.71680, 17.91790,   20.00000, 0.00000, 40.00000);
	CreateDynamicObject(1886, 1813.92725, -1409.07190, 16.07490,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(737, 1831.09998, -1379.90002, 13.90000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2190, 1808.23181, -1437.46191, 13.29660,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1073, 1808.34949, -1428.32361, 13.91070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1082, 1808.34949, -1427.61792, 15.15590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1098, 1808.34949, -1429.14526, 15.15590,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1097, 1808.34949, -1430.76160, 15.15593,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1079, 1808.34949, -1429.96765, 13.91069,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1225, 1821.23743, -1424.55432, 12.94390,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(1218, 1822.30872, -1424.50500, 12.94390,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1348, 1816.08081, -1424.42578, 13.23503,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(927, 1813.71704, -1424.05847, 15.68720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(914, 1812.27429, -1424.04578, 15.26402,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3804, 1808.27209, -1437.08875, 15.96225,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2798, 1819.59387, -1439.26563, 12.60520,   90.00000, 0.00000, 25.97999);
	CreateDynamicObject(2465, 1815.34949, -1408.94507, 14.61880,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2057, 1820.98071, -1425.27295, 12.72270,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(918, 1817.23059, -1424.31348, 12.93510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1009, 1817.45642, -1424.80896, 12.96880,   0.00000, 90.00000, -40.00000);
	CreateDynamicObject(1066, 1819.46753, -1440.79724, 13.11990,   0.00000, 0.00000, 140.00000);
	CreateDynamicObject(1983, 1814.05664, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2541, 1820.70227, -1422.14575, 12.56150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2362, 1815.78931, -1416.09607, 13.65970,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(2369, 1815.74097, -1415.05737, 13.64010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2543, 1819.39575, -1413.62341, 12.56150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2542, 1821.16736, -1419.27393, 12.56150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2541, 1820.18726, -1419.27393, 12.56150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1987, 1817.03406, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2578, 1813.78076, -1420.53076, 13.57240,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2365, 1821.87219, -1414.73730, 12.62480,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1983, 1815.04712, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1983, 1816.03772, -1422.15540, 12.62480,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2541, 1819.69946, -1422.14417, 12.56150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2541, 1819.70532, -1420.27271, 12.56150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2542, 1820.68823, -1420.27271, 12.56150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2542, 1819.20520, -1419.27393, 12.56150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1887, 1814.06689, -1410.12231, 12.38460,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1844, 1815.14233, -1409.22888, 12.38460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1843, 1818.11865, -1409.22888, 12.38460,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2543, 1820.36230, -1413.62341, 12.56150,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2543, 1820.35864, -1412.58032, 12.56150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2543, 1819.39233, -1412.58032, 12.56150,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2443, 1822.20264, -1409.11475, 12.62509,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2452, 1820.39929, -1409.08203, 12.56510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2578, 1813.78076, -1419.49878, 13.57240,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(918, 1817.95703, -1424.36194, 12.93510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(918, 1817.47742, -1424.84436, 12.93510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1421, 1819.48889, -1440.01721, 13.32120,   0.00000, 0.00000, -20.00000);
	CreateDynamicObject(1221, 1817.88745, -1440.48743, 12.99115,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1421, 1821.61865, -1440.12781, 13.32120,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(1074, 1817.32410, -1439.74402, 13.00410,   0.00000, -20.00000, 110.00000);
	CreateDynamicObject(1025, 1815.33948, -1440.46021, 13.11070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14826, 1812.05322, -1445.30310, 13.26680,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1897, 1813.54321, -1440.43323, 12.02360,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1025, 1814.93909, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1025, 1814.53979, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1025, 1814.13562, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1025, 1813.75256, -1440.46863, 13.11070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1025, 1815.69751, -1440.46021, 13.11070,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 1814.68408, -1440.46741, 13.03300,   90.00000, 0.00000, 90.00000);
	CreateDynamicObject(1897, 1815.93066, -1440.43323, 12.02360,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2197, 1811.03418, -1440.24695, 12.54200,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1428, 1818.79480, -1424.72156, 13.90560,   0.00000, 0.00000, -110.00000);
	CreateDynamicObject(2197, 1811.74658, -1440.25073, 12.54200,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1428, 1819.54321, -1425.03430, 13.90560,   0.00000, 0.00000, 70.00000);
	CreateDynamicObject(1218, 1822.02087, -1425.43738, 12.94390,   20.00000, 90.00000, 230.00000);
	CreateDynamicObject(1077, 1817.02686, -1441.06470, 15.31610,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1078, 1818.31152, -1441.06470, 15.31611,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1442, 1808.76965, -1426.73157, 13.02124,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2690, 1809.14807, -1427.05542, 12.89900,   -20.00000, 0.00000, 50.00000);
	CreateDynamicObject(2961, 1808.30457, -1435.95483, 14.22710,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(1650, 1812.36475, -1440.93616, 12.87360,   0.00000, 0.00000, 60.00000);
	CreateDynamicObject(970, 1836.86377, -1448.76196, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1830.67065, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1826.54395, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1822.42456, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1818.30615, -1450.49780, 13.09560,   0.00000, 0.00000, -10.00000);
	CreateDynamicObject(970, 1814.24158, -1449.77490, 13.09560,   0.00000, 0.00000, -10.00000);
	CreateDynamicObject(970, 1810.17871, -1449.06274, 13.09560,   0.00000, 0.00000, -10.00000);
	CreateDynamicObject(970, 1806.11182, -1448.35706, 13.09560,   0.00000, 0.00000, -10.00000);
	CreateDynamicObject(970, 1802.00867, -1445.56726, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1804.06311, -1447.99268, 13.09560,   0.00000, 0.00000, -10.00000);
	CreateDynamicObject(970, 1802.01025, -1441.44495, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1802.00867, -1439.35889, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1802.00867, -1435.22681, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1802.00867, -1431.08606, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1802.00867, -1426.97095, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1802.00867, -1422.82764, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1802.00867, -1418.70837, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1834.76868, -1450.86768, 13.09560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1836.86377, -1444.63501, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1836.86377, -1440.50208, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1836.86377, -1412.84692, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1836.86377, -1416.96545, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1836.86377, -1421.06531, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1836.86377, -1425.22693, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1836.86377, -1393.37915, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1836.86377, -1408.69836, 13.09560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1834.80493, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1830.69568, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1826.56909, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1822.42761, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1818.27344, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1814.14063, -1391.32104, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1812.07202, -1393.37280, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1812.07202, -1397.49329, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1812.07202, -1401.66602, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1812.07202, -1405.79456, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1813.45776, -1409.90454, 12.89560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(970, 1811.40295, -1407.86304, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1807.25769, -1407.86194, 12.89560,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1676, 1834.30273, -1416.19019, 14.25010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1676, 1828.45435, -1416.03247, 14.25010,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(11392, 1809.27478, -1434.25146, 12.60620,   0.00000, 0.00000, 90.00000);*/

	// --> Pershing Square

	/*new ShalleB = CreateObject(19353, 1493.0607, -1743.5504, 14.7668, 0.0000, 0.0000, 91.1592);
	SetObjectMaterialText(ShalleB, "G", 0, 100, "Webdings", 90, 0, -16776961, 0, 1);

	new Shalle = CreateObject(19353, 1493.0189, -1743.5588, 13.7568, 0.0000, 0.0000, 88.9661);
	SetObjectMaterialText(Shalle, "Stadthalle", 0, 100, "Arial", 50, 0, -16776961, 0, 1);

	//new LSRoll = CreateObject(19353, 1479.7238, -1747.8833, 12.4758, -0.0000, -89.4999, 92.0811);
	new LSRoll = CreateObject(19353, 1479.7238, -1747.8833, 12.4758, -0.0000, -90.0000, 90.0000);
	SetObjectMaterialText(LSRoll, "???", 0, 100, "Webdings", 90, 0, -1, 0, 1);

	new LSBoden[9];
	LSBoden[0] = CreateObject(6959, 1538.90039, -1784.90039, 12.57899,   0.00000, 0.00000, 0.00000);
	LSBoden[1] = CreateObject(6959, 1497.59961, -1762.20020, 12.57899,   0.00000, 0.00000, 0.00000);
	LSBoden[2] = CreateObject(6959, 1456.29980, -1762.20020, 12.57899,   0.00000, 0.00000, 0.00000);
	LSBoden[3] = CreateObject(6959, 1415.00000, -1762.20020, 12.53090,   0.00000, 0.00000, 0.00000);
	LSBoden[4] = CreateObject(6959, 1497.59998, -1802.09998, 12.57899,   0.00000, 0.00000, 0.00000);
	LSBoden[5] = CreateObject(6959, 1456.30005, -1802.19995, 12.57899,   0.00000, 0.00000, 0.00000);
	LSBoden[6] = CreateObject(6959, 1415.00000, -1762.20020, 11.49090,   0.00000, 0.00000, 0.00000);
	LSBoden[7] = CreateObject(6959, 1415.00000, -1842.09998, 12.53090,   0.00000, 0.00000, 0.00000);
	LSBoden[8] = CreateObject(6959, 1417.00208, -1802.10364, 12.53090,   0.00000, 0.00000, 0.00000);
	for(new i = 0; i < sizeof(LSBoden); i++)
	{
	SetObjectMaterial(LSBoden[i],  0, 9495, "vict_sfw", "Grass_128HV", 0xFFFFFFFF);
	}

	CreateObject(6959, 1497.50000, -1842.30005, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(6959, 1538.90002, -1842.30005, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(6959, 1456.30005, -1842.30005, 12.60000,   0.00000, 0.00000, 0.00000);

	new STWeg[60];
	STWeg[0] = CreateObject(19379, 1418.80005, -1763.00000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[1] = CreateObject(19379, 1418.80005, -1753.40002, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[2] = CreateObject(19379, 1418.80005, -1772.59998, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[3] = CreateObject(19379, 1408.30005, -1772.59998, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[4] = CreateObject(19379, 1408.30005, -1763.00000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[5] = CreateObject(19379, 1408.30005, -1753.40002, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[6] = CreateObject(19379, 1466.80005, -1769.69995, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[7] = CreateObject(19379, 1466.80005, -1779.33301, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[8] = CreateObject(19379, 1535.19995, -1772.90002, 12.46450,   0.00000, 90.00000, 0.00000);
	STWeg[10] = CreateObject(19462, 1509.50000, -1785.50000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[11] = CreateObject(19462, 1509.50000, -1756.70020, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[12] = CreateObject(19462, 1509.50000, -1747.09961, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[13] = CreateObject(19462, 1509.50000, -1766.30005, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[14] = CreateObject(19462, 1509.50000, -1775.90002, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[15] = CreateObject(19462, 1509.50000, -1795.09998, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[16] = CreateObject(19462, 1506.00000, -1747.09998, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[17] = CreateObject(19462, 1502.50000, -1747.09998, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[18] = CreateObject(19462, 1506.00000, -1756.70020, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[19] = CreateObject(19462, 1506.00000, -1766.29980, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[20] = CreateObject(19462, 1506.00000, -1775.90039, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[21] = CreateObject(19462, 1506.00000, -1785.50000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[22] = CreateObject(19462, 1506.00000, -1795.09998, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[23] = CreateObject(19462, 1502.50000, -1756.70020, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[24] = CreateObject(19462, 1502.50000, -1766.30005, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[25] = CreateObject(19462, 1502.50000, -1775.90002, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[26] = CreateObject(19462, 1502.50000, -1785.50000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[27] = CreateObject(19462, 1502.50000, -1795.09998, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[28] = CreateObject(19462, 1513.57227, -1763.20020, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[29] = CreateObject(19462, 1523.19995, -1763.19995, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[30] = CreateObject(19462, 1532.79980, -1763.20020, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[31] = CreateObject(19462, 1542.40039, -1763.20020, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[32] = CreateObject(19462, 1552.00000, -1763.20020, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[33] = CreateObject(19462, 1496.00000, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[34] = CreateObject(19462, 1486.40002, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[35] = CreateObject(19462, 1476.80005, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[36] = CreateObject(19462, 1467.19995, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[37] = CreateObject(19462, 1457.59998, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[38] = CreateObject(19462, 1448.00000, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[39] = CreateObject(19462, 1438.40002, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[40] = CreateObject(19462, 1428.80005, -1763.19995, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[41] = CreateObject(19462, 1476.80005, -1782.40002, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[42] = CreateObject(19462, 1486.40002, -1782.40002, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[43] = CreateObject(19462, 1496.00000, -1782.40002, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[44] = CreateObject(19462, 1456.80005, -1779.46704, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[45] = CreateObject(19462, 1447.19995, -1779.46704, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[46] = CreateObject(19462, 1437.66895, -1779.46704, 12.46500,   0.00000, 90.00000, 90.00000);
	STWeg[47] = CreateObject(19462, 1434.59998, -1772.90002, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[48] = CreateObject(19462, 1535.64001, -1779.46997, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[49] = CreateObject(19462, 1526.09998, -1779.46997, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[50] = CreateObject(19462, 1545.23499, -1776.26001, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[51] = CreateObject(19462, 1548.30005, -1769.69995, 12.46450,   0.00000, 90.00000, 0.00000);
	STWeg[52] = CreateObject(19462, 1471.00000, -1756.69995, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[53] = CreateObject(19370, 1558.00000, -1763.19995, 12.46450,   0.00000, 90.00000, 90.00000);
	STWeg[54] = CreateObject(19370, 1420.40002, -1747.00000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[55] = CreateObject(19370, 1434.59998, -1766.50000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[56] = CreateObject(19370, 1531.69995, -1766.50000, 12.46450,   0.00000, 90.00000, 0.00000);
	STWeg[57] = CreateObject(19370, 1420.40002, -1743.90002, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[58] = CreateObject(19370, 1413.59998, -1779.00000, 12.46500,   0.00000, 90.00000, 0.00000);
	STWeg[59] = CreateObject(19443, 1413.59998, -1781.40002, 12.46500,   0.00000, 90.00000, 0.00000);
	for(new i = 0; i < sizeof(STWeg); i++)
	{
	SetObjectMaterial(STWeg[i],    0, 17562, "coast_apts", "fakestone1_LA", 0xFFFFFFFF);
	}

	new LSParkplatz[18];
	LSParkplatz[0] = CreateObject(19376, 1516.50000, -1747.09961, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[1] = CreateObject(19376, 1516.50000, -1756.70020, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[2] = CreateObject(19376, 1527.00000, -1747.09961, 12.46000,   0.00000, 90.00000, 0.00000);
	LSParkplatz[3] = CreateObject(19376, 1537.50000, -1747.09998, 12.46000,   0.00000, 90.00000, 0.00000);
	LSParkplatz[4] = CreateObject(19376, 1548.00000, -1747.09961, 12.46000,   0.00000, 90.00000, 0.00000);
	LSParkplatz[5] = CreateObject(19376, 1527.00000, -1756.70020, 12.46000,   0.00000, 90.00000, 0.00000);
	LSParkplatz[6] = CreateObject(19376, 1537.50000, -1756.69995, 12.46000,   0.00000, 90.00000, 0.00000);
	LSParkplatz[7] = CreateObject(19376, 1548.00000, -1756.70020, 12.46000,   0.00000, 90.00000, 0.00000);
	LSParkplatz[8] = CreateObject(19376, 1558.50000, -1756.70020, 12.45000,   0.00000, 90.00000, 0.00000);
	LSParkplatz[9] = CreateObject(19376, 1558.50000, -1747.09998, 12.45200,   0.00000, 90.00000, 0.00000);
	LSParkplatz[10] = CreateObject(19376, 1425.30005, -1787.00000, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[11] = CreateObject(19376, 1414.80005, -1787.00000, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[12] = CreateObject(19376, 1404.30005, -1787.00000, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[13] = CreateObject(19376, 1404.30005, -1796.59998, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[14] = CreateObject(19376, 1414.80005, -1796.59998, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[15] = CreateObject(19376, 1476.30005, -1747.09998, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[16] = CreateObject(19376, 1465.80005, -1747.09998, 12.46100,   0.00000, 90.00000, 0.00000);
	LSParkplatz[17] = CreateObject(19452, 1403.86902, -1803.16003, 12.46100,   0.00000, 90.00000, 90.00000);
	for(new i = 0; i < sizeof(LSParkplatz); i++)
	{
	SetObjectMaterial(LSParkplatz[i],  0, 9241, "sfn_helipad", "helipad_grey1", 0xFFFFFFFF);
	}

	new STMauer[60];
	STMauer[0] = CreateObject(19450, 1511.29980, -1747.09961, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[1] = CreateObject(19450, 1511.29980, -1756.70020, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[2] = CreateObject(19450, 1516.09998, -1761.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[3] = CreateObject(19450, 1554.69995, -1761.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[4] = CreateObject(19450, 1545.09998, -1761.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[5] = CreateObject(19450, 1535.50000, -1761.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[6] = CreateObject(19450, 1554.69995, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[7] = CreateObject(19450, 1545.09998, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[8] = CreateObject(19450, 1535.50000, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[10] = CreateObject(19450, 1525.90039, -1742.29980, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[11] = CreateObject(19450, 1559.50000, -1769.70020, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[12] = CreateObject(19450, 1559.50000, -1769.70020, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[13] = CreateObject(19450, 1495.90002, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[14] = CreateObject(19450, 1486.30005, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[15] = CreateObject(19450, 1559.50000, -1779.30005, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[16] = CreateObject(19450, 1559.50000, -1788.90002, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[17] = CreateObject(19450, 1559.50000, -1798.50000, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[18] = CreateObject(19450, 1519.50000, -1783.30005, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[20] = CreateObject(19450, 1519.50000, -1773.69995, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[21] = CreateObject(19450, 1524.30005, -1768.90002, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[22] = CreateObject(19450, 1529.91296, -1773.69995, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[23] = CreateObject(19450, 1534.69995, -1778.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[24] = CreateObject(19450, 1540.41345, -1783.30005, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[25] = CreateObject(19450, 1535.59998, -1788.09998, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[26] = CreateObject(19450, 1526.00000, -1788.09998, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[27] = CreateObject(19450, 1481.50000, -1747.09998, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[28] = CreateObject(19450, 1476.69995, -1751.90002, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[29] = CreateObject(19450, 1465.30005, -1751.90002, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[30] = CreateObject(19450, 1460.50000, -1747.09998, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[31] = CreateObject(19450, 1455.69995, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[32] = CreateObject(19450, 1446.09998, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[33] = CreateObject(19450, 1436.50000, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[34] = CreateObject(19450, 1426.90002, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[35] = CreateObject(19450, 1407.00000, -1782.09998, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[36] = CreateObject(19450, 1420.09998, -1782.09998, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[37] = CreateObject(19450, 1413.50000, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[38] = CreateObject(19450, 1403.90002, -1742.30005, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[39] = CreateObject(19450, 1399.09998, -1747.09998, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[40] = CreateObject(19450, 1399.09998, -1756.69995, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[41] = CreateObject(19450, 1399.00000, -1777.30005, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[42] = CreateObject(19450, 1403.90002, -1804.90002, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[43] = CreateObject(19358, 1529.09998, -1761.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[44] = CreateObject(19358, 1525.90002, -1761.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[45] = CreateObject(19358, 1559.50000, -1759.90002, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[46] = CreateObject(19358, 1559.50000, -1756.69995, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[47] = CreateObject(19358, 1559.50000, -1747.09998, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[48] = CreateObject(19358, 1559.50000, -1743.90002, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[49] = CreateObject(19358, 1512.90039, -1742.29980, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[50] = CreateObject(19358, 1400.59998, -1782.09998, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[51] = CreateObject(19358, 1399.09998, -1803.30005, 11.60000,   0.00000, 0.00000, 0.00000);
	STMauer[52] = CreateObject(19431, 1529.19995, -1768.90002, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[53] = CreateObject(19431, 1539.69995, -1778.50000, 11.60000,   0.00000, 0.00000, 90.00000);
	STMauer[54] = CreateObject(19431, 1520.40002, -1788.09998, 11.60000,   0.00000, 0.00000, 90.00000);
	for(new i = 0; i < sizeof(STMauer); i++)
	{
	SetObjectMaterial(STMauer[i],   0, 8565, "vgsebuild01", "ws_stonewall", 0xFFFFFFFF);
	}

	new LSSchild[1];
	LSSchild[0] = CreateObject(8132, 1492.19995, -1743.59998, 15.00000,   0.00000, 0.00000, 280.00000);
	for(new i = 0; i < sizeof(LSSchild); i++)
	{
	SetObjectMaterial(LSSchild[i],  1, 1675, "wshxrefhse", "duskyblue_128", 0xFFFFFFFF); //R???ckwand
	SetObjectMaterial(LSSchild[i],  2, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF); //Schild
	}

	new LSBrunnen[3];
	LSBrunnen[0] = CreateObject(19381, 1524.69995, -1783.30005, 13.10000,   0.00000, 90.00000, 0.00000);
	LSBrunnen[1] = CreateObject(19381, 1524.69995, -1773.69995, 13.10000,   0.00000, 90.00000, 0.00000);
	LSBrunnen[2] = CreateObject(19381, 1535.19995, -1783.30005, 13.10000,   0.00000, 90.00000, 0.00000);
	for(new i = 0; i < sizeof(LSBrunnen); i++)
	{
	SetObjectMaterial(LSBrunnen[i],  0, 3947, "rczero_track", "waterclear256", 0xFFFFFFFF);
	}

	CreateObject(18880, 1529.90002, -1778.50000, 13.60000,   0.00000, 180.00000, 0.00000);
	CreateObject(18880, 1540.40002, -1778.50000, 13.60000,   0.00000, 179.99451, 0.00000);
	CreateObject(18880, 1540.40002, -1788.09998, 13.60000,   0.00000, 179.99451, 0.00000);
	CreateObject(18880, 1519.50000, -1788.09998, 13.60000,   0.00000, 179.99451, 0.00000);
	CreateObject(18880, 1519.50000, -1768.90002, 13.60000,   0.00000, 179.99451, 0.00000);
	CreateObject(18880, 1529.90002, -1768.90002, 13.60000,   0.00000, 179.99451, 0.00000);

	CreateObject(10398, 1487.70020, -1811.20020, 40.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(11674, 1403.59998, -1764.30005, 12.50000,   0.00000, 0.00000, 128.00000);
	CreateObject(19425, 1519.50000, -1742.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1516.09998, -1742.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1517.80005, -1742.30005, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(19425, 1559.50000, -1753.50000, 12.50000,   0.00000, 0.00000, 90.00000);
	CreateObject(19425, 1559.50000, -1750.30005, 12.50000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1416.59998, -1748.59998, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(970, 1424.09998, -1750.69995, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1424.09998, -1754.80005, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1424.09998, -1758.90002, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1424.09998, -1767.09998, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1424.09998, -1771.19995, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1424.09998, -1775.30005, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1422.00000, -1777.50000, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(970, 1417.90002, -1777.50000, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(750, 1538.19995, -1785.09998, 12.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(746, 1523.59998, -1772.19995, 12.00000,   0.00000, 0.00000, 0.00000);
	CreateObject(746, 1525.30005, -1772.00000, 12.00000,   0.00000, 0.00000, 290.00000);
	CreateObject(746, 1524.40002, -1775.59998, 11.70000,   0.00000, 0.00000, 289.99512);
	CreateObject(746, 1527.50000, -1773.80005, 11.70000,   0.00000, 0.00000, 289.99512);
	CreateObject(3515, 1535.19995, -1783.30005, 12.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(3515, 1531.80005, -1783.40002, 12.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(3515, 1533.50000, -1783.40002, 10.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(6965, 1523.69995, -1784.09998, 9.70000,   0.00000, 0.00000, 0.00000);
	CreateObject(3515, 1525.09998, -1773.19995, 12.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(746, 1524.30005, -1786.19995, 11.70000,   0.00000, 0.00000, 289.99512);
	CreateObject(746, 1522.40002, -1784.19995, 11.70000,   0.00000, 0.00000, 289.99512);
	CreateObject(746, 1524.90002, -1784.30005, 11.20000,   0.00000, 0.00000, 289.99512);
	CreateObject(746, 1523.19995, -1784.09998, 11.90000,   0.00000, 0.00000, 289.99512);
	CreateObject(746, 1526.00000, -1781.50000, 11.40000,   0.00000, 0.00000, 289.99512);
	CreateObject(746, 1529.00000, -1784.80005, 11.30000,   0.00000, 0.00000, 349.99512);
	CreateObject(617, 1500.40002, -1761.59998, 12.50000,   0.00000, 0.00000, 38.00000);
	CreateObject(618, 1498.09998, -1744.19995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(672, 1496.30005, -1769.00000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(714, 1543.40002, -1768.59998, 8.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(7655, 1544.00000, -1789.40002, 17.60000,   0.00000, 0.00000, 90.00000);
	CreateObject(7655, 1424.00000, -1762.19995, 17.60000,   0.00000, 0.00000, 90.00000);
	CreateObject(617, 1423.80005, -1743.19995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(7655, 1443.30005, -1761.40002, 16.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(618, 1462.59998, -1761.90002, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(7655, 1481.59998, -1761.40002, 16.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(7090, 1505.80005, -1793.69995, 27.50000,   0.00000, 0.00000, 90.00000);
	CreateObject(3935, 1528.69995, -1779.59998, 13.40000,   10.00000, 0.00000, 328.00000);
	CreateObject(11489, 1467.00000, -1787.00000, 12.50000,   0.00000, 0.00000, 180.00000);
	CreateObject(1211, 1482.50000, -1765.09998, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1232, 1472.09998, -1765.09998, 15.00000,   0.00000, 0.00000, 0.00000);
	CreateObject(1232, 1469.19995, -1761.30005, 15.00000,   0.00000, 0.00000, 300.00000);
	CreateObject(1232, 1461.50000, -1765.09998, 15.00000,   0.00000, 0.00000, 299.99817);
	CreateObject(1232, 1461.50000, -1781.40002, 15.00000,   0.00000, 0.00000, 299.99817);
	CreateObject(1232, 1447.09998, -1781.30005, 15.00000,   0.00000, 0.00000, 269.99817);
	CreateObject(1232, 1432.69995, -1773.50000, 15.00000,   0.00000, 0.00000, 179.99451);
	CreateObject(1232, 1424.30005, -1765.09998, 15.00000,   0.00000, 0.00000, 149.99451);
	CreateObject(1232, 1414.80005, -1748.69995, 15.00000,   0.00000, 0.00000, 149.99088);
	CreateObject(1232, 1404.19995, -1748.69995, 15.00000,   0.00000, 0.00000, 149.99088);
	CreateObject(1232, 1415.59998, -1777.50000, 15.00000,   0.00000, 0.00000, 149.99084);
	CreateObject(1232, 1411.59998, -1777.50000, 15.00000,   0.00000, 0.00000, 149.99084);
	CreateObject(1232, 1403.19995, -1777.50000, 15.00000,   0.00000, 0.00000, 149.99084);
	CreateObject(1232, 1399.00000, -1782.09998, 15.00000,   0.00000, 0.00000, 149.99084);
	CreateObject(1232, 1399.09998, -1801.59998, 15.00000,   0.00000, 0.00000, 89.99084);
	CreateObject(1232, 1500.59998, -1765.00000, 15.00000,   0.00000, 0.00000, 149.98901);
	CreateObject(1232, 1500.69995, -1780.50000, 15.00000,   0.00000, 0.00000, 179.98535);
	CreateObject(1232, 1511.30005, -1780.50000, 15.00000,   0.00000, 0.00000, 118.98352);
	CreateObject(1232, 1484.69995, -1780.59998, 15.00000,   0.00000, 0.00000, 208.98193);
	CreateObject(1232, 1533.50000, -1765.09998, 15.00000,   0.00000, 0.00000, 239.73193);
	CreateObject(1232, 1546.40002, -1774.40002, 15.00000,   0.00000, 0.00000, 211.72717);
	CreateObject(1232, 1550.19995, -1765.00000, 15.00000,   0.00000, 0.00000, 151.72302);
	CreateObject(1232, 1538.59998, -1761.47998, 13.20000,   0.00000, 0.00000, 151.72119);
	CreateObject(1232, 1524.40002, -1761.47998, 13.20000,   0.00000, 0.00000, 151.72119);
	CreateObject(1232, 1520.80005, -1761.47998, 13.20000,   0.00000, 0.00000, 151.72119);
	CreateObject(1232, 1511.28003, -1755.19995, 13.20000,   0.00000, 0.00000, 118.71985);
	CreateObject(1232, 1511.28003, -1745.69995, 13.20000,   0.00000, 0.00000, 118.71985);
	CreateObject(1232, 1500.69995, -1755.19995, 15.00000,   0.00000, 0.00000, 179.98535);
	CreateObject(1232, 1500.69995, -1745.90002, 15.00000,   0.00000, 0.00000, 177.98535);
	CreateObject(1232, 1472.80005, -1751.88000, 13.20000,   0.00000, 0.00000, 147.21826);
	CreateObject(1232, 1469.19995, -1751.88000, 13.20000,   0.00000, 0.00000, 147.21677);
	CreateObject(970, 1412.50000, -1748.59998, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(970, 1408.40002, -1748.59998, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(970, 1404.30005, -1748.59998, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(970, 1402.19995, -1750.69995, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(970, 1402.19995, -1754.80005, 13.10000,   0.00000, 0.00000, 90.00000);
	CreateObject(1346, 1423.19995, -1748.00000, 13.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(910, 1402.69995, -1753.80005, 13.80000,   0.00000, 0.00000, 90.00000);
	CreateObject(3035, 1402.80005, -1751.59998, 13.30000,   0.00000, 0.00000, 90.00000);
	CreateObject(2971, 1406.40002, -1754.00000, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(1440, 1405.50000, -1750.19995, 13.00000,   0.00000, 0.00000, 40.00000);
	CreateObject(1439, 1402.80005, -1749.59998, 12.60000,   0.00000, 0.00000, 90.00000);
	CreateObject(1359, 1415.69995, -1780.09998, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1432.09998, -1765.40002, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1461.19995, -1777.40002, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1480.50000, -1780.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1500.30005, -1784.50000, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1511.59998, -1765.40002, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1540.80005, -1774.09998, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1555.90002, -1765.30005, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1500.40002, -1747.19995, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1480.19995, -1761.00000, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1453.00000, -1761.09998, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(1359, 1412.00000, -1765.50000, 13.20000,   0.00000, 0.00000, 0.00000);
	CreateObject(2674, 1415.40002, -1760.69995, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(2675, 1413.19995, -1756.59998, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(2673, 1412.40002, -1766.19995, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(2671, 1414.80005, -1765.00000, 12.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(2036, 1402.90002, -1749.90002, 13.60000,   358.42596, 218.01691, 75.23254);
	CreateObject(3694, 1550.19995, -1797.19995, 12.90000,   0.00000, 0.00000, 250.00000);
	CreateObject(2237, 1555.90002, -1792.09998, 13.60000,   0.00000, 0.00000, 0.00000);
	CreateObject(2237, 1552.09998, -1795.59998, 13.50000,   340.00000, 0.00000, 0.00000);
	CreateObject(1413, 1408.19995, -1752.90002, 13.80000,   0.00000, 0.00000, 270.00000);
	CreateObject(1281, 1418.00000, -1760.00000, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1436.69995, -1767.40002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1436.69995, -1775.19995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1472.40002, -1773.40002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1472.40002, -1776.19995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1511.69995, -1773.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1511.59998, -1778.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1511.59998, -1786.19995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1540.80005, -1772.09998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1550.50000, -1769.50000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(1280, 1535.00000, -1767.69995, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1538.69995, -1767.69995, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1491.59998, -1780.19995, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1478.50000, -1780.30005, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1456.90002, -1777.30005, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1449.40002, -1777.30005, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1451.09998, -1761.09998, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1431.00000, -1761.09998, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1490.90002, -1761.09998, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1487.40002, -1761.09998, 12.90000,   0.00000, 0.00000, 90.00000);
	CreateObject(1280, 1461.19995, -1772.30005, 12.90000,   0.00000, 0.00000, 180.00000);
	CreateObject(1280, 1500.40002, -1769.40002, 12.90000,   0.00000, 0.00000, 179.99451);
	CreateObject(1280, 1500.40002, -1749.30005, 12.90000,   0.00000, 0.00000, 179.99451);
	CreateObject(1280, 1500.40002, -1752.30005, 12.90000,   0.00000, 0.00000, 179.99451);
	CreateObject(1281, 1416.50000, -1755.50000, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1281, 1420.30005, -1765.09998, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1281, 1420.80005, -1770.50000, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1281, 1415.50000, -1768.90002, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1281, 1408.90002, -1775.90002, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1281, 1421.09998, -1775.19995, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1281, 1412.40002, -1752.09998, 13.40000,   0.00000, 0.00000, 0.00000);
	CreateObject(1522, 1409.03601, -1761.57202, 12.56000,   0.00000, 0.00000, 0.00000);
	CreateObject(848, 1444.59998, -1756.69995, 13.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(843, 1442.30005, -1769.80005, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(837, 1449.30005, -1748.09998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(842, 1449.09998, -1751.19995, 12.70000,   0.00000, 0.00000, 0.00000);
	CreateObject(841, 1449.00000, -1751.69995, 12.70000,   0.00000, 0.00000, 0.00000);
	CreateObject(672, 1435.64099, -1753.35095, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(617, 1455.80005, -1745.90002, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(617, 1441.90002, -1777.40002, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(617, 1483.69995, -1778.59998, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(617, 1485.69995, -1749.50000, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(617, 1530.59998, -1792.30005, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(617, 1556.09998, -1789.19995, 12.50000,   0.00000, 0.00000, 0.00000);
	CreateObject(617, 1514.09998, -1784.00000, 12.50000,   0.00000, 0.00000, 37.99622);
	CreateObject(617, 1494.09998, -1789.59998, 12.50000,   0.00000, 0.00000, 327.99622);
	CreateObject(617, 1455.40002, -1787.30005, 12.50000,   0.00000, 0.00000, 327.99133);
	CreateObject(617, 1403.40002, -1745.00000, 12.50000,   0.00000, 0.00000, 327.99133);
	CreateObject(672, 1407.50000, -1779.80005, 13.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(618, 1454.80005, -1771.80005, 11.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(618, 1445.69995, -1768.19995, 12.70000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1482.90002, -1771.40002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(870, 1487.09998, -1770.30005, 12.80000,   0.00000, 0.00000, 6.00000);
	CreateObject(871, 1479.59998, -1772.59998, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1482.80005, -1772.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1485.50000, -1773.09998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1486.00000, -1767.40002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1481.00000, -1767.00000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1477.30005, -1769.40002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1476.90002, -1773.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1474.80005, -1777.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1481.09998, -1777.19995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1475.50000, -1788.00000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1479.80005, -1787.09998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1482.40002, -1790.80005, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1487.09998, -1790.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1491.00000, -1788.19995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1492.50000, -1795.09998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1495.80005, -1792.80005, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1484.80005, -1785.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1474.69995, -1793.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1465.59998, -1793.19995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1459.69995, -1791.00000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1452.80005, -1786.59998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1446.30005, -1787.69995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1441.30005, -1783.19995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1447.59998, -1774.09998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1450.90002, -1767.90002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1458.09998, -1774.69995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1458.69995, -1757.80005, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1465.69995, -1756.80005, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1456.40002, -1751.59998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1428.30005, -1749.69995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1427.69995, -1746.00000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1415.40002, -1745.59998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1495.40002, -1757.59998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1490.00000, -1753.59998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1484.00000, -1757.59998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1495.19995, -1750.30005, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1514.30005, -1773.59998, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1517.59998, -1767.69995, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1544.80005, -1784.50000, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1554.30005, -1781.40002, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(869, 1554.29980, -1781.40039, 12.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1485.19995, -1770.40002, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1494.69995, -1772.40002, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1514.50000, -1769.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1517.09998, -1772.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1527.09998, -1766.09998, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1525.09998, -1766.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1526.19995, -1768.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1550.09998, -1786.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1548.90002, -1787.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1549.90002, -1784.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1547.59998, -1785.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1487.69995, -1756.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1492.30005, -1751.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1428.90002, -1766.80005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1427.90002, -1768.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1430.19995, -1768.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1430.19995, -1770.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1428.50000, -1770.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1426.80005, -1770.00000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1426.80005, -1769.30005, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1426.80005, -1766.50000, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1426.80005, -1772.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1426.80005, -1773.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1426.80005, -1776.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1428.80005, -1774.69995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1430.09998, -1772.19995, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(871, 1430.09961, -1772.20020, 12.80000,   0.00000, 0.00000, 0.00000);
	CreateObject(870, 1493.90002, -1775.80005, 12.80000,   0.00000, 0.00000, 5.99854);
	CreateObject(870, 1515.40002, -1777.90002, 12.80000,   0.00000, 0.00000, 5.99854);
	CreateObject(870, 1516.19995, -1790.59998, 12.80000,   0.00000, 0.00000, 305.99854);
	CreateObject(870, 1517.90002, -1791.69995, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1516.40002, -1794.00000, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1513.40002, -1792.19995, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1515.59998, -1788.59998, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1525.09998, -1791.80005, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1528.90002, -1794.19995, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1530.80005, -1793.59998, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1537.80005, -1793.19995, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1541.59998, -1793.30005, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1541.09998, -1790.09998, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1537.59998, -1790.69995, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1540.09998, -1791.80005, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(870, 1556.40002, -1787.09998, 12.80000,   0.00000, 0.00000, 305.99670);
	CreateObject(1234, 1424.00000, -1761.40002, 14.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(3462, 1418.50000, -1779.09998, 13.90000,   0.00000, 0.00000, 290.00000);
	CreateObject(19353, 1481.30005, -1750.19995, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1478.19995, -1750.19995, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1475.00000, -1750.30005, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1472.00000, -1750.30005, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1460.69995, -1750.19995, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1463.90002, -1750.30005, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1467.09998, -1750.40002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1470.00000, -1750.30005, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1481.30005, -1747.80005, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1478.19995, -1747.80005, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1475.00000, -1747.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1472.00000, -1747.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1470.00000, -1747.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1467.09998, -1748.00000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1463.90002, -1747.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1460.69995, -1747.80005, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1559.40002, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1556.19995, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1553.00000, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1549.80005, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1546.59998, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1543.40002, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1540.19995, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1537.00000, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1533.80005, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1530.59998, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1527.40002, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1524.40002, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1520.80005, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1517.69995, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1514.50000, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1511.40002, -1759.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1511.40002, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1514.50000, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1517.69995, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1520.80005, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1524.40002, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1527.40002, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1530.59998, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1533.80005, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1537.00000, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1540.19995, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1543.40002, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1546.59998, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1549.80005, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1553.00000, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1556.19995, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19426, 1559.40002, -1757.50000, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1521.19995, -1743.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1527.50000, -1743.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1533.80005, -1743.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1540.00000, -1743.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1546.69995, -1743.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1553.09998, -1743.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(19353, 1559.40002, -1743.90002, 10.81000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1522.59998, -1761.40002, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1559.50000, -1763.19995, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1507.80005, -1742.40002, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1504.19995, -1742.40002, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1500.90002, -1742.30005, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1511.00000, -1742.30005, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1420.30005, -1742.40002, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1214, 1413.50000, -1782.09998, 12.10000,   0.00000, 0.00000, 0.00000);
	CreateObject(1232, 1418.50000, -1742.30005, 15.00000,   0.00000, 0.00000, 149.99084);
	CreateObject(837, 1435.34851, -1745.17639, 12.75100,   0.00000, 0.00000, 90.00000);
	CreateObject(843, 1436.15491, -1758.10339, 13.01400,   0.00000, 0.00000, 90.00000);
	CreateObject(837, 1434.93982, -1750.80859, 12.76600,   0.00000, 0.00000, 90.00000);
	CreateObject(1359, 1435.62964, -1781.50513, 13.18360,   0.00000, 0.00000, 0.00000);*/

	// --> Hospital

	/*CreateObject(19449, 1086.21973, -1757.69629, 21.21663,   0.00000, 0.00000, 0.00000);
	new Logo= CreateObject(19353, 1086.24561, -1756.9941, 21.19680,   0.00000, 0.00000, 0.00000);
	SetObjectMaterialText(Logo, "{FFFFFF}OSPITAL", 0, OBJECT_MATERIAL_SIZE_256x128, "Georgia", 60, 1, 0xfff0f0f0, 0, 1);
	new Logo1= CreateObject(2189, 1086.30957, -1759.5939, 21.22210,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(Logo1, 0, 2361, "shopping_freezers", "white", 0xFFECEAEA);
	SetDynamicObjectMaterial(Logo1, 1, 2361, "shopping_freezers", "white", 0xFF092B91);
	new Logo2= CreateObject(19353, 1086.22827, -1759.6048, 21.19680,   0.00000, 0.00000, 0.00000);
	SetObjectMaterialText(Logo2, "{A52A2A}H", 0, OBJECT_MATERIAL_SIZE_256x128, "Georgia", 80, 1, 0xfff0f0f0, 0, 1);
	new Hospital= CreateObject(16564, 1081.28857, -1757.69556, 12.90220,   0.00000, 0.00000, 270.00000);
	SetObjectMaterial(Hospital, 0, 8399, "vgs_shops", "vgsclubwall05_128", 0xFFFFFFFF);
	SetObjectMaterial(Hospital, 1, 3906, "libertyhi5", "wallbrown02_64HV", 0xFF411B00);
	SetObjectMaterial(Hospital, 5, 3850, "carshowglass_sfsx", "ws_glass_balustrade_better", 0xFFA52A2A);
	SetObjectMaterial(Hospital, 6, 8391, "ballys01", "vgncorpdoor1_512", 0);
	SetObjectMaterial(Hospital, 7, 8391, "ballys01", "vgncorpdoor1_512", 0);
	new Base= CreateObject(4103, 1104.09375, -1780.90625, 25.29690,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(Base, 2, 10412, "hotel1", "grasslawnfade_256", 0xFFFFFFFF);
	CreateObject(669, 1158.04663, -1725.72766, 12.82350,   0.00000, 0.00000, 0.00000);
	CreateObject(669, 1108.16821, -1725.72766, 12.82350,   0.00000, 0.00000, 0.00000);
	CreateObject(669, 1052.27600, -1725.72766, 12.82350,   0.00000, 0.00000, 0.00000);
	CreateObject(669, 1050.61487, -1770.62036, 12.82350,   0.00000, 0.00000, 0.00000);
	new Muro[19];
	Muro[0]= CreateObject(18981, 1059.81519, -1764.53516, 0.95480,   0.00000, 0.00000, 0.00000);
	Muro[1]= CreateObject(18981, 1059.81396, -1748.36804, 0.97480,   0.00000, 0.00000, 0.00000);
	Muro[2]= CreateObject(18981, 1071.83984, -1776.53503, 0.93480,   0.00000, 0.00000, 90.00000);
	Muro[3]= CreateObject(18981, 1089.24695, -1776.55896, 0.95480,   0.00000, 0.00000, 90.00000);
	Muro[4]= CreateObject(18981, 1101.39124, -1764.54456, 0.97480,   0.00000, 0.00000, 0.00000);
	Muro[5]= CreateObject(18981, 1071.84033, -1736.37415, 0.93480,   0.00000, 0.00000, 90.00000);
	Muro[6]= CreateObject(18981, 1074.40906, -1736.38037, 0.91480,   0.00000, 0.00000, 90.00000);
	Muro[7]= CreateObject(18762, 1101.38245, -1748.80103, 12.96320,   0.00000, 90.00000, 90.00000);
	Muro[8]= CreateObject(18762, 1101.38086, -1751.39001, 12.94320,   0.00000, 90.00000, 90.00000);
	Muro[9]= CreateObject(18981, 1060.77600, -1764.50659, 0.91480,   0.00000, 0.00000, 0.00000);
	Muro[10]= CreateObject(18981, 1060.77600, -1748.36804, 0.95480,   0.00000, 0.00000, 0.00000);
	Muro[11]= CreateObject(18762, 1102.26135, -1736.37683, 12.36350,   0.00000, 0.00000, 0.00000);
	Muro[12]= CreateObject(18762, 1102.28711, -1746.76917, 12.36350,   0.00000, 0.00000, 0.00000);
	Muro[13]= CreateObject(18762, 1097.57239, -1736.39758, 12.75100,   0.00000, 90.00000, 0.00000);
	Muro[14]= CreateObject(18762, 1099.37964, -1736.41541, 12.73100,   0.00000, 90.00000, 0.00000);
	Muro[15]= CreateObject(18762, 1094.57861, -1736.31165, 14.48175,   0.00000, 0.00000, 0.00000);
	Muro[16]= CreateObject(18762, 1086.43030, -1736.33008, 14.48175,   0.00000, 0.00000, 0.00000);
	Muro[17]= CreateObject(18762, 1092.57117, -1736.29749, 17.15184,   0.00000, 90.00000, 0.00000);
	Muro[18]= CreateObject(18762, 1088.44421, -1736.30432, 17.15180,   0.00000, 90.00000, 0.00000);
	for(new i = 0; i != 19; i++) SetObjectMaterial(Muro[i],0, 6063, "shops2_law", "ws_carpark2", 0xFFFFFFFF);
	new Chao[17];
	Chao[0]= CreateObject(8661, 1080.86353, -1746.82727, 12.92250,   0.00000, 0.00000, 0.00000);
	Chao[1]= CreateObject(8661, 1081.51599, -1766.48596, 12.92250,   0.00000, 0.00000, 0.00000);
	Chao[2]= CreateObject(18764, 1102.79114, -1743.77100, 9.96000,   0.00000, 12.00000, 0.00000);
	Chao[3]= CreateObject(18764, 1102.79114, -1739.10889, 9.96000,   0.00000, 12.00000, 0.00000);
	Chao[4]= CreateObject(8661, 1081.11609, -1766.45520, 12.90250,   0.00000, 0.00000, 0.00000);
	Chao[5]= CreateObject(18764, 1089.35547, -1734.98901, 9.98000,   0.00000, 12.00000, 90.00000);
	Chao[6]= CreateObject(18764, 1093.19385, -1734.99414, 9.98000,   0.00000, 12.00000, 90.00000);
	Chao[7]= CreateObject(18766, 1066.26160, -1746.72937, 18.69240,   90.00000, 0.00000, 0.00000);
	Chao[8]= CreateObject(18766, 1066.26526, -1741.72693, 18.69240,   90.00000, 0.00000, 0.00000);
	Chao[9]= CreateObject(18766, 1066.26868, -1739.46057, 18.69200,   90.00000, 0.00000, 0.00000);
	Chao[10]= CreateObject(18766, 1071.31531, -1746.72595, 18.69200,   90.00000, 0.00000, 0.00000);
	Chao[11]= CreateObject(18766, 1071.30884, -1739.46667, 18.69290,   90.00000, 0.00000, 0.00000);
	Chao[12]= CreateObject(18766, 1063.79321, -1771.04102, 18.69240,   90.00000, 0.00000, 90.00000);
	Chao[13]= CreateObject(18766, 1068.75916, -1771.04968, 18.69240,   90.00000, 0.00000, 90.00000);
	Chao[14]= CreateObject(18766, 1073.74023, -1771.02637, 18.69240,   90.00000, 0.00000, 90.00000);
	Chao[15]= CreateObject(18766, 1073.80017, -1771.02637, 18.69200,   90.00000, 0.00000, 90.00000);
	Chao[16]= CreateObject(18766, 1071.33386, -1742.52991, 18.69100,   90.00000, 0.00000, 0.00000);
	for(new i = 0; i != 17; i++) SetObjectMaterial(Chao[i],0, 11301, "carshow_sfse", "ws_carpark2", 0xFF4F4F4F);
	CreateObject(1232, 1102.08081, -1736.37744, 12.85488,   0.00000, 0.00000, 0.00000);
	CreateObject(1232, 1102.21667, -1746.81018, 12.85488,   0.00000, 0.00000, 0.00000);
	new J0[28];
	J0[0]= CreateObject(19433, 1075.52124, -1736.90356, 15.01585,   0.00000, 0.00000, 90.00000);
	J0[1]= CreateObject(19433, 1074.55957, -1736.92041, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[2]= CreateObject(19433, 1075.52124, -1736.92358, 15.92590,   0.00000, 0.00000, 90.00000);
	J0[3]= CreateObject(19433, 1071.07776, -1736.94104, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[4]= CreateObject(19433, 1067.61755, -1736.93665, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[5]= CreateObject(19433, 1064.13159, -1736.93665, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[6]= CreateObject(19433, 1063.01917, -1736.94409, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[7]= CreateObject(19433, 1061.34705, -1738.62170, 18.37620,   90.00000, 0.00000, 0.00000);
	J0[8]= CreateObject(19433, 1061.34705, -1742.10107, 18.37620,   90.00000, 0.00000, 0.00000);
	J0[9]= CreateObject(19433, 1061.34705, -1745.57080, 18.37620,   90.00000, 0.00000, 0.00000);
	J0[10]= CreateObject(19433, 1061.32715, -1747.46924, 18.37620,   90.00000, 0.00000, 0.00000);
	J0[11]= CreateObject(19433, 1061.33289, -1766.96741, 12.35950,   0.00000, 0.00000, 0.00000);
	J0[12]= CreateObject(19433, 1061.33362, -1737.66467, 15.84690,   0.00000, 0.00000, 0.00000);
	J0[13]= CreateObject(19433, 1062.97644, -1775.96790, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[14]= CreateObject(19433, 1066.47498, -1775.96790, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[15]= CreateObject(19433, 1069.96106, -1775.96790, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[16]= CreateObject(19433, 1073.45496, -1775.96790, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[17]= CreateObject(19433, 1061.33362, -1737.66467, 12.35570,   0.00000, 0.00000, 0.00000);
	J0[18]= CreateObject(19433, 1062.07996, -1775.95850, 12.35950,   0.00000, 0.00000, 90.00000);
	J0[19]= CreateObject(19433, 1062.07996, -1775.95850, 15.85670,   0.00000, 0.00000, 90.00000);
	J0[20]= CreateObject(19433, 1074.55554, -1775.95642, 18.37620,   90.00000, 0.00000, 90.00000);
	J0[21]= CreateObject(19433, 1076.22168, -1774.32825, 18.37620,   90.00000, 0.00000, 0.00000);
	J0[22]= CreateObject(19452, 1076.20911, -1771.26599, 15.86750,   0.00000, 0.00000, 0.00000);
	J0[23]= CreateObject(19452, 1076.20911, -1771.26599, 12.37200,   0.00000, 0.00000, 0.00000);
	J0[24]= CreateObject(19433, 1061.33289, -1766.96741, 15.84140,   0.00000, 0.00000, 0.00000);
	J0[25]= CreateObject(19433, 1061.34167, -1767.91492, 18.37620,   90.00000, 0.00000, 0.00000);
	J0[26]= CreateObject(19433, 1061.34167, -1771.40320, 18.37620,   90.00000, 0.00000, 0.00000);
	J0[27]= CreateObject(19433, 1061.32166, -1774.30664, 18.37620,   90.00000, 0.00000, 0.00000);
	for(new i = 0; i != 28; i++) SetObjectMaterial(J0[i],0,8839, "vgsecarshow", "sw_wallbrick_06", 0xFFFFFFFF);
	new J1[48];
	J1[0]= CreateObject(19455, 1074.66907, -1738.54468, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[1]= CreateObject(19455, 1069.77576, -1738.56238, 17.49780,   0.00000, 90.00000, 90.00000);
	J1[2]= CreateObject(19455, 1069.77576, -1738.56238, 16.77000,   0.00000, 90.00000, 90.00000);
	J1[3]= CreateObject(19455, 1072.34534, -1738.56995, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[4]= CreateObject(19455, 1070.17419, -1738.56995, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[5]= CreateObject(19455, 1068.17297, -1738.56995, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[7]= CreateObject(19455, 1069.77576, -1738.56238, 13.49910,   0.00000, 90.00000, 90.00000);
	J1[8]= CreateObject(19455, 1066.28394, -1738.56677, 13.49900,   0.00000, 90.00000, 90.00000);
	J1[9]= CreateObject(19455, 1066.24097, -1738.56360, 16.77010,   0.00000, 90.00000, 90.00000);
	J1[10]= CreateObject(19455, 1066.24097, -1738.56360, 17.49610,   0.00000, 90.00000, 90.00000);
	J1[11]= CreateObject(19455, 1066.06799, -1738.56995, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[12]= CreateObject(19455, 1063.91199, -1738.56995, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[13]= CreateObject(19455, 1061.49646, -1738.56348, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[14]= CreateObject(19455, 1061.37598, -1738.55298, 12.77050,   90.00000, 0.00000, 0.00000);
	J1[15]= CreateObject(19455, 1062.99341, -1738.48511, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[18]= CreateObject(19455, 1062.99561, -1743.22620, 13.49900,   0.00000, 90.00000, 0.00000);
	J1[19]= CreateObject(19455, 1062.99561, -1743.22620, 16.77010,   0.00000, 90.00000, 0.00000);
	J1[20]= CreateObject(19455, 1063.00513, -1771.14075, 17.49610,   0.00000, 90.00000, 0.00000);
	J1[21]= CreateObject(19455, 1063.01343, -1740.68506, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[22]= CreateObject(19455, 1063.01343, -1742.68506, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[23]= CreateObject(19455, 1063.01343, -1744.68506, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[24]= CreateObject(19455, 1063.01343, -1746.88599, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[25]= CreateObject(19455, 1062.99561, -1749.16321, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[26]= CreateObject(19455, 1063.00610, -1744.29114, 13.49965,   0.00000, 90.00000, 0.00000);
	J1[27]= CreateObject(19455, 1063.00439, -1744.25122, 16.77820,   0.00000, 90.00000, 0.00000);
	J1[28]= CreateObject(19455, 1063.00439, -1744.25122, 17.49130,   0.00000, 90.00000, 0.00000);
	J1[29]= CreateObject(19455, 1062.99341, -1767.83423, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[30]= CreateObject(19455, 1063.01343, -1770.36719, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[31]= CreateObject(19455, 1063.01343, -1773.06726, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[32]= CreateObject(19455, 1063.01343, -1775.92712, 12.77050,   90.00000, 0.00000, 90.00000);
	J1[33]= CreateObject(19455, 1063.00513, -1771.14075, 16.77010,   0.00000, 90.00000, 0.00000);
	J1[34]= CreateObject(19455, 1063.00513, -1771.14075, 13.47010,   0.00000, 90.00000, 0.00000);
	J1[35]= CreateObject(19455, 1067.62476, -1774.36548, 13.47010,   0.00000, 90.00000, 90.00000);
	J1[36]= CreateObject(19455, 1071.30945, -1774.36548, 13.47060,   0.00000, 90.00000, 90.00000);
	J1[37]= CreateObject(19455, 1067.62476, -1774.36548, 17.48670,   0.00000, 90.00000, 90.00000);
	J1[38]= CreateObject(19455, 1071.46936, -1774.36548, 17.48670,   0.00000, 90.00000, 90.00000);
	J1[39]= CreateObject(19455, 1062.88245, -1774.37305, 12.75050,   90.00000, 0.00000, 0.00000);
	J1[40]= CreateObject(19455, 1076.05408, -1774.34766, 12.75050,   90.00000, 0.00000, 0.00000);
	J1[41]= CreateObject(19455, 1065.24573, -1774.35693, 12.75050,   90.00000, 0.00000, 0.00000);
	J1[42]= CreateObject(19455, 1067.64331, -1774.29395, 16.77010,   0.00000, 90.00000, 90.00000);
	J1[43]= CreateObject(19455, 1071.46936, -1774.29346, 16.77010,   0.00000, 90.00000, 90.00000);
	J1[44]= CreateObject(19455, 1067.92566, -1774.35693, 12.75050,   90.00000, 0.00000, 0.00000);
	J1[45]= CreateObject(19455, 1070.82568, -1774.35693, 12.75050,   90.00000, 0.00000, 0.00000);
	J1[46]= CreateObject(19455, 1073.72571, -1774.35693, 12.75050,   90.00000, 0.00000, 0.00000);
	J1[47]= CreateObject(19455, 1063.01611, -1743.36316, 17.49130,   0.00000, 90.00000, 0.00000);
	for(new i = 0; i != 48; i++) SetObjectMaterial(J1[i],0,2361, "shopping_freezers", "white", 0xFF0A0A0A);
	new Teto[6];
	Teto[0]= CreateObject(18765, 1066.26025, -1754.11475, 19.88742,   0.00000, 0.00000, 0.00000);
	Teto[1]= CreateObject(18765, 1066.27795, -1761.14490, 19.86740,   0.00000, 0.00000, 0.00000);
	Teto[2]= CreateObject(18765, 1076.23816, -1761.12585, 19.86740,   0.00000, 0.00000, 0.00000);
	Teto[3]= CreateObject(18765, 1076.22302, -1754.12671, 19.86700,   0.00000, 0.00000, 0.00000);
	Teto[4]= CreateObject(18765, 1081.27710, -1754.13684, 19.86700,   0.00000, 0.00000, 0.00000);
	Teto[5]= CreateObject(18765, 1081.27954, -1761.10376, 19.86790,   0.00000, 0.00000, 0.00000);
	for(new i = 0; i != 6; i++) SetObjectMaterial(Teto[i],0,3906, "libertyhi5", "wallbrown02_64HV", 0xFF411B00);
	CreateObject(19325, 1061.26746, -1770.94385, 15.50840,   0.00000, 0.00000, 0.00000);
	CreateObject(19325, 1061.27991, -1772.56665, 15.50840,   0.00000, 0.00000, 0.00000);
	CreateObject(19325, 1066.08960, -1776.03455, 15.50840,   0.00000, 0.00000, 90.00000);
	CreateObject(19325, 1072.73010, -1776.03455, 15.50840,   0.00000, 0.00000, 90.00000);
	CreateObject(19325, 1071.41479, -1736.84766, 15.50840,   0.00000, 0.00000, 90.00000);
	CreateObject(19325, 1064.76855, -1736.84766, 15.50840,   0.00000, 0.00000, 90.00000);
	CreateObject(19325, 1061.28613, -1741.89160, 15.50840,   0.00000, 0.00000, 0.00000);
	CreateObject(19325, 1061.26868, -1747.73987, 15.50840,   0.00000, 0.00000, 0.00000);
	CreateObject(19357, 1088.37244, -1774.48364, 11.24410,   0.00000, 0.00000, 0.00000);
	CreateObject(19357, 1091.80212, -1774.48364, 11.24410,   0.00000, 0.00000, 0.00000);
	CreateObject(19357, 1095.64185, -1774.48364, 11.24410,   0.00000, 0.00000, 0.00000);
	CreateObject(19357, 1099.73511, -1774.48364, 11.24410,   0.00000, 0.00000, 0.00000);
	new Branco[10];
	Branco[0]= CreateObject(3578, 1081.12634, -1765.35791, 20.93600,   90.00000, 0.00000, 0.00000);
	Branco[1]= CreateObject(3578, 1070.86328, -1765.36926, 20.93600,   90.00000, 0.00000, 0.00000);
	Branco[2]= CreateObject(3578, 1066.37964, -1765.37012, 20.93600,   90.00000, 0.00000, 0.00000);
	Branco[3]= CreateObject(3578, 1085.51184, -1759.48755, 20.93600,   90.00000, 0.00000, 90.00000);
	Branco[4]= CreateObject(3578, 1085.49695, -1754.67078, 20.93600,   90.00000, 0.00000, 90.00000);
	Branco[5]= CreateObject(3578, 1081.15247, -1749.90405, 20.93600,   90.00000, 0.00000, 180.00000);
	Branco[6]= CreateObject(3578, 1070.86560, -1749.88599, 20.91600,   90.00000, 0.00000, 180.00000);
	Branco[7]= CreateObject(3578, 1066.40259, -1749.88318, 20.91600,   90.00000, 0.00000, 180.00000);
	Branco[8]= CreateObject(3578, 1062.01160, -1755.71155, 20.91600,   90.00000, 0.00000, 270.00000);
	Branco[9]= CreateObject(3578, 1062.01636, -1759.48938, 20.91600,   90.00000, 0.00000, 270.00000);
	for(new i = 0; i != 10; i++) SetObjectMaterial(Branco[i],0,2361, "shopping_freezers", "white", 0xFFFFFFFF);
	new Janela[4];
	Janela[0]= CreateObject(19354, 1095.00732, -1744.30005, 15.67710,   0.00000, 0.00000, 0.00000);
	Janela[1]= CreateObject(19354, 1095.02014, -1741.11243, 15.67710,   0.00000, 0.00000, 0.00000);
	Janela[2]= CreateObject(19354, 1088.33472, -1772.25500, 15.67710,   0.00000, 0.00000, 0.00000);
	Janela[3]= CreateObject(19354, 1088.27820, -1769.07605, 15.67710,   0.00000, 0.00000, 0.00000);
	for(new i = 0; i != 4; i++) SetObjectMaterial(Janela[i],0,8391, "ballys01", "vgncorpdoor1_512", 0);
	*/
	
	// --> Tuning

	new TuningShop[78];
	TuningShop[0] = CreateDynamicObject(11317, 1573.328979, -2164.786376, 17.798563, 0.000080, 0.000000, 89.999717, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[0], 2, 18901, "matclothes", "beretred", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 3, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 4, 18646, "matcolours", "red-3", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 5, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 6, 18646, "matcolours", "grey", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 7, 18646, "matcolours", "grey-90-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 8, 18646, "matcolours", "grey-20-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 9, 18646, "matcolours", "grey-60-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 10, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 11, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 12, 10850, "bakerybit2_sfse", "GB_truckdepot29", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[0], 13, 18646, "matcolours", "grey-93-percent", 0x00000000);
	TuningShop[1] = CreateDynamicObject(19912, 1587.999755, -2157.860839, 13.866855, 0.000000, 0.000073, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[1], 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[1], 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[1], 2, 19297, "matlights", "invisible", 0x00000000);
	TuningShop[2] = CreateDynamicObject(19912, 1557.039062, -2184.041259, 13.866854, 0.000000, 0.000072, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[2], 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[2], 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[2], 2, 19297, "matlights", "invisible", 0x00000000);
	TuningShop[3] = CreateDynamicObject(19912, 1574.899414, -2184.041259, 13.866854, 0.000000, 0.000072, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[3], 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[3], 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[3], 2, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[3], 7, 10765, "airportgnd_sfse", "crackedgroundb", 0x00000000);
	TuningShop[4] = CreateDynamicObject(19912, 1602.577026, -2170.591064, 13.866847, -0.000050, 0.000022, -89.999839, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[4], 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[4], 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[4], 2, 19297, "matlights", "invisible", 0x00000000);
	TuningShop[5] = CreateDynamicObject(19912, 1601.189331, -2157.860839, 13.866855, 0.000000, 0.000073, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[5], 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[5], 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[5], 2, 19297, "matlights", "invisible", 0x00000000);
	TuningShop[6] = CreateDynamicObject(19912, 1602.577026, -2183.551269, 13.866847, -0.000050, 0.000022, -89.999839, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[6], 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[6], 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[6], 2, 19297, "matlights", "invisible", 0x00000000);
	TuningShop[7] = CreateDynamicObject(19912, 1560.148803, -2184.041259, 16.796861, 0.000000, -89.999923, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[7], 0, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[7], 1, 19325, "lsmall_shops", "lsmall_window01", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[7], 2, 19297, "matlights", "invisible", 0x00000000);
	TuningShop[8] = CreateDynamicObject(18981, 1564.651367, -2170.810546, 12.077868, 0.000000, -89.999946, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[8], 0, 14846, "genintintpoliceb", "p_floor3", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[8], 13, 18901, "matclothes", "bowlerblue", 0x00000000);
	TuningShop[9] = CreateDynamicObject(18981, 1589.650512, -2170.810546, 12.077868, 0.000000, -89.999946, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[9], 0, 14846, "genintintpoliceb", "p_floor3", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[9], 13, 18901, "matclothes", "bowlerblue", 0x00000000);
	TuningShop[10] = CreateDynamicObject(18981, 1558.000976, -2170.810546, 12.087864, 0.000000, -89.999946, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[10], 0, 14846, "genintintpoliceb", "p_floor3", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[10], 13, 18901, "matclothes", "bowlerblue", 0x00000000);
	TuningShop[11] = CreateDynamicObject(18980, 1563.644775, -2167.736816, 6.404767, 0.000000, 32.900024, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[11], 0, 18646, "matcolours", "red", 0x00000000);
	TuningShop[12] = CreateDynamicObject(18980, 1545.527099, -2167.736816, 6.382367, 0.000000, 32.900024, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[12], 0, 18646, "matcolours", "red", 0x00000000);
	TuningShop[13] = CreateDynamicObject(2960, 1585.377807, -2166.541748, 13.638527, -0.000022, 90.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[13], 0, 18901, "matclothes", "beretred", 0x00000000);
	TuningShop[14] = CreateDynamicObject(9191, 1588.533081, -2184.339355, 25.316907, 0.000022, -90.000000, 89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[14], 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterialText(TuningShop[14], 0, "PIMP MY RIDE", 120, "Ariel", 60, 1, 0xFFCC0000, 0x00000000, 0);
	TuningShop[15] = CreateDynamicObject(9191, 1589.072875, -2188.038818, 25.316907, -0.000022, -90.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[15], 1, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterialText(TuningShop[15], 0, "PIMP MY RIDE", 120, "Ariel", 60, 1, 0xFFCC0000, 0x00000000, 0);
	TuningShop[16] = CreateDynamicObject(2960, 1579.377807, -2166.541748, 13.638527, -0.000022, 90.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[16], 0, 18901, "matclothes", "beretred", 0x00000000);
	TuningShop[17] = CreateDynamicObject(939, 1588.859497, -2163.502197, 15.017869, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[17], 0, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[17], 1, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[17], 3, 18901, "matclothes", "beretred", 0x00000000);
	TuningShop[18] = CreateDynamicObject(939, 1588.859497, -2170.451904, 15.017869, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[18], 0, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[18], 1, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[18], 2, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[18], 3, 18901, "matclothes", "beretred", 0x00000000);
	TuningShop[19] = CreateDynamicObject(18980, 1544.302490, -2143.127929, 4.653812, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[19], 0, 18646, "matcolours", "grey-80-percent", 0x00000000);
	TuningShop[20] = CreateDynamicObject(939, 1575.299804, -2170.451904, 15.017869, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[20], 0, 18646, "matcolours", "grey-40-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[20], 1, 18646, "matcolours", "grey-93-percent", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[20], 2, 19297, "matlights", "invisible", 0x00000000);
	SetDynamicObjectMaterial(TuningShop[20], 3, 18901, "matclothes", "beretred", 0x00000000);
	TuningShop[21] = CreateDynamicObject(19903, 1586.346435, -2161.694091, 12.557873, 0.000000, 0.000000, -141.700027, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[21], 1, 18646, "matcolours", "red", 0x00000000);
	TuningShop[22] = CreateDynamicObject(19903, 1596.203735, -2159.799072, 12.557873, 0.000000, 0.000000, -92.000038, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[22], 1, 18646, "matcolours", "red", 0x00000000);
	TuningShop[23] = CreateDynamicObject(19872, 1582.292480, -2166.462646, 10.737878, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[23], 0, 2669, "cj_chris", "cj_metalplate2", 0x00000000);
	TuningShop[24] = CreateDynamicObject(14724, 1581.750244, -2164.218261, 9.737870, 0.000000, 0.000000, -25.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[24], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[25] = CreateDynamicObject(14724, 1585.477172, -2163.109863, 9.737870, 0.000000, 0.000000, -25.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[25], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[26] = CreateDynamicObject(14724, 1579.236816, -2163.156005, 9.737870, 0.000000, 0.000000, 25.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[26], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[27] = CreateDynamicObject(14724, 1582.950073, -2164.260742, 9.737870, 0.000000, 0.000000, 25.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[27], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[28] = CreateDynamicObject(2960, 1598.858276, -2166.541748, 13.638526, -0.000029, 90.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[28], 0, 18901, "matclothes", "beretred", 0x00000000);
	TuningShop[29] = CreateDynamicObject(2960, 1592.858276, -2166.541748, 13.638526, -0.000029, 90.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[29], 0, 18901, "matclothes", "beretred", 0x00000000);
	TuningShop[31] = CreateDynamicObject(14724, 1595.230712, -2164.218261, 9.737870, -0.000003, 0.000006, -24.999996, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[31], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[32] = CreateDynamicObject(14724, 1598.957641, -2163.109863, 9.737870, -0.000003, 0.000006, -24.999996, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[32], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[33] = CreateDynamicObject(14724, 1592.717285, -2163.156005, 9.737870, 0.000003, 0.000006, 24.999996, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[33], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[34] = CreateDynamicObject(14724, 1596.430541, -2164.260742, 9.737870, 0.000003, 0.000006, 24.999996, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(TuningShop[34], 0, 2627, "genintint_gym", "bench_test2b", 0x00000000);
	TuningShop[35] = CreateDynamicObject(1175, 1574.848754, -2168.370849, 12.997873, 90.000000, -62.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
	TuningShop[36] = CreateDynamicObject(1157, 1588.400268, -2170.585693, 13.386030, -0.000022, 0.000004, -74.999992, -1, -1, -1, 300.00, 300.00);
	TuningShop[37] = CreateDynamicObject(1893, 1595.668945, -2164.022949, 16.827844, -0.000029, 0.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	TuningShop[38] = CreateDynamicObject(1893, 1582.270263, -2164.022949, 16.827844, -0.000029, 0.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	TuningShop[39] = CreateDynamicObject(1893, 1582.270263, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	TuningShop[40] = CreateDynamicObject(1074, 1552.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[41] = CreateDynamicObject(1097, 1554.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[42] = CreateDynamicObject(1075, 1553.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[43] = CreateDynamicObject(1080, 1555.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[44] = CreateDynamicObject(1073, 1551.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[45] = CreateDynamicObject(1082, 1557.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[46] = CreateDynamicObject(1085, 1559.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[47] = CreateDynamicObject(1098, 1561.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[48] = CreateDynamicObject(1079, 1556.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[49] = CreateDynamicObject(1096, 1558.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[50] = CreateDynamicObject(1081, 1560.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[51] = CreateDynamicObject(1076, 1562.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[52] = CreateDynamicObject(1078, 1563.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[53] = CreateDynamicObject(1084, 1565.915161, -2167.745361, 13.637863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[54] = CreateDynamicObject(1083, 1564.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[55] = CreateDynamicObject(1077, 1566.915161, -2167.745361, 14.817863, -0.000022, 0.000000, -89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[56] = CreateDynamicObject(1893, 1595.668945, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	TuningShop[57] = CreateDynamicObject(1893, 1569.419433, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	TuningShop[58] = CreateDynamicObject(1893, 1561.419433, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	TuningShop[59] = CreateDynamicObject(1893, 1553.419433, -2174.693603, 16.827844, -0.000029, 0.000000, -89.999908, -1, -1, -1, 300.00, 300.00);
	TuningShop[60] = CreateDynamicObject(19899, 1600.539794, -2172.298583, 12.578522, 0.000000, 0.000029, 179.999893, -1, -1, -1, 300.00, 300.00);
	TuningShop[61] = CreateDynamicObject(19815, 1601.011474, -2175.325683, 14.578530, 0.000029, 0.000000, -90.000061, -1, -1, -1, 300.00, 300.00);
	TuningShop[62] = CreateDynamicObject(19379, 1469.399414, -1754.000000, 3284.199951, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	TuningShop[63] = CreateDynamicObject(19899, 1600.539794, -2175.329101, 13.838519, 0.000000, 179.999984, -0.000167, -1, -1, -1, 300.00, 300.00);
	TuningShop[64] = CreateDynamicObject(1010, 1576.965698, -2162.554443, 13.827869, -0.000018, 0.000011, -60.899967, -1, -1, -1, 300.00, 300.00);
	TuningShop[65] = CreateDynamicObject(1073, 1590.047729, -2173.117675, 13.047862, -0.000012, 0.000018, -36.999988, -1, -1, -1, 300.00, 300.00);
	TuningShop[66] = CreateDynamicObject(19379, 1479.000000, -1754.000000, 3284.199951, 0.000000, 90.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	TuningShop[67] = CreateDynamicObject(19899, 1592.691528, -2160.069091, 13.838519, 0.000014, 179.999984, 107.399948, -1, -1, -1, 300.00, 300.00);
	TuningShop[68] = CreateDynamicObject(1536, 1475.699951, -1748.863037, 3284.300048, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	TuningShop[69] = CreateDynamicObject(1536, 1472.699218, -1748.899414, 3284.300048, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	TuningShop[70] = CreateDynamicObject(19899, 1577.051147, -2165.296630, 12.578522, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
	TuningShop[71] = CreateDynamicObject(19815, 1576.579467, -2162.269531, 14.578530, 0.000022, 0.000000, 89.999931, -1, -1, -1, 300.00, 300.00);
	TuningShop[72] = CreateDynamicObject(19899, 1577.051147, -2162.266113, 13.838519, 0.000000, 179.999984, 179.999893, -1, -1, -1, 300.00, 300.00);
	TuningShop[73] = CreateDynamicObject(19900, 1586.062988, -2169.098144, 12.547871, 0.000000, 0.000000, -26.200000, -1, -1, -1, 300.00, 300.00);
	TuningShop[74] = CreateDynamicObject(19921, 1575.802124, -2168.976318, 14.647878, 0.000000, 0.000000, 33.100002, -1, -1, -1, 300.00, 300.00);
	TuningShop[75] = CreateDynamicObject(19917, 1575.411621, -2172.258544, 12.867877, 0.000000, 0.000000, -42.400012, -1, -1, -1, 300.00, 300.00);
	TuningShop[76] = CreateDynamicObject(1148, 1588.118652, -2168.476318, 13.417879, 0.000000, 0.000000, 126.099975, -1, -1, -1, 300.00, 300.00);
	TuningShop[77] = CreateDynamicObject(1014, 1588.815063, -2171.586914, 14.537877, 0.000000, 0.000000, -41.700004, -1, -1, -1, 300.00, 300.00);

	// --> Party

	CreateDynamicObject(3115,257.8476562,-1894.0947266,2.7000000,0.0000000,0.0000000,179.9945068); //object(carrier_lift1_sfse) (2)
	CreateDynamicObject(3115,257.8427124,-1903.3947754,10.0000000,90.0000000,270.4943848,269.4896240); //object(carrier_lift1_sfse) (7)
	CreateDynamicObject(14820,261.5658264,-1886.0299072,3.9067500,0.0000000,0.0000000,0.0000000); //object(dj_stuff) (2)
	CreateDynamicObject(2232,286.7681885,-1884.9331055,3.5923858,0.0000000,270.0000000,180.0000000); //object(med_speaker_4) (2)
	CreateDynamicObject(3872,251.1220703,-1879.3632812,13.0000000,0.0000000,0.0000000,249.9884033); //object(ws_floodbeams) (2)
	CreateDynamicObject(2670,269.4973450,-1891.9808350,3.1276269,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (25)
	CreateDynamicObject(14628,268.0768127,-1901.9171143,13.0000000,0.0000000,359.7500000,0.0000000); //object(ab_caligulasfront) (2)
	CreateDynamicObject(1665,237.0996094,-1811.8994141,3.3000000,0.0000000,0.0000000,0.0000000); //object(propashtray1) (7)
	CreateDynamicObject(354,284.5086365,-1903.0936279,13.9025154,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(18783,277.6494141,-1894.9628906,0.0000000,0.0000000,0.0000000,0.0000000); //object(funboxtop1) (1)
	CreateDynamicObject(18783,257.6861572,-1894.9643555,0.0000000,0.0000000,0.0000000,0.0000000); //object(funboxtop1) (2)
	CreateDynamicObject(3115,278.9150391,-1894.1064453,2.7000000,0.0000000,0.0000000,0.0000000); //object(carrier_lift1_sfse) (2)
	CreateDynamicObject(3115,278.9520264,-1903.4160156,10.0000000,270.0000000,270.0000000,270.0000000); //object(carrier_lift1_sfse) (7)
	CreateDynamicObject(3115,278.9150391,-1894.1064453,18.0000000,0.0000000,0.0000000,0.0000000); //object(carrier_lift1_sfse) (2)
	CreateDynamicObject(3115,257.8476562,-1894.0947266,18.0000000,0.0000000,0.0000000,180.0000000); //object(carrier_lift1_sfse) (2)
	CreateDynamicObject(19129,269.1191406,-1862.2841797,2.5625000,0.0000000,0.0000000,0.0000000); //object(dancefloor2) (1)
	CreateDynamicObject(18783,269.1008301,-1862.2655029,0.0000000,0.0000000,0.0000000,0.0000000); //object(funboxtop1) (5)
	CreateDynamicObject(2784,263.6203613,-1885.8977051,4.3000002,0.0000000,0.0000000,0.0000000); //object(ab_slottable6) (2)
	CreateDynamicObject(2784,272.2402344,-1885.8564453,4.3000002,0.0000000,0.0000000,0.0000000); //object(ab_slottable6) (3)
	CreateDynamicObject(16092,288.5266724,-1892.3060303,9.6000004,0.0000000,0.0000000,180.0000000); //object(des_pipestrut05) (1)
	CreateDynamicObject(16092,288.5263672,-1892.3056641,9.6000004,0.0000000,179.9945068,179.9945068); //object(des_pipestrut05) (2)
	CreateDynamicObject(16092,248.2587891,-1892.3525391,9.6000004,0.0000000,179.9945068,179.9945068); //object(des_pipestrut05) (3)
	CreateDynamicObject(16092,248.2587891,-1892.3525391,9.6000004,0.0000000,0.0000000,179.9945068); //object(des_pipestrut05) (4)
	CreateDynamicObject(16092,281.7918396,-1893.0469971,17.0000000,0.0000000,90.0000000,89.9998169); //object(des_pipestrut05) (7)
	CreateDynamicObject(16092,255.0241241,-1893.0881348,17.0000000,0.0000000,90.0000000,89.9998169); //object(des_pipestrut05) (8)
	CreateDynamicObject(16092,268.3115234,-1893.0590820,17.0000000,0.0000000,90.0000000,89.9999390); //object(des_pipestrut05) (9)
	CreateDynamicObject(16092,268.3115234,-1893.0585938,17.0000000,0.0000000,90.0000000,270.0000000); //object(des_pipestrut05) (10)
	CreateDynamicObject(16092,281.7910156,-1893.0468750,17.0000000,0.0000000,90.0000000,270.0000000); //object(des_pipestrut05) (11)
	CreateDynamicObject(16092,255.0234375,-1893.0878906,17.0000000,0.0000000,90.0000000,270.0000000); //object(des_pipestrut05) (12)
	CreateDynamicObject(2232,285.6172485,-1884.9288330,3.5923858,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,284.5674133,-1884.9351807,3.5923858,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,283.4701843,-1893.7293701,5.1999998,0.0000000,0.0000000,183.9999847); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,282.3144531,-1884.9277344,3.5923858,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,281.1858826,-1884.9212646,3.5923858,0.0000000,270.0000000,181.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,280.0877075,-1884.9191895,3.5923858,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,278.9121094,-1884.9069824,3.5923858,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,277.7837830,-1884.9056396,3.5923858,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,259.1630859,-1885.1259766,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(14820,266.0805664,-1886.0277100,3.9067500,0.0000000,0.0000000,0.0000000); //object(dj_stuff) (2)
	CreateDynamicObject(14820,270.2218323,-1885.9282227,3.9067500,0.0000000,0.0000000,0.0000000); //object(dj_stuff) (2)
	CreateDynamicObject(14820,274.4186707,-1885.9824219,3.9067500,0.0000000,0.0000000,0.0000000); //object(dj_stuff) (2)
	CreateDynamicObject(19279,288.7721863,-1884.8116455,3.2325923,0.0000000,0.0000000,0.0000000); //object(lcsmalllight1) (1)
	CreateDynamicObject(19279,248.5025940,-1884.8586426,3.3211756,0.0000000,0.0000000,0.0000000); //object(lcsmalllight1) (2)
	CreateDynamicObject(19279,281.1663513,-1884.8360596,16.7383232,0.0000000,0.0000000,0.0000000); //object(lcsmalllight1) (3)
	CreateDynamicObject(19279,274.7282715,-1884.8360596,16.9618263,0.0000000,0.0000000,0.0000000); //object(lcsmalllight1) (4)
	CreateDynamicObject(19279,268.4616089,-1884.8481445,16.9624557,0.0000000,0.0000000,0.0000000); //object(lcsmalllight1) (5)
	CreateDynamicObject(19279,261.0177002,-1884.8481445,17.0066833,0.0000000,0.0000000,0.0000000); //object(lcsmalllight1) (6)
	CreateDynamicObject(19279,253.5187836,-1884.8771973,17.0021629,0.0000000,0.0000000,0.0000000); //object(lcsmalllight1) (7)
	CreateDynamicObject(18654,259.3544922,-1872.0556641,2.6328127,0.0000000,0.0000000,239.9963379); //object(discolightgreen) (1)
	CreateDynamicObject(18653,259.4819946,-1852.4687500,2.6328123,0.0000000,0.0000000,119.9963379); //object(discolightred) (1)
	CreateDynamicObject(19422,271.6852417,-1885.9998779,3.8330667,0.0000000,0.0000000,0.0000000); //object(headphones02) (1)
	CreateDynamicObject(19422,272.9682312,-1886.0177002,3.8330667,0.0000000,0.0000000,302.7500000); //object(headphones02) (2)
	CreateDynamicObject(19158,269.1347656,-1862.1025391,5.0000000,0.0000000,179.9945068,0.0000000); //object(metallightbars2) (1)
	CreateDynamicObject(19158,269.1347656,-1862.1025391,4.0000000,0.0000000,0.0000000,0.0000000); //object(metallightbars2) (3)
	CreateDynamicObject(18655,279.0107422,-1871.7812500,2.6328125,0.0000000,0.0000000,319.9932861); //object(discolightblue) (2)
	CreateDynamicObject(18655,278.9713440,-1852.4824219,2.6328125,0.0000000,0.0000000,57.9932861); //object(discolightblue) (1)
	CreateDynamicObject(3872,286.6220703,-1879.2109375,13.0000000,0.0000000,0.0000000,284.7326660); //object(ws_floodbeams) (2)
	CreateDynamicObject(19156,286.7972107,-1884.5900879,3.3298018,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (1)
	CreateDynamicObject(19156,285.0532532,-1884.6855469,3.3347898,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (2)
	CreateDynamicObject(19156,278.8823242,-1884.5611572,3.3495588,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (5)
	CreateDynamicObject(19156,277.2705078,-1884.6074219,3.3537488,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (6)
	CreateDynamicObject(19155,286.1891174,-1884.5656738,3.3317926,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (1)
	CreateDynamicObject(19155,284.5144043,-1884.6717529,3.3359993,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (2)
	CreateDynamicObject(19155,282.3081360,-1884.6851807,3.3414521,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (3)
	CreateDynamicObject(19155,280.0339966,-1884.6701660,3.3467741,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (4)
	CreateDynamicObject(19155,276.6171875,-1884.6025391,3.3552320,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (6)
	CreateDynamicObject(19154,284.0268860,-1884.6430664,3.3371325,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (2)
	CreateDynamicObject(19154,281.7762756,-1884.6905518,3.3427932,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (3)
	CreateDynamicObject(19154,279.4676208,-1884.6326904,3.3483214,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (4)
	CreateDynamicObject(19154,277.8339844,-1884.6152344,3.3522630,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (5)
	CreateDynamicObject(19153,283.4646606,-1884.6577148,3.3386953,0.0000000,0.0000000,0.0000000); //object(pinspotlight11) (1)
	CreateDynamicObject(19153,281.1653748,-1884.6992188,3.3443043,0.0000000,0.0000000,0.0000000); //object(pinspotlight11) (2)
	CreateDynamicObject(2232,276.6992188,-1884.9052734,3.5923858,0.0000000,90.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,257.9843750,-1885.1298828,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,256.8373413,-1885.1253662,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,255.6858215,-1885.1362305,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,254.5595703,-1885.1494141,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,253.4090881,-1885.1407471,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,252.2763672,-1885.1435547,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,251.1467133,-1885.1544189,3.4000001,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,249.9632263,-1885.1463623,3.4000001,0.0000000,90.0000000,180.0000000); //object(med_speaker_4) (2)
	CreateDynamicObject(19155,259.1787415,-1884.7330322,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (6)
	CreateDynamicObject(19155,256.9037781,-1884.7139893,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (6)
	CreateDynamicObject(19155,254.5779419,-1884.7204590,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (6)
	CreateDynamicObject(19155,252.3268127,-1884.7258301,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (6)
	CreateDynamicObject(19155,249.9257965,-1884.7312012,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight13) (6)
	CreateDynamicObject(19156,258.5664368,-1884.7016602,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (6)
	CreateDynamicObject(19156,256.2877197,-1884.7105713,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (6)
	CreateDynamicObject(19156,253.9816895,-1884.6953125,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (6)
	CreateDynamicObject(19156,251.7523804,-1884.7011719,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (6)
	CreateDynamicObject(19156,249.4232178,-1884.7132568,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight14) (6)
	CreateDynamicObject(19154,258.0030518,-1884.7119141,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (5)
	CreateDynamicObject(19154,255.7283020,-1884.7326660,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (5)
	CreateDynamicObject(19154,253.3779144,-1884.7303467,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (5)
	CreateDynamicObject(19154,251.1768646,-1884.6984863,3.2000000,0.0000000,0.0000000,0.0000000); //object(pinspotlight12) (5)
	CreateDynamicObject(8614,290.2692871,-1888.9444580,1.8000000,0.0000000,0.0000000,92.0000000); //object(vgssstairs01_lvs) (1)
	CreateDynamicObject(2780,288.8747559,-1884.2175293,0.9441433,0.0000000,0.0000000,0.0000000); //object(cj_smoke_mach) (1)
	CreateDynamicObject(2693,267.9316101,-1885.4677734,3.7457037,0.0000000,0.0000000,180.0000000); //object(cj_banner11) (1)
	CreateDynamicObject(16092,248.2608185,-1877.3552246,1.9354343,0.0000000,0.0000000,179.9945068); //object(des_pipestrut05) (3)
	CreateDynamicObject(16092,288.5289612,-1877.3183594,2.8332205,0.0000000,0.0000000,179.9945068); //object(des_pipestrut05) (3)
	CreateDynamicObject(16092,248.2887726,-1847.2684326,1.9354343,0.0000000,0.0000000,179.9945068); //object(des_pipestrut05) (3)
	CreateDynamicObject(7306,247.9964600,-1862.6761475,11.5342445,0.0000000,0.0000000,314.7500000); //object(vgnmallsigns04) (1)
	CreateDynamicObject(7306,248.5478516,-1862.7255859,11.5342445,0.0000000,0.0000000,134.7473145); //object(vgnmallsigns04) (2)
	CreateDynamicObject(16092,248.2724609,-1862.4072266,1.9354343,0.0000000,0.0000000,179.9945068); //object(des_pipestrut05) (3)
	CreateDynamicObject(16092,288.5434875,-1862.2897949,2.8332205,0.0000000,0.0000000,179.9945068); //object(des_pipestrut05) (3)
	CreateDynamicObject(16092,288.5554504,-1847.2854004,2.8332205,0.0000000,0.0000000,179.9945068); //object(des_pipestrut05) (3)
	CreateDynamicObject(7305,288.2840271,-1862.7454834,12.4320307,0.0000000,0.0000000,315.0000000); //object(vgnmallsigns03) (2)
	CreateDynamicObject(7305,288.8080750,-1862.7502441,12.4320307,0.0000000,0.0000000,134.9945068); //object(vgnmallsigns03) (3)
	CreateDynamicObject(7906,280.9408875,-1885.1611328,21.3999996,0.0000000,0.0000000,180.0000000); //object(vgwestbillbrd07) (1)
	CreateDynamicObject(7909,255.9059753,-1885.2907715,21.3999996,0.0000000,0.0000000,179.9945068); //object(vgwestbillbrd10) (1)
	CreateDynamicObject(1237,288.4361572,-1842.9450684,2.5192356,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (1)
	CreateDynamicObject(1237,288.2970276,-1845.2065430,2.4555702,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (2)
	CreateDynamicObject(1237,288.2562561,-1847.4338379,2.3846750,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (3)
	CreateDynamicObject(1237,288.3243103,-1849.6444092,2.3165617,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (4)
	CreateDynamicObject(1237,288.2864685,-1851.9097900,2.2462726,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (5)
	CreateDynamicObject(1237,288.5119324,-1857.5701904,2.0685296,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (6)
	CreateDynamicObject(1237,288.5112000,-1859.6422119,2.0053959,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (7)
	CreateDynamicObject(1237,288.4358826,-1861.8574219,1.9434524,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (8)
	CreateDynamicObject(1237,288.3295288,-1864.2324219,1.8856368,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (9)
	CreateDynamicObject(1237,288.3259888,-1866.6470947,1.8303289,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (10)
	CreateDynamicObject(1237,248.4698792,-1845.3541260,2.3465776,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (11)
	CreateDynamicObject(1237,248.3724060,-1842.7885742,2.4104023,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (12)
	CreateDynamicObject(1237,248.4668579,-1847.6788330,2.2956743,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (13)
	CreateDynamicObject(1237,248.3499756,-1849.9833984,2.2473235,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (14)
	CreateDynamicObject(1237,248.2767639,-1852.4252930,2.1659234,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (15)
	CreateDynamicObject(1237,248.2281799,-1857.9233398,2.0233016,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (16)
	CreateDynamicObject(1237,248.1907806,-1860.3793945,1.9397240,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (17)
	CreateDynamicObject(1237,248.1964722,-1862.8161621,1.8912785,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (18)
	CreateDynamicObject(1237,248.2123413,-1864.8231201,1.8625066,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (19)
	CreateDynamicObject(1237,248.1857758,-1866.9986572,1.6427429,0.0000000,0.0000000,0.0000000); //object(strtbarrier01) (20)
	CreateDynamicObject(3578,280.4770508,-1840.4506836,3.3351078,0.0000000,0.0000000,0.0000000); //object(dockbarr1_la) (1)
	CreateDynamicObject(3578,267.3764648,-1840.4418945,3.2809405,0.0000000,0.0000000,0.0000000); //object(dockbarr1_la) (2)
	CreateDynamicObject(3578,254.5479126,-1840.4517822,3.2453451,0.0000000,0.0000000,0.0000000); //object(dockbarr1_la) (3)
	CreateDynamicObject(619,250.6118622,-1843.1411133,2.3969002,0.0000000,0.0000000,118.0000000); //object(veg_palwee03) (2)
	CreateDynamicObject(18102,272.1347656,-1869.5439453,7.8000002,0.0000000,0.0000000,0.0000000); //object(light_box1) (3)
	CreateDynamicObject(18102,272.1907654,-1859.3063965,7.8000002,0.0000000,0.0000000,0.0000000); //object(light_box1) (4)
	CreateDynamicObject(2101,264.6036377,-1886.0762939,3.7999310,0.0000000,0.0000000,0.0000000); //object(med_hi_fi_3) (1)
	CreateDynamicObject(2101,262.9031372,-1886.0397949,3.7999310,0.0000000,0.0000000,0.0000000); //object(med_hi_fi_3) (2)
	CreateDynamicObject(2101,268.8913574,-1885.9467773,3.7999310,0.0000000,0.0000000,0.0000000); //object(med_hi_fi_3) (3)
	CreateDynamicObject(2101,275.7206726,-1886.0549316,3.7999310,0.0000000,0.0000000,0.0000000); //object(med_hi_fi_3) (4)
	CreateDynamicObject(1723,275.6054077,-1889.1693115,3.0267987,0.0000000,0.0000000,190.2500458); //object(mrk_seating1) (1)
	CreateDynamicObject(1723,271.1054382,-1889.3775635,3.0267987,0.0000000,0.0000000,162.2447510); //object(mrk_seating1) (2)
	CreateDynamicObject(1723,266.6524353,-1889.4245605,3.0340765,0.0000000,0.0000000,209.5000000); //object(mrk_seating1) (4)
	CreateDynamicObject(1723,262.5093079,-1890.3081055,3.0239594,0.0000000,0.0000000,157.4982910); //object(mrk_seating1) (5)
	CreateDynamicObject(2232,283.4375000,-1884.9277344,3.5923858,0.0000000,270.0000000,179.9945068); //object(med_speaker_4) (2)
	CreateDynamicObject(2232,252.5879669,-1893.7536621,5.1999998,0.0000000,0.0000000,183.9990234); //object(med_speaker_4) (2)
	CreateDynamicObject(354,268.5127563,-1903.0780029,15.2399282,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,275.3677368,-1903.0947266,6.3912230,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,261.7633667,-1903.0734863,6.5520468,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,252.6567230,-1903.0882568,13.0659189,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,280.9692993,-1884.8358154,16.6342602,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,268.3365479,-1884.8476562,16.7284889,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,253.3164673,-1884.8768311,17.1282749,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,287.7873230,-1869.8264160,7.3355393,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(354,249.0115204,-1870.0029297,5.9413323,0.0000000,0.0000000,0.0000000); //object(34)
	CreateDynamicObject(2780,247.8668213,-1883.4860840,0.3088379,0.0000000,0.0000000,0.0000000); //object(cj_smoke_mach) (2)
	CreateDynamicObject(19146,267.9747620,-1885.1524658,4.6721492,0.0000000,0.0000000,0.0000000); //object(pinspotlight4) (1)
	CreateDynamicObject(19319,272.2789917,-1885.3551025,5.3965306,0.0000000,0.0000000,168.0000000); //object(warlock01) (1)
	CreateDynamicObject(19319,263.5813293,-1885.3961182,5.4988565,0.0000000,0.0000000,167.9974365); //object(warlock01) (2)
	CreateDynamicObject(19294,275.5971069,-1840.5421143,4.1413579,0.0000000,0.0000000,0.0000000); //object(pointlight14) (1)
	CreateDynamicObject(19294,272.4184875,-1840.3538818,4.0871906,0.0000000,0.0000000,0.0000000); //object(pointlight14) (2)
	CreateDynamicObject(19294,259.4705505,-1840.5955811,4.0515952,0.0000000,0.0000000,0.0000000); //object(pointlight14) (4)
	CreateDynamicObject(19294,262.5101624,-1840.5792236,4.0871906,0.0000000,0.0000000,0.0000000); //object(pointlight14) (5)
	CreateDynamicObject(18761,277.2558899,-1840.2630615,7.7766809,0.0000000,0.0000000,0.0000000); //object(racefinishline1) (2)
	CreateDynamicObject(18761,258.9355774,-1840.3281250,7.7766809,0.0000000,0.0000000,0.0000000); //object(racefinishline1) (3)
	CreateDynamicObject(14809,262.0779419,-1897.0020752,4.4393506,0.0000000,0.0000000,358.0000000); //object(strip2_platforms) (1)
	CreateDynamicObject(14809,273.3254395,-1897.6243896,4.4426689,0.0000000,0.0000000,177.9949951); //object(strip2_platforms) (2)
	CreateDynamicObject(3503,265.3601074,-1893.9739990,4.8035846,0.0000000,0.0000000,0.0000000); //object(vgsnscffple) (1)
	CreateDynamicObject(3503,270.1138306,-1900.6495361,4.8069029,0.0000000,0.0000000,0.0000000); //object(vgsnscffple) (2)
	CreateDynamicObject(3503,276.4130554,-1897.8195801,4.9008894,0.0000000,0.0000000,0.0000000); //object(vgsnscffple) (3)
	CreateDynamicObject(3503,273.0782166,-1893.9083252,4.9008894,0.0000000,0.0000000,0.0000000); //object(vgsnscffple) (4)
	CreateDynamicObject(3503,262.6574402,-1901.1295166,4.9051719,0.0000000,0.0000000,0.0000000); //object(vgsnscffple) (5)
	CreateDynamicObject(3503,258.8195190,-1896.0673828,4.8975711,0.0000000,0.0000000,0.0000000); //object(vgsnscffple) (6)
	CreateDynamicObject(16151,267.0159607,-1841.8721924,2.7000000,0.0000000,0.0000000,89.7500000); //object(ufo_bar) (1)
	CreateDynamicObject(1486,269.1349487,-1842.6142578,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (2)
	CreateDynamicObject(1520,269.5690308,-1842.6705322,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (1)
	CreateDynamicObject(1520,269.5604858,-1842.7901611,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (2)
	CreateDynamicObject(1520,269.5506897,-1842.9218750,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (3)
	CreateDynamicObject(1520,269.5441589,-1843.0556641,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (4)
	CreateDynamicObject(1520,269.7113037,-1842.6726074,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (5)
	CreateDynamicObject(1520,269.7071838,-1842.8051758,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (6)
	CreateDynamicObject(1520,269.6957092,-1842.9313965,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (7)
	CreateDynamicObject(1520,269.6902466,-1843.0593262,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (8)
	CreateDynamicObject(1520,269.8211365,-1843.0604248,3.3054185,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (9)
	CreateDynamicObject(1520,269.8331299,-1842.9346924,3.2938313,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (10)
	CreateDynamicObject(1520,269.8336792,-1842.8078613,3.2982535,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (11)
	CreateDynamicObject(1520,269.8342896,-1842.6713867,3.2876706,0.0000000,0.0000000,0.0000000); //object(dyn_wine_bounce) (12)
	CreateDynamicObject(1486,269.1375122,-1842.6811523,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (8)
	CreateDynamicObject(1486,269.1149902,-1842.8708496,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (9)
	CreateDynamicObject(1486,269.1209412,-1842.9874268,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (10)
	CreateDynamicObject(1486,269.0023499,-1842.9388428,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (11)
	CreateDynamicObject(1486,269.0205078,-1842.8164062,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (12)
	CreateDynamicObject(1486,269.0360718,-1842.6199951,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (13)
	CreateDynamicObject(1486,268.9047241,-1842.6334229,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (14)
	CreateDynamicObject(1486,268.9294434,-1842.8262939,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (15)
	CreateDynamicObject(1486,268.8872986,-1842.9536133,3.4503675,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (16)
	CreateDynamicObject(1541,265.7964478,-1842.3843994,3.5000000,0.0000000,0.0000000,0.0000000); //object(cj_beer_taps_1) (1)
	CreateDynamicObject(1544,268.4729919,-1842.6793213,3.3054185,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (1)
	CreateDynamicObject(1544,268.3066711,-1842.8323975,3.3054185,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (2)
	CreateDynamicObject(1544,268.2554016,-1842.7269287,3.3054185,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (3)
	CreateDynamicObject(1544,268.4274597,-1842.9079590,3.3054185,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (4)
	CreateDynamicObject(1546,266.6164856,-1842.6534424,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (1)
	CreateDynamicObject(1546,266.6241760,-1842.8000488,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (2)
	CreateDynamicObject(1546,266.6410522,-1842.9779053,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (3)
	CreateDynamicObject(1546,266.5112000,-1842.9682617,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (4)
	CreateDynamicObject(1546,266.5008545,-1842.8277588,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (5)
	CreateDynamicObject(1546,266.4911804,-1842.6832275,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (6)
	CreateDynamicObject(1546,266.3699951,-1842.6958008,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (7)
	CreateDynamicObject(1546,266.3661194,-1842.8247070,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (8)
	CreateDynamicObject(1546,266.3906250,-1842.9291992,3.3945475,0.0000000,0.0000000,0.0000000); //object(cj_pint_glass) (9)
	CreateDynamicObject(1547,267.4345093,-1842.7713623,3.3299999,0.0000000,0.0000000,0.0000000); //object(cj_b_pish_t) (1)
	CreateDynamicObject(1582,263.5582581,-1842.0971680,3.7568104,0.0000000,0.0000000,0.0000000); //object(pizzabox) (1)
	CreateDynamicObject(2670,272.1139526,-1897.6085205,3.1212370,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (25)
	CreateDynamicObject(2670,263.5928040,-1897.4512939,3.1186593,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (25)
	CreateDynamicObject(2670,256.3707275,-1889.9848633,3.1156683,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (25)
	CreateDynamicObject(2670,278.9783630,-1890.4088135,3.1044741,0.0000000,0.0000000,0.0000000); //object(proc_rubbish_1) (25)

	//==============================================================================

	// --> City Hall
	CreateDynamicObject(19943, 1489.43091, -1750.24146, 14.43519,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 1483.86853, -1750.18164, 14.43519,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 1478.41394, -1750.12280, 14.43519,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 1473.02502, -1750.31702, 14.43519,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 1467.87439, -1750.48511, 14.43519,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19943, 1494.55420, -1750.52979, 14.43520,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 1491.22009, -1751.49561, 26.03160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 1477.88147, -1751.71423, 26.03160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3920, 1465.17322, -1751.84180, 26.03160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3810, 1469.35510, -1750.47400, 20.68930,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3810, 1474.65015, -1750.30713, 20.68930,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3810, 1479.78870, -1750.06494, 20.68930,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3810, 1484.53516, -1750.15686, 20.68930,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3810, 1490.05640, -1750.19836, 20.68930,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3810, 1494.56396, -1749.46570, 20.68930,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(3810, 1489.41968, -1748.98511, 20.68930,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(3810, 1483.87769, -1748.88831, 20.68930,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(3810, 1478.42432, -1748.62317, 20.68930,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(3810, 1473.04236, -1748.74670, 20.68930,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(3810, 1467.84106, -1748.83704, 20.68930,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(3810, 1471.56396, -1750.30286, 20.68930,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(3810, 1477.07813, -1750.12024, 20.68930,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(3810, 1482.80066, -1750.17773, 20.68930,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(3810, 1488.45703, -1750.26819, 20.68930,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(3810, 1493.42932, -1750.52856, 20.68930,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(640, 1506.23132, -1742.60986, 13.25970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(646, 1509.37512, -1742.48376, 13.92750,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 1501.71802, -1742.63416, 13.20330,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(640, 1497.32751, -1742.63208, 13.25970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1256, 1492.97705, -1742.64197, 13.20330,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(640, 1488.58264, -1742.67981, 13.25970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2745, 1484.69885, -1742.69275, 13.08300,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(2745, 1477.53503, -1742.74609, 13.08300,   0.00000, 0.00000, -180.00000);
	CreateDynamicObject(640, 1474.06824, -1742.62744, 13.25970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1256, 1469.70850, -1742.60400, 13.20330,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(640, 1465.41345, -1742.63501, 13.25970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1256, 1461.00330, -1742.58789, 13.20330,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(640, 1456.70569, -1742.53564, 13.25970,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19604, 1530.98242, -1731.85120, 12.36248,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19604, 1532.99268, -1747.72900, 13.06310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19604, 1533.00525, -1748.99524, 13.06310,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19588, 1533.10022, -1748.36951, 13.08280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2491, 1526.82886, -1746.05383, 11.92680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2491, 1526.84570, -1750.21814, 11.92680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1568, 1526.56189, -1750.45044, 10.80970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1568, 1526.60608, -1746.30908, 10.80970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2491, 1539.72864, -1745.64880, 11.92680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1568, 1539.53821, -1745.92371, 10.80970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2491, 1539.66821, -1750.31470, 11.92680,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1568, 1539.48242, -1750.57080, 10.80970,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(856, 1553.52576, -1758.83301, 12.72080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1553.66602, -1751.89380, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1551.09998, -1747.25232, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1546.45654, -1749.29578, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1543.99438, -1746.97681, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1521.49036, -1749.19421, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1518.40930, -1746.93445, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1513.99744, -1747.35254, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19604, 1430.93750, -1747.60596, 13.05560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19604, 1430.95264, -1748.97021, 13.05560,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19588, 1430.72388, -1748.24780, 13.04313,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1444.53918, -1747.60547, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1441.56921, -1749.36182, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1418.82166, -1749.60303, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1415.35461, -1747.32715, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1410.52673, -1748.31079, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1406.06763, -1753.57434, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1404.60596, -1747.05701, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1406.33606, -1762.44458, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1405.34241, -1759.33472, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 1404.60754, -1757.09119, 13.50350,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2942, 1493.05994, -1772.29700, 18.43400,   0.00000, 0.00000, -179.00000);
	CreateDynamicObject(2942, 1468.96704, -1772.29651, 18.43400,   0.00000, 0.00000, -179.00000);
	CreateDynamicObject(19425, 1505.36707, -1735.60449, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(19425, 1505.30518, -1732.31152, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(19425, 1505.26282, -1729.00623, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(19425, 1455.91772, -1735.60010, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(19425, 1455.85168, -1732.30640, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(19425, 1455.78760, -1729.00732, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(1256, 1509.65125, -1748.38428, 13.22420,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1256, 1451.68066, -1748.25891, 13.20210,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1231, 1495.94958, -1749.23596, 15.94500,   356.85840, 0.00000, 3.14160);
	CreateDynamicObject(1231, 1466.83191, -1749.17676, 15.94500,   356.85840, 0.00000, 3.14160);
	CreateDynamicObject(19425, 1481.23169, -1735.62598, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(19425, 1481.17444, -1732.32214, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(19425, 1481.10876, -1729.01160, 12.38810,   0.00000, 0.00000, 91.00000);
	CreateDynamicObject(1622, 1502.82922, -1749.99023, 22.77500,   0.00000, 0.00000, -62.00000);
	CreateDynamicObject(1622, 1459.44226, -1750.02808, 20.82550,   0.00000, 0.00000, -175.00000);
	CreateDynamicObject(1366, 1506.85974, -1737.67578, 13.16310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1366, 1454.47070, -1737.80615, 13.16310,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1574, 1503.43530, -1749.73669, 12.54368,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1574, 1457.81104, -1750.95740, 12.54112,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1492.14221, -1751.32483, 15.01110,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1486.63708, -1751.32141, 15.01110,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1475.74695, -1751.29810, 15.01110,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1470.20508, -1751.25854, 15.01110,   0.00000, 0.00000, 0.00000);
}
