QBShared = QBShared or {}
QBShared.Items = {
    -- WEAPONS
    -- Melee
    weapon_unarmed               = { name = 'weapon_unarmed', label = 'Fists', weight = 1000, type = 'weapon', ammotype = nil, image = 'placeholder.png', unique = true, useable = false, description = 'Fisticuffs' },
    weapon_dagger                = { name = 'weapon_dagger', label = 'Dagger', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_dagger.png', unique = true, useable = false, description = 'A short knife with a pointed and edged blade, used as a weapon' },
    weapon_bat                   = { name = 'weapon_bat', label = 'Bat', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bat.png', unique = true, useable = false, description = 'Used for hitting a ball in sports (or other things)' },
    weapon_bottle                = { name = 'weapon_bottle', label = 'Broken Bottle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bottle.png', unique = true, useable = false, description = 'A broken bottle' },
    weapon_crowbar               = { name = 'weapon_crowbar', label = 'Crowbar', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_crowbar.png', unique = true, useable = false, description = 'An iron bar with a flattened end, used as a lever' },
    weapon_flashlight            = { name = 'weapon_flashlight', label = 'Flashlight', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_flashlight.png', unique = true, useable = false, description = 'A battery-operated portable light' },
    weapon_golfclub              = { name = 'weapon_golfclub', label = 'Golfclub', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_golfclub.png', unique = true, useable = false, description = 'A club used to hit the ball in golf' },
    weapon_hammer                = { name = 'weapon_hammer', label = 'Hammer', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hammer.png', unique = true, useable = false, description = 'Used for jobs such as breaking things (legs) and driving in nails' },
    weapon_hatchet               = { name = 'weapon_hatchet', label = 'Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hatchet.png', unique = true, useable = false, description = 'A small axe with a short handle for use in one hand' },
    weapon_knuckle               = { name = 'weapon_knuckle', label = 'Knuckle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knuckle.png', unique = true, useable = false, description = 'A metal guard worn over the knuckles in fighting, especially to increase the effect of the blows' },
    weapon_knife                 = { name = 'weapon_knife', label = 'Knife', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knife.png', unique = true, useable = false, description = 'An instrument composed of a blade fixed into a handle, used for cutting or as a weapon' },
    weapon_machete               = { name = 'weapon_machete', label = 'Machete', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_machete.png', unique = true, useable = false, description = 'A broad, heavy knife used as a weapon' },
    weapon_switchblade           = { name = 'weapon_switchblade', label = 'Switchblade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_switchblade.png', unique = true, useable = false, description = 'A knife with a blade that springs out from the handle when a button is pressed' },
    weapon_nightstick            = { name = 'weapon_nightstick', label = 'Nightstick', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_nightstick.png', unique = true, useable = false, description = 'A police officer\'s club or billy' },
    weapon_wrench                = { name = 'weapon_wrench', label = 'Wrench', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_wrench.png', unique = true, useable = false, description = 'A tool used for gripping and turning nuts, bolts, pipes, etc' },
    weapon_battleaxe             = { name = 'weapon_battleaxe', label = 'Battle Axe', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_battleaxe.png', unique = true, useable = false, description = 'A large broad-bladed axe used in ancient warfare' },
    weapon_poolcue               = { name = 'weapon_poolcue', label = 'Poolcue', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_poolcue.png', unique = true, useable = false, description = 'A stick used to strike a ball, usually the cue ball (or other things)' },
    weapon_briefcase             = { name = 'weapon_briefcase', label = 'Briefcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase.png', unique = true, useable = false, description = 'A briefcase for storing important documents' },
    weapon_briefcase_02          = { name = 'weapon_briefcase_02', label = 'Suitcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase2.png', unique = true, useable = false, description = 'Wonderfull for nice vacation to Liberty City' },
    weapon_garbagebag            = { name = 'weapon_garbagebag', label = 'Garbage Bag', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_garbagebag.png', unique = true, useable = false, description = 'A garbage bag' },
    weapon_handcuffs             = { name = 'weapon_handcuffs', label = 'Handcuffs', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_handcuffs.png', unique = true, useable = false, description = 'A pair of lockable linked metal rings for securing a prisoner\'s wrists' },
    weapon_bread                 = { name = 'weapon_bread', label = 'Baquette', weight = 1000, type = 'weapon', ammotype = nil, image = 'baquette.png', unique = true, useable = false, description = 'Bread...?' },
    weapon_stone_hatchet         = { name = 'weapon_stone_hatchet', label = 'Stone Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stone_hatchet.png', unique = true, useable = true, description = 'Stone Hatchet' },
    weapon_candycane             = { name = 'weapon_candycane', label = 'Candy Cane', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_candycane', unique = true, useable = true, description = 'Candy Cane' },

    -- Handguns
    weapon_pistol                = { name = 'weapon_pistol', label = 'Walther P99', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol.png', unique = true, useable = false, description = 'A small firearm designed to be held in one hand' },
    weapon_pistol_mk2            = { name = 'weapon_pistol_mk2', label = 'Pistol Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol_mk2.png', unique = true, useable = false, description = 'An upgraded small firearm designed to be held in one hand' },
    weapon_combatpistol          = { name = 'weapon_combatpistol', label = 'Combat Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_combatpistol.png', unique = true, useable = false, description = 'A combat version small firearm designed to be held in one hand' },
    -- weapon_appistol              = { name = 'weapon_appistol', label = 'AP Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_appistol.png', unique = true, useable = false, description = 'A small firearm designed to be held in one hand that is automatic' },
    -- weapon_stungun               = { name = 'weapon_stungun', label = 'Taser', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stungun.png', unique = true, useable = false, description = 'A weapon firing barbs attached by wires to batteries, causing temporary paralysis' },
    -- weapon_pistol50              = { name = 'weapon_pistol50', label = 'Pistol .50', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol50.png', unique = true, useable = false, description = 'A .50 caliber firearm designed to be held with both hands' },
    weapon_snspistol             = { name = 'weapon_snspistol', label = 'SNS Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_snspistol.png', unique = true, useable = false, description = 'A very small firearm designed to be easily concealed' },
    weapon_heavypistol           = { name = 'weapon_heavypistol', label = 'Heavy Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_heavypistol.png', unique = true, useable = false, description = 'A hefty firearm designed to be held in one hand (or attempted)' },
    weapon_vintagepistol         = { name = 'weapon_vintagepistol', label = 'Vintage Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_vintagepistol.png', unique = true, useable = false, description = 'An antique firearm designed to be held in one hand' },
    weapon_radargun         = { name = 'weapon_radargun', label = 'Radar Gun', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_vintagepistol.png', unique = true, useable = false, description = 'Radargun for LEO' },
    weapon_flaregun              = { name = 'weapon_flaregun', label = 'Flare Gun', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flaregun.png', unique = true, useable = false, description = 'A handgun for firing signal rockets' },
    weapon_marksmanpistol        = { name = 'weapon_marksmanpistol', label = 'Marksman Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_marksmanpistol.png', unique = true, useable = false, description = 'A very accurate small firearm designed to be held in one hand' },
    weapon_revolver              = { name = 'weapon_revolver', label = 'Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver.png', unique = true, useable = false, description = 'A pistol with revolving chambers enabling several shots to be fired without reloading' },
    weapon_revolver_mk2          = { name = 'weapon_revolver_mk2', label = 'Violence', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver_mk2.png', unique = true, useable = true, description = 'da Violence' },
    weapon_doubleaction          = { name = 'weapon_doubleaction', label = 'Double Action Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_doubleaction.png', unique = true, useable = true, description = 'Double Action Revolver' },
    weapon_snspistol_mk2         = { name = 'weapon_snspistol_mk2', label = 'SNS Pistol Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_snspistol_mk2.png', unique = true, useable = true, description = 'SNS Pistol MK2' },
    weapon_raypistol             = { name = 'weapon_raypistol', label = 'Up-n-Atomizer', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_raypistol.png', unique = true, useable = true, description = 'Weapon Raypistol' },
    weapon_ceramicpistol         = { name = 'weapon_ceramicpistol', label = 'Ceramic Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_ceramicpistol.png', unique = true, useable = true, description = 'Weapon Ceramicpistol' },
    weapon_navyrevolver          = { name = 'weapon_navyrevolver', label = 'Navy Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_navyrevolver.png', unique = true, useable = true, description = 'Weapon Navyrevolver' },
    weapon_gadgetpistol          = { name = 'weapon_gadgetpistol', label = 'Perico Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_gadgetpistol.png', unique = true, useable = true, description = 'Weapon Gadgetpistol' },
    weapon_pistolxm3             = { name = 'weapon_pistolxm3', label = 'Pistol XM3', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistolxm3.png', unique = true, useable = true, description = 'Pistol XM3' },

    	-- WEAPONS BLACK V2
	['weapon_m4']     			     = {['name'] = 'weapon_m4',     				['label'] = 'M4',        			    ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_RIFLE',    		['image'] = 'weapon_m4.png',           		['unique'] = true, 		['useable'] = true, 	['description'] = 'Devlete Ait Silah'},
	['weapon_glock']    			 = {['name'] = 'weapon_glock',  				['label'] = 'Glock 18',     			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_PISTOL',   		['image'] = 'weapon_glock.png',        		['unique'] = true, 		['useable'] = true, 	['description'] = 'Devlete Ait Silah'},
	['weapon_ltl']      			 = {['name'] = 'weapon_ltl',    				['label'] = 'PD Shotgun',   			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SHOTGUN',  		['image'] = 'weapon_pumpshotgun.png', 		['unique'] = true, 		['useable'] = true, 	['description'] = 'Devlete Ait Silah'},
	['weapon_stungun']    			 = {['name'] = 'weapon_stungun',  				['label'] = 'PD Taser',	        		['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_TASER',    		['image'] = 'weapon_stungun.png',     		['unique'] = true, 		['useable'] = true, 	['description'] = 'Devlete Ait Silah'},
	['weapon_specialcarbine_mk2']    = {['name'] = 'weapon_specialcarbine_mk2',  	['label'] = 'FN SCAR-L',	        	['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_RIFLE',    		['image'] = 'weapon_specialcarbine.png',	['unique'] = true, 		['useable'] = true, 	['description'] = 'Devlete Ait Silah'},
	['weapon_railgun'] 				 = {['name'] = 'weapon_railgun', 		 	  	['label'] = 'EMP Launcher', 			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_EMP',				['image'] = 'weapon_empgun.png', 			['unique'] = true, 		['useable'] = false, 	['description'] = 'Devlete Ait Silah'},
	['weapon_m14']                   = {['name'] = 'weapon_m14',  	                ['label'] = 'Mk14 Enhanced Battle Rifle',['weight'] = 1000, 	['type'] = 'weapon', 	['ammotype'] = 'AMMO_SNIPER',    		['image'] = 'weapon_mk14.png',     			['unique'] = true, 		['useable'] = true, 	['description'] = 'Devlete Ait Silah'},
	['weapon_sniperrifle']           = {['name'] = 'weapon_sniperrifle',  	        ['label'] = 'M24',	        	        ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SNIPER',    		['image'] = 'weapon_m24.png',     			['unique'] = true, 		['useable'] = true, 	['description'] = 'Devlete Ait Silah'},
	['weapon_smg'] 				 	 = {['name'] = 'weapon_smg', 			 	  	['label'] = 'MP5', 					    ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SMG',				['image'] = 'weapon_smg.png', 				['unique'] = true, 		['useable'] = false, 	['description'] = 'Devlete Ait Silah'},
	['weapon_pistol50'] 			 = {['name'] = 'weapon_pistol50', 		 	  	['label'] = 'Desert Eagle', 	   	    ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_PISTOL',			['image'] = 'weapon_pistol50.png', 			['unique'] = true, 		['useable'] = false, 	['description'] = ''},
	['weapon_combatpdw'] 			 = {['name'] = 'weapon_combatpdw', 		 	  	['label'] = 'SIG MPX', 				    ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SMG',				['image'] = 'weapon_mpx.png', 	            ['unique'] = true, 		['useable'] = false, 	['description'] = 'Devlete Ait Silah'},
	['weapon_advancedrifle'] 		 = {['name'] = 'weapon_advancedrifle', 	 	  	['label'] = 'OTs-14 Groza', 	        ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_RIFLE',			['image'] = 'weapon_groza.png', 			['unique'] = true, 		['useable'] = false, 	['description'] = 'An assault version of a rapid-fire, magazine-fed automatic rifle designed for infantry use'},
	['weapon_compactrifle'] 		 = {['name'] = 'weapon_compactrifle', 	 	  	['label'] = 'Draco NAK9', 				['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_RIFLE',			['image'] = 'weapon_draco.png', 			['unique'] = true, 		['useable'] = false, 	['description'] = 'A compact version of an assault rifle'},
	['weapon_assaultrifle2']	     = {['name'] = 'weapon_assaultrifle2',		    ['label'] = 'M70',         		     	['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_RIFLE',    		['image'] = 'weapon_cmp-rifle.png',			['unique'] = true, 		['useable'] = true, 	['description'] = 'AK47'},
	['weapon_microsmg2']			 = {['name'] = 'weapon_microsmg2',				['label'] = 'Uzi',			            ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SMG',      		['image'] = 'weapon_micro-smg2.png',   		['unique'] = true, 		['useable'] = true, 	['description'] = 'Mini Uzi'},
	['weapon_microsmg3']			 = {['name'] = 'weapon_microsmg3',				['label'] = 'MAC-10',        			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SMG',      		['image'] = 'weapon_micro-smg.png',		    ['unique'] = true, 		['useable'] = true, 	['description'] = 'Mac10'},
	['componet_gavel']     			 = {['name'] = 'componet_gavel',   				['label'] = 'Gavel',    			    ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = nil,                     ['image'] = 'weapon_gavel.png',		        ['unique'] = true, 		['useable'] = true, 	['description'] = 'PLAY BALL!'},
	['weapon_bats']     			 = {['name'] = 'weapon_bats',   				['label'] = 'Baseball bat',    		['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = nil,             		['image'] = 'weapon_bat.png',				['unique'] = true,      ['useable'] = true,     ['description'] = 'PLAY BALL!'},
	['weapon_katanas']  			 = {['name'] = 'weapon_katanas',				['label'] = 'Katanas',        			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = nil,             		['image'] = 'weapon_katana.png',       		['unique'] = true, 		['useable'] = true, 	['description'] = '“slaying moon”'},
	['weapon_katana']   			 = {['name'] = 'weapon_katana',				    ['label'] = 'Katana',     			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = nil,             		['image'] = 'weapon_cursed-katana.png',		['unique'] = true, 		['useable'] = true, 	['description'] = '“wind of death”'},
	['weapon_nailgun']  			 = {['name'] = 'weapon_nailgun',				['label'] = 'Nail gun',     		['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_NAIL',     		['image'] = 'weapon_nailgun.png',      		['unique'] = true, 		['useable'] = true, 	['description'] = 'BOB THE BUILDER'},
	['weapon_sledgeham']			 = {['name'] = 'weapon_sledgeham',				['label'] = 'Sledge Hammer',  					['weight'] = 2000, 		['type'] = 'weapon', 	['ammotype'] = nil,              		['image'] = 'weapon_hammer.png', 		    ['unique'] = true, 		['useable'] = true, 	['description'] = 'I HIT HARD'},
	['weapon_shiv']     			 = {['name'] = 'weapon_shiv',   				['label'] = 'Shiv',         			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = nil,             		['image'] = 'weapon_shiv.png',         		['unique'] = true, 		['useable'] = true, 	['description'] = 'You dont want to know where i keep this.'},
	['weapon_dp9']      			 = {['name'] = 'weapon_dp9',    				['label'] = 'Diamondback DB9', 			['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_PISTOL',           ['image'] = 'weapon_DB9.png',         		['unique'] = true,      ['useable'] = true, 	['description'] = 'pop pop pop'},
	['weapon_staff']    			 = {['name'] = 'weapon_staff',  				['label'] = 'Staff Weap', 						['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_STAFF',    		['image'] = 'weapon_staff01.png',      		['unique'] = true, 		['useable'] = true, 	['description'] = 'IM A WIZARD HARRY!'},
	['weapon_sniperrifle2']			 = {['name'] = 'weapon_sniperrifle2',			['label'] = 'Hunting Rifle',				['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SNIPER',   		['image'] = 'weapon_huntingrifle.png', 		['unique'] = true, 		['useable'] = true, 	['description'] = 'For hunting'},
	['weapon_dragunov']			     = {['name'] = 'weapon_dragunov',		    	['label'] = 'Dragunov',			        ['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_SNIPER',   		['image'] = 'weapon_dragunov.png', 		    ['unique'] = true, 		['useable'] = true, 	['description'] = 'For hunting'},
	['weapon_appistol'] 			 = {['name'] = 'weapon_appistol', 		 	  	['label'] = 'Glock 18c', 				['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = 'AMMO_PISTOL',			['image'] = 'weapon_glock18c.png', 		    ['unique'] = true, 		['useable'] = false, 	['description'] = ''},
    ['bkr_prop_prtmachine_dryer_spin'] = {['name'] = 'bkr_prop_prtmachine_dryer_spin',  ['label'] = 'Dryer Machine',    ['weight'] = 500,        ['type'] = 'item',          ['image'] = 'bkr_prop_prtmachine_dryer_spin.png',      ['unique'] = true,            ['useable'] = true,      ['shouldClose'] = true,       ['combinable'] = nil,     ['description'] = "" },
    
    -- Submachine Guns
    weapon_microsmg              = { name = 'weapon_microsmg', label = 'Micro SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_microsmg.png', unique = true, useable = false, description = 'A handheld light                                                                                                                                                                                                                                                                                                                                                            weight machine gun' },
    -- weapon_smg                   = { name = 'weapon_smg', label = 'SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg.png', unique = true, useable = false, description = 'A handheld light                                                                                                                                                                                                                                                                                                                                                                 weight machine gun' },
    weapon_smg_mk2               = { name = 'weapon_smg_mk2', label = 'SMG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg_mk2.png', unique = true, useable = true, description = 'SMG MK2' },
    weapon_assaultsmg            = { name = 'weapon_assaultsmg', label = 'Assault SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_assaultsmg.png', unique = true, useable = false, description = 'An assault version of a handheld light                                                                                                                                                                                                                                                                                                                                    weight machine gun' },
    -- weapon_combatpdw             = { name = 'weapon_combatpdw', label = 'SIG MPX', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_combatpdw.png', unique = true, useable = false, description = 'A combat version of a handheld light                                                                                                                                                                                                                                                                                                                                       weight machine gun' },
    weapon_machinepistol         = { name = 'weapon_machinepistol', label = 'Tec-9', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_machinepistol.png', unique = true, useable = false, description = 'A self-loading pistol capable of burst or fully automatic fire' },
    weapon_minismg               = { name = 'weapon_minismg', label = 'Mini SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_minismg.png', unique = true, useable = false, description = 'A mini handheld light                                                                                                                                                                                                                                                                                                                                                        weight machine gun' },
    weapon_raycarbine            = { name = 'weapon_raycarbine', label = 'Unholy Hellbringer', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_raycarbine.png', unique = true, useable = true, description = 'Weapon Raycarbine' },

    -- Shotguns
    weapon_pumpshotgun           = { name = 'weapon_pumpshotgun', label = 'Pump Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun.png', unique = true, useable = false, description = 'A pump-action smoothbore gun for firing small shot at short range' },
    weapon_sawnoffshotgun        = { name = 'weapon_sawnoffshotgun', label = 'Sawn-off Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_sawnoffshotgun.png', unique = true, useable = false, description = 'A sawn-off smoothbore gun for firing small shot at short range' },
    weapon_assaultshotgun        = { name = 'weapon_assaultshotgun', label = 'Assault Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_assaultshotgun.png', unique = true, useable = false, description = 'An assault version of asmoothbore gun for firing small shot at short range' },
    weapon_bullpupshotgun        = { name = 'weapon_bullpupshotgun', label = 'Bullpup Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_bullpupshotgun.png', unique = true, useable = false, description = 'A compact smoothbore gun for firing small shot at short range' },
    weapon_musket                = { name = 'weapon_musket', label = 'Musket', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_musket.png', unique = true, useable = false, description = 'An infantryman\'s light gun with a long barrel, typically smooth-bored, muzzleloading, and fired from the shoulder' },
    weapon_heavyshotgun          = { name = 'weapon_heavyshotgun', label = 'Heavy Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_heavyshotgun.png', unique = true, useable = false, description = 'A large smoothbore gun for firing small shot at short range' },
    weapon_dbshotgun             = { name = 'weapon_dbshotgun', label = 'Double-barrel Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_dbshotgun.png', unique = true, useable = false, description = 'A shotgun with two parallel barrels, allowing two single shots to be fired in quick succession' },
    weapon_autoshotgun           = { name = 'weapon_autoshotgun', label = 'Auto Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_autoshotgun.png', unique = true, useable = false, description = 'A shotgun capable of rapid continous fire' },
    weapon_pumpshotgun_mk2       = { name = 'weapon_pumpshotgun_mk2', label = 'Pumpshotgun Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun_mk2.png', unique = true, useable = true, description = 'Pumpshotgun MK2' },
    weapon_combatshotgun         = { name = 'weapon_combatshotgun', label = 'Combat Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_combatshotgun.png', unique = true, useable = true, description = 'Weapon Combatshotgun' },

    -- Assault Rifles
    weapon_assaultrifle          = { name = 'weapon_assaultrifle', label = 'Assault Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle.png', unique = true, useable = false, description = 'A rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_assaultrifle_mk2      = { name = 'weapon_assaultrifle_mk2', label = 'Assault Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle_mk2.png', unique = true, useable = true, description = 'Assault Rifle MK2' },
    weapon_carbinerifle          = { name = 'weapon_carbinerifle', label = 'Carbine Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle.png', unique = true, useable = false, description = 'A light                                                                                                                                                                                                                                                                                                                                                               weight automatic rifle' },
    weapon_carbinerifle_mk2      = { name = 'weapon_carbinerifle_mk2', label = 'Carbine Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle_mk2.png', unique = true, useable = true, description = 'Carbine Rifle MK2' },
    -- weapon_advancedrifle         = { name = 'weapon_advancedrifle', label = 'Advanced Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_advancedrifle.png', unique = true, useable = false, description = 'An assault version of a rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_specialcarbine        = { name = 'weapon_specialcarbine', label = 'Special Carbine', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine.png', unique = true, useable = false, description = 'An extremely versatile assault rifle for any combat situation' },
    weapon_bullpuprifle          = { name = 'weapon_bullpuprifle', label = 'Bullpup Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle.png', unique = true, useable = false, description = 'A compact automatic assault rifle' },
    -- weapon_compactrifle          = { name = 'weapon_compactrifle', label = 'Compact Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_compactrifle.png', unique = true, useable = false, description = 'A compact version of an assault rifle' },
    -- weapon_specialcarbine_mk2    = { name = 'weapon_specialcarbine_mk2', label = 'Special Carbine Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine_mk2.png', unique = true, useable = true, description = 'Weapon Wpecialcarbine MK2' },
    weapon_bullpuprifle_mk2      = { name = 'weapon_bullpuprifle_mk2', label = 'Bullpup Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle_mk2.png', unique = true, useable = true, description = 'Bull Puprifle MK2' },
    weapon_militaryrifle         = { name = 'weapon_militaryrifle', label = 'Military Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_militaryrifle.png', unique = true, useable = true, description = 'Weapon Militaryrifle' },

    -- Light Machine Guns
    weapon_mg                    = { name = 'weapon_mg', label = 'Machinegun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_mg.png', unique = true, useable = false, description = 'An automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_combatmg              = { name = 'weapon_combatmg', label = 'Combat MG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg.png', unique = true, useable = false, description = 'A combat version of an automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_gusenberg             = { name = 'weapon_gusenberg', label = 'Thompson SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_gusenberg.png', unique = true, useable = false, description = 'An automatic rifle commonly referred to as a tommy gun' },
    weapon_combatmg_mk2          = { name = 'weapon_combatmg_mk2', label = 'Combat MG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg_mk2.png', unique = true, useable = true, description = 'Weapon Combatmg MK2' },

    -- Sniper Rifles
    -- weapon_sniperrifle           = { name = 'weapon_sniperrifle', label = 'Sniper Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_sniperrifle.png', unique = true, useable = false, description = 'A high-precision, long-range rifle' },
    weapon_heavysniper           = { name = 'weapon_heavysniper', label = 'Heavy Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper.png', unique = true, useable = false, description = 'An upgraded high-precision, long-range rifle' },
    weapon_marksmanrifle         = { name = 'weapon_marksmanrifle', label = 'Marksman Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle.png', unique = true, useable = false, description = 'A very accurate single-fire rifle' },
    weapon_remotesniper          = { name = 'weapon_remotesniper', label = 'Remote Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER_REMOTE', image = 'weapon_remotesniper.png', unique = true, useable = false, description = 'A portable high-precision, long-range rifle' },
    weapon_heavysniper_mk2       = { name = 'weapon_heavysniper_mk2', label = 'Heavy Sniper Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper_mk2.png', unique = true, useable = true, description = 'Weapon Heavysniper MK2' },
    weapon_marksmanrifle_mk2     = { name = 'weapon_marksmanrifle_mk2', label = 'Marksman Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle_mk2.png', unique = true, useable = true, description = 'Weapon Marksmanrifle MK2' },

    -- Heavy Weapons
    weapon_rpg                   = { name = 'weapon_rpg', label = 'RPG', weight = 1000, type = 'weapon', ammotype = 'AMMO_RPG', image = 'weapon_rpg.png', unique = true, useable = false, description = 'A rocket-propelled grenade launcher' },
    weapon_grenadelauncher       = { name = 'weapon_grenadelauncher', label = 'Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_grenadelauncher.png', unique = true, useable = false, description = 'A weapon that fires a specially-designed large-caliber projectile, often with an explosive, smoke or gas warhead' },
    weapon_grenadelauncher_smoke = { name = 'weapon_grenadelauncher_smoke', label = 'Smoke Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_smokegrenade.png', unique = true, useable = false, description = 'A bomb that produces a lot of smoke when it explodes' },
    weapon_minigun               = { name = 'weapon_minigun', label = 'Minigun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_minigun.png', unique = true, useable = false, description = 'A portable machine gun consisting of a rotating cluster of six barrels and capable of variable rates of fire of up to 6,000 rounds per minute' },
    weapon_firework              = { name = 'weapon_firework', label = 'Firework Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_firework.png', unique = true, useable = false, description = 'A device containing gunpowder and other combustible chemicals that causes a spectacular explosion when ignited' },
    -- weapon_railgun               = { name = 'weapon_railgun', label = 'Railgun', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgun.png', unique = true, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_railgunxm3            = { name = 'weapon_railgunxm3', label = 'Railgun XM3', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgunxm3.png', unique = true, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_hominglauncher        = { name = 'weapon_hominglauncher', label = 'Homing Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_STINGER', image = 'weapon_hominglauncher.png', unique = true, useable = false, description = 'A weapon fitted with an electronic device that enables it to find and hit a target' },
    weapon_compactlauncher       = { name = 'weapon_compactlauncher', label = 'Compact Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_compactlauncher.png', unique = true, useable = false, description = 'A compact grenade launcher' },
    weapon_rayminigun            = { name = 'weapon_rayminigun', label = 'Widowmaker', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_rayminigun.png', unique = true, useable = true, description = 'Weapon Rayminigun' },

    -- Throwables
    weapon_grenade               = { name = 'weapon_grenade', label = 'Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_grenade.png', unique = true, useable = false, description = 'A handheld throwable bomb' },
    weapon_bzgas                 = { name = 'weapon_bzgas', label = 'BZ Gas', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bzgas.png', unique = true, useable = false, description = 'A cannister of gas that causes extreme pain' },
    weapon_molotov               = { name = 'weapon_molotov', label = 'Molotov', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_molotov.png', unique = true, useable = false, description = 'A crude bomb made of a bottle filled with a flammable liquid and fitted with a wick for lighting' },
    weapon_stickybomb            = { name = 'weapon_stickybomb', label = 'C4', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stickybomb.png', unique = true, useable = false, description = 'An explosive charge covered with an adhesive that when thrown against an object sticks until it explodes' },
    weapon_proxmine              = { name = 'weapon_proxmine', label = 'Proxmine Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_proximitymine.png', unique = true, useable = false, description = 'A bomb placed on the ground that detonates when going within its proximity' },
    weapon_snowball              = { name = 'weapon_snowball', label = 'Snowball', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_snowball.png', unique = true, useable = false, description = 'A ball of packed snow, especially one made for throwing at other people for fun' },
    weapon_pipebomb              = { name = 'weapon_pipebomb', label = 'Pipe Bomb', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_pipebomb.png', unique = true, useable = false, description = 'A homemade bomb, the components of which are contained in a pipe' },
    weapon_ball                  = { name = 'weapon_ball', label = 'Ball', weight = 1000, type = 'weapon', ammotype = 'AMMO_BALL', image = 'weapon_ball.png', unique = true, useable = false, description = 'A solid or hollow spherical or egg-shaped object that is kicked, thrown, or hit in a game' },
    weapon_smokegrenade          = { name = 'weapon_smokegrenade', label = 'Smoke Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_c4.png', unique = true, useable = false, description = 'An explosive charge that can be remotely detonated' },
    weapon_flare                 = { name = 'weapon_flare', label = 'Flare pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flare.png', unique = true, useable = false, description = 'A small pyrotechnic devices used for illumination and signalling' },

    -- Miscellaneous
    weapon_petrolcan             = { name = 'weapon_petrolcan', label = 'Petrol Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_petrolcan.png', unique = true, useable = false, description = 'A robust liquid container made from pressed steel' },
    weapon_fireextinguisher      = { name = 'weapon_fireextinguisher', label = 'Fire Extinguisher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_fireextinguisher.png', unique = true, useable = false, description = 'A portable device that discharges a jet of water, foam, gas, or other material to extinguish a fire' },
    weapon_hazardcan             = { name = 'weapon_hazardcan', label = 'Hazardous Jerry Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_hazardcan.png', unique = true, useable = true, description = 'Weapon Hazardcan' },

    -- Weapon Attachments
    clip_attachment              = { name = 'clip_attachment', label = 'Clip', weight = 1000, type = 'item', image = 'clip_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A clip for a weapon' },
    drum_attachment              = { name = 'drum_attachment', label = 'Drum', weight = 1000, type = 'item', image = 'drum_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A drum for a weapon' },
    flashlight_attachment        = { name = 'flashlight_attachment', label = 'Flashlight', weight = 1000, type = 'item', image = 'flashlight_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A flashlight for a weapon' },
    suppressor_attachment        = { name = 'suppressor_attachment', label = 'Suppressor', weight = 1000, type = 'item', image = 'suppressor_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A suppressor for a weapon' },
    smallscope_attachment        = { name = 'smallscope_attachment', label = 'Small Scope', weight = 1000, type = 'item', image = 'smallscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A small scope for a weapon' },
    medscope_attachment          = { name = 'medscope_attachment', label = 'Medium Scope', weight = 1000, type = 'item', image = 'medscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A medium scope for a weapon' },
    largescope_attachment        = { name = 'largescope_attachment', label = 'Large Scope', weight = 1000, type = 'item', image = 'largescope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A large scope for a weapon' },
    holoscope_attachment         = { name = 'holoscope_attachment', label = 'Holo Scope', weight = 1000, type = 'item', image = 'holoscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A holo scope for a weapon' },
    advscope_attachment          = { name = 'advscope_attachment', label = 'Advanced Scope', weight = 1000, type = 'item', image = 'advscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An advanced scope for a weapon' },
    nvscope_attachment           = { name = 'nvscope_attachment', label = 'Night Vision Scope', weight = 1000, type = 'item', image = 'nvscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A night vision scope for a weapon' },
    thermalscope_attachment      = { name = 'thermalscope_attachment', label = 'Thermal Scope', weight = 1000, type = 'item', image = 'thermalscope_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A thermal scope for a weapon' },
    flat_muzzle_brake            = { name = 'flat_muzzle_brake', label = 'Flat Muzzle Brake', weight = 1000, type = 'item', image = 'flat_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    tactical_muzzle_brake        = { name = 'tactical_muzzle_brake', label = 'Tactical Muzzle Brake', weight = 1000, type = 'item', image = 'tactical_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brakee for a weapon' },
    fat_end_muzzle_brake         = { name = 'fat_end_muzzle_brake', label = 'Fat End Muzzle Brake', weight = 1000, type = 'item', image = 'fat_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    precision_muzzle_brake       = { name = 'precision_muzzle_brake', label = 'Precision Muzzle Brake', weight = 1000, type = 'item', image = 'precision_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    heavy_duty_muzzle_brake      = { name = 'heavy_duty_muzzle_brake', label = 'HD Muzzle Brake', weight = 1000, type = 'item', image = 'heavy_duty_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    slanted_muzzle_brake         = { name = 'slanted_muzzle_brake', label = 'Slanted Muzzle Brake', weight = 1000, type = 'item', image = 'slanted_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    split_end_muzzle_brake       = { name = 'split_end_muzzle_brake', label = 'Split End Muzzle Brake', weight = 1000, type = 'item', image = 'split_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    squared_muzzle_brake         = { name = 'squared_muzzle_brake', label = 'Squared Muzzle Brake', weight = 1000, type = 'item', image = 'squared_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    bellend_muzzle_brake         = { name = 'bellend_muzzle_brake', label = 'Bellend Muzzle Brake', weight = 1000, type = 'item', image = 'bellend_muzzle_brake.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A muzzle brake for a weapon' },
    barrel_attachment            = { name = 'barrel_attachment', label = 'Barrel', weight = 1000, type = 'item', image = 'barrel_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A barrel for a weapon' },
    grip_attachment              = { name = 'grip_attachment', label = 'Grip', weight = 1000, type = 'item', image = 'grip_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A grip for a weapon' },
    comp_attachment              = { name = 'comp_attachment', label = 'Compensator', weight = 1000, type = 'item', image = 'comp_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A compensator for a weapon' },
    luxuryfinish_attachment      = { name = 'luxuryfinish_attachment', label = 'Luxury Finish', weight = 1000, type = 'item', image = 'luxuryfinish_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A luxury finish for a weapon' },
    digicamo_attachment          = { name = 'digicamo_attachment', label = 'Digital Camo', weight = 1000, type = 'item', image = 'digicamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A digital camo for a weapon' },
    brushcamo_attachment         = { name = 'brushcamo_attachment', label = 'Brushstroke Camo', weight = 1000, type = 'item', image = 'brushcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A brushstroke camo for a weapon' },
    woodcamo_attachment          = { name = 'woodcamo_attachment', label = 'Woodland Camo', weight = 1000, type = 'item', image = 'woodcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A woodland camo for a weapon' },
    skullcamo_attachment         = { name = 'skullcamo_attachment', label = 'Skull Camo', weight = 1000, type = 'item', image = 'skullcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A skull camo for a weapon' },
    sessantacamo_attachment      = { name = 'sessantacamo_attachment', label = 'Sessanta Nove Camo', weight = 1000, type = 'item', image = 'sessantacamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A sessanta nove camo for a weapon' },
    perseuscamo_attachment       = { name = 'perseuscamo_attachment', label = 'Perseus Camo', weight = 1000, type = 'item', image = 'perseuscamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A perseus camo for a weapon' },
    leopardcamo_attachment       = { name = 'leopardcamo_attachment', label = 'Leopard Camo', weight = 1000, type = 'item', image = 'leopardcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A leopard camo for a weapon' },
    zebracamo_attachment         = { name = 'zebracamo_attachment', label = 'Zebra Camo', weight = 1000, type = 'item', image = 'zebracamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A zebra camo for a weapon' },
    geocamo_attachment           = { name = 'geocamo_attachment', label = 'Geometric Camo', weight = 1000, type = 'item', image = 'geocamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A geometric camo for a weapon' },
    boomcamo_attachment          = { name = 'boomcamo_attachment', label = 'Boom Camo', weight = 1000, type = 'item', image = 'boomcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A boom camo for a weapon' },
    patriotcamo_attachment       = { name = 'patriotcamo_attachment', label = 'Patriot Camo', weight = 1000, type = 'item', image = 'patriotcamo_attachment.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A patriot camo for a weapon' },

    -- Weapon Tints
    weapontint_0                 = { name = 'weapontint_0', label = 'Default Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Default/Black Weapon Tint' },
    weapontint_1                 = { name = 'weapontint_1', label = 'Green Tint', weight = 1000, type = 'item', image = 'weapontint_green.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Green Weapon Tint' },
    weapontint_2                 = { name = 'weapontint_2', label = 'Gold Tint', weight = 1000, type = 'item', image = 'weapontint_gold.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Gold Weapon Tint' },
    weapontint_3                 = { name = 'weapontint_3', label = 'Pink Tint', weight = 1000, type = 'item', image = 'weapontint_pink.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pink Weapon Tint' },
    weapontint_4                 = { name = 'weapontint_4', label = 'Army Tint', weight = 1000, type = 'item', image = 'weapontint_army.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Army Weapon Tint' },
    weapontint_5                 = { name = 'weapontint_5', label = 'LSPD Tint', weight = 1000, type = 'item', image = 'weapontint_lspd.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'LSPD Weapon Tint' },
    weapontint_6                 = { name = 'weapontint_6', label = 'Orange Tint', weight = 1000, type = 'item', image = 'weapontint_orange.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Orange Weapon Tint' },
    weapontint_7                 = { name = 'weapontint_7', label = 'Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_plat.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Platinum Weapon Tint' },
    weapontint_mk2_0             = { name = 'weapontint_mk2_0', label = 'Classic Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_1             = { name = 'weapontint_mk2_1', label = 'Classic Gray Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Gray Weapon Tint for MK2 Weapons' },
    weapontint_mk2_2             = { name = 'weapontint_mk2_2', label = 'Classic Two-Tone Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Two-Tone Weapon Tint for MK2 Weapons' },
    weapontint_mk2_3             = { name = 'weapontint_mk2_3', label = 'Classic White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_4             = { name = 'weapontint_mk2_4', label = 'Classic Beige Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Beige Weapon Tint for MK2 Weapons' },
    weapontint_mk2_5             = { name = 'weapontint_mk2_5', label = 'Classic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_6             = { name = 'weapontint_mk2_6', label = 'Classic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_7             = { name = 'weapontint_mk2_7', label = 'Classic Earth Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Earth Weapon Tint for MK2 Weapons' },
    weapontint_mk2_8             = { name = 'weapontint_mk2_8', label = 'Classic Brown & Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Classic Brown & Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_9             = { name = 'weapontint_mk2_9', label = 'Red Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Red Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_10            = { name = 'weapontint_mk2_10', label = 'Blue Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Blue Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_11            = { name = 'weapontint_mk2_11', label = 'Yellow Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Yellow Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_12            = { name = 'weapontint_mk2_12', label = 'Orange Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Orange Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_13            = { name = 'weapontint_mk2_13', label = 'Bold Pink Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Pink Weapon Tint for MK2 Weapons' },
    weapontint_mk2_14            = { name = 'weapontint_mk2_14', label = 'Bold Purple & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Purple & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_15            = { name = 'weapontint_mk2_15', label = 'Bold Orange Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Orange Weapon Tint for MK2 Weapons' },
    weapontint_mk2_16            = { name = 'weapontint_mk2_16', label = 'Bold Green & Purple Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Green & Purple Weapon Tint for MK2 Weapons' },
    weapontint_mk2_17            = { name = 'weapontint_mk2_17', label = 'Bold Red Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Red Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_18            = { name = 'weapontint_mk2_18', label = 'Bold Green Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Green Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_19            = { name = 'weapontint_mk2_19', label = 'Bold Cyan Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Cyan Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_20            = { name = 'weapontint_mk2_20', label = 'Bold Yellow Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Yellow Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_21            = { name = 'weapontint_mk2_21', label = 'Bold Red & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Red & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_22            = { name = 'weapontint_mk2_22', label = 'Bold Blue & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Bold Blue & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_23            = { name = 'weapontint_mk2_23', label = 'Metallic Gold Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Gold Weapon Tint for MK2 Weapons' },
    weapontint_mk2_24            = { name = 'weapontint_mk2_24', label = 'Metallic Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Platinum Weapon Tint for MK2 Weapons' },
    weapontint_mk2_25            = { name = 'weapontint_mk2_25', label = 'Metallic Gray & Lilac Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Gray & Lilac Weapon Tint for MK2 Weapons' },
    weapontint_mk2_26            = { name = 'weapontint_mk2_26', label = 'Metallic Purple & Lime Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Purple & Lime Weapon Tint for MK2 Weapons' },
    weapontint_mk2_27            = { name = 'weapontint_mk2_27', label = 'Metallic Red Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Red Weapon Tint for MK2 Weapons' },
    weapontint_mk2_28            = { name = 'weapontint_mk2_28', label = 'Metallic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_29            = { name = 'weapontint_mk2_29', label = 'Metallic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_30            = { name = 'weapontint_mk2_30', label = 'Metallic White & Aqua Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic White & Aqua Weapon Tint for MK2 Weapons' },
    weapontint_mk2_31            = { name = 'weapontint_mk2_31', label = 'Metallic Orange & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Orange & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_32            = { name = 'weapontint_mk2_32', label = 'Metallic Red and Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Metallic Red and Yellow Weapon Tint for MK2 Weapons' },
    -- ITEMS

    -- Ammo ITEMS
    pistol_ammo                  = { name = 'pistol_ammo', label = 'Pistol ammo', weight = 200, type = 'item', image = 'pistol_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Pistols' },
    rifle_ammo                   = { name = 'rifle_ammo', label = 'Rifle ammo', weight = 1000, type = 'item', image = 'rifle_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Rifles' },
    smg_ammo                     = { name = 'smg_ammo', label = 'SMG ammo', weight = 500, type = 'item', image = 'smg_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Sub Machine Guns' },
    shotgun_ammo                 = { name = 'shotgun_ammo', label = 'Shotgun ammo', weight = 500, type = 'item', image = 'shotgun_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Shotguns' },
    mg_ammo                      = { name = 'mg_ammo', label = 'MG ammo', weight = 1000, type = 'item', image = 'mg_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Machine Guns' },
    snp_ammo                     = { name = 'snp_ammo', label = 'Sniper ammo', weight = 1000, type = 'item', image = 'rifle_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for Sniper Rifles' },
    emp_ammo                     = { name = 'emp_ammo', label = 'EMP Ammo', weight = 200, type = 'item', image = 'emp_ammo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Ammo for EMP Launcher' },

    -- Card ITEMS
    id_card                      = { name = 'id_card', label = 'ID Card', weight = 0, type = 'item', image = 'id_card.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'A card containing all your information to identify yourself' },
    idcard                      = { name = 'idcard', label = 'ID Card', weight = 0, type = 'item', image = 'id_card.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'A card containing all your information to identify yourself' },
    driver_license               = { name = 'driver_license', label = 'Drivers License', weight = 0, type = 'item', image = 'driver_license.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'Permit to show you can drive a vehicle' },
    lawyerpass                   = { name = 'lawyerpass', label = 'Lawyer Pass', weight = 0, type = 'item', image = 'lawyerpass.png', unique = true, useable = true, shouldClose = false, combinable = nil, description = 'Pass exclusive to lawyers to show they can represent a suspect' },
    weaponlicense                = { name = 'weaponlicense', label = 'Weapon License', weight = 0, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Weapon License' },
    bank_card                    = { name = 'bank_card', label = 'Bank Card', weight = 0, type = 'item', image = 'bank_card.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Used to access ATM' },
    security_card_01             = { name = 'security_card_01', label = 'Security Card A', weight = 0, type = 'item', image = 'security_card_01.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A security card... I wonder what it goes to' },
    security_card_02             = { name = 'security_card_02', label = 'Security Card B', weight = 0, type = 'item', image = 'security_card_02.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A security card... I wonder what it goes to' },

    -- Eat ITEMS
    tosti                        = { name = 'tosti', label = 'Grilled Cheese Sandwich', weight = 200, type = 'item', image = 'tosti.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nice to eat' },
    twerks_candy                 = { name = 'twerks_candy', label = 'Twerks', weight = 100, type = 'item', image = 'twerks_candy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some delicious candy :O' },
    snikkel_candy                = { name = 'snikkel_candy', label = 'Snikkel', weight = 100, type = 'item', image = 'snikkel_candy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some delicious candy :O' },
    sandwich                     = { name = 'sandwich', label = 'Sandwich', weight = 200, type = 'item', image = 'sandwich.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nice bread for your stomach' },

    -- Drink ITEMS
    water_bottle                 = { name = 'water_bottle', label = 'Bottle of Water', weight = 500, type = 'item', image = 'water_bottle.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },
    coffee                       = { name = 'coffee', label = 'Coffee', weight = 200, type = 'item', image = 'coffee.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pump 4 Caffeine' },
    kurkakola                    = { name = 'kurkakola', label = 'Cola', weight = 500, type = 'item', image = 'cola.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },

    -- Alcohol
    beer                         = { name = 'beer', label = 'Beer', weight = 500, type = 'item', image = 'beer.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Nothing like a good cold beer!' },
    whiskey                      = { name = 'whiskey', label = 'Whiskey', weight = 500, type = 'item', image = 'whiskey.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },
    vodka                        = { name = 'vodka', label = 'Vodka', weight = 500, type = 'item', image = 'vodka.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For all the thirsty out there' },
    grape                        = { name = 'grape', label = 'Grape', weight = 100, type = 'item', image = 'grape.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'Mmmmh yummie, grapes' },
    wine                         = { name = 'wine', label = 'Wine', weight = 300, type = 'item', image = 'wine.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'Some good wine to drink on a fine evening' },
    grapejuice                   = { name = 'grapejuice', label = 'Grape Juice', weight = 200, type = 'item', image = 'grapejuice.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'Grape juice is said to be healthy' },

    -- Drugs
    joint                        = { name = 'joint', label = 'Joint', weight = 0, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Sidney would be very proud at you' },
    cokebaggy                    = { name = 'cokebaggy', label = 'Bag of Coke', weight = 0, type = 'item', image = 'cocaine_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy real quick' },
    crack_baggy                  = { name = 'crack_baggy', label = 'Bag of Crack', weight = 0, type = 'item', image = 'crack_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'To get happy faster' },
    xtcbaggy                     = { name = 'xtcbaggy', label = 'Bag of XTC', weight = 0, type = 'item', image = 'xtc_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pop those pills baby' },
    coke_brick                   = { name = 'coke_brick', label = 'Coke Brick', weight = 1000, type = 'item', image = 'coke_brick.png', unique = true, useable = false, shouldClose = true, combinable = nil, description = 'Heavy package of cocaine, mostly used for deals and takes a lot of space' },
    weed_brick                   = { name = 'weed_brick', label = 'Weed Brick', weight = 1000, type = 'item', image = 'weed_brick.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = '1KG Weed Brick to sell to large customers.' },
    coke_small_brick             = { name = 'coke_small_brick', label = 'Coke Package', weight = 350, type = 'item', image = 'coke_small_brick.png', unique = true, useable = false, shouldClose = true, combinable = nil, description = 'Small package of cocaine, mostly used for deals and takes a lot of space' },
    oxy                          = { name = 'oxy', label = 'Prescription Oxy', weight = 0, type = 'item', image = 'oxy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'The Label Has Been Ripped Off' },
    meth                         = { name = 'meth', label = 'Meth', weight = 100, type = 'item', image = 'meth_baggy.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A baggie of Meth' },
    rolling_paper                = { name = 'rolling_paper', label = 'Rolling Paper', weight = 0, type = 'item', image = 'rolling_paper.png', unique = false, useable = false, shouldClose = true, combinable = { accept = { 'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47' }, reward = 'joint', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'Paper made specifically for encasing and smoking tobacco or cannabis.' },

    -- Seed And Weed
    weed_whitewidow              = { name = 'weed_whitewidow', label = 'White Widow 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g White Widow' },
    weed_skunk                   = { name = 'weed_skunk', label = 'Skunk 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g Skunk' },
    weed_purplehaze              = { name = 'weed_purplehaze', label = 'Purple Haze 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g Purple Haze' },
    weed_ogkush                  = { name = 'weed_ogkush', label = 'OGKush 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g OG Kush' },
    weed_amnesia                 = { name = 'weed_amnesia', label = 'Amnesia 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g Amnesia' },
    weed_ak47                    = { name = 'weed_ak47', label = 'AK47 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed bag with 2g AK47' },
    weed_whitewidow_seed         = { name = 'weed_whitewidow_seed', label = 'White Widow Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed seed of White Widow' },
    weed_skunk_seed              = { name = 'weed_skunk_seed', label = 'Skunk Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Skunk' },
    weed_purplehaze_seed         = { name = 'weed_purplehaze_seed', label = 'Purple Haze Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Purple Haze' },
    weed_ogkush_seed             = { name = 'weed_ogkush_seed', label = 'OGKush Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of OG Kush' },
    weed_amnesia_seed            = { name = 'weed_amnesia_seed', label = 'Amnesia Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Amnesia' },
    weed_ak47_seed               = { name = 'weed_ak47_seed', label = 'AK47 Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of AK47' },
    empty_weed_bag               = { name = 'empty_weed_bag', label = 'Empty Weed Bag', weight = 0, type = 'item', image = 'weed_baggy_empty.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A small empty bag' },
    weed_nutrition               = { name = 'weed_nutrition', label = 'Plant Fertilizer', weight = 2000, type = 'item', image = 'weed_nutrition.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Plant nutrition' },

    -- Material
    plastic                      = { name = 'plastic', label = 'Plastic', weight = 100, type = 'item', image = 'plastic.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'RECYCLE! - Greta Thunberg 2019' },
    metalscrap                   = { name = 'metalscrap', label = 'Metal Scrap', weight = 100, type = 'item', image = 'metalscrap.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'You can probably make something nice out of this' },
    copper                       = { name = 'copper', label = 'Copper', weight = 100, type = 'item', image = 'copper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Nice piece of metal that you can probably use for something' },
    aluminum                     = { name = 'aluminum', label = 'Aluminium', weight = 100, type = 'item', image = 'aluminum.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Nice piece of metal that you can probably use for something' },
    aluminumoxide                = { name = 'aluminumoxide', label = 'Aluminium Powder', weight = 100, type = 'item', image = 'aluminumoxide.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Some powder to mix with' },
    iron                         = { name = 'iron', label = 'Iron', weight = 100, type = 'item', image = 'iron.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Handy piece of metal that you can probably use for something' },
    ironoxide                    = { name = 'ironoxide', label = 'Iron Powder', weight = 100, type = 'item', image = 'ironoxide.png', unique = false, useable = false, shouldClose = false, combinable = { accept = { 'aluminumoxide' }, reward = 'thermite', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Mixing powder..', timeOut = 10000 } }, description = 'Some powder to mix with.' },
    steel                        = { name = 'steel', label = 'Steel', weight = 100, type = 'item', image = 'steel.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Nice piece of metal that you can probably use for something' },
    rubber                       = { name = 'rubber', label = 'Rubber', weight = 100, type = 'item', image = 'rubber.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Rubber, I believe you can make your own rubber ducky with it :D' },
    glass                        = { name = 'glass', label = 'Glass', weight = 100, type = 'item', image = 'glass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'It is very fragile, watch out' },

    -- Tools
    lockpick                     = { name = 'lockpick', label = 'Lockpick', weight = 300, type = 'item', image = 'lockpick.png', unique = false, useable = true, shouldClose = true, combinable = { accept = { 'screwdriverset' }, reward = 'advancedlockpick', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Crafting lockpick', timeOut = 7500, } }, description = 'Very useful if you lose your keys a lot.. or if you want to use it for something else...' },
    advancedlockpick             = { name = 'advancedlockpick', label = 'Advanced Lockpick', weight = 500, type = 'item', image = 'advancedlockpick.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'If you lose your keys a lot this is very useful... Also useful to open your beers' },
    electronickit                = { name = 'electronickit', label = 'Electronic Kit', weight = 100, type = 'item', image = 'electronickit.png', unique = false, useable = true, shouldClose = true, combinable = { accept = { 'gatecrack' }, reward = 'trojan_usb', anim = nil }, description = 'If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?' },
    gatecrack                    = { name = 'gatecrack', label = 'Gatecrack', weight = 0, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Handy software to tear down some fences' },
    thermite                     = { name = 'thermite', label = 'Thermite', weight = 1000, type = 'item', image = 'thermite.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Sometimes you\'d wish for everything to burn' },
    trojan_usb                   = { name = 'trojan_usb', label = 'Trojan USB', weight = 0, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Handy software to shut down some systems' },
    screwdriverset               = { name = 'screwdriverset', label = 'Toolkit', weight = 1000, type = 'item', image = 'screwdriverset.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Very useful to screw... screws...' },
    drill                        = { name = 'drill', label = 'Drill', weight = 20000, type = 'item', image = 'drill.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'The real deal...' },

    -- Vehicle Tools
    nitrous                      = { name = 'nitrous', label = 'Nitrous', weight = 1000, type = 'item', image = 'nitrous.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Speed up, gas pedal! :D' },
    repairkit                    = { name = 'repairkit', label = 'Repairkit', weight = 2500, type = 'item', image = 'repairkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A nice toolbox with stuff to repair your vehicle' },
    advancedrepairkit            = { name = 'advancedrepairkit', label = 'Advanced Repairkit', weight = 4000, type = 'item', image = 'advancedkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A nice toolbox with stuff to repair your vehicle' },
    cleaningkit                  = { name = 'cleaningkit', label = 'Cleaning Kit', weight = 250, type = 'item', image = 'cleaningkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A microfiber cloth with some soap will let your car sparkle again!' },
    tunerlaptop                  = { name = 'tunerlaptop', label = 'Tunerchip', weight = 2000, type = 'item', image = 'tunerchip.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'With this tunerchip you can get your car on steroids... If you know what you\'re doing' },
    harness                      = { name = 'harness', label = 'Race Harness', weight = 1000, type = 'item', image = 'harness.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Racing Harness so no matter what you stay in the car' },
    jerry_can                    = { name = 'jerry_can', label = 'Jerrycan 20L', weight = 20000, type = 'item', image = 'jerry_can.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A can full of Fuel' },
    tirerepairkit                = { name = 'tirerepairkit', label = 'Tire Repair Kit', weight = 1000, type = 'item', image = 'tirerepairkit.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A kit to repair your tires' },

    -- Mechanic Parts
    veh_toolbox                  = { name = 'veh_toolbox', label = 'Toolbox', weight = 1000, type = 'item', image = 'veh_toolbox.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Check vehicle status' },
    veh_armor                    = { name = 'veh_armor', label = 'Armor', weight = 1000, type = 'item', image = 'veh_armor.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle armor' },
    veh_brakes                   = { name = 'veh_brakes', label = 'Brakes', weight = 1000, type = 'item', image = 'veh_brakes.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle brakes' },
    veh_engine                   = { name = 'veh_engine', label = 'Engine', weight = 1000, type = 'item', image = 'veh_engine.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle engine' },
    veh_suspension               = { name = 'veh_suspension', label = 'Suspension', weight = 1000, type = 'item', image = 'veh_suspension.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle suspension' },
    veh_transmission             = { name = 'veh_transmission', label = 'Transmission', weight = 1000, type = 'item', image = 'veh_transmission.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle transmission' },
    veh_turbo                    = { name = 'veh_turbo', label = 'Turbo', weight = 1000, type = 'item', image = 'veh_turbo.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Install vehicle turbo' },
    veh_interior                 = { name = 'veh_interior', label = 'Interior', weight = 1000, type = 'item', image = 'veh_interior.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle interior' },
    veh_exterior                 = { name = 'veh_exterior', label = 'Exterior', weight = 1000, type = 'item', image = 'veh_exterior.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle exterior' },
    veh_wheels                   = { name = 'veh_wheels', label = 'Wheels', weight = 1000, type = 'item', image = 'veh_wheels.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle wheels' },
    veh_neons                    = { name = 'veh_neons', label = 'Neons', weight = 1000, type = 'item', image = 'veh_neons.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle neons' },
    veh_xenons                   = { name = 'veh_xenons', label = 'Xenons', weight = 1000, type = 'item', image = 'veh_xenons.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Upgrade vehicle xenons' },
    veh_tint                     = { name = 'veh_tint', label = 'Tints', weight = 1000, type = 'item', image = 'veh_tint.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Install vehicle tint' },
    veh_plates                   = { name = 'veh_plates', label = 'Plates', weight = 1000, type = 'item', image = 'veh_plates.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Install vehicle plates' },

    -- Medication
    firstaid                     = { name = 'firstaid', label = 'First Aid', weight = 2500, type = 'item', image = 'firstaid.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'You can use this First Aid kit to get people back on their feet' },
    bandage                      = { name = 'bandage', label = 'Bandage', weight = 0, type = 'item', image = 'bandage.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A bandage works every time' },
    ifaks                        = { name = 'ifaks', label = 'ifaks', weight = 200, type = 'item', image = 'ifak.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'ifaks for healing and a complete stress remover.' },
    painkillers                  = { name = 'painkillers', label = 'Painkillers', weight = 0, type = 'item', image = 'painkillers.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'For pain you can\'t stand anymore, take this pill that\'d make you feel great again' },
    walkstick                    = { name = 'walkstick', label = 'Walking Stick', weight = 1000, type = 'item', image = 'walkstick.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Walking stick for ya\'ll grannies out there.. HAHA' },

    -- Communication
    phone                        = { name = 'phone', label = 'Phone', weight = 700, type = 'item', image = 'phone.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = 'Neat phone ya got there' },
    radio                        = { name = 'radio', label = 'Radio', weight = 2000, type = 'item', image = 'radio.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'You can communicate with this through a signal' },
    iphone                       = { name = 'iphone', label = 'iPhone', weight = 1000, type = 'item', image = 'iphone.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Very expensive phone' },
    samsungphone                 = { name = 'samsungphone', label = 'Samsung S10', weight = 1000, type = 'item', image = 'samsungphone.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Very expensive phone' },
    laptop                       = { name = 'laptop', label = 'Laptop', weight = 4000, type = 'item', image = 'laptop.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Expensive laptop' },
    tablet                       = { name = 'tablet', label = 'Tablet', weight = 2000, type = 'item', image = 'tablet.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Expensive tablet' },
    fitbit                       = { name = 'fitbit', label = 'Fitbit', weight = 500, type = 'item', image = 'fitbit.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'I like fitbit' },
    radioscanner                 = { name = 'radioscanner', label = 'Radio Scanner', weight = 1000, type = 'item', image = 'radioscanner.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'With this you can get some police alerts. Not 100% effective however' },
    pinger                       = { name = 'pinger', label = 'Pinger', weight = 1000, type = 'item', image = 'pinger.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'With a pinger and your phone you can send out your location' },
    cryptostick                  = { name = 'cryptostick', label = 'Crypto Stick', weight = 200, type = 'item', image = 'cryptostick.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Why would someone ever buy money that doesn\'t exist.. How many would it contain..?' },

    -- Theft and Jewelry
    rolex                        = { name = 'rolex', label = 'Golden Watch', weight = 1500, type = 'item', image = 'rolex.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A golden watch seems like the jackpot to me!' },
    diamond_ring                 = { name = 'diamond_ring', label = 'Diamond Ring', weight = 1500, type = 'item', image = 'diamond_ring.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A diamond ring seems like the jackpot to me!' },
    diamond                      = { name = 'diamond', label = 'Diamond', weight = 1000, type = 'item', image = 'diamond.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A diamond seems like the jackpot to me!' },
    goldchain                    = { name = 'goldchain', label = 'Golden Chain', weight = 1500, type = 'item', image = 'goldchain.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'A golden chain seems like the jackpot to me!' },
    tenkgoldchain                = { name = '10kgoldchain', label = '10k Gold Chain', weight = 2000, type = 'item', image = '10kgoldchain.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = '10 carat golden chain' },
    goldbar                      = { name = 'goldbar', label = 'Gold Bar', weight = 7000, type = 'item', image = 'goldbar.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Looks pretty expensive to me' },

    -- Cops Tools
    armor                        = { name = 'armor', label = 'Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some protection won\'t hurt... right?' },
    heavyarmor                   = { name = 'heavyarmor', label = 'Heavy Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Some protection won\'t hurt... right?' },
    handcuffs                    = { name = 'handcuffs', label = 'Handcuffs', weight = 100, type = 'item', image = 'handcuffs.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Comes in handy when people misbehave. Maybe it can be used for something else?' },
    police_stormram              = { name = 'police_stormram', label = 'Stormram', weight = 18000, type = 'item', image = 'police_stormram.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A nice tool to break into doors' },
    empty_evidence_bag           = { name = 'empty_evidence_bag', label = 'Empty Evidence Bag', weight = 0, type = 'item', image = 'evidence_empty.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Used a lot to keep DNA from blood, bullet shells and more' },
    filled_evidence_bag          = { name = 'filled_evidence_bag', label = 'Evidence Bag', weight = 200, type = 'item', image = 'evidence.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = 'A filled evidence bag to see who committed the crime >:(' },

    -- Firework Tools
    firework1                    = { name = 'firework1', label = '2Brothers', weight = 1000, type = 'item', image = 'firework1.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },
    firework2                    = { name = 'firework2', label = 'Poppelers', weight = 1000, type = 'item', image = 'firework2.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },
    firework3                    = { name = 'firework3', label = 'WipeOut', weight = 1000, type = 'item', image = 'firework3.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },
    firework4                    = { name = 'firework4', label = 'Weeping Willow', weight = 1000, type = 'item', image = 'firework4.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Fireworks' },

    -- Sea Tools
    dendrogyra_coral             = { name = 'dendrogyra_coral', label = 'Dendrogyra', weight = 1000, type = 'item', image = 'dendrogyra_coral.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Its also known as pillar coral' },
    antipatharia_coral           = { name = 'antipatharia_coral', label = 'Antipatharia', weight = 1000, type = 'item', image = 'antipatharia_coral.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Its also known as black corals or thorn corals' },
    diving_gear                  = { name = 'diving_gear', label = 'Diving Gear', weight = 30000, type = 'item', image = 'diving_gear.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'An oxygen tank and a rebreather' },
    diving_fill                  = { name = 'diving_fill', label = 'Diving Tube', weight = 3000, type = 'item', image = 'diving_tube.png', unique = true, useable = true, shouldClose = true, combinable = nil, discription = 'An oxygen tube and a rebreather' },

    -- Other Tools
    casinochips                  = { name = 'casinochips', label = 'Casino Chips', weight = 0, type = 'item', image = 'casinochips.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Chips For Casino Gambling' },
    stickynote                   = { name = 'stickynote', label = 'Sticky note', weight = 0, type = 'item', image = 'stickynote.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = 'Sometimes handy to remember something :)' },
    moneybag                     = { name = 'moneybag', label = 'Money Bag', weight = 0, type = 'item', image = 'moneybag.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A bag with cash' },
    parachute                    = { name = 'parachute', label = 'Parachute', weight = 30000, type = 'item', image = 'parachute.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'The sky is the limit! Woohoo!' },
    binoculars                   = { name = 'binoculars', label = 'Binoculars', weight = 600, type = 'item', image = 'binoculars.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Sneaky Breaky...' },
    lighter                      = { name = 'lighter', label = 'Lighter', weight = 0, type = 'item', image = 'lighter.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'On new years eve a nice fire to stand next to' },
    certificate                  = { name = 'certificate', label = 'Certificate', weight = 0, type = 'item', image = 'certificate.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'Certificate that proves you own certain stuff' },
    markedbills                  = { name = 'markedbills', label = 'Marked Money', weight = 1000, type = 'item', image = 'markedbills.png', unique = true, useable = false, shouldClose = true, combinable = nil, description = 'Money?' },
    labkey                       = { name = 'labkey', label = 'Key', weight = 500, type = 'item', image = 'labkey.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Key for a lock...?' },
    printerdocument              = { name = 'printerdocument', label = 'Document', weight = 500, type = 'item', image = 'printerdocument.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A nice document' },
    newscam                      = { name = 'newscam', label = 'News Camera', weight = 100, type = 'item', image = 'newscam.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A camera for the news' },
    newsmic                      = { name = 'newsmic', label = 'News Microphone', weight = 100, type = 'item', image = 'newsmic.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A microphone for the news' },
    newsbmic                     = { name = 'newsbmic', label = 'Boom Microphone', weight = 100, type = 'item', image = 'newsbmic.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A Useable BoomMic' },
    classic_phone = {
        name = "classic_phone",
        label = "Classic Phone",
        weight = 700,
        type = "item",
        image = "classic_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    black_phone = {
        name = "black_phone",
        label = "Black Phone",
        weight = 700,
        type = "item",
        image = "black_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    blue_phone = {
        name = "blue_phone",
        label = "Blue Phone",
        weight = 700,
        type = "item",
        image = "blue_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    gold_phone = {
        name = "gold_phone",
        label = "Gold Phone",
        weight = 700,
        type = "item",
        image = "gold_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    red_phone = {
        name = "red_phone",
        label = "Red Phone",
        weight = 700,
        type = "item",
        image = "red_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    green_phone = {
        name = "green_phone",
        label = "Green Phone",
        weight = 700,
        type = "item",
        image = "green_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    greenlight_phone = {
        name = "greenlight_phone",
        label = "Green Light Phone",
        weight = 700,
        type = "item",
        image = "greenlight_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    pink_phone = {
        name = "pink_phone",
        label = "Pink Phone",
        weight = 700,
        type = "item",
        image = "pink_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    white_phone = {
        name = "white_phone",
        label = "White Phone",
        weight = 700,
        type = "item",
        image = "white_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_phone = {
        name = "wet__phone",
        label = "Wet Phone",
        weight = 700,
        type = "item",
        image = "wet_classic_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_classic_phone = {
        name = "wet_classic_phone",
        label = "Wet Classic Phone",
        weight = 700,
        type = "item",
        image = "wet_classic_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_black_phone = {
        name = "wet_black_phone",
        label = "Wet Black Phone",
        weight = 700,
        type = "item",
        image = "wet_black_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_blue_phone = {
        name = "wet_blue_phone",
        label = "Wet Blue Phone",
        weight = 700,
        type = "item",
        image = "wet_blue_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_gold_phone = {
        name = "wet_gold_phone",
        label = "Wet Gold Phone",
        weight = 700,
        type = "item",
        image = "wet_gold_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_red_phone = {
        name = "wet_red_phone",
        label = "Wet Red Phone",
        weight = 700,
        type = "item",
        image = "wet_red_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_green_phone = {
        name = "wet_green_phone",
        label = "Wet Green Phone",
        weight = 700,
        type = "item",
        image = "wet_green_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_greenlight_phone = {
        name = "wet_greenlight_phone",
        label = "Wet Green Light Phone",
        weight = 700,
        type = "item",
        image = "wet_greenlight_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_pink_phone = {
        name = "wet_pink_phone",
        label = "Wet Pink Phone",
        weight = 700,
        type = "item",
        image = "wet_pink_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_white_phone = {
        name = "wet_white_phone",
        label = "Wet White Phone",
        weight = 700,
        type = "item",
        image = "wet_white_phone.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    phone_hack = {
        name = "phone_hack",
        label = "Phone Hack",
        weight = 300,
        type = "item",
        image = "phone_hack.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "With this chip, you can access hidden areas of Discord."
    },
    
    phone_module = {
        name = "phone_module",
        label = "Phone Module",
        weight = 300,
        type = "item",
        image = "phone_module.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "It seems that we can fix a wet phone with this module, interesting."
    },
    
    powerbank = {
        name = "powerbank",
        label = "Power Bank",
        weight = 150,
        type = "item",
        image = "powerbank.png",
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = "Incredible portable charger!"
    },

    spikespack 			 = {name = 'spikespack', 				label = 'Spikes Pack', 				weight = 0, 		type = 'item', 		image = 'spikespack.png', 		unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'A 5 spikes pack for your needs.'},
	nikon 			 	 	     = {name = 'nikon', 					    label = 'Nikoff G900', 				weight = 1000, 		type = 'item', 		image = 'nikon.png', 				unique = true, 	useable = true, 	shouldClose = true,    combinable = nil,   description = 'Caught in 4K'},
	gsrtestkit					 = {name= "gsrtestkit", 			  		label= "GSR Field Test Kit", 		weight= 200, 		type= "item", 		image= "gsrtestkit.png", 			unique= false,		useable= true, 	shouldClose= true,	   combinable= nil,   description= 'A field GSR test kit containing several test strips'},
	dnatestkit					 = {name= "dnatestkit", 			  		label= "DNA Field Swab Kit", 		weight= 200, 		type= "item", 		image= "dnatestkit.png", 			unique= false,		useable= true, 	shouldClose= true,	   combinable= nil,   description= 'A field DNA swab kit containing several vials and swabs'},
	drugtestkit				 = {name= "drugtestkit", 			  		label= "Drug Test Kit", 			weight= 200, 		type= "item", 		image= "drugtestkit.png", 			unique= false,		useable= true, 	shouldClose= true,	   combinable= nil,   description= 'A multipanel field test kit used to test for popular drugs in a suspects saliva, it\'s probably accurate.'},
	breathalyzer				 = {name= "breathalyzer", 			  		label= "Breathalyzer", 			weight= 200, 		type= "item", 		image= "breathalyzer.png", 		unique= false,		useable= true, 	shouldClose= true,	   combinable= nil,   description= 'A vintage 2000\'s WiWang breathalyzer engraved Property of LSPD'},
	accesstool					 = {name = 'accesstool', 					label = 'Access Tool',			 	weight = 500, 		type = 'item', 		image = 'accesstool.png', 			unique = true,		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Snap into an access tool.'},
	fingerprintreader			 = {name= "fingerprintreader", 			label= "Pro Tech XFR8001", 		weight= 200, 		type= "item", 		image= "fingerprintreader.png", 	unique= true,		useable= true, 	shouldClose= true,	   combinable= nil,   description= 'A Pro Tech mobile fingerprint reader that looks like it\'s seen better days, currently stuck in french.'},
	sdcard 			 	 	     = {name = 'sdcard', 					    label = 'SD Card', 				weight = 1000, 		type = 'item', 		image = 'sdcard.png', 				unique = true, 	useable = true, 	shouldClose = true,    combinable = nil,   description = 'People still use these??'},
    tshirt 						 = {name = 'tshirt', 						label = 'T-shirt', 					weight = 0, 		type = 'item', 		image = 'tshirt.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Tshirt'},
    torso 						 = {name = 'torso', 						label = 'Torso', 					weight = 0, 		type = 'item', 		image = 'torso.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Torso'},
    arms 						 = {name = 'arms', 							label = 'Arms', 					weight = 0, 		type = 'item', 		image = 'arms.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Arms'},
    jeans 						 = {name = 'jeans', 						label = 'Jeans', 					weight = 0, 		type = 'item', 		image = 'jeans.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Jeans'},
    shoes 						 = {name = 'shoes', 						label = 'Shoes', 					weight = 0, 		type = 'item', 		image = 'shoes.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Shoes'},
    mask 						 = {name = 'mask', 							label = 'Mask', 					weight = 0, 		type = 'item', 		image = 'mask.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Mask'},
    ears 						 = {name = 'ears', 							label = 'Ears', 					weight = 0, 		type = 'item', 		image = 'ears.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Ears'},
    glasses 					         = {name = 'glasses', 						label = 'Glasses', 					weight = 0, 		type = 'item', 		image = 'glasses.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Glasses'},
    helmet 						 = {name = 'helmet', 						label = 'Helmet', 					weight = 0, 		type = 'item', 		image = 'helmet.png', 			unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Helmet'},
    bag 						 = {name = 'bag', 							label = 'Bag', 					weight = 0, 		type = 'item', 		image = 'bag.png', 				unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Bag'},
    body_cam                     = {name = "body_cam", label = "Body Cam", weight = 0, type = 'item', 		image = 'bodycam.png', 				unique = true, 		useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Body cam for law enforcers'},

    bandageg = { name = 'bandageg', label = 'Bandage', weight = 500, type = 'item', image = 'bandageg.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'edit here' },
    gauze = { name = 'gauze', label = 'Gauze', weight = 500, type = 'item', image = 'gauze.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    tape = { name = 'tape', label = 'Tape', weight = 500, type = 'item', image = 'tape.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    surgical_tray = { name = 'surgical_tray', label = 'Surgical tray', weight = 500, type = 'item', image = 'surgical_tray.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    iodine = { name = 'iodine', label = 'Iodine', weight = 500, type = 'item', image = 'iodine.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    syringe = { name = 'syringe', label = 'Syringe', weight = 500, type = 'item', image = 'syringe.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    forceps = { name = 'forceps', label = 'Forceps', weight = 500, type = 'item', image = 'forceps.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    pill = { name = 'pill', label = 'Pill', weight = 500, type = 'item', image = 'pill.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    surgical_gloves = { name = 'surgical_gloves', label = 'Surgical gloves', weight = 500, type = 'item', image = 'surgical_gloves.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },
    surgical_staple = { name = 'surgical_staple', label = 'Surgical staple', weight = 500, type = 'item', image = 'surgical_staple.png', unique = false, useable = false, shouldClose = true, combinable = nil, description = 'edit here' },

    spray = {
        name = 'spray',
        label = 'Spray Paint',
        weight = 300,
        type = 'item',
        image = 'spray.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Spray Anywhere Boys'
    },
    
    spray_remover = {
        name = 'spray_remover',
        label = 'Spray Removal Kit',
        weight = 300,
        type = 'item',
        image = 'spray_remover.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Remove the sprays, increase the heat btw gangs!'
    },

    syphoningkit = {
        name = 'syphoningkit',
        label = 'Syphoning Kit',
        weight = 5000,
        type = 'item',
        image = 'syphoningkit.png',
        unique = true,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'A kit made to siphon gasoline from vehicles.'
    },
    
    jerrycan = {
        name = 'jerrycan',
        label = 'Jerry Can',
        weight = 15000,
        type = 'item',
        image = 'jerrycan.png',
        unique = true,
        useable = true,
        shouldClose = false,
        combinable = nil,
        description = 'A Jerry Can made to hold gasoline.'
    },

    thermite_bomb = {
        name = 'thermite_bomb',
        label = 'Thermite Bomb',
        weight = 100,
        type = 'item',
        image = 'thermite.png',
        unique = false,
        useable = false,
        shouldClose = true,
        combinable = nil,
        description = 'Explosive'
    },
    
    c4_bomb = {
        name = 'c4_bomb',
        label = 'C4 Bomb',
        weight = 220,
        type = 'item',
        image = 'np_c4.png',
        unique = false,
        useable = false,
        shouldClose = true,
        combinable = nil,
        description = 'Explosive'
    },
    
    cutter = {
        name = 'cutter',
        label = 'Cutter',
        weight = 15000,
        type = 'item',
        image = 'trimming_scissors.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Cutter.'
    },
    
    bag = {
        name = 'bag',
        label = 'Bag',
        weight = 10,
        type = 'item',
        image = 'bag.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Bag.'
    },
    
    drill = {
        name = 'drill',
        label = 'Drill',
        weight = 20000,
        type = 'item',
        image = 'drill.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'The real deal...'
    },
    
    goldbar = {
        name = 'goldbar',
        label = 'Gold Bar',
        weight = 500,
        type = 'item',
        image = 'goldbar.png',
        unique = false,
        useable = false,
        shouldClose = true,
        combinable = nil,
        description = 'Looks pretty expensive to me'
    },
    
    paintingg = {
        name = 'paintingg',
        label = 'Painting G',
        weight = 120,
        type = 'item',
        image = 'paintingg.png',
        unique = false,
        useable = false,
        shouldClose = true,
        combinable = nil,
        description = 'Painting G'
    },
    
    paintingf = {
        name = 'paintingf',
        label = 'Painting F',
        weight = 120,
        type = 'item',
        image = 'paintingf.png',
        unique = false,
        useable = false,
        shouldClose = true,
        combinable = nil,
        description = 'Painting F'
    },

    -- BurgerShot
    -- Big Size
burgershot_bagbig = {
    name = 'burgershot_bagbig',
    label = 'Big Size Package',
    weight = 100,
    type = 'item',
    image = 'burgershot_bagbig.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "1x Big King, 1x Big Size Cola, 1x Big Size Patato"
},

burgershot_bigking = {
    name = 'burgershot_bigking',
    label = 'Big King Burger',
    weight = 100,
    type = 'item',
    image = 'burgershot_bigking.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Big King"
},

burgershot_colab = {
    name = 'burgershot_colab',
    label = 'Big Size Cola',
    weight = 100,
    type = 'item',
    image = 'burgershot_colab.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Big Size Cola"
},

burgershot_patatob = {
    name = 'burgershot_patatob',
    label = 'Big Size Patato',
    weight = 100,
    type = 'item',
    image = 'burgershot_patatob.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Big Size Patato"
},

-- Small Size
burgershot_bagsmall = {
    name = 'burgershot_bagsmall',
    label = 'Small Size Package',
    weight = 100,
    type = 'item',
    image = 'burgershot_bagsmall.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "1x Bleeder Burger, 1x Small Size Cola, 1x Small Size Patato"
},

burgershot_bleeder = {
    name = 'burgershot_bleeder',
    label = 'Bleeder Burger',
    weight = 100,
    type = 'item',
    image = 'burgershot_bleeder.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Bleeder Burger"
},

burgershot_colas = {
    name = 'burgershot_colas',
    label = 'Small Size Cola',
    weight = 100,
    type = 'item',
    image = 'burgershot_colas.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Small Size Cola"
},

burgershot_patatos = {
    name = 'burgershot_patatos',
    label = 'Small Size Patato',
    weight = 100,
    type = 'item',
    image = 'burgershot_patatos.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Small Size Patato"
},

-- Goat Menu (Big Kola)
burgershot_baggoat = {
    name = 'burgershot_baggoat',
    label = 'Goat Menu Package',
    weight = 100,
    type = 'item',
    image = 'burgershot_baggoat.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "1x Goat Wrap, 1x Big Size Cola, 1x Shot Nuggets, 1x Shot Rings"
},

burgershot_goatwrap = {
    name = 'burgershot_goatwrap',
    label = 'Goat Wrap',
    weight = 100,
    type = 'item',
    image = 'burgershot_goatwrap.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Goat Wrap"
},

burgershot_shotnuggets = {
    name = 'burgershot_shotnuggets',
    label = 'Shot Nuggets',
    weight = 100,
    type = 'item',
    image = 'burgershot_shotnuggets.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Shot Nuggets"
},

burgershot_shotrings = {
    name = 'burgershot_shotrings',
    label = 'Shot Rings',
    weight = 100,
    type = 'item',
    image = 'burgershot_shotrings.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Shot Rings"
},

-- Coffee Menu
burgershot_bagcoffe = {
    name = 'burgershot_bagcoffe',
    label = 'Coffee Package',
    weight = 100,
    type = 'item',
    image = 'burgershot_bagcoffe.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "1x Coffee, 1x Macaroon"
},

burgershot_coffee = {
    name = 'burgershot_coffee',
    label = 'Burger Shot Coffee',
    weight = 100,
    type = 'item',
    image = 'burgershot_coffee.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Burger Shot Coffee"
},

burgershot_macaroon = {
    name = 'burgershot_macaroon',
    label = 'Macaroon',
    weight = 100,
    type = 'item',
    image = 'burgershot_macaroon.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Macaroon"
},

-- Toys
burgershot_toy1 = {
    name = 'burgershot_toy1',
    label = 'Burger Shot Toy',
    weight = 100,
    type = 'item',
    image = 'burgershot_toy1.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Burger Shot Toy"
},

burgershot_toy2 = {
    name = 'burgershot_toy2',
    label = 'Burger Shot Toy',
    weight = 100,
    type = 'item',
    image = 'burgershot_toy2.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Burger Shot Toy"
},

burgershot_toy3 = {
    name = 'burgershot_toy3',
    label = 'Burger Shot Toy',
    weight = 100,
    type = 'item',
    image = 'burgershot_toy3.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Burger Shot Toy"
},

burgershot_toy4 = {
    name = 'burgershot_toy4',
    label = 'Burger Shot Toy',
    weight = 100,
    type = 'item',
    image = 'burgershot_toy4.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Burger Shot Toy"
},

burgershot_toy5 = {
    name = 'burgershot_toy5',
    label = 'Burger Shot Toy',
    weight = 100,
    type = 'item',
    image = 'burgershot_toy5.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Burger Shot Toy"
},

burgershot_toy6 = {
    name = 'burgershot_toy6',
    label = 'Burger Shot Toy',
    weight = 100,
    type = 'item',
    image = 'burgershot_toy6.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Burger Shot Toy"
},

-- Fridge Items
burgershot_tomato = {
    name = 'burgershot_tomato',
    label = 'Tomato',
    weight = 100,
    type = 'item',
    image = 'burgershot_tomato.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Tomato"
},

burgershot_cheddar = {
    name = 'burgershot_cheddar',
    label = 'Cheddar',
    weight = 100,
    type = 'item',
    image = 'burgershot_cheddar.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Cheddar"
},

burgershot_curly = {
    name = 'burgershot_curly',
    label = 'Curly',
    weight = 100,
    type = 'item',
    image = 'burgershot_curly.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Curly"
},

burgershot_sauce = {
    name = 'burgershot_sauce',
    label = 'Sauce',
    weight = 100,
    type = 'item',
    image = 'burgershot_sauce.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Sauce"
},

burgershot_bread = {
    name = 'burgershot_bread',
    label = 'Bread',
    weight = 100,
    type = 'item',
    image = 'burgershot_bread.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Bread"
},

burgershot_lavash = {
    name = 'burgershot_lavash',
    label = 'Lavash',
    weight = 100,
    type = 'item',
    image = 'burgershot_lavash.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Lavash"
},

burgershot_bigcardboard = {
    name = 'burgershot_bigcardboard',
    label = 'Big Size Cardboard',
    weight = 100,
    type = 'item',
    image = 'burgershot_bigcardboard.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Big Size Cardboard"
},

burgershot_smallcardboard = {
    name = 'burgershot_smallcardboard',
    label = 'Small Size Cardboard',
    weight = 100,
    type = 'item',
    image = 'burgershot_smallcardboard.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Small Size Cardboard"
},

burgershot_smallemptyglass = {
    name = 'burgershot_smallemptyglass',
    label = 'Small Size Empty Glass',
    weight = 100,
    type = 'item',
    image = 'burgershot_smallemptyglass.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Small Size Empty Glass"
},

burgershot_bigemptyglass = {
    name = 'burgershot_bigemptyglass',
    label = 'Big Size Empty Glass',
    weight = 100,
    type = 'item',
    image = 'burgershot_bigemptyglass.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Big Size Empty Glass"
},

burgershot_coffeeemptyglass = {
    name = 'burgershot_coffeeemptyglass',
    label = 'Coffee Empty Glass',
    weight = 100,
    type = 'item',
    image = 'burgershot_coffeeemptyglass.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Coffee Empty Glass"
},

burgershot_frozenmeat = {
    name = 'burgershot_frozenmeat',
    label = 'Frozen Meat',
    weight = 100,
    type = 'item',
    image = 'burgershot_frozenmeat.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Frozen Meat"
},

burgershot_frozenrings = {
    name = 'burgershot_frozenrings',
    label = 'Frozen Rings',
    weight = 100,
    type = 'item',
    image = 'burgershot_frozenrings.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Frozen Rings"
},

burgershot_frozennuggets = {
    name = 'burgershot_frozennuggets',
    label = 'Frozen Nuggets',
    weight = 100,
    type = 'item',
    image = 'burgershot_frozennuggets.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Frozen Nuggets"
},

burgershot_smallfrozenpotato = {
    name = 'burgershot_smallfrozenpotato',
    label = 'Small Size Frozen Potato',
    weight = 100,
    type = 'item',
    image = 'burgershot_smallfrozenpotato.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Small Size Frozen Potato"
},

burgershot_bigfrozenpotato = {
    name = 'burgershot_bigfrozenpotato',
    label = 'Big Size Frozen Potato',
    weight = 100,
    type = 'item',
    image = 'burgershot_bigfrozenpotato.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Big Size Frozen Potato"
},

burgershot_meat = {
    name = 'burgershot_meat',
    label = 'Meat',
    weight = 100,
    type = 'item',
    image = 'burgershot_meat.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Meat"
},

-- Ice Cream
burgershot_thesmurfsicecream = {
    name = 'burgershot_thesmurfsicecream',
    label = 'The Smurfs Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_thesmurfsicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "The Smurfs Ice Cream"
},

burgershot_smurfetteicecream = {
    name = 'burgershot_smurfetteicecream',
    label = 'Smurfette Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_smurfetteicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Smurfette Ice Cream"
},

burgershot_matchaicecream = {
    name = 'burgershot_matchaicecream',
    label = 'Matcha Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_matchaicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Matcha Ice Cream"
},

burgershot_ubeicecream = {
    name = 'burgershot_ubeicecream',
    label = 'Ube Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_ubeicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Ube Ice Cream"
},

burgershot_unicornicecream = {
    name = 'burgershot_unicornicecream',
    label = 'Unicorn Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_unicornicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Unicorn Ice Cream"
},

burgershot_vanillaicecream = {
    name = 'burgershot_vanillaicecream',
    label = 'Vanilla Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_vanillaicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Vanilla Ice Cream"
},

burgershot_chocolateicecream = {
    name = 'burgershot_chocolateicecream',
    label = 'Chocolate Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_chocolateicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Chocolate Ice Cream"
},

burgershot_strawberryicecream = {
    name = 'burgershot_strawberryicecream',
    label = 'Strawberry Ice Cream',
    weight = 100,
    type = 'item',
    image = 'burgershot_strawberryicecream.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Strawberry Ice Cream"
},

burgershot_icecreamcone = {
    name = 'burgershot_icecreamcone',
    label = 'Empty Cone',
    weight = 100,
    type = 'item',
    image = 'burgershot_icecreamcone.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Cone"
},

cctv_tablet = {
    name = 'cctv_tablet',
    label = 'CCTV Tablet',
    weight = 100,
    type = 'item',
    image = 'cctv_tablet.png',
    unique = true,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = "Tablet where we can see things ahaha"
},

weapon_digiscanner           = { name = 'weapon_digiscanner', label = 'Key Frequency Radar', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_digiscanner.png', unique = true, useable = false, description = '' },
car_wheel                    = { name = 'car_wheel',    label = 'Car Wheel',        weight = 10000,     type = 'item',  image = 'car_wheel.png',     unique = false,     useable = false,    shouldClose = true, combinable = nil, description = '' },
car_door                     = { name = 'car_door',     label = 'Car Door',         weight = 10000,     type = 'item',  image = 'car_door.png',      unique = false,     useable = false,    shouldClose = true, combinable = nil, description = '' },
radiator                     = { name = 'radiator',     label = 'Car Radiator',     weight = 10000,     type = 'item',  image = 'car_radiator.png',  unique = true,      useable = true,     shouldClose = true, combinable = nil, description = '' },
trunk                        = { name = 'trunk',        label = 'Car Trunk',        weight = 10000,     type = 'item',  image = 'car_trunk.png',     unique = true,      useable = true,     shouldClose = true, combinable = nil, discription = '' },

rfid_disruptor = {
    name = 'rfid_disruptor',
    label = 'RFID Disruptor',
    weight = 1000,
    type = 'item',
    image = 'rfid_disruptor.png',
    unique = false,
    useable = true,
    shouldClose = false,
    combinable = nil,
    description = 'A Disruptor used for ATM firewalls'
},

potato = {
    name = 'potato',
    label = 'Potato',
    weight = 350,
    type = 'item',
    image = 'potato.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Po-ta-to'
},
dirty_potato = {
    name = 'dirty_potato',
    label = 'Dirty Potato',
    weight = 350,
    type = 'item',
    image = 'dirty_potato.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Po-ta-to'
},
tomato = {
    name = 'tomato',
    label = 'Tomato',
    weight = 350,
    type = 'item',
    image = 'tomato.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'To-ma-to'
},
dirty_tomato = {
    name = 'dirty_tomato',
    label = 'Dirty Tomato',
    weight = 350,
    type = 'item',
    image = 'dirty_tomato.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'To-ma-to'
},
coffee_beans = {
    name = 'coffee_beans',
    label = 'Coffee Beans',
    weight = 350,
    type = 'item',
    image = 'coffee_beans.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Wakey wakey!'
},
dirty_coffee_beans = {
    name = 'dirty_coffee_beans',
    label = 'Dirty Coffee Beans',
    weight = 350,
    type = 'item',
    image = 'dirty_coffee_beans.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Wakey wakey!'
},
cabbage = {
    name = 'cabbage',
    label = 'Cabbage',
    weight = 350,
    type = 'item',
    image = 'cabbage.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Let-tuce? No!'
},
dirty_cabbage = {
    name = 'dirty_cabbage',
    label = 'Dirty Cabbage',
    weight = 350,
    type = 'item',
    image = 'dirty_cabbage.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Let-tuce? No!'
},
orange = {
    name = 'orange',
    label = 'Orange',
    weight = 350,
    type = 'item',
    image = 'orange.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'The talking orange!'
},
dirty_orange = {
    name = 'dirty_orange',
    label = 'Dirty Orange',
    weight = 350,
    type = 'item',
    image = 'dirty_orange.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'The talking orange!'
},
trowel = {
    name = 'trowel',
    label = 'Trowel',
    weight = 350,
    type = 'item',
    image = 'trowel.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Mini-shovel yes'
},
shovel = {
    name = 'shovel',
    label = 'Shovel',
    weight = 350,
    type = 'item',
    image = 'shovel.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Legit shovel yes'
},
wallet = {
    name = 'wallet',
    label = 'Wallet',
    weight = 350,
    type = 'item',
    image = 'wallet.png',
    unique = false,
    useable = false,
    shouldClose = true,
    combinable = nil,
    description = 'Dont Leave it ANYWHERE!'
},

['delivery_food']                 = {['name'] = 'delivery_food',                   ['label'] = 'Delivery Food',                  ['weight'] = 300,          ['type'] = 'item',         ['image'] = 'burgershot_bagbig.png',         ['unique'] = true,          ['useable'] = false,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Grab food!?'},
['burger']                 = {['name'] = 'burger',                   ['label'] = 'Burger',                  ['weight'] = 300,          ['type'] = 'item',         ['image'] = 'burger.png',         ['unique'] = true,          ['useable'] = false,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'nom nom'},

["bands"] = {
    name = "bands",
    label = "Band Of Notes",
    weight = 100,
    type = "item",
    image = "cashstack.png",
    unique = false,
    useable = false,
    shouldClose = false,
    combinable = nil,
    description = "A band of small notes.."
},
["rolls"] = {
    name = "rolls",
    label = "Roll Of Small Notes",
    weight = 100,
    type = "item",
    image = "cashroll.png",
    unique = false,
    useable = false,
    shouldClose = false,
    combinable = nil,
    description = "A roll of small notes.."
},
["package"] = {
    name = "package",
    label = "Suspicious Package",
    weight = 10000,
    type = "item",
    image = "package.png",
    unique = true,
    useable = true,
    shouldClose = false,
    combinable = nil,
    description = "A mysterious package.. Scary!"
},
['weedbud'] 				     = {['name'] = 'weedbud', 			 		['label'] = 'Weed Bud', 					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weedbud.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A small 2g weed bud..'},
["weedpackage"] 					 = {["name"] = "weedpackage", 			 	["label"] = "Weed Package", 		        ["weight"] = 15000, 		["type"] = "item", 		["image"] = "weedpackage.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A large & hastly sealed package with a herbal aroma"},
["sealedpackage"] = {["name"] = "sealedpackage", ["label"] = "Sealed Package", ["weight"] = 15000, ["type"] = "item", 		["image"] = "sealedpackage.png", ["unique"] = true, ["useable"] = true, ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "A heavy water-sealed package"},
	-- jim-mining stuff
    ["stone"] 		 	 			 = {["name"] = "stone",           				["label"] = "Stone",	 				["weight"] = 2000, 	    ["type"] = "item", 		["image"] = "stone.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Stone woo"},

    ["uncut_emerald"] 				 = {["name"] = "uncut_emerald", 			  	["label"] = "Uncut Emerald", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_emerald.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Emerald"},
    ["uncut_ruby"] 					 = {["name"] = "uncut_ruby", 			  	  	["label"] = "Uncut Ruby", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_ruby.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Ruby"},
    ["uncut_diamond"] 				 = {["name"] = "uncut_diamond", 			  	["label"] = "Uncut Diamond", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_diamond.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Diamond"},
    ["uncut_sapphire"] 				 = {["name"] = "uncut_sapphire", 			  	["label"] = "Uncut Sapphire", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "uncut_sapphire.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A rough Sapphire"},
    
    ["emerald"] 					 = {["name"] = "emerald", 			  	  		["label"] = "Emerald", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "emerald.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Emerald that shimmers"},
    ["ruby"] 						 = {["name"] = "ruby", 			  	  			["label"] = "Ruby", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "ruby.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Ruby that shimmers"},
    ["diamond"] 					 = {["name"] = "diamond", 			  	  		["label"] = "Diamond", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "diamond.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Diamond that shimmers"},
    ["sapphire"] 					 = {["name"] = "sapphire", 			  	  		["label"] = "Sapphire",					["weight"] = 100, 		["type"] = "item", 		["image"] = "sapphire.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A Sapphire that shimmers"},
    
    ["gold_ring"] 					 = {["name"] = "gold_ring", 			  	  	["label"] = "Gold Ring", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "gold_ring.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["diamond_ring"] 				 = {["name"] = "diamond_ring", 			  	  	["label"] = "Diamond Ring", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["ruby_ring"] 					 = {["name"] = "ruby_ring", 			  	  	["label"] = "Ruby Ring", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_ring.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["sapphire_ring"] 				 = {["name"] = "sapphire_ring", 			  	["label"] = "Sapphire Ring", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["emerald_ring"] 				 = {["name"] = "emerald_ring", 			  	  	["label"] = "Emerald Ring", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_ring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    
    ["silver_ring"] 				 = {["name"] = "silver_ring", 			  		["label"] = "Silver Ring", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "silver_ring.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["diamond_ring_silver"] 		 = {["name"] = "diamond_ring_silver", 		  	["label"] = "Diamond Ring Silver", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_ring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["ruby_ring_silver"] 			 = {["name"] = "ruby_ring_silver", 			  	["label"] = "Ruby Ring Silver", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_ring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["sapphire_ring_silver"] 		 = {["name"] = "sapphire_ring_silver", 		 	["label"] = "Sapphire Ring Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_ring_silver.png", ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["emerald_ring_silver"] 		 = {["name"] = "emerald_ring_silver", 		  	["label"] = "Emerald Ring Silver", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_ring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    
    ["goldchain"] 				 	 = {["name"] = "goldchain", 			  	  	["label"] = "Golden Chain", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "goldchain.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["diamond_necklace"] 			 = {["name"] = "diamond_necklace", 			  	["label"] = "Diamond Necklace", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_necklace.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["ruby_necklace"] 				 = {["name"] = "ruby_necklace", 			  	["label"] = "Ruby Necklace", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_necklace.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["sapphire_necklace"] 			 = {["name"] = "sapphire_necklace", 			["label"] = "Sapphire Necklace", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_necklace.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["emerald_necklace"] 			 = {["name"] = "emerald_necklace", 			  	["label"] = "Emerald Necklace", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_necklace.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    
    ["silverchain"] 				 = {["name"] = "silverchain", 			  	 	["label"] = "Silver Chain", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "silverchain.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["diamond_necklace_silver"] 	 = {["name"] = "diamond_necklace_silver", 		["label"] = "Diamond Necklace Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_necklace_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["ruby_necklace_silver"] 		 = {["name"] = "ruby_necklace_silver", 			["label"] = "Ruby Necklace Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_necklace_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["sapphire_necklace_silver"] 	 = {["name"] = "sapphire_necklace_silver", 		["label"] = "Sapphire Necklace Silver", ["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_necklace_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["emerald_necklace_silver"] 	 = {["name"] = "emerald_necklace_silver", 		["label"] = "Emerald Necklace Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_necklace_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    
    ["goldearring"] 				 = {["name"] = "goldearring", 				  	["label"] = "Golden Earrings", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "gold_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["diamond_earring"] 			 = {["name"] = "diamond_earring", 			  	["label"] = "Diamond Earrings", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["ruby_earring"] 				 = {["name"] = "ruby_earring", 			  		["label"] = "Ruby Earrings", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["sapphire_earring"] 			 = {["name"] = "sapphire_earring", 				["label"] = "Sapphire Earrings", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_earring.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["emerald_earring"] 			 = {["name"] = "emerald_earring", 			  	["label"] = "Emerald Earrings", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    
    ["silverearring"] 				 = {["name"] = "silverearring", 				["label"] = "Silver Earrings", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "silver_earring.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["diamond_earring_silver"] 		 = {["name"] = "diamond_earring_silver", 		["label"] = "Diamond Earrings Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "diamond_earring_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["ruby_earring_silver"] 		 = {["name"] = "ruby_earring_silver", 			["label"] = "Ruby Earrings Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "ruby_earring_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["sapphire_earring_silver"] 	 = {["name"] = "sapphire_earring_silver", 		["label"] = "Sapphire Earrings Silver", ["weight"] = 200, 		["type"] = "item", 		["image"] = "sapphire_earring_silver.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["emerald_earring_silver"] 		 = {["name"] = "emerald_earring_silver", 		["label"] = "Emerald Earrings Silver", 	["weight"] = 200, 		["type"] = "item", 		["image"] = "emerald_earring_silver.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    
    ["carbon"] 					 	 = {["name"] = "carbon", 			  	  		["label"] = "Carbon", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "carbon.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Carbon, a base ore."},
    ["ironore"] 					 = {["name"] = "ironore", 			  	  		["label"] = "Iron Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "ironore.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Iron, a base ore."},
    ["copperore"] 					 = {["name"] = "copperore", 			  	  	["label"] = "Copper Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "copperore.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Copper, a base ore."},
    ["goldore"] 					 = {["name"] = "goldore", 			  	  		["label"] = "Gold Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "goldore.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Gold Ore"},
    ["silverore"] 					 = {["name"] = "silverore", 			  	  	["label"] = "Silver Ore", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "silverore.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "Silver Ore"},
    
    ["goldingot"] 					 = {["name"] = "goldingot", 			  	  	["label"] = "Gold Ingot", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "goldingot.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    ["silveringot"] 				 = {["name"] = "silveringot", 			  	  	["label"] = "Silver Ingot", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "silveringot.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
    
    ["pickaxe"] 					 = {["name"] = "pickaxe", 			  	  		["label"] = "Pickaxe", 					["weight"] = 1000, 		["type"] = "item", 		["image"] = "pickaxe.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
    ["miningdrill"] 				 = {["name"] = "miningdrill", 			  	  	["label"] = "Mining Drill", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "miningdrill.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
    ["mininglaser"] 				 = {["name"] = "mininglaser", 			  	  	["label"] = "Mining Laser", 			["weight"] = 900, 		["type"] = "item", 		["image"] = "mininglaser.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
    ["drillbit"] 					 = {["name"] = "drillbit", 			  	  		["label"] = "Drill Bit", 				["weight"] = 10, 		["type"] = "item", 		["image"] = "drillbit.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
    
    ["goldpan"] 					 = {["name"] = "goldpan", 			  	  		["label"] = "Gold Panning Tray", 		["weight"] = 10, 		["type"] = "item", 		["image"] = "goldpan.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "" },
    
    ["bottle"] 						 = {["name"] = "bottle", 			  	  		["label"] = "Empty Bottle", 			["weight"] = 10, 		["type"] = "item", 		["image"] = "bottle.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A glass bottle"},
    ["can"] 						 = {["name"] = "can", 			  	  			["label"] = "Empty Can", 				["weight"] = 10, 		["type"] = "item", 		["image"] = "can.png", 					["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "An empty can, good for recycling"},
-- Jim-Recycle Items
["recyclablematerial"]  = {["name"] = "recyclablematerial",   ["label"] = "Recycle Box",      ["weight"] = 100, ["type"] = "item", 		["image"] = "recyclablematerial.png",   ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A box of Recyclable Materials"},
["bottle"]              = {["name"] = "bottle",               ["label"] = "Empty Bottle",     ["weight"] = 10,  ["type"] = "item", 		["image"] = "bottle.png",               ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A glass bottle"},
["can"]                 = {["name"] = "can",                  ["label"] = "Empty Can",        ["weight"] = 10,  ["type"] = "item", 		["image"] = "can.png",                  ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "An empty can, good for recycling"},
skateboard 	  	= { name = "skateboard",	label = "Skateboard",	weight = 1,   type = "item", image = "skateboard.png", 	unique = true, 	useable = true, 	shouldClose = true,	combinable = nil,  	description = "a jimnastic board"},
["notepad"]		= {["name"] = "notepad",	["label"] = "Notepad",	["weight"] = 100,	["type"] = "item",	["image"] = "notepad.png",	['unique'] = true,	['useable'] = false,	['shouldClose'] = true,	['combinable'] = nil,   ['description'] = ""},
["mechanic_tools"] =    {["name"] = "mechanic_tools",   ["label"] = "Mechanic tools",		["weight"] = 0, ["type"] = "item",  ["image"] = "mechanic_tools.png",   ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Needed for vehicle repairs"},
["toolbox"] =           {["name"] = "toolbox",          ["label"] = "Toolbox",				["weight"] = 0, ["type"] = "item",  ["image"] = "toolbox.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Needed for Performance part removal"},
["ducttape"] =          {["name"] = "ducttape",         ["label"] = "Duct Tape",			["weight"] = 0, ["type"] = "item",  ["image"] = "bodyrepair.png",       ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Good for quick fixes"},
["mechboard"] =         {["name"] = "mechboard",        ["label"] = "Mechanic Sheet",		["weight"] = 0, ["type"] = "item",  ["image"] = "mechboard.png",        ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

--Performance
["turbo"] =             {["name"] = "turbo",            ["label"] = "Supercharger Turbo",	["weight"] = 0, ["type"] = "item",  ["image"] = "turbo.png",            ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "Who doesn't need a 65mm Turbo??"},
["car_armor"]=          {["name"] = "car_armor",		["label"] = "Vehicle Armor",		["weight"] = 0, ["type"] = "item",  ["image"] = "armour.png",           ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["nos"]=                {["name"] = "nos",				["label"] = "NOS Bottle",			["weight"] = 0, ["type"] = "item",  ["image"] = "nos.png",              ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = "A full bottle of NOS"},
["noscan"]=             {["name"] = "noscan",			["label"] = "Empty NOS Bottle",		["weight"] = 0, ["type"] = "item",  ["image"] = "noscan.png",           ["unique"] = false, ["useable"] = true, ["shouldClose"] = true, ["description"] = "An Empty bottle of NOS"},
["noscolour"]=          {["name"] = "noscolour",		["label"] = "NOS Colour Injector",	["weight"] = 0, ["type"] = "item",  ["image"] = "noscolour.png", 		["unique"] = false, ["useable"] = true, ["shouldClose"] = true, ["description"] = "Make that purge spray"},

["engine1"]=            {["name"] = "engine1",			["label"] = "Tier 1 Engine",		["weight"] = 0, ["type"] = "item",  ["image"] = "engine1.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["engine2"]=            {["name"] = "engine2",			["label"] = "Tier 2 Engine",		["weight"] = 0, ["type"] = "item",  ["image"] = "engine2.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["engine3"]=            {["name"] = "engine3",			["label"] = "Tier 3 Engine",		["weight"] = 0, ["type"] = "item",  ["image"] = "engine3.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["engine4"]=            {["name"] = "engine4",			["label"] = "Tier 4 Engine",		["weight"] = 0, ["type"] = "item",  ["image"] = "engine4.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["engine5"]=            {["name"] = "engine5",			["label"] = "Tier 5 Engine",		["weight"] = 0, ["type"] = "item",  ["image"] = "engine5.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["transmission1"]=      {["name"] = "transmission1",    ["label"] = "Tier 1 Transmission",	["weight"] = 0, ["type"] = "item",  ["image"] = "transmission1.png",    ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["transmission2"]=      {["name"] = "transmission2",	["label"] = "Tier 2 Transmission",	["weight"] = 0, ["type"] = "item",  ["image"] = "transmission2.png",    ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["transmission3"]=      {["name"] = "transmission3",    ["label"] = "Tier 3 Transmission",	["weight"] = 0, ["type"] = "item",  ["image"] = "transmission3.png",    ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["transmission4"]=      {["name"] = "transmission4",	["label"] = "Tier 4 Transmission",	["weight"] = 0, ["type"] = "item",  ["image"] = "transmission4.png",    ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["brakes1"]=            {["name"] = "brakes1",			["label"] = "Tier 1 Brakes",		["weight"] = 0, ["type"] = "item",  ["image"] = "brakes1.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["brakes2"]=            {["name"] = "brakes2",			["label"] = "Tier 2 Brakes",		["weight"] = 0, ["type"] = "item",  ["image"] = "brakes2.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["brakes3"]=            {["name"] = "brakes3",			["label"] = "Tier 3 Brakes",		["weight"] = 0, ["type"] = "item",  ["image"] = "brakes3.png",          ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["suspension1"]=        {["name"] = "suspension1",		["label"] = "Tier 1 Suspension",	["weight"] = 0, ["type"] = "item",  ["image"] = "suspension1.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["suspension2"]=        {["name"] = "suspension2",		["label"] = "Tier 2 Suspension",	["weight"] = 0, ["type"] = "item",  ["image"] = "suspension2.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["suspension3"]=        {["name"] = "suspension3",		["label"] = "Tier 3 Suspension",	["weight"] = 0, ["type"] = "item",  ["image"] = "suspension3.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["suspension4"]=        {["name"] = "suspension4",		["label"] = "Tier 4 Suspension",	["weight"] = 0, ["type"] = "item",  ["image"] = "suspension4.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["suspension5"]=        {["name"] = "suspension5",		["label"] = "Tier 5 Suspension",	["weight"] = 0, ["type"] = "item",  ["image"] = "suspension5.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["bprooftires"]=        {["name"] = "bprooftires",		["label"] = "Bulletproof Tires",	["weight"] = 0, ["type"] = "item",  ["image"] = "bprooftires.png",      ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["drifttires"]=         {["name"] = "drifttires",		["label"] = "Drift Tires",			["weight"] = 0, ["type"] = "item",  ["image"] = "drifttires.png",       ["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

--Cosmetics
["underglow_controller"]={["name"] = "underglow_controller",["label"] = "Neon Controller",	["weight"] = 0, ["type"] = "item",  ["image"] = "underglow_controller.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = true, ["description"] = "RGB LED Vehicle Remote"},
["headlights"]=         {["name"] = "headlights",       ["label"] = "Xenon Headlights",		["weight"] = 0, ["type"] = "item",  ["image"] = "headlights.png",       ["unique"] = true, 	["useable"] = true, ["shouldClose"] = true, ["description"] = "8k HID headlights"},

["tint_supplies"]=      {["name"] = "tint_supplies",    ["label"] = "Tint Supplies",		["weight"] = 0, ["type"] = "item",  ["image"] = "tint_supplies.png",    ["unique"] = false, ["useable"] = true, ["shouldClose"] = true, ["description"] = "Supplies for window tinting"},

["customplate"]=        {["name"] = "customplate",      ["label"] = "Customized Plates",	["weight"] = 0, ["type"] = "item",  ["image"] = "plate.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["hood"]=               {["name"] = "hood",             ["label"] = "Vehicle Hood",			["weight"] = 0, ["type"] = "item",  ["image"] = "hood.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["roof"]=               {["name"] = "roof",             ["label"] = "Vehicle Roof",			["weight"] = 0, ["type"] = "item",  ["image"] = "roof.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["spoiler"]=            {["name"] = "spoiler",          ["label"] = "Vehicle Spoiler",		["weight"] = 0, ["type"] = "item",  ["image"] = "spoiler.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["bumper"]=             {["name"] = "bumper",           ["label"] = "Vehicle Bumper",		["weight"] = 0, ["type"] = "item",  ["image"] = "bumper.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["skirts"]=             {["name"] = "skirts",           ["label"] = "Vehicle Skirts",		["weight"] = 0, ["type"] = "item",  ["image"] = "skirts.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["exhaust"]=            {["name"] = "exhaust",          ["label"] = "Vehicle Exhaust",		["weight"] = 0, ["type"] = "item",  ["image"] = "exhaust.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["seat"]=               {["name"] = "seat",             ["label"] = "Seat Cosmetics",		["weight"] = 0, ["type"] = "item",  ["image"] = "seat.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["rollcage"]=           {["name"] = "rollcage",         ["label"] = "Roll Cage",			["weight"] = 0, ["type"] = "item",  ["image"] = "rollcage.png", 		["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["rims"]=               {["name"] = "rims",             ["label"] = "Custom Wheel Rims",	["weight"] = 0, ["type"] = "item",  ["image"] = "rims.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["livery"]=             {["name"] = "livery",           ["label"] = "Livery Roll",			["weight"] = 0, ["type"] = "item",  ["image"] = "livery.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["paintcan"]=           {["name"] = "paintcan",         ["label"] = "Vehicle Spray Can",	["weight"] = 0, ["type"] = "item",  ["image"] = "spraycan.png", 		["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["tires"]=              {["name"] = "tires",            ["label"] = "Drift Smoke Tires",	["weight"] = 0, ["type"] = "item",  ["image"] = "tires.png", 	  		["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["horn"]=               {["name"] = "horn",             ["label"] = "Custom Vehicle Horn",	["weight"] = 0, ["type"] = "item",  ["image"] = "horn.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

["internals"] =         {["name"] = "internals",        ["label"] = "Internal Cosmetics",	["weight"] = 0, ["type"] = "item",  ["image"] = "internals.png", 		["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},
["externals"] =         {["name"] = "externals",        ["label"] = "Exterior Cosmetics",	["weight"] = 0, ["type"] = "item",  ["image"] = "mirror.png", 			["unique"] = true,  ["useable"] = true, ["shouldClose"] = true, ["description"] = ""},

--Repair Parts
["newoil"] =            {["name"] = "newoil",           ["label"] = "Car Oil",				["weight"] = 0, ["type"] = "item",  ["image"] = "caroil.png",           ["unique"] = false, ["useable"] = false,["shouldClose"] = false,["description"] = ""},
["sparkplugs"]=         {["name"] = "sparkplugs",       ["label"] = "Spark Plugs",			["weight"] = 0, ["type"] = "item",  ["image"] = "sparkplugs.png",       ["unique"] = false, ["useable"] = false,["shouldClose"] = false,["description"] = ""},
["carbattery"]=         {["name"] = "carbattery",       ["label"] = "Car Battery",			["weight"] = 0, ["type"] = "item",  ["image"] = "carbattery.png",       ["unique"] = false, ["useable"] = false,["shouldClose"] = false,["description"] = ""},
["axleparts"]=          {["name"] = "axleparts",        ["label"] = "Axle Parts",			["weight"] = 0, ["type"] = "item",  ["image"] = "axleparts.png",        ["unique"] = false, ["useable"] = false,["shouldClose"] = false,["description"] = ""},
["sparetire"]=          {["name"] = "sparetire",        ["label"] = "Spare Tire",			["weight"] = 0, ["type"] = "item",  ["image"] = "sparetire.png",        ["unique"] = true,  ["useable"] = false,["shouldClose"] = false,["description"] = ""},
['cleanershovel']                         = {['name'] = 'cleanershovel',                           ['label'] = 'Mini Shovel',                   ['weight'] = 2000,         ['type'] = 'item',         ['image'] = 'cleanershovel.png',       ["decay"] = 14.0,          ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},
['eblower']                               = {['name'] = 'eblower',                                  ['label'] = 'Electric Blower',              ['weight'] = 2000,         ['type'] = 'item',         ['image'] = 'eblower.png',             ["decay"] = 9.0,           ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ''},


["casino_goldchip"] 			 = {["name"] = "casino_goldchip", 			 ["label"] = "Casino Chip", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "casino_goldchip.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino Chip"},
["casino_member"] 				 = {["name"] = "casino_member", 			 ["label"] = "Casino Membership", 		["weight"] = 500, 		["type"] = "item", 		["image"] = "casino_member.png", 				["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino Member Card"},
["casino_vip"] 					 = {["name"] = "casino_vip", 			 	 ["label"] = "V.I.P Membership", 		["weight"] = 500, 		["type"] = "item", 		["image"] = "casino_vip.png", 				    ["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Diamond Casino V.I.P Card"},

["pancakesbb"] = { ["name"] = "pancakesbb", ["label"] = "Blueberry Pancakes", ["weight"] = 10, ["type"] = "item", ["image"] = "pancakesbb.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Yum." },
["pancakesmaple"] = { ["name"] = "pancakesmaple", ["label"] = "Syrup Pancakes", ["weight"] = 10, ["type"] = "item", ["image"] = "pancakesmaple.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Yum." },
["pancakemix"] = { ["name"] = "pancakemix", ["label"] = "Pancake Mix", ["weight"] = 10, ["type"] = "item", ["image"] = "pancakemix.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Pancake mix." },
["blueberries"] = { ["name"] = "blueberries", ["label"] = "Blueberries", ["weight"] = 10, ["type"] = "item", ["image"] = "blueberries.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Blueberries." },
["maplesyrup"] = { ["name"] = "maplesyrup", ["label"] = "Maple Syrup", ["weight"] = 10, ["type"] = "item", ["image"] = "maplesyrup.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Maple Syrup." },
["baconegg"] = { ["name"] = "baconegg", ["label"] = "B.E Muffin", ["weight"] = 10, ["type"] = "item", ["image"] = "baconegg.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Like McDonalds but better." },
["lteggs"] = { ["name"] = "lteggs", ["label"] = "LT Eggs", ["weight"] = 10, ["type"] = "item", ["image"] = "lteggs.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltcheese"] = { ["name"] = "ltcheese", ["label"] = "LT Cheese", ["weight"] = 10, ["type"] = "item", ["image"] = "ltcheese.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltmuffin"] = { ["name"] = "ltmuffin", ["label"] = "Muffin Bun", ["weight"] = 10, ["type"] = "item", ["image"] = "ltmuffin.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltbacon"] = { ["name"] = "ltbacon", ["label"] = "Bacon", ["weight"] = 10, ["type"] = "item", ["image"] = "ltbacon.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["teapotorange"] = { ["name"] = "teapotorange", ["label"] = "Orange Juice", ["weight"] = 10, ["type"] = "item", ["image"] = "teapotorange.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["oranges"] = { ["name"] = "oranges", ["label"] = "Oranges", ["weight"] = 10, ["type"] = "item", ["image"] = "oranges.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["teapotcoffee"] = { ["name"] = "teapotcoffee", ["label"] = "Cup of Coffee", ["weight"] = 10, ["type"] = "item", ["image"] = "teapotcoffee.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltbox"] = { ["name"] = "ltbox", ["label"] = "LT Ingredients", ["weight"] = 10, ["type"] = "item", ["image"] = "ltbox.png", ["unique"] = true, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["coffeebeans"] = { ["name"] = "coffeebeans", ["label"] = "Coffee Beans", ["weight"] = 10, ["type"] = "item", ["image"] = "coffeebeans.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltbuns"] = { ["name"] = "ltbuns", ["label"] = "Breakfast Buns", ["weight"] = 10, ["type"] = "item", ["image"] = "ltbuns.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltlettuce"] = { ["name"] = "ltlettuce", ["label"] = "Lettuce", ["weight"] = 10, ["type"] = "item", ["image"] = "ltlettuce.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["lttomato"] = { ["name"] = "lttomato", ["label"] = "Tomato", ["weight"] = 10, ["type"] = "item", ["image"] = "lttomato.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["bltsandwich"] = { ["name"] = "bltsandwich", ["label"] = "BLT Sandwich", ["weight"] = 10, ["type"] = "item", ["image"] = "bltsandwich.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltteabags"] = { ["name"] = "ltteabags", ["label"] = "Tea Bags", ["weight"] = 10, ["type"] = "item", ["image"] = "ltteabags.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["teapottea"] = { ["name"] = "teapottea", ["label"] = "Cup of Tea", ["weight"] = 10, ["type"] = "item", ["image"] = "teapottea.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "." },
["ltcookies"] = {["name"] = "ltcookies", ["label"] = "Cookie",  ["weight"] = 10, ["type"] = "item", ["image"] = "ltcookies.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cookies"},
["ltdonut"]   = {["name"] = "ltdonut", ["label"] = "Donut", ["weight"] = 10, ["type"] = "item", ["image"] = "ltdonut.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Donut"},
["ltcroissant"] ={["name"] = "ltcroissant", ["label"] = "Croissant", ["weight"] = 10, 		["type"] = "item", 			["image"] = "ltcroissant.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Croissant"},
["smoothieor"] = { ["name"] = "smoothieor", ["label"] = "Orange Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothieor.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Orange Smoothie" },
["smoothiera"] = { ["name"] = "smoothiera", ["label"] = "Raspberry Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothiera.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Raspberry Smoothie" },
["ltraspberry"] = { ["name"] = "ltraspberry", ["label"] = "Raspberries", ["weight"] = 10, ["type"] = "item", ["image"] = "ltraspberry.png", ["unique"] = false, ['useable'] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Raspberries" },
["smoothiest"] = { ["name"] = "smoothiest", ["label"] = "Strawberry Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothiest.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Strawberry Smoothie" },
["ltstrawberry"] = { ["name"] = "ltstrawberry", ["label"] = "Strawberries", ["weight"] = 10, ["type"] = "item", ["image"] = "ltstrawberry.png", ["unique"] = false, ['useable'] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Strawberries" },
["smoothiema"] = { ["name"] = "smoothiema", ["label"] = "Mango Smoothie", ["weight"] = 10, ["type"] = "item", ["image"] = "smoothiema.png", ["unique"] = false, ['useable'] = true, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Mango Smoothie" },
["ltmango"] = { ["name"] = "ltmango", ["label"] = "Mango", ["weight"] = 10, ["type"] = "item", ["image"] = "ltmango.png", ["unique"] = false, ['useable'] = false, ["shouldClose"] = true, ["combinable"] = nil, ["description"] = "Mango" },


	-- MT (UwuCafe Stuff)

	-- Ingredients
	["pacote-leite"] 	   = {["name"] = "pacote-leite", 		["label"] = "Milk Pack",            ["weight"] = 1500, 	 ["type"] = "item",   	["image"] = "leite.png", 	    ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["barra-manteiga"] 	   = {["name"] = "barra-manteiga", 		["label"] = "Butter Bar",   	    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "manteiga.png",		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["pacote-farinha"] 	   = {["name"] = "pacote-farinha", 		["label"] = "Flour Package", 	    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "farinha.png",   	["unique"] = false,     ["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["barra-chocolate"]    = {["name"] = "barra-chocolate", 	["label"] = "Chocolate Bar", 	    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "chocolate.png", 	["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["caixa-morangos"] 	   = {["name"] = "caixa-morangos", 		["label"] = "Strawberries Box",     ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "morangos.png", 	["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["limao"] 		       = {["name"] = "limao", 			    ["label"] = "Lemon", 			    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "limao.png", 		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["pacote-natas"] 	   = {["name"] = "pacote-natas", 		["label"] = "Package of Cream",     ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "natas.png", 		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["leite-condensado"]   = {["name"] = "leite-condensado", 	["label"] = "Condensed Milk", 	    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "condensado.png", 	["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["extrato-baunilha"]   = {["name"] = "extrato-baunilha", 	["label"] = "Vanilla Extract", 	    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "baunilha.png", 	["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["pacote-acucar"] 	   = {["name"] = "pacote-acucar", 		["label"] = "Sugar Pack", 		    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "acucar.png", 		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["frasco-nutela"] 	   = {["name"] = "frasco-nutela", 	    ["label"] = "Jar of Nutella", 	    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "nutela.png", 		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["pacote-oreo"] 	   = {["name"] = "pacote-oreo", 		["label"] = "Oreo Pack", 	        ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "oreo.png", 		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["extrato-menta"] 	   = {["name"] = "extrato-menta",    	["label"] = "Mint Extract", 	    ["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "menta.png", 		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["caixa-amoras"] 	   = {["name"] = "caixa-amoras", 		["label"] = "Box of Blackberries", 	["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "amoras.png", 		["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["graos-cafe"] 		   = {["name"] = "graos-cafe", 		    ["label"] = "Coffee Beans", 		["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "graoscafe.png", 	["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["frango"] 		       = {["name"] = "frango", 			    ["label"] = "Chicken", 				["weight"] = 1500, 	 ["type"] = "item", 	["image"] = "frango.png", 	    ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

	-- Foods
	["cupcake-morango"] 	 = {["name"] = "cupcake-morango",	["label"] = "Strawberry Cupcake", 	["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "cupmorango.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["cupcake-chocolate"] 	 = {["name"] = "cupcake-chocolate", ["label"] = "Chocolate Cupcake", 	["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "cupchocolate.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["cupcake-limao"] 		 = {["name"] = "cupcake-limao", 	["label"] = "Lemon Cupcake", 		["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "cuplimao.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["gelado-morango"] 		 = {["name"] = "gelado-morango", 	["label"] = "Strawberry Icecream", 	["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "gemorango.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["gelado-chocolate"] 	 = {["name"] = "gelado-chocolate", 	["label"] = "Chocolate Icecream", 	["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "gechocolate.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["gelado-baunilha"] 	 = {["name"] = "gelado-baunilha", 	["label"] = "Vanilla Icecream", 	["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "gemorango.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["panqueca-nutela"] 	 = {["name"] = "panqueca-nutela", 	["label"] = "Nutella Pancake", 		["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "panutela.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["panqueca-oreo"] 		 = {["name"] = "panqueca-oreo", 	["label"] = "Oreo Pancake", 		["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "paoreo.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["waffle-nutela"] 		 = {["name"] = "waffle-nutela", 	["label"] = "Nutela Waffle", 		["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "wnutela.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["pastel-frango"] 		 = {["name"] = "pastel-frango", 	["label"] = "Chicken Pastel", 		["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "pfrango.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["muffin-chocolate"]     = {["name"] = "muffin-chocolate", 	["label"] = "Chocolate Muffin", 	["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "mufchocolate.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

	-- Drinks & Shakes
	["cafe-uwu"] 		    = {["name"] = "cafe-uwu", 			   ["label"] = "Café", 		              ["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "cafe.png", 	    ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["latte-uwu"] 		    = {["name"] = "latte-uwu", 			   ["label"] = "Latte", 				  ["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "latte.png", 	    ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["bubble-amora"]        = {["name"] = "bubble-amora", 		   ["label"] = "Blackberry Bubble Tea",   ["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "btamora.png",     ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["bubble-menta"] 	    = {["name"] = "bubble-menta", 		   ["label"] = "Mint Bubble Team", 		  ["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "btmenta.png",     ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["bubble-morango"] 	    = {["name"] = "bubble-morango", 	   ["label"] = "Strawberry Bubble Tea",   ["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "btmorango.png",   ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["milkshake-morango"]   = {["name"] = "milkshake-morango",     ["label"] = "Strawberry Milkshake",    ["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "msmorango.png",   ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["milkshake-chocolate"] = {["name"] = "milkshake-chocolate",   ["label"] = "Chocolate Milkshake", 	  ["weight"] = 1000, 	["type"] = "item", 	 ["image"] = "mschocolate.png", ["unique"] = false, 	["useable"] = true,   ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},


    vehicletracker              = { name = 'vehicletracker', label = 'Vehicle GPS Tracker', weight = 1000, type = 'item', image = 'vehicletracker.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'A device placed to track a vehicle\'s location.'},
vehicletrackertablet        = { name = 'vehicletrackertablet', label = 'Vehicle Tracker Tablet', weight = 1000, type = 'item', image = 'vehicletrackertablet.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Connects to a vehicle tracker to show it\'s location.'},
vehicletrackerscanner       = { name = 'vehicletrackerscanner', label = 'Vehicle Tracker Scanner', weight = 1000, type = 'item', image = 'vehicletrackerscanner.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Scans a vehicle for existence of GPS tracker.'},

cash_bag                        = { name = 'cash_bag', label = 'Gruppe 6 Cash Bag', weight = 1000, type = 'item', image = 'cash_bag.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Bag full of un-inked cash' },
inked_cash_bag                        = { name = 'inked_cash_bag', label = 'Gruppe 6 Inked Cash Bag', weight = 1000, type = 'item', image = 'inked_cash_bag.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = 'Bag full of useless inked cash.' },


--qb-limeysjob
	
	--drinks
    ['limeysdonut'] 				 	 = {['name'] = 'limeysdonut', 			  	  	['label'] = 'Strawberry Donut', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'limeysdonut2.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Strawberry Donut!'},
    ['limeysdonut2'] 				 	 = {['name'] = 'limeysdonut2', 			  	  	['label'] = 'Chocolate Donut', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'limeysdonut2.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Chocolate Donut!'},
    ['limeysgum'] 				 	 = {['name'] = 'limeysgum', 			  	  	['label'] = 'Trident Gum', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'limeysgum.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Chewy! Minty! Fresh!'},
    ['limeyschocolate'] 				 	 = {['name'] = 'limeyschocolate', 			  	  	['label'] = 'Nestle Extrafino Chocolate', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'limeyschocolate.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Mmmmmm Chocolate!'},
    ['limeyschocolate2'] 				 	 = {['name'] = 'limeyschocolate2', 			  	  	['label'] = 'Cadbury Dairy Milk Chocolate', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'limeyschocolate2.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cadbury Chocolate!'},
	['cherrydrink'] 				 	 = {['name'] = 'cherrydrink', 			  	  	['label'] = 'Cherry Drink', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cherrydrink.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cherries!'},
	['lemondrink'] 				 	 = {['name'] = 'lemondrink', 			  	     	['label'] = 'Lemon Drink', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lemondrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Rip-off Lemonade'},
	['limedrink'] 				 	 = {['name'] = 'limedrink', 			  	     	['label'] = 'Lime Drink', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'limedrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Limes...'},
	['orangedrink'] 				 	 = {['name'] = 'orangedrink', 			     	['label'] = 'Orange Drink', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'orangedrink.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A fancy orange juice...'},
	['watermelondrink'] 				 	 = {['name'] = 'watermelondrink', 			  	    	['label'] = 'Watermelon Drink', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'watermelondrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Watermelon Drink.'},
	['paradisecocktail'] 				     	 = {['name'] = 'paradisecocktail', 			    	  	['label'] = 'Paradise Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'paradisecocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Living in paradise!'},
	['cherrycocktail'] 				     	 = {['name'] = 'cherrycocktail', 			    	  	['label'] = 'Cherry Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cherrycocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Cherries.. But with whiskey'},
	['applecocktail'] 				     	 = {['name'] = 'applecocktail', 			    	  	['label'] = 'Apple Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'applecocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Rumor has it that Issac Newton made this.'},
	['bananacocktail'] 				     	 = {['name'] = 'bananacocktail', 			    	  	['label'] = 'Banana Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'bananacocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The Minions made this.'},
	['kiwicocktail'] 				     	 = {['name'] = 'kiwicocktail', 			    	  	['label'] = 'Kiwi Cocktail', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'kiwicocktail.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Kiwi.'},
	['drink-glass'] 				 = {['name'] = 'drink-glass', 			  	  	['label'] = 'Glass', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drink-glass.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Glass made for normal drinks'},
	['cocktailglass'] 				 = {['name'] = 'cocktailglass', 			  	  	['label'] = 'Cocktail Glass', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cocktailglass.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Glass made for cocktails!'},
	['apple'] 		    	 = {['name'] = 'apple', 			   	['label'] = 'Apple',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'apple.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['banana'] 		    	 = {['name'] = 'banana', 			   	['label'] = 'Banana',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'banana.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['cherry'] 		    	 = {['name'] = 'cherry', 			   	['label'] = 'Cherry',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cherry.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['kiwi'] 		    	 = {['name'] = 'kiwi', 			   	['label'] = 'Kiwi',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'kiwi.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['lemon'] 		    	 = {['name'] = 'lemon', 			   	['label'] = 'Lemon',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lemon.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['lime'] 		    	 = {['name'] = 'lime', 			   	['label'] = 'Lime',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'lime.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['orange'] 		    	 = {['name'] = 'orange', 			   	['label'] = 'Orange',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'orange.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},
	['watermelon'] 		    	 = {['name'] = 'watermelon', 			   	['label'] = 'Watermelon',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'watermelon.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'a sliceable watermelon!'},
	['whiskey'] 		    	 = {['name'] = 'whiskey', 			   	['label'] = 'Whiskey',               	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'whiskey.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'This is not a bottle of booze!'},
	['watermelonslice'] 		    	 = {['name'] = 'watermelonslice', 			   	['label'] = 'Watermelon Slice',               	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'watermelonslice.png', 	    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'an ingredient!'},

	-- Regular Fish
	['stingray'] 			     	 = {['name'] = 'stingray', 				    ['label'] = 'Stingray',            		['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'stingray.png',         	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Stingray'},
	['flounder'] 			     	 = {['name'] = 'flounder', 				    ['label'] = 'Flounder',            		['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'flounder.png',         	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Flounder'},
	['codfish'] 			     	 = {['name'] = 'codfish', 				    ['label'] = 'Cod',            			['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'codfish.png',         		['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Cod'},
	['mackerel'] 			     	 = {['name'] = 'mackerel', 				    ['label'] = 'Mackerel',            		['weight'] = 2500,      ['type'] = 'item',      ['image'] = 'mackerel.png',         	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Mackerel'},
	['bass'] 			 		 	 = {['name'] = 'bass', 						['label'] = 'Bass',                     ['weight'] = 1250,      ['type'] = 'item',      ['image'] = 'bass.png',                 ['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'A normal fish Tatses pretty good!'},
	
	-- Trash Items
	['fishingtin'] 			 	 	 = {['name'] = 'fishingtin', 				['label'] = 'Fishing Tin', 				['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'fishingtin.png', 			['unique'] = false,    ['useable'] = false, 	['shouldClose'] = false,	 ['combinable'] = nil,   ['description'] = 'Fishing Tin'},	
	['fishingboot'] 			 	 = {['name'] = 'fishingboot', 				['label'] = 'Fishing Boot', 			['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'fishingboot.png', 			['unique'] = false,    ['useable'] = false, 	['shouldClose'] = false,	 ['combinable'] = nil,   ['description'] = 'Fishing Boot'},	
	
	-- Exotic Fish
	['killerwhale'] 			 	 = {['name'] = 'killerwhale', 				['label'] = 'Whale', 					['weight'] = 15000, 	['type'] = 'item', 		['image'] = 'killerwhale.png', 			['unique'] = true, 	   ['useable'] = false, 	['shouldClose'] = false,	 ['combinable'] = nil,   ['description'] = 'Killer Whale'},	
	['dolphin'] 			     	 = {['name'] = 'dolphin', 					['label'] = 'Dolphin',          		['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'dolphin.png',       		['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Dolphin'},
	['sharkhammer'] 			     = {['name'] = 'sharkhammer', 				['label'] = 'Shark',         			['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'sharkhammer.png',       	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Hammerhead Shark'},
	['sharktiger'] 			     	 = {['name'] = 'sharktiger', 				['label'] = 'Shark',          			['weight'] = 5000,      ['type'] = 'item',      ['image'] = 'sharktiger.png',       	['unique'] = true,     ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Tigershark'},
	
	-- Gear
	['fishbait'] 			     	 = {['name'] = 'fishbait', 					['label'] = 'Fish Bait', 				['weight'] = 400, 		['type'] = 'item', 		['image'] = 'fishbait.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Fishing bait'},
	['fishingrod'] 			 		 = {['name'] = 'fishingrod', 				['label'] = 'Fishing Rod', 				['weight'] = 750, 		['type'] = 'item', 		['image'] = 'fishingrod.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A fishing rod for adventures with friends!!'},	
	['anchor'] 			 	 		 = {['name'] = 'anchor', 					['label'] = 'Boat Anchor', 				['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'anchor.png', 				['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Boat Anchor'},	
	['fishicebox'] 			 	 	 = {['name'] = 'fishicebox', 				['label'] = 'Fishing Ice Chest', 		['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'fishicebox.png', 			['unique'] = true,     ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ice Box to store all of your fish'},	
	
	-- Rewards
	['fishingloot'] 			 	 = {['name'] = 'fishingloot', 				['label'] = 'Metal Box', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'fishingloot.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Seems to be a corroded from the salt water, Should be easy to open'},	
	['fishinglootbig'] 			 	 = {['name'] = 'fishinglootbig', 			['label'] = 'Treasure Chest', 			['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'fishinglootbig.png', 		['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The lock seems to be intact, Might need a key'},	
	['fishingkey'] 			 	 	 = {['name'] = 'fishingkey', 			    ['label'] = 'Corroded Key', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'fishingkey.png', 		    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A weathered key that looks usefull'},	
	['fishtacklebox'] 			 	 = {['name'] = 'fishtacklebox', 			['label'] = 'Tackle Box', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fishtacklebox.png', 		['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Seems to be left over tackle box from another fisherman'},	
	['pearlscard'] 			 	 	 = {['name'] = 'pearlscard', 				['label'] = 'Pearls Seafood', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'pearlscard.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A special member of Pearl\'s Seafood Restaurant'},	

    ['guide'] 			 	 	 = {['name'] = 'guide', 			    ['label'] = 'Server Guide', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'np_book.png', 		    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A weathered key that looks usefull'},	
	['police_guide'] 			 	 = {['name'] = 'police_guide', 			['label'] = 'Police Guide', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'np_book.png', 		['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Seems to be left over'},	
	['bar'] 			 	 	 = {['name'] = 'bar', 				['label'] = 'News book', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'np_book.png', 			['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'LOL'},

    heist_papers = {
        name = 'heist_papers',
        label = 'Vehicle Papers',
        weight = 0,
        type = 'item',
        image = 'heist_papers.png',
        unique = true,
        useable = false,
        shouldClose = true,
        combinable = nil,
        description = 'Delivery documents.'
    },

}

