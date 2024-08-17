const BUILD = GetGameBuildNumber();

on("gameEventTriggered", (event, args) => {
  switch (event) {
    case "CEventNetworkEntityDamage": {
      damage = { name : "nd", label : "Not detected!" }
      let i = 0;
      var victim = args[i++];
      var attacker = args[i++];

      i++;  

      if (BUILD >= 2060) i++;  
      if (BUILD >= 2189) i++;  

      var isFatal = !!args[i++];
      var weaponHash = args[i++];

      i += 5; 

      var isMelee = !!args[i++];
      var vehicleDamageTypeFlag = args[i++];

      victim_ped = victim
      victim = NetworkGetPlayerIndexFromPed(victim)
      victim = GetPlayerServerId(victim)

      attacker_ped = attacker
      attacker = NetworkGetPlayerIndexFromPed(attacker)
      attacker = GetPlayerServerId(attacker)

      if(victim == attacker && vehicleDamageTypeFlag == 0) {
        damage = { name : "fdm", label : "Fall Damage" }
      }

      if(vehicleDamageTypeFlag != 0 && GetVehiclePedIsIn(attacker_ped, false) != 0) {
        damage = { name : "veh", label : "Vehicle Damage" }
      }

    //   if(isMelee) {
          if (IsPedArmed(attacker_ped, 1)) {
            damage = { name : "melee", label : "Melee Damage" }
          } else {
            damage = { name : "fist", label : "Fist attack" }
          }
    //   }

      // console.log("isMelee: " + isMelee + " vehicleDamageTypeFlag: " + vehicleDamageTypeFlag + " weaponHash: " + weaponHash + " isFatal: " + isFatal + " victim: " + victim + " attacker: " + attacker + " damage: " + damage.name + " " + damage.label)

      var [FoundLastDamagedBone, LastDamagedBone] = GetPedLastDamageBone(victim_ped)
 
      if(victim == 0) return;
      if(attacker == 0) return;
      if(damage.name == "nd") return;
      emit("s4-realisticdisease:dmg", victim, attacker, attacker_ped, victim_ped, damage, LastDamagedBone);
    
      break;
    }
  }
})