-- $Id: Atlas_BurningCrusade-koKR.lua 38 2018-08-09 13:56:48Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2018 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_BurningCrusade", "koKR", false);

-- Atlas Spanish Localization
if ( GetLocale() == "koKR" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
AtlasSortIgnore = {
	--"the (.+)",
};

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
--	["Ahn'Qiraj"] = "Templo de Ahn'Qiraj";
--	["The Temple of Atal'Hakkar"] = "El Templo de Atal'Hakkar";
--	["Throne of Tides"] = "Fauce Abisal: Trono de las Mareas";
};
end


if L then
L["\"Captain\" Kaftiz"] = "\"두목\" 카프티즈"
L["\"Slim\" <Shady Dealer>"] = "\"말라깽이\" <암거래상>"
L["Abbendis"] = "아벤디스"
--[[Translation missing --]]
--[[ L["AC"] = ""--]] 
L["Advance Scout Chadwick"] = "전위 정찰병 채드윅"
L["Aged Dalaran Wizard"] = "늙은 달라란 마술사"
L["Aluyen <Reagents>"] = "알루엔 <마법 재료 상인>"
L["Ambassador Pax'ivi"] = "대사 팍시비"
L["Apoko"] = "아포코"
--[[Translation missing --]]
--[[ L["Arca"] = ""--]] 
L["Archmage Leryda"] = "대마법사 레리다"
L["Artificer Morphalius"] = "기술병 몰팔리우스"
--[[Translation missing --]]
--[[ L["Auch"] = ""--]] 
L["Avatar of the Martyred"] = "순교자의 화신"
L["Barkeep Kelly <Bartender>"] = "바텐더 켈리 <바텐더>"
L["Barnes <The Stage Manager>"] = "반즈 <무대 관리인>"
L["Baron Rafe Dreuger"] = "남작 레이프 드류거"
L["Baroness Dorothea Millstipe"] = "남작부인 도로시아 밀스타이프"
L["Bennett <The Sergeant at Arms>"] = "벤네트 <경호원>"
L["Berthold <The Doorman>"] = "베르솔드 <문지기>"
--[[Translation missing --]]
--[[ L["BF"] = ""--]] 
L["Bilger the Straight-laced"] = "엄한 빌저"
--[[Translation missing --]]
--[[ L["Bota"] = ""--]] 
--[[Translation missing --]]
--[[ L["Brazen"] = ""--]] 
--[[Translation missing --]]
--[[ L["Broken Stairs"] = ""--]] 
--[[Translation missing --]]
--[[ L["BT"] = ""--]] 
L["Calliard <The Nightman>"] = "칼리아드 <야경꾼>"
L["Captain Alina"] = "대장 앨리나"
L["Captain Boneshatter"] = "대장 본쉐터"
L["Captain Edward Hanes"] = "선장 에드워드 헤인즈"
L["Captain Sanders"] = "선장 샌더스"
L["Caza'rez"] = "카자레즈"
L["Charred Bone Fragment"] = "그을린 뼈 조각"
L["Chef Jessen <Speciality Meat & Slop>"] = "주방장 예센 <고기 및 특제 요리 상인>"
L["Clarissa"] = "클라리사"
L["Commander Mograine"] = "사령관 모그레인"
--[[Translation missing --]]
--[[ L["CoT"] = ""--]] 
--[[Translation missing --]]
--[[ L["CoT1"] = ""--]] 
--[[Translation missing --]]
--[[ L["CoT2"] = ""--]] 
--[[Translation missing --]]
--[[ L["CoT3"] = ""--]] 
--[[Translation missing --]]
--[[ L["CR"] = ""--]] 
L["Cryo-Engineer Sha'heen"] = "극저온 기술자 샤힌"
L["Dealer Tariq <Shady Dealer>"] = "무역업자 타리크 <암거래상>"
L["Dealer Vijaad"] = "무역업자 비자드"
L["Don Carlos"] = "돈 카를로스"
L["D'ore"] = "도레"
L["Draenei Spirit"] = "드레나이 영혼"
L["Drisella"] = "드리셀라"
L["Earthbinder Rayge"] = "대지의 결속자 레이지"
L["Ebonlocke <The Noble>"] = "이본로크 <귀족>"
L["Echo of Medivh"] = "메디브의 메아리"
L["Ellrys Duskhallow"] = "엘리스 더스크할로우"
L["Eramas Brightblaze"] = "에라마스 브라이트블레이즈"
L["Erozion"] = "에로지온"
L["Ethereal Transporter Control Panel"] = "에테리얼 순간이동기 제어장치"
L["Exarch Larethor"] = "총독 라레소르"
L["Fairbanks"] = "페어뱅크스"
L["Farmer Kent"] = "농부 켄트"
L["Fel Crystals"] = "지옥 수정"
L["Field Commander Mahfuun"] = "야전사령관 마푼"
L["First Fragment Guardian"] = "첫 번째 조각의 수호자"
L["Fizzle"] = "피즐"
L["Frances Lin <Barmaid>"] = "프란세스 린 <바텐더>"
L["Garaxxas"] = "가락사스"
--[[Translation missing --]]
--[[ L["GL"] = ""--]] 
L["Gradav <The Warlock>"] = "그라다브 <흑마법사>"
L["Greatfather Aldrimus"] = "대부 알드리머스"
L["Guerrero"] = "게레로"
L["Gunny"] = "구니"
L["Hal McAllister"] = "할 맥알리스터"
L["Ha'lei"] = "할라이"
L["Hastings <The Caretaker>"] = "헤이스팅스 <관리인>"
--[[Translation missing --]]
--[[ L["HC"] = ""--]] 
L["Helcular"] = "헬쿨라"
L["Herod the Bully"] = "골목대장 헤로드"
L["Horvon the Armorer <Armorsmith>"] = "방어구 제작자 하본 <방어구 제작자>"
L["Indormi <Keeper of Ancient Gem Lore>"] = "인도르미 <고대 보석 지식의 수호자>"
L["Innkeeper Monica"] = "여관주인 모니카"
L["Isfar"] = "이스파르"
L["Isillien"] = "이실리엔"
L["Jay Lemieux"] = "제이 레미욱스"
L["Jerry Carter"] = "제리 카터"
L["Jonathan Revah"] = "조나단 레바"
L["Julie Honeywell"] = "줄리 허니웰"
L["Kagani Nightstrike"] = "카가니 나이트스트라이크"
L["Kamsis <The Conjurer>"] = "캄시스 <창조술사>"
--[[Translation missing --]]
--[[ L["Kara"] = ""--]] 
L["Keanna's Log"] = "킨나의 기록"
L["Korag Proudmane"] = "코라그 프라우드메인"
L["Koren <The Blacksmith>"] = "코렌 <대장장이>"
L["Lady Catriona Von'Indi"] = "여군주 카트리오나 본인디"
L["Lady Jaina Proudmoore"] = "여군주 제이나 프라우드무어"
L["Lady Keira Berrybuck"] = "여군주 케이라 베리벅"
L["Lakka"] = "라카"
--[[Translation missing --]]
--[[ L["Landing Spot"] = ""--]] 
L["Little Jimmy Vishas"] = "꼬마 지미 비샤스"
L["Lord Crispin Ference"] = "군주 크립핀 페렌스"
L["Lord Robin Daris"] = "군주 로빈 다리스"
--[[Translation missing --]]
--[[ L["Lydia Accoste"] = ""--]] 
L["Madrigosa"] = "마드리고사"
--[[Translation missing --]]
--[[ L["Mag"] = ""--]] 
L["Magistrate Henry Maleb"] = "집정관 헨리 말레브"
--[[Translation missing --]]
--[[ L["Main Chambers Access Panel"] = ""--]] 
L["Mamdy the \"Ologist\""] = "\"전문가\" 맴디"
--[[Translation missing --]]
--[[ L["MaT"] = ""--]] 
--[[Translation missing --]]
--[[ L["Mech"] = ""--]] 
--[[Translation missing --]]
--[[ L["Meeting Stone of Hellfire Citadel"] = ""--]] 
--[[Translation missing --]]
--[[ L["Meeting Stone of Magtheridon's Lair"] = ""--]] 
L["Millhouse Manastorm"] = "밀하우스 마나스톰"
L["Mortog Steamhead"] = "모르토그 스팀헤드"
--[[Translation missing --]]
--[[ L["MT"] = ""--]] 
--[[Translation missing --]]
--[[ L["Mysterious Bookshelf"] = ""--]] 
L["Nahuud"] = "나후우드"
L["Nat Pagle"] = "내트 페이글"
L["Nathanos Marris"] = "나타노스 매리스"
L["Naturalist Bite"] = "식물학자 바이트"
L["Nexus-Prince Haramad"] = "연합왕자 하라매드"
L["Okuno <Ashtongue Deathsworn Quartermaster>"] = "오쿠노 <잿빛혓바닥 결사단 병참장교>"
L["Overcharged Manacell"] = "과충전된 마나저장소"
L["Overwatch Mark 0 <Protector>"] = "망꾼 0호 <경호원>"
--[[Translation missing --]]
--[[ L["Path to the Broken Stairs"] = ""--]] 
--[[Translation missing --]]
--[[ L["Path to the Hellfire Ramparts and Shattered Halls"] = ""--]] 
--[[Translation missing --]]
--[[ L["Phin Odelic <The Kirin Tor>"] = ""--]] 
--[[Translation missing --]]
--[[ L["Private Jacint"] = ""--]] 
--[[Translation missing --]]
--[[ L["Provisioner Tsaalt"] = ""--]] 
--[[Translation missing --]]
--[[ L["Raleigh the True"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ramdor the Mad"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ramp"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ramp down to the Gamesman's Hall"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ramp to Guardian's Library"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ramp to Medivh's Chamber"] = ""--]] 
--[[Translation missing --]]
--[[ L["Ramp up to the Celestial Watch"] = ""--]] 
--[[Translation missing --]]
--[[ L["Randy Whizzlesprocket"] = ""--]] 
--[[Translation missing --]]
--[[ L["Red Riding Hood"] = ""--]] 
--[[Translation missing --]]
--[[ L["Reinforced Fel Iron Chest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Renault Mograine"] = ""--]] 
--[[Translation missing --]]
--[[ L["Rifleman Brownbeard"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sa'at <Keepers of Time>"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sally Whitemane"] = ""--]] 
--[[Translation missing --]]
--[[ L["Scout Orgarr"] = ""--]] 
--[[Translation missing --]]
--[[ L["Scrying Orb"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sebastian <The Organist>"] = ""--]] 
--[[Translation missing --]]
--[[ L["Second Fragment Guardian"] = ""--]] 
--[[Translation missing --]]
--[[ L["Seer Kanai"] = ""--]] 
--[[Translation missing --]]
--[[ L["Seer Olum"] = ""--]] 
--[[Translation missing --]]
--[[ L["Servant Quarters"] = ""--]] 
--[[Translation missing --]]
--[[ L["Seth"] = ""--]] 
--[[Translation missing --]]
--[[ L["SH"] = ""--]] 
--[[Translation missing --]]
--[[ L["Shadow Lord Xiraxis"] = ""--]] 
--[[Translation missing --]]
--[[ L["Shattered Hand Executioner"] = ""--]] 
--[[Translation missing --]]
--[[ L["Skar'this the Heretic"] = ""--]] 
--[[Translation missing --]]
--[[ L["SL"] = ""--]] 
--[[Translation missing --]]
--[[ L["Sliver <Garaxxas' Pet>"] = ""--]] 
--[[Translation missing --]]
--[[ L["Southshore Inn"] = ""--]] 
--[[Translation missing --]]
--[[ L["SP"] = ""--]] 
--[[Translation missing --]]
--[[ L["Spiral Stairs to Netherspace"] = ""--]] 
--[[Translation missing --]]
--[[ L["Spirit of Olum"] = ""--]] 
--[[Translation missing --]]
--[[ L["Spirit of Udalo"] = ""--]] 
--[[Translation missing --]]
--[[ L["Spy Grik'tha"] = ""--]] 
--[[Translation missing --]]
--[[ L["Spy To'gun"] = ""--]] 
--[[Translation missing --]]
--[[ L["SSC"] = ""--]] 
--[[Translation missing --]]
--[[ L["Stalvan Mistmantle"] = ""--]] 
--[[Translation missing --]]
--[[ L["Steps and path to the Blood Furnace"] = ""--]] 
--[[Translation missing --]]
--[[ L["Stone Guard Stok'ton"] = ""--]] 
--[[Translation missing --]]
--[[ L["SuP"] = ""--]] 
--[[Translation missing --]]
--[[ L["SV"] = ""--]] 
--[[Translation missing --]]
--[[ L["Taelan"] = ""--]] 
--[[Translation missing --]]
--[[ L["Taretha"] = ""--]] 
--[[Translation missing --]]
--[[ L["The Codex of Blood"] = ""--]] 
L["The Master's Terrace"] = "주인의 테라스"
L["The Saga of Terokk"] = "테로크의 전설"
L["The Underspore"] = "쉬슬리스의 방주"
L["Third Fragment Guardian"] = "세 번째 조각의 수호자"
L["Thomas Yance <Travelling Salesman>"] = "토마스 얀스 <여행 중인 선원>"
L["Thrall"] = "스랄"
L["Thrall <Warchief>"] = "스랄 <대족장>"
--[[Translation missing --]]
--[[ L["TK"] = ""--]] 
L["Tormented Soulpriest"] = "고통받는 영혼사제"
--[[Translation missing --]]
--[[ L["Towards Illidan Stormrage"] = ""--]] 
--[[Translation missing --]]
--[[ L["Towards Reliquary of Souls"] = ""--]] 
--[[Translation missing --]]
--[[ L["Towards Teron Gorefiend"] = ""--]] 
L["T'shu"] = "트슈"
L["Tydormu <Keeper of Lost Artifacts>"] = "타이도르무 <잃어버린 유물의 수호자>"
L["Tyrande Whisperwind <High Priestess of Elune>"] = "티란데 위스퍼윈드 <엘룬의 대여사제>"
L["Tyrith"] = "티리스"
--[[Translation missing --]]
--[[ L["UB"] = ""--]] 
L["Udalo"] = "우달로"
L["Warlord Salaris"] = "장군 살라리스"
L["Watcher Jhang"] = "감시자 쟝"
L["Weeder Greenthumb"] = "약초학자 그린썸"
L["Windcaller Claw"] = "바람소환사 클로"
--[[Translation missing --]]
--[[ L["Wizard of Oz"] = ""--]] 
L["Wravien <The Mage>"] = "레비엔 <마법사>"
L["Yazzai"] = "야자이"
L["Young Blanchy"] = "망아지 블랑쉬"
L["Ythyar"] = "이스야르"
L["Zelfan"] = "젤판"
L["Zixil <Aspiring Merchant>"] = "직실 <야심찬 상인>"

end
