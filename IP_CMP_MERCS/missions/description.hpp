#define SET_MISSION_META(_stage, _name, _briefingName, _onLoadMission, _overviewText, _loadScreen, _overviewPicture, _briefing, _debriefing, _fixedDate, _fixedWeather, _keepLoadout, _isHub, _tacPad) \
	stage = _stage; \
	name = _name; \
	briefingName = _briefingName; \
	onLoadName = _briefingName; \
	onLoadMission = _onLoadMission; \
	overviewText = _overviewText; \
	loadScreen = _loadScreen; \
	overviewPicture = _overviewPicture; \
	briefing = _briefing; \
	debriefing = _debriefing; \
	fixedDate = _fixedDate; \
	fixedWeather = _fixedWeather; \
	keepLoadout = _keepLoadout; \
	isHub = _isHub; \
	tacPad = _tacPad;

#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\characterTemplates.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\defines.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\factions.hpp"
//#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\functions.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\hints.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\identities.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\insignias.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\mainValues.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\notifications.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\supports.hpp"

#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\conv\dialogs.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\gmg\genericMissions.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\laptop\dialogs.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\rest\dialogs.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\dialogs.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\meta.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\missions.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\personnel.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\weapons.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\magazines.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\items.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\uniforms.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\campEnhancements.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\shop\campVehicles.hpp"
#include "\IP_CMP_MERCS\IP_CMP_MERCS\cfg\tacPad\dialogs.hpp"

author = "IndeedPete";
allowSubordinatesTakeWeapons = 1;
enableCampaignSystems = 1;
enableDebugConsole = 1;