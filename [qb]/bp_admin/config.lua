Config = {}


-- for set admin >> /setadmin playerid rank


Config.Mysql = 'oxmysql' -- "ghmattisql", "mysql-async", "oxmysql"




Config.useweather = true    ---- you can disable weather here


Config.maxperm = 5    ---- perms only work with 1-5 number  

Config.serverchecktime = 1 ----- munite check players online or offline

Config.commands = {
    ['setadmincommand'] = {['commandname'] = "setadmin", ['commandstate'] = true, ['commandonlyadmin'] = true},
    ['admincommand'] = {['commandname'] = "admin", ['commandstate'] = true, ['commandonlyadmin'] = false},        
    ['ticketcommand'] = {['commandname'] = "tickets", ['commandstate'] = true, ['commandonlyadmin'] = false}     ---------------------------- commands on/off and names,(commandstate ==> allow perm)

}


Config.keycode = {
    ['adminkey'] = {['keyname'] = "F10", ['keystate'] = true},
    ['ticketkey'] = {['keyname'] = "F9", ['keystate'] = true}            ---------------------------- key on/off and key names

}



Config.MenuPerms = {
    ['playersettingsmin'] = 4,
    ['playerbanremove'] = 4,                      
    ['vehiclespawnmin'] = 4,               ---------------------------- you can set menu permsher (this perms minvalue)
    ['propspawnmin'] = 4,
    ['playersupportmin'] = 4,
    ['rconmin'] = 5




}

Config.blockedPeds = {
    "mp_m_freemode_01",
    "mp_f_freemode_01",
    "tony",
    "g_m_m_chigoon_02_m",                       ---------------------------- developer mode give ped blocked peds
    "u_m_m_jesus_01",
    "a_m_y_stbla_m",
    "ig_terry_m",
    "a_m_m_ktown_m",
    "a_m_y_skater_m",
    "u_m_y_coop",
    "ig_car3guy1_m",
}


Config.extraperms = {
    ['giveitem'] = 2,
    ['givemoney'] = 2,
    ['weather'] = 2,                               ---------------------------- extra part perms minranks
    ['developermod'] = 4,
    ['announce'] = 2
    -- ['bliponoff'] = 2 --- soonnnn
  
}


Config.VehicleList = {
    {['label'] = "SULTAN RS", ['name'] = 'sultanrs', ['img'] = "vehicleimg/sultanrs.png" , ['minpermission'] = 2},
    {['label'] = "ZENTORNO", ['name'] = 'zentorno', ['img'] = "vehicleimg/zentorno.png" ,['minpermission'] = 2},
    {['label'] = "ZION", ['name'] = 'zion',['img'] = "vehicleimg/zion.png" , ['maxpermission'] = 2},
    {['label'] = "T20", ['name'] = 't20',['img'] = "vehicleimg/sultanrs.png" , ['maxpermission'] = 2},
    {['label'] = "TURISMOR", ['name'] = 'turismor',['img'] = "vehicleimg/sultanrs.png" , ['maxpermission'] = 2},
    {['label'] = "BALLER", ['name'] = 'baller',['img'] = "vehicleimg/sultanrs.png" , ['maxpermission'] = 2},
    {['label'] = "BALLER", ['name'] = 'baller',['img'] = "vehicleimg/sultanrs.png" , ['maxpermission'] = 2},
    {['label'] = "BALLER", ['name'] = 'baller',['img'] = "vehicleimg/sultanrs.png" , ['maxpermission'] = 2},
    {['label'] = "BALLER", ['name'] = 'baller',['img'] = "vehicleimg/sultanrs.png" , ['maxpermission'] = 2},
    {['label'] = "BALLER", ['name'] = 'baller',['img'] = "vehicleimg/sultanrs.png" , ['maxpermission'] = 2}






}

Config.ObjectList = {
    {['label'] = "Woods", ['name'] = 'prop_logpile_06b', ['img'] = "https://gtahash.ru/files/construction/prop_logpile_06b.jpg" , ['minpermission'] = 2},
    {['label'] = "Med Stasion", ['name'] = 'prop_medstation_04', ['img'] = "https://gtahash.ru/files/construction/prop_medstation_04.jpg" , ['minpermission'] = 2},
    {['label'] = "Work Light", ['name'] = 'prop_worklight_01a', ['img'] = "https://gtahash.ru/files/construction/prop_worklight_01a.jpg" , ['minpermission'] = 2},
    {['label'] = "Barrier", ['name'] = 'prop_barrier_work02a', ['img'] = "https://gtahash.ru/files/construction/prop_barrier_work02a.jpg" , ['minpermission'] = 2},
    {['label'] = "Road Pole", ['name'] = 'prop_roadpole_01b', ['img'] = "https://gtahash.ru/files/construction/prop_roadpole_01b.jpg" , ['minpermission'] = 2},
    {['label'] = "Pick Axe", ['name'] = 'prop_tool_pickaxe', ['img'] = "https://gtahash.ru/files/construction/prop_tool_pickaxe.jpg" , ['minpermission'] = 2},
    {['label'] = "Work barier", ['name'] = 'prop_barrier_work04a', ['img'] = "https://gtahash.ru/files/construction/prop_barrier_work04a.jpg" , ['minpermission'] = 2},
    {['label'] = "Barier corn", ['name'] = 'prop_barier_conc_05a', ['img'] = "https://gtahash.ru/files/construction/prop_barier_conc_05a.jpg" , ['minpermission'] = 2},
    {['label'] = "Oil tub", ['name'] = 'prop_oiltub_02', ['img'] = "https://gtahash.ru/files/construction/prop_oiltub_02.jpg" , ['minpermission'] = 2},
    {['label'] = "Road Cone", ['name'] = 'prop_roadcone01c', ['img'] = "https://gtahash.ru/files/construction/prop_roadcone01c.jpg" , ['minpermission'] = 2},
    {['label'] = "Barier wat", ['name'] = 'prop_roadcone01c', ['img'] = "https://gtahash.ru/files/construction/prop_barrier_wat_03a.jpg" , ['minpermission'] = 2}









    
    


}


