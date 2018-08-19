local _, ns = ...
local TARGET_CONFIG = { SELF = {}, FRIENDLY = {}, HOSTILE = {} }
ns.TARGET_CONFIG = TARGET_CONFIG

----------------------------
-- START OF TARGET CONFIG --
----------------------------

-- IMPORTANT: If you make any changes to this file, make sure you back it up before installing a new version.
-- This will allow you to restore your custom configuration with ease.
-- Also back up any custom textures you add.

-- Changes made to this file will take effect when you reload your UI (e.g. using the /reload slash command),
-- log out and back in or restart the game.
-- New files won't be accessible until you restart the game.

-- Config variables that start with TARGET_CONFIG.SELF are used when targeting yourself.
-- Config variables that start TARGET_CONFIG.FRIENDLY are used for friendly targets.
-- Config variables that start with TARGET_CONFIG.HOSTILE are used for hostile targets.

-------
-- This variable controls whether the texture is visible for your target.
-------
TARGET_CONFIG.ENABLED = true					-- 啟用/停用所有選取目標的箭頭圖案，true 代表啟用、false 代表停用。

-------
-- These variables control whether the indicator is visible for yourself and for friendly and hostile units.
-------

TARGET_CONFIG.SELF.ENABLED = true				-- 啟用/停用選取目標為自己的箭頭圖案

TARGET_CONFIG.FRIENDLY.ENABLED = true			-- 啟用/停用選取目標為友方的箭頭圖案

TARGET_CONFIG.HOSTILE.ENABLED = true			-- 啟用/停用選取目標為敵方的箭頭圖案

-------
-- These variables control the appearance of the texture.
-------

-- The path of the texture file you want to use relative to the main WoW directory (without the texture's file extension).
-- The AddOn includes thirty textures:
--  Reticule                -- Red targeting reticule (contributed by Dridzt of WoWI)
--  RedArrow                -- Red arrow pointing downwards (contributed by DohNotAgain of WoWI)
--  NeonReticule            -- Neon version of the reticule (contributed by mezmorizedck of Curse)
--  NeonRedArrow            -- Neon version of the red arrow (contributed by mezmorizedck of Curse)
--  RedChevronArrow         -- Red inverted triple chevron (contributed by OligoFriends of Curse/WoWI)
--  PaleRedChevronArrow     -- Pale red version of the chevron (contributed by OligoFriends of Curse/WoWI)
--  arrow_tip_green         -- Green 3D arrow (contributed by OligoFriends of Curse/WoWI)
--  arrow_tip_red           -- Red 3D arrow (contributed by OligoFriends of Curse/WoWI)
--  skull                   -- Skull and crossbones (contributed by OligoFriends of Curse/WoWI)
--  circles_target          -- Red concentric circles in the style of a target (contributed by OligoFriends of Curse/WoWI)
--  red_star                -- Red star with gold outline (contributed by OligoFriends of Curse/WoWI)
--  greenarrowtarget        -- Neon green arrow with a red target (contributed by mezmorizedck of Curse)
--  BlueArrow               -- Blue arrow pointing downwards (contributed by Imithat of WoWI)
--  bluearrow1              -- Abstract style blue arrow pointing downwards (contributed by Imithat of WoWI)
--  gearsofwar              -- Gears of War logo (contributed by Imithat of WoWI)
--  malthael                -- Malthael (Diablo) logo (contributed by Imithat of WoWI)
--  NewRedArrow             -- Red arrow pointing downwards, same style as BlueArrow (contributed by Imithat of WoWI)
--  NewSkull                -- Skull with gas mask (contributed by Imithat of WoWI)
--  PurpleArrow             -- Abstract style purple arrow pointing downwards, same style as bluearrow1 (contributed by Imithat of WoWI)
--  Shield                  -- Kite shield with sword and crossed spears/polearms (contributed by Imithat of WoWI)
--  NeonGreenArrow          -- Green version of the neon red arrow (contributed by Nokiya420 of Curse)
--  Q_FelFlamingSkull       -- Fel green flaming skull (contributed by ContinuousQ of Curse)
--  Q_RedFlamingSkull       -- Red flaming skull (contributed by ContinuousQ of Curse)
--  Q_ShadowFlamingSkull    -- Shadow purple flaming skull (contributed by ContinuousQ of Curse)
--  Q_GreenGPS              -- Green map pin/GPS symbol (contributed by ContinuousQ of Curse)
--  Q_RedGPS                -- Red map pin/GPS symbol (contributed by ContinuousQ of Curse)
--  Q_WhiteGPS              -- White map pin/GPS symbol (contributed by ContinuousQ of Curse)
--  Q_GreenTarget           -- Green target arrow (contributed by ContinuousQ of Curse)
--  Q_RedTarget             -- Red target arrow (contributed by ContinuousQ of Curse)
--  Q_WhiteTarget           -- White target arrow (contributed by ContinuousQ of Curse)
--  Hunters_Mark            -- Red Hunter's Mark Arrow (contributed by thisguyyouknow of Curse)

-- All of the textures listed above need to be prefixed with "Interface\\AddOns\\TargetNameplateIndicator\\Textures\\" like the default value below.
-- 要更改 "選取目標為自己" 個人資源條的箭頭圖案，將下行中的 NeonWhiteArrow 替換為 AddOns > TargetNameplateIndicator > Textures 資料夾內的任何一個檔案名稱，不要加上副檔名。
TARGET_CONFIG.SELF.TEXTURE_PATH = "Interface\\AddOns\\TargetNameplateIndicator\\Textures\\NeonWhiteArrow"

-- 要更改 "選取目標為友方" 箭頭圖案，將下行中的 NeonGreenArrow 替換為 AddOns > TargetNameplateIndicator > Textures 資料夾內的任何一個檔案名稱，不要加上副檔名。
TARGET_CONFIG.FRIENDLY.TEXTURE_PATH = "Interface\\AddOns\\TargetNameplateIndicator\\Textures\\NeonGreenArrow"

-- 要更改 "選取目標為敵方" 箭頭圖案，將下行中的 NeonRedArrow 替換為 AddOns > TargetNameplateIndicator > Textures 資料夾內的任何一個檔案名稱，不要加上副檔名。
TARGET_CONFIG.HOSTILE.TEXTURE_PATH  = "Interface\\AddOns\\TargetNameplateIndicator\\Textures\\NeonRedArrow"

-- You can add your own texture by placing a TGA image in the WoW\Interface\AddOns\TargetNameplateIndicator directory and changing the string after TEXTURE_PATH to match its name.
-- See the "filename" argument on the following page for details on the required texture file format:
-- http://www.wowpedia.org/API_Texture_SetTexture
--
-- GIMP (www.gimp.org) is a free image editing program that can easily convert almost any image format to TGA as well as let you create your own TGA images.
-- If you want your texture to be packaged with the AddOn, just leave a comment on Curse or WoWI with the image embedded or a direct link to download the image.
-- I can convert PNG and other formats to TGA if needed.
-- Make sure that you have ownership rights of any image that you contribute.



-- The height/width of the texture. Using a height:width ratio different to that of the texture file may result in distortion.
TARGET_CONFIG.SELF.TEXTURE_HEIGHT = 50			-- 選取目標為自己箭頭圖案的大小
TARGET_CONFIG.SELF.TEXTURE_WIDTH  = 50

TARGET_CONFIG.FRIENDLY.TEXTURE_HEIGHT = 50		-- 選取目標為友方箭頭圖案的大小
TARGET_CONFIG.FRIENDLY.TEXTURE_WIDTH  = 50

TARGET_CONFIG.HOSTILE.TEXTURE_HEIGHT  = 50		-- 選取目標為敵方箭頭圖案的大小
TARGET_CONFIG.HOSTILE.TEXTURE_WIDTH   = 50


-- The opacity of the texture. 1 is fully opaque, 0 is transparent.
TARGET_CONFIG.SELF.OPACITY = 1

TARGET_CONFIG.FRIENDLY.OPACITY = 1

TARGET_CONFIG.HOSTILE.OPACITY = 1

-------
-- These variables control how the texture is anchored to the nameplate.
-------

-- Used in texture:SetPoint(TEXTURE_POINT, nameplate, ANCHOR_POINT, OFFSET_X, OFFSET_Y)
-- See http://www.wowpedia.org/API_Region_SetPoint for explanation.
TARGET_CONFIG.SELF.TEXTURE_POINT = "BOTTOM"      -- The point of the texture that should be anchored to the nameplate.
TARGET_CONFIG.SELF.ANCHOR_POINT  = "TOP"         -- The point of the nameplate the texture should be anchored to.
TARGET_CONFIG.SELF.OFFSET_X = 0                  -- The x/y offset of the texture relative to the anchor point.
TARGET_CONFIG.SELF.OFFSET_Y = -5				 -- 選取目標為自己箭頭圖案的 x/y 位置

TARGET_CONFIG.FRIENDLY.TEXTURE_POINT = "BOTTOM"  -- The point of the texture that should be anchored to the nameplate.
TARGET_CONFIG.FRIENDLY.ANCHOR_POINT  = "TOP"     -- The point of the nameplate the texture should be anchored to.
TARGET_CONFIG.FRIENDLY.OFFSET_X = 0              -- The x/y offset of the texture relative to the anchor point.
TARGET_CONFIG.FRIENDLY.OFFSET_Y = -5				 -- 選取目標為友方箭頭圖案的 x/y 位置

TARGET_CONFIG.HOSTILE.TEXTURE_POINT = "BOTTOM"   -- The point of the texture that should be anchored to the nameplate.
TARGET_CONFIG.HOSTILE.ANCHOR_POINT  = "TOP"      -- The point of the nameplate the texture should be anchored to.
TARGET_CONFIG.HOSTILE.OFFSET_X = 0               -- The x/y offset of the texture relative to the anchor point.
TARGET_CONFIG.HOSTILE.OFFSET_Y = 22				 -- 選取目標為敵方箭頭圖案的 x/y 位置

--------------------------
-- END OF TARGET CONFIG --
--------------------------
