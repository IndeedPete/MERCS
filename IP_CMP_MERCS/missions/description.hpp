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

#include "\Campaigns\IP_CMP_MERCS\cfg\characterTemplates.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\defines.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\factions.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\functions.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\hints.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\identities.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\insignias.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\mainValues.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\notifications.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\supports.hpp"

#include "\Campaigns\IP_CMP_MERCS\cfg\conv\dialogs.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\gmg\genericMissions.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\laptop\dialogs.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\rest\dialogs.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\dialogs.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\missions.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\personnel.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\weapons.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\magazines.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\items.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\clothes.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\campEnhancements.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\shop\campVehicles.hpp"
#include "\Campaigns\IP_CMP_MERCS\cfg\tacPad\dialogs.hpp"

author = "IndeedPete";
allowSubordinatesTakeWeapons = 1;
enableCampaignSystems = 1;
enableDebugConsole = 1;