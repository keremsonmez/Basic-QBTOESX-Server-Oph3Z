Config = {}
Config.DropMaxWeight = 9999

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Config.RandomStr = function(length)
	if length > 0 then
		return Config.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Config.RandomInt = function(length)
	if length > 0 then
		return Config.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

Config.GarbageProps = {
    [218085040] = true, --prop_dumpster_01a
    [666561306] = true, --prop_dumpster_02a
	[-58485588] = true, --prop_dumpster_02b
	[-206690185] = true, --prop_dumpster_3a
	[1511880420] = true, --prop_dumpster_4a
    [682791951] = true, --prop_dumpster_4b
}
Config.GarbageSlot = 15
Config.GarbageItems = { -- only items not working with weapons or if u want put in weapon u must enable item weapons
    [1] = {
        name = 'bread',
        count = math.random(1, 20),
        slot = 1
    },
    [2] = {
        name = 'lithium',
        count = math.random(8, 18),
        slot = 2
    },
    [3] = {
        name = 'lithium',
        count = math.random(8, 18),
        slot = 3
    },
    [4] = {
        name = 'carsaf',
        count = math.random(3, 13),
        slot = 4
    },
    [5] = {
        name = 'kiriksise',
        count = math.random(3, 33),
        slot = 5
    },
    [6] = {
        name = 'tosuncamsil',
        count = math.random(2, 8),
        slot = 6
    },
    [7] = {
        name = 'oldphone',
        count = math.random(2, 20),
        slot = 7
    },
    [8] = {
        name = 'pknife',
        count = math.random(1, 3),
        slot = 8
    },
}

-- Config.VendingObjects = {
--     [1114264700] = true,
--     [992069095] = true, 
-- 	[1099892058] = true, 
-- }

-- Config.VendingItem = {
--     ["vends"] = {
--         label = "Vends",
--         Shop = {
--             Items = {
--                 [1] = {
--                     name = "soda",
--                     price = 12,
--                     count = 250,
--                     info = {},
--                     type = "weapon",
--                     slot = 1,
--                 },
--                 [2] = {
--                     name = "water",
--                     price = 1,
--                     count = 250,
--                     info = {},
--                     type = "weapon",
--                     slot = 2,
--                 },
--                 [3] = {
--                     name = "cola",
--                     price = 8,
--                     count = 250,
--                     info = {},
--                     type = "weapon",
--                     slot = 3,
--                 },
--             }
--         }
--     }
-- }

Config.CraftingItems = {
    [1] = {
        name = "water",
        amount = 50,
        info = {},
        costs = {
            ["bread"] = 15,
        },
        type = "item",
        slot = 1,
        threshold = 0,
        points = 1,
    },
    [2] = {
        name = "handcuffs",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 5,
            ["plastic"] = 5,
        },
        type = "item",
        slot = 2,
        threshold = 0,
        points = 1,
    },
    [3] = {
        name = "electronickit",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 15,
            ["plastic"] = 20,
            ["copper"] = 10,
        },
        type = "item",
        slot = 3,
        threshold = 0,
        points = 1,
    },
    [4] = {
        name = "thermite",
        amount = 50,
        info = {},
        costs = {
            ["aluminumoxide"] = 2,
            ["ironoxide"] = 2,
        },
        type = "item",
        slot = 4,
        threshold = 0,
        points = 1,
    },
    [5] = {
        name = "drill",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 15,
            ["plastic"] = 35,
            ["iron"] = 15,
            ["electronickit"] = 1,
        },
        type = "item",
        slot = 5,
        threshold = 0,
        points = 1,
    },
    [6] = {
        name = "aluminumoxide",
        amount = 50,
        info = {},
        costs = {
            ["glass"] = 10,
            ["aluminum"] = 20,
        },
        type = "item",
        slot = 6,
        threshold = 0,
        points = 1,
    },
    [7] = {
        name = "ironoxide",
        amount = 50,
        info = {},
        costs = {
            ["glass"] = 10,
            ["iron"] = 20,
        },
        type = "item",
        slot = 7,
        threshold = 0,
        points = 1,
    },
    [8] = {
        name = "weapon_microsmg",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 120,
            ["steel"] = 30,
        },
        type = "item",
        slot = 8,
        threshold = 0,
        points = 1,
    },
    [9] = {
        name = "weapon_minismg",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 110,
            ["steel"] = 25,            
        },
        type = "item",
        slot = 9,
        threshold = 0,
        points = 1,
    },
    [10] = {
        name = "weapon_appistol",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 150,
            ["steel"] = 25,   
        },
        type = "item",
        slot = 10,
        threshold = 0,
        points = 1,
    },
    [11] = {
        name = "weapon_assaultrifle",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 200,
            ["steel"] = 30,
            ["maddev"] = 10,
        },
        type = "item",
        slot = 11,
        threshold = 0,
        points = 1,
    },
    [12] = {
        name = "weapon_sawnoffshotgun",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 120,
            ["steel"] = 30,
            ["maddev"] = 7,
        },
        type = "item",
        slot = 12,
        threshold = 0,
        points = 1,
    },
}



Config.AttachmentCrafting = {
    ["items"] = {
        [1] = {
            name = "weapon_pistol",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 55,
            },
            type = "weapon",
            slot = 1,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "weapon_snspistol",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 75,
                ["gunpart"] = 1,
            },
            type = "weapon",
            slot = 2,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [3] = {
            name = "pistol_ammo",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 5,
                ["barut"] = 1,
            },
            type = "item",
            slot = 3,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [4] = {
            name = "advancedlockpick",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 10,
                ["lockpick"] = 1,
            },
            type = "item",
            slot = 4,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [6] = {
            name = "aracparcasi",
            count = 100,
            info = {},
            costs = {
                ["metalscrap"] = 0.1,
            },
            type = "item",
            slot = 5,
            weight = 1,
            threshold = 0,
            points = 1,
        },
    },
    ["lostmc"] = {
        [1] = {
            name = "weapon_pistol",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 55,
            },
            type = "weapon",
            slot = 1,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "weapon_snspistol",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 75,
                ["gunpart"] = 1,
            },
            type = "weapon",
            slot = 2,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [3] = {
            name = "pistol_ammo",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 5,
                ["barut"] = 1,
            },
            type = "item",
            slot = 3,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [4] = {
            name = "advancedlockpick",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 10,
                ["lockpick"] = 1,
            },
            type = "item",
            slot = 4,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [5] = {
            name = "weapon_machinepistol",
            count = 10,
            info = {},
            costs = {
                ["metalscrap"] = 135,
                ["gunpart"] = 3,
                ["barut"] = 5,
            },
            type = "weapon",
            slot = 5,
            weight = 1,
            threshold = 0,
            points = 1,
        },
        [6] = {
            name = "aracparcasi",
            count = 100,
            info = {},
            costs = {
                ["metalscrap"] = 0.1,
            },
            type = "item",
            slot = 6,
            weight = 1,
            threshold = 0,
            points = 1,
        },
    }
}

Config.Jobs = {
    ["news"] = {
        label = "news",
        Stash = {
            text = "Depo",
            coords = vector3(-566.96, -931.76, 23.8775)
        },
        Shop = {
            text = "Market",
            coords = vector3(-562.34, -932.59, 23.8775),
            Items = {
                [1] = {
                    name = "newscard",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 1,
                },
            }
        }
    },
    ["police"] = {
        label = "Police",
        Stash = {
            text = "Depo",
            coords = vector3(-1076.6, -831.45, 19.2994)
        },
        Shop = {
            text = "Silah Marketi",
            coords = vector3(-1075.7, -827.85, 19.2994),
            Items = {
                [1] = {
                    name = "weapon_carbinerifle",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "weapon",
                    slot = 1,
                },
                [2] = {
                    name = "weapon_pumpshotgun",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "weapon",
                    slot = 2,
                },
                [3] = {
                    name = "weapon_pistol_mk2",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "weapon",
                    slot = 3,
                },
                [4] = {
                    name = "weapon_combatpistol",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "weapon",
                    slot = 4,
                },
                [5] = {
                    name = "weapon_stungun",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "weapon",
                    slot = 5,
                },
                [6] = {
                    name = "weapon_nightstick",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "weapon",
                    slot = 6,
                },
                [7] = {
                    name = "weapon_flashlight",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "weapon",
                    slot = 7,
                },
                [8] = {
                    name = "pistol_ammo",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 8,
                },
                [9] = {
                    name = "smg_ammo",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 9,
                },
                [10] = {
                    name = "shotgun_ammo",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 10,
                },
                [11] = {
                    name = "fullarmor",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 11,
                },
                [12] = {
                    name = "handcuffs",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 12,
                },
                [13] = {
                    name = "handcuffkey",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 13,
                },
                [14] = {
                    name = "radio",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 14,
                },
                [15] = {
                    name = "gps",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 15,
                },
                [16] = {
                    name = "polmdt",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 16,
                },
                [17] = {
                    name = "bodycam",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 17,
                },
                [18] = {
                    name = "lockpick",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 18,
                },
                [19] = {
                    name = "ifak",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 19,
                },
                [20] = {
                    name = "flashlight",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 20,
                },
                [21] = {
                    name = "grip",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 21,
                },
                [22] = {
                    name = "clip",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 22,
                },
                [23] = {
                    name = "empty_evidence_bag",
                    price = 1,
                    count = 25,
                    info = {},
                    type = "item",
                    slot = 23,
                },
            }
        }
    },
    ["ambulance"] = {
        label = "Doktor ",
        Stash = {
            text = "Depo",
            coords = vector3(-435.24, -306.45, 34.5018)
        },
        Shop = {
            text = "Ecza Dolabı",
            coords = vector3(-439.46, -312.46, 34.5038),
            Items = {
                [1] = {
                    name = "bandage",
                    price = 1,
                    count = 250,
                    info = {},
                    type = "item",
                    slot = 1,
                },
                [2] = {
                    name = "medikit",
                    price = 1,
                    count = 250,
                    info = {},
                    type = "item",
                    slot = 2,
                },
                [3] = {
                    name = "ifak",
                    price = 1,
                    count = 250,
                    info = {},
                    type = "item",
                    slot = 3,
                },
                [4] = {
                    name = "kandurdurucu",
                    price = 1,
                    count = 250,
                    info = {},
                    type = "item",
                    slot = 4,
                },
                [5] = {
                    name = "radio",
                    price = 1,
                    count = 250,
                    info = {},
                    type = "item",
                    slot = 5,
                },
                [6] = {
                    name = "gps",
                    price = 1,
                    count = 250,
                    info = {},
                    type = "item",
                    slot = 6,
                },
                [7] = {
                    name = "wheelchair",
                    price = 1,
                    count = 250,
                    info = {},
                    type = "item",
                    slot = 7,
                },
            }
        }
    },
}

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

MaxInventorySlots = 40

BackEngineVehicles = {
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}



Config.MaximumAmmoValues = {
    ["pistol"] = 2500,
    ["smg"] = 2500,
    ["shotgun"] = 2000,
    ["rifle"] = 2500,
}

Config.Weapons = {
	-- // WEAPONS
	[("weapon_unarmed")] 				 = {["name"] = "weapon_unarmed", 		 	  	["label"] = "Hands", 					["weight"] = 1000, 		["type"] = "weapon",	["ammotype"] = nil, 					["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_knife")] 				 = {["name"] = "weapon_knife", 			 	  	["label"] = "Knife", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_nightstick")] 			 = {["name"] = "weapon_nightstick", 		 	["label"] = "Nightstick", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_hammer")] 				 = {["name"] = "weapon_hammer", 			 	["label"] = "Hammer", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_bat")] 					 = {["name"] = "weapon_bat", 			 	  	["label"] = "Bat", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_golfclub")] 			 = {["name"] = "weapon_golfclub", 		 	  	["label"] = "Golfclub", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_crowbar")] 				 = {["name"] = "weapon_crowbar", 		 	  	["label"] = "Crowbar", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_pistol")] 				 = {["name"] = "weapon_pistol", 			 	["label"] = "Walther P99", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_pistol_mk2")] 			 = {["name"] = "weapon_pistol_mk2", 			["label"] = "Pistol Mk II", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "pistolmk2.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_combatpistol")] 		 = {["name"] = "weapon_combatpistol", 	 	  	["label"] = "Glock 17", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "combatpistol.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_appistol")] 			 = {["name"] = "weapon_appistol", 		 	  	["label"] = "AP Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_pistol50")] 			 = {["name"] = "weapon_pistol50", 		 	  	["label"] = "Pistol .50 Cal", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_microsmg")] 			 = {["name"] = "weapon_microsmg", 		 	  	["label"] = "Micro SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_smg")] 				 	 = {["name"] = "weapon_smg", 			 	  	["label"] = "SMG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_assaultsmg")] 			 = {["name"] = "weapon_assaultsmg", 		 	["label"] = "Assault SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_assaultrifle")] 		 = {["name"] = "weapon_assaultrifle", 	 	  	["label"] = "Assault Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_carbinerifle")] 		 = {["name"] = "weapon_carbinerifle", 	 	  	["label"] = "Carbine Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "carbinerifle.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_advancedrifle")] 		 = {["name"] = "weapon_advancedrifle", 	 	  	["label"] = "Advanced Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_mg")] 					 = {["name"] = "weapon_mg", 				 	["label"] = "Machinegun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_combatmg")] 			 = {["name"] = "weapon_combatmg", 		 	  	["label"] = "Combat MG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_pumpshotgun")] 			 = {["name"] = "weapon_pumpshotgun", 	 	  	["label"] = "Pump Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_sawnoffshotgun")] 		 = {["name"] = "weapon_sawnoffshotgun", 	 	["label"] = "Sawn-off Shotgun", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_assaultshotgun")] 		 = {["name"] = "weapon_assaultshotgun", 	 	["label"] = "Assault Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_bullpupshotgun")] 		 = {["name"] = "weapon_bullpupshotgun", 	 	["label"] = "Bullpup Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
    [("weapon_stungun")] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
    [("weapon_flashlight")] 				 = {["name"] = "weapon_stungun", 		 	  	["label"] = "Taser", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_sniperrifle")] 			 = {["name"] = "weapon_sniperrifle", 	 	  	["label"] = "Sniper Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_heavysniper")] 			 = {["name"] = "weapon_heavysniper", 	 	  	["label"] = "Heavy Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_remotesniper")] 		 = {["name"] = "weapon_remotesniper", 	 	  	["label"] = "Remote Sniper", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER_REMOTE",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_grenadelauncher")] 		 = {["name"] = "weapon_grenadelauncher", 	  	["label"] = "Grenade Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_grenadelauncher_smoke")] = {["name"] = "weapon_grenadelauncher_smoke", 	["label"] = "Smoke Grenade Launcher", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_GRENADELAUNCHER",	["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_rpg")] 					 = {["name"] = "weapon_rpg", 			      	["label"] = "RPG", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RPG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_minigun")] 				 = {["name"] = "weapon_minigun", 		      	["label"] = "Minigun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MINIGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_grenade")] 				 = {["name"] = "weapon_grenade", 		      	["label"] = "Grenade", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_stickybomb")] 			 = {["name"] = "weapon_stickybomb", 		    ["label"] = "C4", 						["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "stickybomb.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_smokegrenade")] 		 = {["name"] = "weapon_smokegrenade", 	      	["label"] = "Smoke Grenade", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_bzgas")] 				 = {["name"] = "weapon_bzgas", 			      	["label"] = "BZ Gas", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_molotov")] 				 = {["name"] = "weapon_molotov", 		      	["label"] = "Molotov", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_fireextinguisher")] 	 = {["name"] = "weapon_fireextinguisher",      	["label"] = "Fire Extinguisher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_petrolcan")] 			 = {["name"] = "weapon_petrolcan", 		 	  	["label"] = "Petrolcan", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PETROLCAN",		["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_briefcase")] 			 = {["name"] = "weapon_briefcase", 		 	  	["label"] = "Briefcase", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_briefcase_02")] 		 = {["name"] = "weapon_briefcase_02", 	 	  	["label"] = "Briefcase2", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_ball")] 				 = {["name"] = "weapon_ball", 			 	  	["label"] = "Ball", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_BALL",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_flare")] 				 = {["name"] = "weapon_flare", 			 	  	["label"] = "Flare pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_snspistol")] 			 = {["name"] = "weapon_snspistol", 		 	  	["label"] = "SNS Pistol", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_bottle")] 				 = {["name"] = "weapon_bottle", 			 	["label"] = "Bottle", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_gusenberg")] 			 = {["name"] = "weapon_gusenberg", 		 	  	["label"] = "Thompson SMG", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_MG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_specialcarbine")] 		 = {["name"] = "weapon_specialcarbine", 	 	["label"] = "Special Carbine", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_heavypistol")] 			 = {["name"] = "weapon_heavypistol", 	 	  	["label"] = "Heavy Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_bullpuprifle")] 		 = {["name"] = "weapon_bullpuprifle", 	 	  	["label"] = "Bullpup Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_dagger")] 				 = {["name"] = "weapon_dagger", 			 	["label"] = "Dagger", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_vintagepistol")] 		 = {["name"] = "weapon_vintagepistol", 	 	  	["label"] = "Vintage Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "weapon_vintagepistol.png", ["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_firework")] 			 = {["name"] = "weapon_firework", 		 	  	["label"] = "Firework Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_musket")] 			     = {["name"] = "weapon_musket", 			 	["label"] = "Musket", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_heavyshotgun")] 		 = {["name"] = "weapon_heavyshotgun", 	 	  	["label"] = "Heavy Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_marksmanrifle")] 		 = {["name"] = "weapon_marksmanrifle", 	 	  	["label"] = "Marksman Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SNIPER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_hominglauncher")] 		 = {["name"] = "weapon_hominglauncher", 	 	["label"] = "Homing Launcher", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_STINGER",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_proxmine")] 			 = {["name"] = "weapon_proxmine", 		 	  	["label"] = "Proxmine Grenade", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_snowball")] 		     = {["name"] = "weapon_snowball", 		 	  	["label"] = "Snowball", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_flaregun")] 			 = {["name"] = "weapon_flaregun", 		 	  	["label"] = "Flare Gun", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_FLARE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_garbagebag")] 			 = {["name"] = "weapon_garbagebag", 		 	["label"] = "Garbagebag", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_handcuffs")] 			 = {["name"] = "weapon_handcuffs", 		 	  	["label"] = "Handcuffs", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_combatpdw")] 			 = {["name"] = "weapon_combatpdw", 		 	  	["label"] = "Combat PDW", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_marksmanpistol")] 		 = {["name"] = "weapon_marksmanpistol", 	 	["label"] = "Marksman Pistol", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_knuckle")] 				 = {["name"] = "weapon_knuckle", 		 	  	["label"] = "Knuckle", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_hatchet")] 				 = {["name"] = "weapon_hatchet", 		 	  	["label"] = "Hatchet", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_railgun")] 				 = {["name"] = "weapon_railgun", 		 	  	["label"] = "Railgun", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_machete")] 				 = {["name"] = "weapon_machete", 		 	  	["label"] = "Machete", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_machinepistol")] 		 = {["name"] = "weapon_machinepistol", 	 	  	["label"] = "Tec-9", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_switchblade")] 			 = {["name"] = "weapon_switchblade", 	 	  	["label"] = "Switchblade", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_revolver")] 			 = {["name"] = "weapon_revolver", 		 	  	["label"] = "Revolver", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_PISTOL",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_dbshotgun")] 			 = {["name"] = "weapon_dbshotgun", 		 	  	["label"] = "Double-barrel Shotgun", 	["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_compactrifle")] 		 = {["name"] = "weapon_compactrifle", 	 	  	["label"] = "Compact Rifle", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_RIFLE",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Ateşli Silah(Üretiminde: 40x Metal Hurda, 80x Çelik, 30x Aluminum,60x Bakır,10x Madde S Gerekli."},
	[("weapon_autoshotgun")] 			 = {["name"] = "weapon_autoshotgun", 	 	  	["label"] = "Auto Shotgun", 			["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "Ateşli Silah(Üretiminde: 40x Metal Hurda, 80x Çelik, 30x Aluminum,60x Bakır,10x Madde S Gerekli."},
	[("weapon_battleaxe")] 			 = {["name"] = "weapon_battleaxe", 		 	  	["label"] = "Battle Axe", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_compactlauncher")] 		 = {["name"] = "weapon_compactlauncher",  	  	["label"] = "Compact Launcher", 		["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_minismg")] 				 = {["name"] = "weapon_minismg", 		 	  	["label"] = "Mini SMG", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SMG",				["image"] = "weapon_minismg.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_pipebomb")] 			 = {["name"] = "weapon_pipebomb", 		 	  	["label"] = "Pipe bom", 				["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_poolcue")] 				 = {["name"] = "weapon_poolcue", 		 	  	["label"] = "Poolcue", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_wrench")] 				 = {["name"] = "weapon_wrench", 			 	["label"] = "Wrench", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "placeholder.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_autoshotgun")] 		 	 = {["name"] = "weapon_autoshotgun", 	 		["label"] = "Auto Shotgun", 			["weight"] = 3000, 		["type"] = "weapon", 	["ammotype"] = "AMMO_SHOTGUN",			["image"] = "sweepershotgun.png", 	["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
	[("weapon_bread")] 				 = {["name"] = "weapon_bread", 				 	["label"] = "Bread", 					["weight"] = 1000, 		["type"] = "weapon", 	["ammotype"] = nil,						["image"] = "baquette.png", 		["unique"] = true, 		["useable"] = false, 	["description"] = "This is a placeholder description"},
}