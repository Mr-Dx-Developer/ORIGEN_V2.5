HOW TO INSTALL (QBCore):

1.) Place the following into qb-core/shared/items.lua:

	['weapon_radargun'] 				 = {['name'] = 'weapon_radargun', 		      	['label'] = 'Radar Gun', 					['weight'] = 1000, 		['type'] = 'weapon', 	['ammotype'] = nil,						['image'] = 'weapon_radargun.png', 		['unique'] = true, 		['useable'] = false, 	['description'] = 'A handhel speed detection device'},

2.) Place the following into qb-core/shared/weapons.lua:

    [`weapon_radargun`] 				 = {['name'] = 'weapon_radargun', 		['label'] = 'Radar Gun', 				['ammotype'] = nil,	['damagereason'] = 'Really???'},

3.) Drag and drop the qb-inventory folder provided into the [qb] folder. If you're using some other inventory script other than qb-inventory, just place the image where the images go for that respective script.

4.) Drag the qb-radargun into your [qb] folder. This resource should still work standalone. If you are using this standalone, just drag and drop into your resource directory, and type "ensure qb-radargun" in your server.cfg.