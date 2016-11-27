if ( GetLocale() == "ruRU" ) then

DugisLocals = {
	PART_TEXT = "\208\167\208\176\209\129\209\130\209\140",
	["|cffff4500This quest is not listed in your current guide"] = "|cffff4500\208\173\209\130\208\190\208\179\208\190 \208\183\208\176\208\180\208\176\208\189\208\184\209\143 \208\189\208\181\209\130 \208\178 \208\178\209\139\208\177\209\128\208\176\208\189\208\189\208\190\208\188 \209\128\209\131\208\186\208\190\208\178\208\190\208\180\209\129\209\130\208\178\208\181",
	["(.*) is now your home."] = "\208\146\208\176\209\136 \208\189\208\190\208\178\209\139\208\185 \208\180\208\190\208\188 - (.*).",
	["^You .*Hitem:(%d+).*(%[.+%])"] = "^\208\146\208\176\209\136\208\176 .*H\208\180\208\190\208\177\209\139\209\135\208\176:(%d+).*(%[.+%])",

	["Accept Quest"] = "Взять задание",
	["Accept Daily"] = "Взять Ежедневное задание",
	["Ach/Profession"] = "Достиж/Профес",
	["Achievements and Profession Guides"] = "Путеводитель по Достижениям и Профессиям",
	["Alchemy"] = "Алхимия",
	["Automatic Waypoints"] = "Автоматический Маршрут",
	["Blacksmithing"] = "Кузнечное дело",
	["Boat to"] = "Плыть на корабле в",
	["Buy Item"] = "Купить предмет",
	["Complete"] = "Завершено",
	["Complete Quest"] = "Завершить задание",
	["Configuration Settings for DugisGuideViewer"] = "Конфигурационные настройки DugisGuideViewer",
	["Cooking"] = "Кулинария",
	["Current Guide"] = "Текущий гид",
	["Dailies/Events"] = "Ежедневка/События",
	["Dailies and Events Guides"] = "Путеводитель по Ежедневным заданиям и Событиям",
	["Desecrate this Fire!"] = "Осквернение огня",
	["Display Quest Level"] = "Показать уровень задания",
	["Dungeons"] = "Подземелья",	
	["Dungeon Guides"] = "Путеводитель по Подземельям",
	["Dungeon Maps"] = "Карты Подземелий",
	["Enchanting"] = "Наложение чар",
	["Engineering"] = "Инженерное дело",
	["First Aid"] = "Первая помощь",
	["Fishing"] = "Рыбная ловля",
	["Fly to"] = "Лететь в",
	["Get Flight Path"] = "Найти пункт полёта",
	["Herbalism"] = "Травничество",
	["Honor the Flame"] = "Поклонение огню",
	["Inscription"] = "Начертание",
	["Floating Item Button"] = "Кнопка предмета",
	["Jewelcrafting"] = "Ювелирное дело",
	["Kill NPC"] = "Убить не играющего персонажа",
	["Leatherworking"] = "Кожевничество",
	["Leveling"] = "Прокачка",
	["Leveling Guides"] = "Путеводители по Прокачке",
--	["Lock Large Frame"] = "закрепить большую рамку",
--	["Lock Small Frame"] = "закрепить малую рамку",
--	["Lock small frame into place"] = "закрепить малую рамку на место",
--	["Lock large frame into place"] = "закрепить большую рамку на место",
	["Manual Mode"] = "Ручной Режим",
	["Maps"] = "Карты",
--	["Map each destination with TomTom"] = "составить карту к каждой цели с помощью TomTom",
	["Mining"] = "Горное дело",	
	["No Guide Loaded"] = "Путеводитель не выбран",
	["Right Click Here To Select One"] = "Нажмите сюда правой кнопкой мыши для выбора Путеводителя",
	["Note"] = "Примечание",
	["Optional"] = "необязательнo",
	["Quest accepted: (.*)"] = "\208\159\208\190\208\187\209\131\209\135\208\181\208\189\208\190 \208\183\208\176\208\180\208\176\208\189\208\184\208\181: (.*)",
	["Reload"] = "Перезапустить",
	["Reset"] = "обнулить",
--	["Reset Frames Position"] = "обнулить место рамок",
	["Select a Dungeon Map"] = "Выбрать Карту Подземелья",
--	["Select a leveling guide closest to your current level"] = "Выбрать Путеводитель ближайший к Вашему текущему уровню",
	["Set Hearthstone"] = "Установить камень возвращения",
	["Settings"] = "Настройки",
	["Settings for Dugi Guides"] = "Настройки Dugi Guides",
--	["Shows a small window to click when an item is needed for a quest"] = "Показывает окошко, на которое нужно нажать, когда требуется предмет для задания",
--	["Show Small Frame"] = "показать малую рамку",
--	["Show the quest level on the large and small frames"] = "Показать уровень задания на большой и малой рамке",
	["Skinning"] = "Снятие шкур",
	["Tailoring"] = "Портняжное дело",
--	["This mode lets the user individually complete or skip quests. When unchecked, the guide will skip all quests in the quest sequence"] = "Этот режим позволяет пользователю в индивидуальном порядке завершать или пропускать задания. Когда не отмечен галочкой, путеводитель пропустит все задания в очереди заданий",
	["Too High Level"] = "Слишком Высокий Уровень",
	["Travel to"] = "Отправиться к",
	["Turn in Daily"] = "Выполнить ежедневное задание",
	["Turn in Quest"] = "Выполнить задание",
	["Use Dungeon Finder"] = "Использовать Поиск Подземелий",
	["Use Hearthstone"] = "Использовать камень возвращения",
	["Use Item"] = "Использовать предмет",
--	["Events"] = "События",
--	["Dailies"] = "ежедневные задания",
--	["Dungeons"] = "Подземелья",
--	["Dailies Guides"] = "Путеводитель по Ежедневным заданиям",
--	["Events Guides"] = "Путеводитель по событиям",
--	["Achievements Guides = "Путеводитель по Достижениям",
--	["Professions Guides = "Путеводитель по Профессиям",
--	["Help = "справка",
--	["Automatic Quest Watch = "автоматическое наблюдение задания",
--	["Small Frame Effect = "эффект малой рамки",
--	["Large Frame Border = "граница большой рамки",
--	["Step Complete Sound = "",
--	["Use Carbonite Arrow = "использовать карбонитовую стрелу",
--	["Use TomTom Arrow = "использовать стрелу TomTom",
--	["Classic Arrow = "классическая стрела",
--	["Show Ant Trail = "отобразить «муравьиную тропу»",
--	["Auto Quest Accept = "Автоматически принять задание",
--	["Tooltip Coordinates = "координаты подсказки",
--	["Guide Suggest Mode = "Режим предложения путеводителя",
--	["Auto Sell Greys = "Автоматически продать серые",
--	["Remove Map Fog = "Очистить туман карты",
--	["Small Frame Border = "Граница малой рамки",
--	["Minimap Blobs = "блобы миникарты",
--	["Low = "Низкий",
--	["High = "высокий",
--	["None = "Никакой",
--	["Current Step = "Текущий шаг",
--	["Tracked Quests = "Отслеживаемые задания",
--	["Target Button = "Кнопка цели",
--	["Minimap Blob Quality = "качество блоба миникарты",
--	["Auto Tooltip (Seconds) = "автоматическая подсказка (секунды)",
--	["Leveling Mode = "режим прокачки",
--	["Collect Item = "забрать предмет",
--	["Higher Level Quest = "Задание более высокого уровня",
--	["Accept Daily Quest = "Принять ежедневное Задание",
--	["Suggest = "Предложить",
--	["Map each destination = "составить карту к каждой цели",
--	["Switch between modern and classic arrow icons = "Переключиться между иконками современной и классической стрел",
--	["Display ant trail between waypoints on the world map = "Отобразить «муравьиную тропу» между точками маршрута на карте мира",
--	["Automatically accept and turn in quests from NPCs. Disable with shift = "Автоматически принять и Выполнить задания от не играющих персонажей. Сделать невозможным клавишей Shift",
--	["Show destination coordinates in the status frame tooltip = "Отобразить координаты пунктов прибытия в подсказке рамки статуса",
--	["Use the Carbonite arrow instead of the built in arrow = "Воспользоваться карбонитовой стрелкой вместо встроенной стрелки",
--	["Use the TomTom arrow instead of the built in arrow = "Воспользоваться стрелкой TomTom вместо встроенной стрелки",
--	["Suggest guides for your player on level up = "Предложить путеводители для вашего героя по достижении следующего уровня",
--	["Automatically sell grey quality items to merchant NPCs = "Автоматически продавать предметы серого качества не играющим торговцам",
--	["Use the same border that is selected for the large frame = "Воспользоваться той-же границей, что выбрана и для большой рамки",
--	["View undiscovered areas of the world map, type /reload in your chat box after change of settings = "Просмотреть неисследованные области карты мира, печатайте /reload в окошке чатa после смены установок",
--	["Show regional quest destination hints on the Minimap = "Отобразить подсказки пунктов прибытия региональных заданий на миникарте",
--	["Target the NPC needed for the quest step = "Нацелиться на не играющего персонажа, нужного для шага задания",
--	["Human = "Человек",
--	["Easy = "Лёгкий",
--	["Normal = "Нормальный",
--	["Hard = "Трудный",
--	["You can now advance to = "Теперь вы можете продвинуться к ",
--	["Dungeons = "Подземелья",
--	["Dailies = "Ежедневные задания",
--	["Events = "События",
--	["Achievements = "Достижения",
--	["Professions = "Профессии",
--	["Other = "Другое",
--	["Questing = "Выполнение заданий",
--	["Waypoints = "Маршруты",
--	["Frames = "Рамки",
--	["Search = "Поиск",
--	["Title = "Титул",
--	["Preload = "Загрузить",
--	["Record = "Запись",
--	["Enabled = "Включённый",
--	["Clear Record = "Очистить Запись",
--	["For technical support please contact: = "Для технической поддержки, пожалуйста свяжитесь с",
--	["Video tutorials are available from the link below: = "Видео уроки доступны с указателя связи внизу",
--	["Icon Reference = "Сноска иконки",
--	["Show Dugi Arrow = "Отобразить стрелку Dugi",
--	["Show Dugis waypoint arrow = "Отобразить стрелку маршрута Dugi",
--	["Show the corpse arrow to direct you to your body = "Отобразить стрелку трупа, чтобы провести Вас к Bашему телу",
--	["Show Corpse Arrow = "Отобразить стрелку трупа",
--	["Show the On/Off button which enables or disables the guide = "Отобразить кнопку Вкл./Выкл., которая активизирует или де-активизирует путеводитель",
--	["Show DG Icon Button = "Отобразить кнопку Вкл./Выкл.",
--	["Shift click a quest step to track in the frame = "Щёлкните шаг задания одновременно с Shift, чтобы прослеживать в рамке",
--	["Enable Sticky Frame = "активизировать липучую рамку",
--	["Map Coordinates = "Координаты карты",
--	["Show Player and Mouse coordinates at the bottom of the map. = "Отобразить координаты героя и мышки внизу карты",
--	["Show Target Button = "Отобразить кнопку цели",
--	["Show target button frame = "Отобразить рамку кнопки цели",
--	["Customize Macro = "настроить макро",
--	["Customize Target Macro = "настроить макро цели",
--	["Apply = "Применить",
--	["Default = "По умолчанию",
--	["Clear = "Очистить",
--	["Memory = "Память",
--	["Model Database = "База данных моделей",
--	["NPC Name Database = "База данных имён не играющих персонажей",
--	["Quest Level Database = "База данных уровней заданий",
--	["Apply Memory Settings = "Применить установки памяти",
--	["Collect Garbage = "Собрать мусор",
--	["Allows model viewer to function = "Позволяет визуализатору моделей функционировать",
--	["Provides localized NPC names. Required for target button. = "Предоставляет локализованные имена не играющих персонажей. Требуется для кнопки цели",
--	["Shows minimum level required for quests = "Отображает минимальный уровень, требуемый для заданий",
--	["Auto Stick = "Автоматически приклеить",
--	["Color Code Quest = "кодировать задание цветом",
--	["Color code quest against your character's level = "кодировать задание цветом против уровня Вашего героя",
--	["Floating Small Frame = "Плавающая малая рамка",
--	["Allow a free floating Small Frame.  Otherwise add it to the Objective Tracker = "Позволить свободно плавающую малую рамку. В противном случае добавить её в отслеживатель поставленных задач",
	}
setmetatable(DugisLocals, {__index=function(t,k) rawset(t, k, k); return k; end})	
end
