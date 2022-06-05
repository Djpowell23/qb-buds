# A Best Buds Target Script for QBCore Framework

- Fixed Version qb-buds.
- Original from: https://github.com/Tyler-Zimmerman/qb-buds
## Changes
- nh-keyboard to qb-input


## Note

- Heavily modified by Goobastank from BLVCKLISTED's qb-buds (original fork from qb-burgershot). 

- Added three different joints of varying strengths.

- Weed Brownies and Infused Gummies for long-term stress relief (fully configurable, default 5 mins, bigger chunks. good for banks, racing, flying, etc.)

- Three custom strains from bud to grinded weed to joint.

- Garage for company vehicle for deliveries. (need good vehicle and livery)


## QB-Core>Shared>items.lua
	['caramelojoint'] 				 = {['name'] = 'caramelojoint', 			  	['label'] = 'Caramelo Joint', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'caramelojoint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'THC: 16% | CBD: 0%'},
	['apeshitjoint'] 				 = {['name'] = 'apeshitjoint', 			  	  	['label'] = 'Ape Shit Joint', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'apeshitjoint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'THC: 19% | CBD: 0%'},
	['medicalmassjoint'] 			 = {['name'] = 'medicalmassjoint', 			  	['label'] = 'Medical Joint', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'medicalmassjoint.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'THC: 6% | CBD: 9%'},
	['holyghostjoint'] 				 = {['name'] = 'holyghostjoint', 			  	['label'] = 'Holy Ghost Joint', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'holyghostjoint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'THC: 21% | CBD: 0%'},
	['hazeheavenjoint'] 			 = {['name'] = 'hazeheavenjoint', 			  	['label'] = 'Haze Heaven Joint', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'hazeheavenjoint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'THC: 23% | CBD: 5%'},
	
		['caramelobud'] 			 	 = {['name'] = 'caramelobud', 			 		['label'] = 'Caramelo Bud', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'caramelobud.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A sticky nug of Caramelo'},
	['apeshitbud'] 				  	 = {['name'] = 'apeshitbud', 			 		['label'] = 'Ape Shit Bud', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'apeshitbud.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A sticky nug of Ape Shit'},
	['medicalmassbud'] 			 	 = {['name'] = 'medicalmassbud', 			 	['label'] = 'Medical Mass Bud', 		['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'medicalmassbud.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A sticky nug of Medical Mass'},
	['holyghostbud'] 				 = {['name'] = 'holyghostbud', 			 		['label'] = 'Holy Ghost Bud', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'holyghostbud.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A sticky nug of Holy Ghost'},
	['hazeheavenbud'] 				 = {['name'] = 'hazeheavenbud', 			 	['label'] = 'Haze Heaven Bud', 			['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'hazeheavenbud.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A sticky nug of Haze Heaven'},
	['weedbrownie'] 			 	 = {['name'] = 'weedbrownie', 			  		['label'] = 'Buds Brownie', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'weedbrownie.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Chocolate infused with tasty cannabis'},
	['weedgummy'] 			 	 	 = {['name'] = 'weedgummy', 			  		['label'] = 'Buds Gummy', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'weedgummy.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Gummy Buddy from Best Buds'},


## Dependencies :

[MLO] Interior Legion Weed Clinic - https://www.gta5-mods.com/maps/mlo-legion-weed-clinic

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target (Only needed if not using draw text)

nh-context - ~~https://github.com/nerohiro/nh-context (owner removed script)~~ See folder [NH] for scripts

