DP = {}

DP.Expressions = {
   ["angry"] = {"Expression", "mood_angry_1"},
   ["drunk"] = {"Expression", "mood_drunk_1"},
   ["dumb"] = {"Expression", "pose_injured_1"},
   ["electrocuted"] = {"Expression", "electrocuted_1"},
   ["grumpy"] = {"Expression", "effort_1"},
   ["grumpy2"] = {"Expression", "mood_drivefast_1"},
   ["grumpy3"] = {"Expression", "pose_angry_1"},
   ["happy"] = {"Expression", "mood_happy_1"},
   ["injured"] = {"Expression", "mood_injured_1"},
   ["joyful"] = {"Expression", "mood_dancing_low_1"},
   ["mouthbreather"] = {"Expression", "smoking_hold_1"},
   ["never blink"] = {"Expression", "pose_normal_1"},
   ["one eye"] = {"Expression", "pose_aiming_1"},
   ["shocked"] = {"Expression", "shocked_1"},
   ["shocked2"] = {"Expression", "shocked_2"},
   ["sleeping"] = {"Expression", "mood_sleeping_1"},
   ["sleeping2"] = {"Expression", "dead_1"},
   ["sleeping3"] = {"Expression", "dead_2"},
   ["smug"] = {"Expression", "mood_smug_1"},
   ["speculative"] = {"Expression", "mood_aiming_1"},
   ["stressed"] = {"Expression", "mood_stressed_1"},
   ["sulking"] = {"Expression", "mood_sulk_1"},
   ["weird"] = {"Expression", "effort_2"},
   ["weird2"] = {"Expression", "effort_3"},
--    ["holdSmoke"] = {"Expression", "smoking_hold_1"},
}

DP.Walks = {
  ["Alien"] = {"move_m@alien"},
  ["Armored"] = {"anim_group_move_ballistic"},
  ["Arrogant"] = {"move_f@arrogant@a"},
  ["Brave"] = {"move_m@brave"},
  ["Casual"] = {"move_m@casual@a"},
  ["Casual2"] = {"move_m@casual@b"},
  ["Casual3"] = {"move_m@casual@c"},
  ["Casual4"] = {"move_m@casual@d"},
  ["Casual5"] = {"move_m@casual@e"},
  ["Casual6"] = {"move_m@casual@f"},
  ["Chichi"] = {"move_f@chichi"},
  ["Confident"] = {"move_m@confident"},
  ["Cop"] = {"move_m@business@a"},
  ["Cop2"] = {"move_m@business@b"},
  ["Cop3"] = {"move_m@business@c"},
  ["Default Female"] = {"move_f@multiplayer"},
  ["Default Male"] = {"move_m@multiplayer"},
  ["Drunk"] = {"move_m@drunk@slightlydrunk"},
  ["Drunk2"] = {"move_m@buzzed"},
  ["Drunk3"] = {"move_m@drunk@verydrunk"},
  ["Femme"] = {"move_f@femme@"},
  ["Fire"] = {"move_characters@franklin@fire"},
  ["Fire2"] = {"move_characters@michael@fire"},
  ["Fire3"] = {"move_m@fire"},
  ["Flee"] = {"move_f@flee@a"},
  ["Franklin"] = {"move_p_m_one"},
  ["Gangster"] = {"move_m@gangster@generic"},
  ["Gangster2"] = {"move_m@gangster@ng"},
  ["Gangster3"] = {"move_m@gangster@var_e"},
  ["Gangster4"] = {"move_m@gangster@var_f"},
  ["Gangster5"] = {"move_m@gangster@var_i"},
  ["Grooving"] = {"anim@move_m@grooving@"},
  ["Guard"] = {"move_m@prison_gaurd"},
  ["Handcuffs"] = {"move_m@prisoner_cuffed"},
  ["Heels"] = {"move_f@heels@c"},
  ["Heels2"] = {"move_f@heels@d"},
  ["Hiking"] = {"move_m@hiking"},
  ["Hipster"] = {"move_m@hipster@a"},
  ["Hobo"] = {"move_m@hobo@a"},
  ["Hurry"] = {"move_f@hurry@a"},
  ["Janitor"] = {"move_p_m_zero_janitor"},
  ["Janitor2"] = {"move_p_m_zero_slow"},
  ["Jog"] = {"move_m@jog@"},
  ["Lemar"] = {"anim_group_move_lemar_alley"},
  ["Lester"] = {"move_heist_lester"},
  ["Lester2"] = {"move_lester_caneup"},
  ["Maneater"] = {"move_f@maneater"},
  ["Michael"] = {"move_ped_bucket"},
  ["Money"] = {"move_m@money"},
  ["Muscle"] = {"move_m@muscle@a"},
  ["Posh"] = {"move_m@posh@"},
  ["Posh2"] = {"move_f@posh@"},
  ["Quick"] = {"move_m@quick"},
  ["Runner"] = {"female_fast_runner"},
  ["Sad"] = {"move_m@sad@a"},
  ["Sassy"] = {"move_m@sassy"},
  ["Sassy2"] = {"move_f@sassy"},
  ["Scared"] = {"move_f@scared"},
  ["Sexy"] = {"move_f@sexy@a"},
  ["Shady"] = {"move_m@shadyped@a"},
  ["Slow"] = {"move_characters@jimmy@slow@"},
  ["Swagger"] = {"move_m@swagger"},
  ["Tough"] = {"move_m@tough_guy@"},
  ["Tough2"] = {"move_f@tough_guy@"},
  ["Trash"] = {"clipset@move@trash_fast_turn"},
  ["Trash2"] = {"missfbi4prepp1_garbageman"},
  ["Trevor"] = {"move_p_m_two"},
  ["Wide"] = {"move_m@bag"},
  -- I cant get these to work for some reason, if anyone knows a fix lmk
  --["Caution"] = {"move_m@caution"},
  --["Chubby"] = {"anim@move_m@chubby@a"},
  --["Crazy"] = {"move_m@crazy"},
  --["Joy"] = {"move_m@joy@a"},
  --["Power"] = {"move_m@power"},
  --["Sad2"] = {"anim@move_m@depression@a"},
  --["Sad3"] = {"move_m@depression@b"},
  --["Sad4"] = {"move_m@depression@d"},
  --["Wading"] = {"move_m@wading"},
}

DP.Shared = {

    ["kiss"] = {"hs3_ext-20", "cs_lestercrest_3_dual-20", "Lip Kiss 🔞 - ~y~New ", "kiss2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 4000,
       SyncOffsetFront = 0.40,
   }},
   ["kiss2"] = {"hs3_ext-20", "csb_georginacheng_dual-20", "Lip Kiss2 🔞 - ~y~New ", "kiss", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 4000,
       SyncOffsetFront = 0.40,
   }},
   ["hug3"] = {"misscarsteal2chad_goodbye", "chad_armsaround_chad", "Hug 3 - ~y~New ", "hug4", AnimationOptions =
   {
     EmoteMoving = false,
     EmoteLoop = true,
     SyncOffsetFront = 0.05,
   }},
   ["hug4"] = {"misscarsteal2chad_goodbye", "chad_armsaround_girl", "Hug 4 - ~y~New ", "hug3", AnimationOptions =
   {
     EmoteMoving = false,
     EmoteLoop = true,
     SyncOffsetFront = 0.13
   }},


   --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions}
   -- you dont have to specify targetemoteanem, if you do dont it will just play the same animation on both.
   -- targetemote is used for animations that have a corresponding animation to the other player.
   ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", "handshake2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
       SyncOffsetFront = 0.9
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", "handshake", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug", "hug2", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 5,
   }},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2", "hug", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
       SyncOffsetFront = 1.13
   }},
   ["bro"] = {"mp_ped_interaction", "hugs_guy_a", "Bro", "bro2", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["bro2"] = {"mp_ped_interaction", "hugs_guy_b", "Bro 2", "bro", AnimationOptions =
   {
        SyncOffsetFront = 1.14
   }},
   ["give"] = {"mp_common", "givetake1_a", "Give", "give2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["give2"] = {"mp_common", "givetake1_b", "Give 2", "give", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["baseball"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_a", "Baseball", "baseballthrow"},
   ["baseballthrow"] = {"anim@arena@celeb@flat@paired@no_props@", "baseball_a_player_b", "Baseball Throw", "baseball"},
   ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", "stickupscared", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stickupscared"] = {"missminuteman_1ig_2", "handsup_base", "Stickup Scared", "stickup", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["punch"] = {"melee@unarmed@streamed_variations", "plyr_takedown_rear_lefthook", "Punch", "punched"},
   ["punched"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r", "Punched", "punch"},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt", "headbutted"},
   ["headbutted"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_headbutt", "Headbutted", "headbutt"},
   ["slap2"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_backslap", "Slap 2", "slapped2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", "slapped", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["slapped"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_slap", "Slapped", "slap"},
   ["slapped2"] = {"melee@unarmed@streamed_variations", "victim_takedown_front_backslap", "Slapped 2", "slap2"},
}

DP.Dances = {
        ["crossbounce"] = {"custom@crossbounce", "crossbounce", "Cross bounce - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        ["bellydance"] = {"custom@bellydance", "bellydance", "Belly Dance - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Fish Dance - ~y~New", AnimationOptions =
        {
        EmoteLoop = true,
        EmoteMoving = true,
        }},
        ["dancedrink1"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_f1", "Dance Drink 1 (Wine) - ~y~New", AnimationOptions =
        {
          Prop = 'p_wine_glass_s',
          PropBone = 28422,
          PropPlacement = {0.0, 0.0,-0.0900, 0.0, 0.0, 0.00},
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dancedrink2"] = {"anim@amb@nightclub_island@dancers@beachdanceprop@", "mi_loop_m04", "Dance Drink 2 (Whiskey) - ~y~New", AnimationOptions =
        {
          Prop = 'ba_prop_battle_whiskey_opaque_s',
          PropBone = 28422,
          PropPlacement = {-0.0100, 0.00,0.0, 0.0, 0.0, 10.00},
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dancedrink3"] = {"anim@amb@nightclub_island@dancers@beachdanceprops@male@", "mi_idle_b_m04", "Dance Drink 3 (Whiskey) - ~y~New", AnimationOptions =
        {
          Prop = 'ba_prop_battle_whiskey_opaque_s',
          PropBone = 28422,
          PropPlacement = {-0.0100, 0.00,0.0, 0.0, 0.0, 10.00},
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["danceclub"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m03", "Dance Club - ~y~New", AnimationOptions =
        {
          EmoteLoop = true
        }},
        ["danceclub2"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m05", "Dance Club 2 - ~y~New", AnimationOptions =
        {
          EmoteLoop = true
        }},
        ["danceclub3"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_a_m02", "Dance Club 3 - ~y~New", AnimationOptions =
        {
          EmoteLoop = true
        }},
        ["danceclub4"] = {"anim@amb@nightclub_island@dancers@beachdance@", "hi_idle_b_f01", "Dance Club 4 - ~y~New", AnimationOptions =
        {
          EmoteLoop = true
        }},
        ["danceclub5"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_a_f02", "Dance Club 5 - ~y~New", AnimationOptions =
        {
          EmoteLoop = true
        }},
        ["danceclub6"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_b_m03", "Dance Club 6 - ~y~New", AnimationOptions =
        {
          EmoteLoop = true
        }},
        ["danceclub7"] = {"anim@amb@nightclub_island@dancers@club@", "hi_idle_d_f01", "Dance Club 7 - ~y~New", AnimationOptions =
        {
          EmoteLoop = true
        }},
        ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = true,
        }},
        ["dj2"] = {"anim@amb@nightclub@djs@solomun@", "sol_idle_ctr_mid_a_sol", "DJ 2 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj3"] = {"anim@amb@nightclub@djs@solomun@", "sol_dance_l_sol", "DJ 3 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj4"] = {"anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_a_blamadon", "DJ 4 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj5"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_a_dix", "DJ 5 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj6"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_b_dix", "DJ 6 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj7"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_g_dix", "DJ 7 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj8"] = {"anim@amb@nightclub@djs@dixon@", "dixn_idle_cntr_gb_dix", "DJ 8 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj9"] = {"anim@amb@nightclub@djs@dixon@", "dixn_sync_cntr_j_dix", "DJ 9 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["dj10"] = {"anim@amb@nightclub@djs@dixon@", "dixn_end_dix", "DJ 5 - ~y~New ", AnimationOptions =
        {
          EmoteLoop = true,
          EmoteMoving = false,
        }},
        ["jdj10"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ 10 - ~y~New ", AnimationOptions =
        {
            EmoteLoop = true,
        }},
        ["jdj11"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 11 - ~y~New ", AnimationOptions =
        {
            EmoteLoop = true,
        }},
        ["jdj12"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 12 - ~y~New ", AnimationOptions =
        {
         EmoteLoop = true,
        }},
        ["jdj13"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 13 - ~y~New ", AnimationOptions =
        {
            EmoteLoop = true,
        }},
    
        ["dontstart"] = {"custom@dont_start", "dont_start", "Dont Start - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["floss"] = {"custom@floss", "floss", "Floss - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["orangejustice"] = {"custom@orangejustice", "orangejustice", "Orange Justice - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["renegade"] = {"custom@renegade", "renegade", "Renegade - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["rickroll"] = {"custom@rickroll", "rickroll", "Rick Roll - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["savage"] = {"custom@savage", "savage", "Savage - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["sayso"] = {"custom@sayso", "sayso", "Say So - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["takel"] = {"custom@take_l", "take_l", "Take the L - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
    
        ["tslide"] = {"custom@toosie_slide", "toosie_slide", "Tootsie Slide - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        ["clock"] = {"custom@around_the_clock", "around_the_clock", "Around the clock - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["dancemoves"] = {"custom@dancemoves", "dancemoves", "Dance moves - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["discodance"] = {"custom@disco_dance", "disco_dance", "Disco Dance - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["electroshuffle"] = {"custom@electroshuffle_original", "electroshuffle_original", "Electro Shuffle - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["electroshuffle2"] = {"custom@electroshuffle", "electroshuffle", "Electro Shuffle 2 - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["fresh"] = {"custom@fresh_fortnite", "fresh_fortnite", "Fresh - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["gylphic"] = {"custom@gylphic", "gylphic", "Glyphic - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        ["salsa"] = {"custom@salsa", "salsa", "salsa ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
    
    
        ["gangnamstyle"] = {"custom@gangnamstyle", "gangnamstyle", "gangnamstyle ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
    
        ["makarena"] = {"custom@makarena", "makarena", "makarena ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
    
        ["maraschino"] = {"custom@maraschino", "maraschino", "maraschino ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
    
    
        ["pullup"] = {"custom@pullup", "pullup", "Pullup ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
    
        ["rollie"] = {"custom@rollie", "rollie", "Rollie ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
    
        ["wanna_see_me"] = {"custom@wanna_see_me", "wanna_see_me", "Wanna see me ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
    
        ["billybounce"] = {"custom@billybounce", "billybounce", "Billy bounce ", AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }},
        
        ["hitit"] = {"custom@hitit", "hitit", "Hit It - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["inparty"] = {"custom@in_da_party", "in_da_party", "In Da Party - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["robotdance"] = {"custom@robotdance_fortnite", "robotdance_fortnite", "Robot Dance - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["frightfunk"] = {"custom@frightfunk", "frightfunk", "Fright Funk - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["gloss"] = {"custom@gloss", "gloss", "Gloss - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["lastforever"] = {"custom@last_forever", "last_forever", "Last Forever - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["smoothmoves"] = {"custom@smooth_moves", "smooth_moves", "Smooth moves - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["introducing"] = {"custom@introducing", "introducing", "Introducing... - ~y~New ", AnimationOptions =
        {
        EmoteMoving = false,
        EmoteLoop = true,
        }},
        
        ["bellydance2"] = {"custom@bellydance2", "bellydance2", "Belly Dance 2 - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["fbbq"] = {"amb@prop_human_bbq@male@idle_a", "idle_b", "fbbq", AnimationOptions = { Prop = "prop_fish_slice_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = false, }},
    ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup", AnimationOptions = { Prop = 'prop_plastic_cup_02', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
    ["footwork"] = {"custom@footwork", "footwork", "Footwork - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    ["armwave"] = {"custom@armwave", "armwave", "armwave ", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},

    ["armswirl"] = {"custom@armswirl", "armswirl", "armswirl  ", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
        ["headspin"] = {"custom@headspin", "headspin", "Headspin - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = false,
    }},
    
        ["pumpup"] = {"custom@hiphop_pumpup", "hiphop_pumpup", "Hiphop Pumpup - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
        ["hiphop_yeah"] = {"custom@hiphop_yeah", "hiphop_yeah", "Hiphop Yeah - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = false,
    }},
    
    ["salsatime"] = {"custom@salsatime", "salsatime", "Salsa Time - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["samba"] = {"custom@samba", "samba", "Samba - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["shockdance"] = {"custom@shockdance", "shockdance", "Shock Dance - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["specialdance"] = {"custom@specialdance", "specialdance", "Special Dance - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["toetwist"] = {"custom@toetwist", "toetwist", "Toe twist - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},

   ["jdrill"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_male^3", "Drill · Male - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill2"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male^1", "Drill · Male 2 - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill3"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^4", "Drill · Male 3 - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Drill · Male 4 - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance F6 · Female", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill5"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^5", "Drill · Male 5 - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jDrill6"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^5", "Drill · Male 6 - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdrill7"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_up", "Drill · Solo 1 - ", AnimationOptions =
   {
       EmoteLoop = true,
    }},
    ["jdrill8"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center", "Drill · Solo 2 - ", AnimationOptions =
    {
        EmoteLoop = true,
     }},
    ["jdrill9"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_down", "Drill · Solo 3 - ", AnimationOptions =
     {
         EmoteLoop = true,
      }}, 
      ["jdrill10"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center", "Drill · Solo 4 - ", AnimationOptions =
     {
         EmoteLoop = true,
      }}, 
   ["jDrill11"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left_down", "Drill · Solo 5 - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Dance 2 · Male", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Dance 3 · Male", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Dance 4 · Male", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Upper · Female", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance Upper 2 · Female", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Dance Shy · Male", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance Shy 2 · Female", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center_down", "Dance Shy 3 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Dance Slow · Male", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["salsor"] = {"anim@mp_player_intuppersalsa_roll", "idle_a", "Salso Roll", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["unclej"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "Uncle Josh - ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Dance 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance8"] = {"missfbi3_sniping", "dance_m_default", "Dance 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Dance Silly · Male 1", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Dance Silly · Male 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Dance Silly · Male 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dance Silly · Female 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Dance Silly · Male 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Dance Silly · Male 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance · Female 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Dance Silly · Female 8", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Silly · Female 7", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dance 5", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Dance Glowsticks", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Dance Glowsticks 2", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Dance Glowsticks 3", AnimationOptions =
   {
       Prop = 'ba_prop_battle_glowstick_01',
       PropBone = 28422,
       PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
       SecondProp = 'ba_prop_battle_glowstick_01',
       SecondPropBone = 60309,
       SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
       EmoteLoop = true,
   }},
   ["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Dance Horse", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Dance Horse 2", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Dance Horse 3", AnimationOptions =
   {
       Prop = "ba_prop_battle_hobby_horse",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,  
    }},
    ["jmonkeyd"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center", "Monkey Dance  ", AnimationOptions =
   {
       EmoteLoop = true
    }},
    ["jmonkeyd2"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_down", "Monkey Dance 2  ", AnimationOptions =
    {
        EmoteLoop = true
     }},
     ["jmonkeyd3"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_down", "Monkey Dance 3  ", AnimationOptions =
     {
         EmoteLoop = true
      }},
    ["jrightdown"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_down", "Boxing Dance Solo  ", AnimationOptions =
    {
        EmoteLoop = true
     }},
     ["jlowdance"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center", "Low Dance · Female ", AnimationOptions =
    {
        EmoteLoop = true
       }},
       ["jlowdance2"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center", "Low Dance · Female", AnimationOptions =
       {
        EmoteLoop = true
        }},
       ["jhiphop"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_d@", "ped_a_dance_idle", "Hip Hop Dance ", AnimationOptions =
        {
           EmoteLoop = true
        }},
       ["jhiphop2"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_b@", "ped_a_dance_idle", "Hip Hop Dance ", AnimationOptions =
       {
           EmoteLoop = true
         }},
        ["jhiphop3"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_a@", "ped_a_dance_idle", "Hip Hop Dance ", AnimationOptions =
        {
           EmoteLoop = true
        }},
        ["hiphopslide"] = {"custom@hiphop_slide", "hiphop_slide", "HipHop Slide - ~y~New", AnimationOptions =
        {
           EmoteMoving = false,
           EmoteLoop = true,
        }},
        
        ["hiphop1"] = {"custom@hiphop1", "hiphop1", "HipHop 1 - ~y~New", AnimationOptions =
        {
           EmoteMoving = false,
           EmoteLoop = true,
        }},
        
        ["hiphop2"] = {"custom@hiphop2", "hiphop2", "HipHop 2 - ~y~New", AnimationOptions =
        {
           EmoteMoving = false,
           EmoteLoop = true,
        }},
        
        ["hiphop3"] = {"custom@hiphop3", "hiphop3", "HipHop 3 - ~y~New", AnimationOptions =
        {
           EmoteMoving = false,
           EmoteLoop = true,
        }},
        
        ["hiphopold"] = {"custom@hiphop90s", "hiphop90s", "HipHop Old - ~y~New", AnimationOptions =
        {
           EmoteMoving = false,
           EmoteLoop = true,
        }},
 }
 DP.AdultEmotes = {
    ["hump"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Male Hump - ~y~New", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
  
    }},
    ["hump2"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Male Hump 2 (Bear) - ~y~New", AnimationOptions =
    {
       Prop = 'prop_mr_raspberry_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = false,
       EmoteLoop = true,
  
    }},
    ["jcleanleg"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Check Pu**y - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["dock"] = {"anim@mp_player_intincardockstd@rds@", "idle_a", "Dock - ~y~New", AnimationOptions =
    {
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["fspose"] = {"missfam5_yoga", "c2_pose", "Female Sex Pose - ~y~New", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
  
  
    }},
    ["fspose2"] = {"missfam5_yoga", "c6_pose", "Female Sex Pose 2 - ~y~New", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
  
  
    }},
    ["fspose4"] = {"anim@amb@carmeet@checkout_car@", "female_c_idle_d", "Female Sex Pose 3 - ~y~New", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
  
  
    }},
    ["jerkf"] = {"switch@trevor@jerking_off", "trev_jerking_off_loop", "Female JerkOff! - ~y~New", AnimationOptions =
    {
       Prop = 'prop_cs_dildo_01',
       PropBone = 28422,
       PropPlacement = {0.09, 0.05, -0.03, 90.0, 80.0, 30.0},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["jshowboobs"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Show Boobs - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["jshowboobs2"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Show Boobs 2 - ~y~New", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteDuration = 6000,
    }},
    ["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance"},
    
    ["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance 2", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance3"] = {"mini@strip_club@private_dance@part1", "priv_dance_p1", "Lapdance 3 - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance4"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lapdance 4 - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance5"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lapdance 5", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdance6"] = {"oddjobs@assassinate@multi@yachttarget@lapdance", "yacht_ld_f", "Lapdance 6 - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdancewith"] = {"mini@strip_club@lap_dance_2g@ld_2g_p3", "ld_2g_p3_s2", "Lapdance With - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdancewith2"] = {"mini@strip_club@lap_dance_2g@ld_2g_p2", "ld_2g_p2_s2", "Lapdance With2 - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapdancewith3"] = {"mini@strip_club@lap_dance_2g@ld_2g_p1", "ld_2g_p1_s2", "Lapdance With3 - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapchair"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f", "Lap Chair - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapchair2"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p2", "ld_girl_a_song_a_p2_f", "Lap Chair2 - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["lapchair3"] = {"mini@strip_club@lap_dance@ld_girl_a_song_a_p3", "ld_girl_a_song_a_p3_f", "Lap Chair3 - ~y~New", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    
}

DP.Emotes = {

    ["valet"] = {"anim@amb@casino@valet_scenario@pose_a@", "base_a_m_y_vinewood_01", "Valet", AnimationOptions =
  {
     EmoteLoop = true,
     EmoteMoving = false,
  }},
  ["valet2"] = {"anim@amb@casino@valet_scenario@pose_b@", "base_a_m_y_vinewood_01", "Valet 2", AnimationOptions =
  {
     EmoteLoop = true,
     EmoteMoving = false,
  }},
  ["valet3"] = {"anim@amb@casino@valet_scenario@pose_d@", "base_a_m_y_vinewood_01", "Valet 3", AnimationOptions =
  {
     EmoteLoop = true,
     EmoteMoving = true,
  }},
  --["hump"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Hump - ~r~Adult", AnimationOptions =
 -- {
  --   EmoteMoving = false,
  --   EmoteLoop = true,
--
  --}},
  --["hump2"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Hump 2 (Bear) - ~r~New Adult ", AnimationOptions =
  --{
   --  Prop = 'prop_mr_raspberry_01',
   --  PropBone = 28422,
   --  PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   --  EmoteMoving = false,
    -- EmoteLoop = true,
--
 -- }},
  ["tighten"] = {"timetable@denice@ig_1", "idle_b", "Tigten (Yoga) - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  --["fspose"] = {"missfam5_yoga", "c2_pose", "Female Sex Pose - ~r~New Adult ", AnimationOptions =
  --{
   --  EmoteMoving = false,
  --   EmoteLoop = true,
--
--
 -- }},
  --["fspose2"] = {"missfam5_yoga", "c6_pose", "Female Sex Pose 2 - ~r~New Adult ", AnimationOptions =
  --{
  --   EmoteMoving = false,
   --  EmoteLoop = true,
--
--
  --}},
 -- ["fspose4"] = {"anim@amb@carmeet@checkout_car@", "female_c_idle_d", "Female Sex Pose 3 - ~r~New Adult ", AnimationOptions =
 -- {
  --   EmoteMoving = false,
   --  EmoteLoop = true,
--
--
 -- }},
  ["showerf"] = {"mp_safehouseshower@female@", "shower_enter_into_idle", "Shower Enter Female - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  ["showerf2"] = {"mp_safehouseshower@female@", "shower_idle_a", "Shower Female - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  ["showerf3"] = {"mp_safehouseshower@female@", "shower_idle_b", "Shower Female 2 - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  ["showerm"] = {"mp_safehouseshower@male@", "male_shower_idle_a", "Shower Enter Male - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  ["showerm2"] = {"mp_safehouseshower@male@", "male_shower_idle_b", "Shower Male 2 - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  ["showerm3"] = {"mp_safehouseshower@male@", "male_shower_idle_c", "Shower Male 3 - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  ["showerm4"] = {"mp_safehouseshower@male@", "male_shower_idle_d", "Shower Male 4 - ~y~New ", AnimationOptions =
  {
     EmoteMoving = false,
     EmoteLoop = true,

  }},
  ["picklock"] = {"missheistfbisetup1", "hassle_intro_loop_f", "Picklock - ~y~New ", AnimationOptions =
  {
     EmoteMoving = true,
     EmoteLoop = true,

  }},
  ["cleanhands"] = {"missheist_agency3aig_23", "urinal_sink_loop", "Clean Them Filthy Hands - ~y~New ", AnimationOptions =
  {
     EmoteMoving = true,
     EmoteLoop = true,

  }},
  ["cleanface"] = {"switch@michael@wash_face", "loop_michael", "Clean Your Face - ~y~New ", AnimationOptions =
  {
     EmoteMoving = true,
     EmoteLoop = true,

  }},
  ["buzz"] = {"anim@apt_trans@buzzer", "buzz_reg", "Buzz Door - ~y~New ", AnimationOptions =
  {
     EmoteLoop = false,
     EmoteMoving = false,

  }},


    ["jumpingjack"] = {"custom@jumpingjack", "jumpingjack", "·Jumping Jack", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["narutorun"] = {"custom@narutorun", "narutorun", "Naruto Run - ~y~New ", AnimationOptions =
    {
        EmoteMoving = true,
        EmoteLoop = true,
    }},
    ["dragonballz"] = {"custom@dragonballz", "dragonballz", "Dragonball Z - ~y~New ", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = false,
    }},
    ["ayubowan"] = {"flash@ayubowan", "flash_ayubonclip", "Ayubowan - ~y~New  ", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = true,
    }},


    ["corkscrew"] = {"mikey@acrobatics@new", "corkscrew", "Corkscrew - ~y~New ", AnimationOptions =
    {
        EmoteLoop = false
    }},
    ["corkscrew2"] = {"mikey@acrobatics@new", "corkscrew2", "Corkscrew 2 - ~y~New ", AnimationOptions =
    {
        EmoteLoop = false
    }},
    ["prop_flip"] = {"mikey@acrobatics@new", "prop_flip", "Prop Flip - ~y~New ", AnimationOptions =
    {
        EmoteLoop = false
    }},
    ["runfrontflip"] = {"mikey@acrobatics@new", "runfrontflip", "Run Front Flip - ~y~New ", AnimationOptions =
    {
        EmoteLoop = false
    }},
    ["runwallbackflip"] = {"mikey@acrobatics@new", "runwallbackflip", "Run Wall Back Flip - ~y~New ", AnimationOptions =
    {
        EmoteLoop = false
    }},
    --["spin_kickflip"] = {"mikey@acrobatics@new", "spin_kick_flip", "Spin Kick Flip", AnimationOptions =
    --{
    --   EmoteLoop = false
    --}},
    --["standingbackflip"] = {"mikey@acrobatics@new", "standingbackflip", "Standing Back Flip", AnimationOptions =
    --{
    --    EmoteLoop = false
    --}},
    --["steeze_backflip"] = {"mikey@acrobatics@new", "steeze_backflip", "Steeze Back Flip", AnimationOptions =
    --{
    --    EmoteLoop = false
    --}},
    ["twistflip"] = {"mikey@acrobatics@new", "twistflip", "Twistflip", AnimationOptions =
    {
        EmoteLoop = false
    }},
    
   ["drink"] = {"mp_player_inteat@pnq", "loop", "Drink", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jpbox"] = {"mp_am_hold_up", "purchase_beerbox_shopkeeper", "Purchase Box ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 2500,
   }},
   ["jch"] = {"amb@code_human_police_investigate@idle_b", "idle_f", "Cop Search ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 7000,
   }},
   ["jgangsign5"] = {"anim@mp_player_intupperdock", "idle_a", "Gang Sign ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jcheckwatch"] = {"amb@code_human_wander_idles_fat@male@idle_a", "idle_a_wristwatch", "Check Watch · Male ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jpicking"] = {"amb@prop_human_movie_bulb@idle_a", "idle_a", "Picking ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jgangaim"] = {"combat@aim_variations@1h@gang", "aim_variation_b", "Gang Aim ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
  -- ["jshowboobs"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Show Boobs ", AnimationOptions =
  -- {
   --    EmoteMoving = false,
   --    EmoteDuration = 6000,
  -- }},
   ["jcleanleg"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Clean Legs ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 6000,
   }},
  -- ["jshowboobs2"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Show Boobs 2 ", AnimationOptions =
   --{
   --    EmoteMoving = false,
    --   EmoteDuration = 6000,
   --}},
   ["jlockcar"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Lock Car ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jselfie5"] = {"cellphone@self", "selfie", "Selfie 3 ", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jselfiewc"] = {"cellphone@self@franklin@", "west_coast", "Selfie West Coast ", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jselfie3"] = {"cellphone@self@michael@", "finger_point", "Selfie Finger ", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jselfie4"] = {"cellphone@self@franklin@", "chest_bump", "Selfie Chest Bump ", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jSelfie1"] = {"cellphone@self@trevor@", "throat_slit", "Selfie ", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["jSelfie2"] = {"cellphone@self@trevor@", "proud_finger", "Selfie2 ", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["oob2"] = {"rcmfanatic3leadinoutef_3_mcs_1", "fra_outofbreath_loop", "Out Of Breath 2", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["damn3"] = {"misscommon@response", "damn", "Damn", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jkhaby"] = {"missarmenian3@simeon_tauntsidle_b", "areyounotman", "Khaby · Special ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jdepressed"] = {"oddjobs@bailbond_hobodepressed", "base", "Depressed ", AnimationOptions =
   {
    EmoteMoving = true,
   }},
   ["jcarsign"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base", "idle_a", "Gang Sign · Car ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jcarsign2"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base", "idle_a", "Gang Signs 2 · Car ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2500,
   }},
   ["jcarlowrider"] = {"anim@veh@lowrider@low@front_ds@arm@base", "sit", "Lowrider Style · Car  ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["jcarlowrider2"] = {"anim@veh@lowrider@std@ds@arm@music@mexicanidle_a", "idle", "Lowrider Mexican Style · Car  ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["handsow"] = {"rcmjosh1", "idle", "Hands On Waist", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["washhand"] = {"missheist_agency3aig_23", "urinal_sink_loop", "Wash Hands", AnimationOptions =
   {
    EmoteMoving = true,
   }},
   ["jleaningwallback"] = {"anim@amb@casino@peds@", "amb_world_human_leaning_male_wall_back_mobile_idle_a", "Leaning Wall Back · Male", AnimationOptions =
   {
    Prop = "prop_npc_phone_02",
    PropBone = 28422,
    PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    EmoteLoop = true,
    EmoteMoving = true,
   }},
   ["stop"] = {"anim@amb@casino@peds@", "mini_strip_club_idles_bouncer_stop_stop", "Stop", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Chill", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Cloudgaze", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Cloudgaze 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["prone"] = {"missfbi3_sniping", "prone_dave", "Prone", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Pullover", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Idle", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Idle 8"},
   ["idle9"] = {"friends@fra@ig_1", "base_idle", "Idle 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle10"] = {"mp_move@prostitute@m@french", "idle", "Idle 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["idle11"] = {"random@countrysiderobbery", "idle_a", "Idle 11", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Idle 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Idle 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Idle 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Idle 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Idle 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idle7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Idle 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Wait 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Idle Drunk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Idle Drunk 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["idledrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Idle Drunk 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitar"},
   ["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synth"},
   ["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Argue", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Argue 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Bartender", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Blow Kiss"},
   ["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Blow Kiss 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000

   }},
   ["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "Curtsy"},
   ["bringiton"] = {"misscommon@response", "bring_it_on", "Bring It On", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "Come at me bro", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000
   }},
   ["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Cop 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Cop 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crossarms"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Crossarms", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Crossarms 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["crossarms3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Crossarms 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms4"] = {"random@street_race", "_car_b_lookout", "Crossarms 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Crossarms 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Fold Arms 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarms6"] = {"random@shop_gunstore", "_idle", "Crossarms 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Fold Arms", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["crossarmsside"] = {"rcmnigel1a_band_groupies", "base_m2", "Crossarms Side", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Damn", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Damn 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Point Down", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["surrender"] = {"random@arrests@busted", "idle_a", "Surrender", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Facepalm 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Facepalm", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Facepalm 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 8000
   }},
   ["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Facepalm 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Fall Over"},
   ["fallover2"] = {"mp_suicide", "pistol", "Fall Over 2"},
   ["fallover3"] = {"mp_suicide", "pill", "Fall Over 3"},
   ["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Fall Over 4"},
   ["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Fall Over 5"},
   ["fallasleep"] = {"mp_sleep", "sleep_loop", "Fall Asleep", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "Fight Me"},
   ["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "Fight Me 2"},
   ["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Finger", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Finger 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Handshake", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["handshake2"] = {"mp_ped_interaction", "handshake_guy_b", "Handshake 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000
   }},
   ["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Wait 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["wait5"] = {"missclothing", "idle_storeclerk", "Wait 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Wait 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait7"] = {"rcmnigel1cnmt_1c", "base", "Wait 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait8"] = {"rcmjosh1", "idle", "Wait 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Wait 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Wait 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait11"] = {"misshair_shop@hair_dressers", "keeper_base", "Wait 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hiking"] = {"move_m@hiking", "idle", "Hiking", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Hug"},
   ["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Hug 2"},
   ["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Hug 3"},
   ["inspect"] = {"random@train_tracks", "idle_e", "Inspect"},
   ["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Jazzhands", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 6000,
   }},
   ["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jog 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jog 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jog 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jog5"] = {"move_m@joy@a", "walk", "Jog 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Jumping Jacks", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel2"] = {"rcmextreme3", "idle", "Kneel 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "Kneel 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "Knock", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "Knock 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Knuckle Crunch", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdance"},
   ["lean2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "Lean 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "Lean 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "Lean 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lean5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "Lean 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "Lean Flirt", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "Lean Bar 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "Lean Bar 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "Lean Bar 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "Lean High", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "Lean High 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside"] = {"timetable@mime@01_gc", "idle_a", "Leanside", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "Leanside 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Leanside 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "Leanside 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Me", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000
   }},
   ["mechanic"] = {"mini@repair", "fixing_a_ped", "Mechanic", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mechanic2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "Mechanic 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mechanic 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "Medic 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Meditiate", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Meditiate 2", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["meditate3"] = {"rcmepsilonism3", "base_loop", "Meditiate 3", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
   }},
   ["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal", AnimationOptions = -- CHANGE ME
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "No", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "No 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "Nose Pick", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "No Way", AnimationOptions =
   {
       EmoteDuration = 1500,
       EmoteMoving = true,
   }},
   ["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["outofbreath"] = {"re@construction", "out_of_breath", "Out of Breath", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Push", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Push 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["point"] = {"gestures@f@standing@casual", "gesture_point", "Point", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Pushup", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["countdown"] = {"random@street_race", "grid_girl_race_start", "Countdown", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Point Right", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salute", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salute 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salute 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared"] = {"random@domestic", "f_distressed_loop", "Scared", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "Scared 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["screwyou"] = {"misscommon@response", "screw_you", "Screw You", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "Shake Off", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3500,
   }},
   ["shot"] = {"random@dealgonewrong", "idle_a", "Shot", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Sleep", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Shrug", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Shrug 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "Sit", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "Sit 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "Sit 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "Sit 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "Sit 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "Sit 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "Sit 7", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "Sit 8", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "Sit 9", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "Sit Lean", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Sit Sad", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "Sit Scared", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "Sit Scared 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "Sit Scared 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "Sit Drunk", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "Sit Chair 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair3"] = {"timetable@reunited@ig_10", "base_amanda", "Sit Chair 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair4"] = {"timetable@ron@ig_3_couch", "base", "Sit Chair 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "Sit Chair 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchair6"] = {"timetable@maid@couch@", "base", "Sit Chair 6", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sitchairside"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "Sit Chair Side", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Sit Up", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clapangry"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Clap Angry", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Slow Clap 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clap"] = {"amb@world_human_cheering@male_a", "base", "Clap", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Slow Clap", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Slow Clap 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Smell", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Stick Up", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stumble"] = {"misscarsteal4@actor", "stumble", "Stumble", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stunned"] = {"stungun@standing", "damage", "Stunned", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Sunbathe", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "Sunbathe 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
["standfire"] = {"amb@world_human_stand_fire@male@base", "base", "standfire", AnimationOptions =
{
    EmoteLoop = true,
}},
   ["t"] = {"missfam5_yoga", "a2_pose", "Titanic", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["t2"] = {"mp_sleep", "bind_pose_180", "Titanic 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Think 5", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Think", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["think3"] = {"timetable@tracy@ig_8@base", "base", "Think 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},

   ["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Think 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Thumbs Up 3", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Thumbs Up 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Thumbs Up", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Type", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Type 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type3"] = {"mp_prison_break", "hack_loop", "Type 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["type4"] = {"mp_fbi_heist", "loop", "Type 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Warmth", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Wave 4", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Wave 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Wave 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave"] = {"friends@frj@ig_1", "wave_a", "Wave", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave5"] = {"friends@frj@ig_1", "wave_b", "Wave 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave6"] = {"friends@frj@ig_1", "wave_c", "Wave 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave7"] = {"friends@frj@ig_1", "wave_d", "Wave 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave8"] = {"friends@frj@ig_1", "wave_e", "Wave 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Wave 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whistle"] = {"taxi_hail", "hail_taxi", "Whistle", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 1300,
   }},
   ["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Whistle 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lift"] = {"random@hitch_lift", "idle_f", "Lift", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "LOL", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "LOL 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Gang Sign", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Gang Sign 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["passout"] = {"missarmenian2", "drunk_loop", "Passout", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Passout 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Passout 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Passout 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Passout 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Petting", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["crawl"] = {"move_injured_ground", "front_loop", "Crawl", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Flip 2"},
   ["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Flip"},
   ["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Slide"},
   ["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Slide 2"},
   ["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Slide 3"},
   ["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Slugger"},
   ["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Flip Off", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Flip Off 2", AnimationOptions =
   {
       EmoteMoving = true,
   }},
   ["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Bow", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Bow 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Key Fob", AnimationOptions =
   {
       EmoteLoop = false,
       EmoteMoving = true,
       EmoteDuration = 1000,
   }},
   ["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Golf Swing"},
   ["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 3000,
   }},
   ["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Reaching", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait"] = {"random@shop_tattoo", "_idle_a", "Wait", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Wait 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait12"] = {"rcmjosh1", "idle", "Wait 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["wait13"] = {"rcmnigel1a", "base", "Wait 13", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   --["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance 2", AnimationOptions =
  -- {
    --   EmoteLoop = true,
   --}},
   --["lapdance3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lapdance 3", AnimationOptions =
   --{
   --    EmoteLoop = true,
   --}},
   --["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
  -- {
   --    EmoteLoop = true,
  -- }},
   ["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Slap", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
       EmoteDuration = 2000,
   }},
   ["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Headbutt"},
   ["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Fish Dance", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["ledge"] = {"missfbi1", "ledge_loop", "Ledge", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["airplane"] = {"missfbi1", "ledge_loop", "Air Plane", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["peek"] = {"random@paparazzi@peek", "left_peek_a", "Peek", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Cough", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["stretch"] = {"mini@triathlon", "idle_e", "Stretch", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch2"] = {"mini@triathlon", "idle_f", "Stretch 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch3"] = {"mini@triathlon", "idle_d", "Stretch 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "Stretch 4", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Celebrate", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["punching"] = {"rcmextreme2", "loop_punching", "Punching", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["superhero"] = {"rcmbarry", "base", "Superhero", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["superhero2"] = {"rcmbarry", "base", "Superhero 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Mind Control", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Mind Control 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "Try Clothes", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "Try Clothes 2", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "Try Clothes 3", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Nervous 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Nervous", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Nervous 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["uncuff"] = {"mp_arresting", "a_uncuff", "Uncuff", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["weedbox"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
   {
       Prop = "hei_prop_heist_weed_block_01",
       PropBone = 28422,
       PropPlacement = {0.01, -0.07, -0.11, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Threaten", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Pull", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bird"] = {"random@peyote@bird", "wakeup", "Bird"},
   ["chicken"] = {"random@peyote@chicken", "wakeup", "Chicken", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bark"] = {"random@peyote@dog", "wakeup", "Bark"},
   ["rabbit"] = {"random@peyote@rabbit", "wakeup", "Rabbit"},
   ["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spider-Man", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "BOI", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 3000,
   }},
   ["adjust"] = {"missmic4", "michael_tux_fidget", "Adjust", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteDuration = 4000,
   }},
   ["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Hands Up", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},
   ["pee"] = {"misscarsteal2peeing", "peeing_loop", "Pee", AnimationOptions =
   {
       EmoteStuck = true,
       PtfxAsset = "scr_amb_chop",
       PtfxName = "ent_anim_dog_peeing",
       PtfxNoProp = true,
       PtfxPlacement = {-0.05, 0.3, 0.0, 0.0, 90.0, 90.0, },
       PtfxInfo = "Hold [G] to pee.",
       PtfxWait = 3000,
   }},

   -- new
   ["circlec"] = {"custom@circle_crunch", "circle_crunch", "Circle Crunc - ~y~New ", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
 
   }},
   ["dig"] = {"custom@dig", "dig", "Dig", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
 
   }},
   ["whatidk"] = {"custom@what_idk", "what_idk", "What Idk", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
 
   }},
   ["pick"] = {"custom@pickfromground", "pickfromground", "Pick From Ground", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["dab"] = {"custom@dab", "dab", "Dab - ~y~New ", AnimationOptions =
     {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["cantsee"] = {"custom@cant_see", "cant_see", "Cant See - ~y~New ", AnimationOptions =
     {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
   ["sheesh"] = {"custom@sheeeeesh", "sheeeeesh", "Sheeeeesh - ~y~New ", AnimationOptions =
     {
       EmoteMoving = true,
       EmoteLoop = true,
   }},
    ["convulsion"] = {"custom@convulsion", "convulsion", "Convulsion - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["pose1"] = {"custom@female_pose_1", "female_pose_1", "Pose 1 (Female) - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["pose2"] = {"custom@female_pose_2", "female_pose_2", "Pose 2 (Female) - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["pose3"] = {"custom@female_pose_3", "female_pose_3", "Pose 3 (Female) - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["pose4"] = {"custom@male_pose_1", "male_pose_1", "Pose 4 (Male) - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["pose5"] = {"custom@male_pose_2", "male_pose_2", "Pose 5 (Male) - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["pose6"] = {"custom@male_pose_3", "male_pose_3", "Pose 6 (Male) - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["pluck"] = {"custom@pluck_fruits", "pluck_fruits", "Pluck Fruits - ~y~New ", AnimationOptions =
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    
    ["waiter"] = {"custom@waiter", "waiter", "Waiter", AnimationOptions =
    {
       EmoteMoving = true,
       EmoteLoop = true,
    }},

-----------------------------------------------------------------------------------------------------------
------ new emotes idk --------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
    ["what_idk"] = {"custom@what_idk", "what_idk", "what_idk ", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},

    ["pickfromground"] = {"custom@pickfromground", "pickfromground", "pickfromground ", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},



-----------------------------------------------------------------------------------------------------------
------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
-----------------------------------------------------------------------------------------------------------

   ["atm"] = {"Scenario", "PROP_HUMAN_ATM", "ATM"},
   ["bbq"] = {"MaleScenario", "PROP_HUMAN_BBQ", "BBQ"},
   ["bumbin"] = {"Scenario", "PROP_HUMAN_BUM_BIN", "Bum Bin"},
   ["bumsleep"] = {"Scenario", "WORLD_HUMAN_BUM_SLUMPED", "Bum Sleep"},
   ["cheer"] = {"Scenario", "WORLD_HUMAN_CHEERING", "Cheer"},
   ["chinup"] = {"Scenario", "PROP_HUMAN_MUSCLE_CHIN_UPS", "Chinup"},
   ["clipboard2"] = {"MaleScenario", "WORLD_HUMAN_CLIPBOARD", "Clipboard 2"},
   ["cop"] = {"Scenario", "WORLD_HUMAN_COP_IDLES", "Cop"},
   ["copbeacon"] = {"MaleScenario", "WORLD_HUMAN_CAR_PARK_ATTENDANT", "Cop Beacon"},
   ["filmshocking"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Film Shocking"},
   ["flex"] = {"Scenario", "WORLD_HUMAN_MUSCLE_FLEX", "Flex"},
   ["guard"] = {"Scenario", "WORLD_HUMAN_GUARD_STAND", "Guard"},
   ["hammer"] = {"Scenario", "WORLD_HUMAN_HAMMERING", "Hammer"},
   ["hangout"] = {"Scenario", "WORLD_HUMAN_HANG_OUT_STREET", "Hangout"},
   ["impatient"] = {"Scenario", "WORLD_HUMAN_STAND_IMPATIENT", "Impatient"},
   ["janitor"] = {"Scenario", "WORLD_HUMAN_JANITOR", "Janitor"},
   ["jog"] = {"Scenario", "WORLD_HUMAN_JOG_STANDING", "Jog"},
   ["kneel"] = {"Scenario", "CODE_HUMAN_MEDIC_KNEEL", "Kneel"},
   ["leafblower"] = {"MaleScenario", "WORLD_HUMAN_GARDENER_LEAF_BLOWER", "Leafblower"},
   ["lean"] = {"Scenario", "WORLD_HUMAN_LEANING", "Lean"},
   ["leanbar"] = {"Scenario", "PROP_HUMAN_BUM_SHOPPING_CART", "Lean Bar"},
   ["lookout"] = {"Scenario", "CODE_HUMAN_CROSS_ROAD_WAIT", "Lookout"},
   ["maid"] = {"Scenario", "WORLD_HUMAN_MAID_CLEAN", "Maid"},
   ["medic"] = {"Scenario", "CODE_HUMAN_MEDIC_TEND_TO_DEAD", "Medic"},
   ["musician"] = {"MaleScenario", "WORLD_HUMAN_MUSICIAN", "Musician"},
   ["notepad2"] = {"Scenario", "CODE_HUMAN_MEDIC_TIME_OF_DEATH", "Notepad 2"},
   ["parkingmeter"] = {"Scenario", "PROP_HUMAN_PARKING_METER", "Parking Meter"},
   ["party"] = {"Scenario", "WORLD_HUMAN_PARTYING", "Party"},
   ["texting"] = {"Scenario", "WORLD_HUMAN_STAND_MOBILE", "Texting"},
   ["prosthigh"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", "Prostitue High"},
   ["prostlow"] = {"Scenario", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS", "Prostitue Low"},
   ["puddle"] = {"Scenario", "WORLD_HUMAN_BUM_WASH", "Puddle"},
   ["record"] = {"Scenario", "WORLD_HUMAN_MOBILE_FILM_SHOCKING", "Record"},
   -- Sitchair is a litte special, since you want the player to be seated correctly.
   -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"
   ["sitchair"] = {"ScenarioObject", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", "Sit Chair"},
   ["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Smoke"},
   ["smokeweed"] = {"MaleScenario", "WORLD_HUMAN_DRUG_DEALER", "Smoke Weed"},
   ["statue"] = {"Scenario", "WORLD_HUMAN_HUMAN_STATUE", "Statue"},
   ["sunbathe3"] = {"Scenario", "WORLD_HUMAN_SUNBATHE", "Sunbathe 3"},
   ["sunbatheback"] = {"Scenario", "WORLD_HUMAN_SUNBATHE_BACK", "Sunbathe Back"},
   ["weld"] = {"Scenario", "WORLD_HUMAN_WELDING", "Weld"},
   ["windowshop"] = {"Scenario", "WORLD_HUMAN_WINDOW_SHOP_BROWSE", "Window Shop"},
   ["yoga"] = {"Scenario", "WORLD_HUMAN_YOGA", "Yoga"},
   -- CASINO DLC EMOTES (STREAMED)
   ["karate"] = {"anim@mp_player_intcelebrationfemale@karate_chops", "karate_chops", "Karate"},
   ["karate2"] = {"anim@mp_player_intcelebrationmale@karate_chops", "karate_chops", "Karate 2"},
   ["cutthroat"] = {"anim@mp_player_intcelebrationmale@cut_throat", "cut_throat", "Cut Throat"},
   ["cutthroat2"] = {"anim@mp_player_intcelebrationfemale@cut_throat", "cut_throat", "Cut Throat 2"},
   ["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "Mind Blown", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "Mind Blown 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxing", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxing 2", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 4000
   }},
   ["stink"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Stink", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Think 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Adjust Tie", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteDuration = 5000
   }},
   ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Reaction Absolutely ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Reaction Anger ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Reaction Why ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactscrew"] = {"random@shop_robbery_reactions@", "screw_you", "Reaction Screw You ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Reaction Shock ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "Reaction Good Choice ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Try New Clothes ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Try New Clothes 2 ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Reaction Easy Now ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactıwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Reaction I will ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Reaction No Way ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Reaction Bye Hard ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreacthello"] = {"gestures@f@standing@casual", "gesture_hello", "Reaction Hello ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
      ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Look At Player ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
     ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Great ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Fake Punch ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
      ["jreactdamn"] = {"missheist_jewel", "damn", "Reaction Damn ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
     ["jimtellingyou"] = {"missheist_jewel", "im_telling_you", "I'm telling you ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jreactno"] = {"missheist_jewel", "despair", "Reaction No ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jdontkillme"] = {"missheist_jewel", "manageress_kneel_loop", "Dont Kill Me ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jbangbang"] = {"anim@mp_player_intcelebrationfemale@bang_bang", "bang_bang", "Bang Bang ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Try Shirt Negative ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "Try Shirt Positive ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
      ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Try Shoes ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Try Shoes 2 ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["joverhere"] = {"friends@fra@ig_1", "over_here_idle_a", "Over Here ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jwashingface"] = {"missmic2_washing_face", "michael_washing_face", "Washing Face ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
    ["jlastday"] = {"misstrevor1", "ortega_outro_loop_ort", "Last Day ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
    ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Try Glasses · Female ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
    ["jpickup"] = {"pickup_object", "pickup_low", "Pick Up ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "Stretch Long ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jhos"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Hang Out Street · Male ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Hang Out Street 2 · Male ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jguardaim"] = {"guard_reactions", "1hand_aiming_cycle", "Guard Aim ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jgready"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Getting Ready ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Look At Outfits ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 6000,
   }},
   ["jtoilet"] = {"switch@trevor@on_toilet", "trev_on_toilet_loop", "Have A Shit ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jtoilet2"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Have A Shit 2 ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jcovermale2"] = {"amb@code_human_cower@male@base", "base", "Cover · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jvalet"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Valet ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jvalet2"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Valet 2 ", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteLoop = true,
   }},
   ["jsunbathem"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Sunbathe · Male ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
   }},
   ["jsunbathem2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Sunbathe 2 · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jleancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Lean Car ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jcheckout2"] = {"anim@amb@carmeet@checkout_car@male_c@idles", "idle_a", "Check Out 2 · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jcheckout"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Check Out 3 · Female ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jreadmessages"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Read Messages · Male ", AnimationOptions =
   {
       EmoteMoving = false,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jreadmessages2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Read Messages 2 · Female ", AnimationOptions =
   {
       EmoteMoving = false,  
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
   }},
   ["jlistenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Listen Music ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jogger"] = {"move_f@jogger", "idle", "Jogger · Female ", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["jogger2"] = {"move_m@jogger", "idle", "Jogger · Male ", AnimationOptions =
   {
       EmoteDuration = 2500,
       EmoteMoving = true,
   }},
   ["jwtf"] = {"mini@triathlon", "wot_the_fuck", "Wot The Fuck ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "U Cant Do That ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jwarmup"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Warmup ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwarmup2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Warmup 2 ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwarmup3"] = {"mini@triathlon", "jog_idle_f", "Warmup 3 ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwarmup4"] = {"mini@triathlon", "jog_idle_e", "Warmup 4 ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jhmassage"] = {"missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Heart Massage ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jpassout"] = {"missheistfbi3b_ig8_2", "cower_loop_victim", "Pass Out ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jddealer"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Drug Dealer · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jswatch"] = {"amb@world_human_strip_watch_stand@male_c@idle_a", "idle_b", "Watch Strip · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jcheckw"] = {"amb@world_human_bum_wash@male@high@base", "base", "Check Water ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jwaitt"] = {"oddjobs@taxi@", "idle_a", "Wait Taxi ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteDuration = 5000,
   }},
   ["jnoway"] = {"oddjobs@towingpleadingbase", "base", "No Way ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jtsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Tell Something ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jlfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Looking For Help ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jmstretch"] = {"oddjobs@assassinate@multi@", "idle_a", "Muscle Stretch ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jdj"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdj2"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 2 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdj3"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 3 ", AnimationOptions =
   {
    EmoteLoop = true,
   }},
   ["jdj4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 4 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jlmic"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Listen Music In Car ", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteDuration = 2500,
   }},
   ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Get Off The Car ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Very Sad ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jdgrave"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Digging Grave ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
       Prop = 'prop_tool_shovel006',
       PropBone = 28422,
       PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
   }},
   ["jbow3"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Bend Over Wait ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 2500,
   }},
   ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Weeding · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "Look Plan ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteDuration = 5000,
   }},
   ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Gang Drink 2 ", AnimationOptions =
   {
       Prop = 'prop_cs_beer_bot_40oz_03',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jmleaning"] = {"amb@world_human_leaning@male@wall@back@mobile@base", "base", "Mobile Leaning · Male ", AnimationOptions =
   {
       EmoteMoving = false,
       EmoteLoop = true,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   }},
   ["jthanks"] = {"random@arrests", "thanks_male_05", "Thanks ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Texting · Male ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
   }},
 --  ["jffb"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "F*ck From Behind ", AnimationOptions =
  -- {
  --     EmoteLoop = true,
  -- }},
   ["jsitchair7"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", "Sit Chair 7 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jsitchair8"] = {"timetable@michael@on_sofabase", "sit_sofa_base", "Sit Chair 8 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jsitchair9"] = {"timetable@trevor@smoking_meth@base", "base", "Sit Chair 9 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jsitchair10"] = {"timetable@tracy@ig_7@base", "base", "Sit Chair 10 ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jstandingt"] = {"amb@world_human_bum_standing@twitchy@base", "base", "Standing Twitchy ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jstandingfit"] = {"amb@world_human_jog_standing@male@fitbase", "base", "Standing Fit ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jstandingm"] = {"anim@amb@casino@hangout@ped_male@stand@03b@base", "base", "Standing · Male ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jstandingf"] = {"anim@amb@casino@hangout@ped_female@stand@02a@base", "base", "Standing · Female ", AnimationOptions =
   {
       EmoteLoop = true,
   }},
   ["jgabgtaunt"] = {"switch@franklin@gang_taunt_p1", "gang_taunt_loop_lamar", "Gang Taunt ", AnimationOptions =
   {
    EmoteMoving = true,
    EmoteLoop = true,
   }},
   ["jdj5"] = {"mini@strip_club@idles@dj@base", "base", "DJ 5 ", AnimationOptions =
   {
    EmoteMoving = false,
    EmoteLoop = true,
   }},

}

DP.PropEmotes = {
    -- uWu
    ["bubbletea"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bubble Tea - ~p~Uwu ", AnimationOptions =
    {
        Prop = 'apa_prop_cs_plastic_cup_01',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["misosoup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Misosoup - ~p~Uwu ", AnimationOptions =
    {
        Prop = 'v_ret_247_noodle1',
        PropBone = 28422,
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["uwusandy"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandy - ~p~Uwu ", AnimationOptions =
    {
        Prop = 'ng_proc_food_ornge1a',
        PropBone = 18905,
        PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
        EmoteMoving = true,
    }},
    ["budhabowl"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Budhabowl - ~p~Uwu ", AnimationOptions =
    {
        Prop = "prop_cs_bowl_01b",
        PropBone = 60309,
        PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
        SecondProp = 'h4_prop_h4_caviar_spoon_01a',
        SecondPropBone = 28422,
        SecondPropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},


-----------------------------------------------------------------------------------------------------
------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
-----------------------------------------------------------------------------------------------------

   ["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Notepad", AnimationOptions =
   {
       Prop = 'prop_notepad_01',
       PropBone = 18905,
       PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
       SecondProp = 'prop_pencil_01',
       SecondPropBone = 58866,
       SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
       -- EmoteLoop is used for emotes that should loop, its as simple as that.
       -- Then EmoteMoving is used for emotes that should only play on the upperbody.
       -- The code then checks both values and sets the MovementType to the correct one
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["box"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
   {
       Prop = "hei_prop_heist_box",
       PropBone = 60309,
       PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose", AnimationOptions =
   {
       Prop = "prop_single_rose",
       PropBone = 18905,
       PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke 2", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 3", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Smoke 4", AnimationOptions =
   {
       Prop = 'prop_cs_ciggy_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bong", AnimationOptions =
   {
       Prop = 'hei_heist_sh_bong_01',
       PropBone = 18905,
       PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
   }},
   ["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase", AnimationOptions =
   {
       Prop = "prop_ld_suitcase_01",
       PropBone = 57005,
       PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "Suitcase 2", AnimationOptions =
   {
       Prop = "prop_security_case_01",
       PropBone = 57005,
       PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Mugshot", AnimationOptions =
   {
       Prop = 'prop_police_id_board',
       PropBone = 58868,
       PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
   {
       Prop = 'prop_drink_whisky',
       PropBone = 28422,
       PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup", AnimationOptions =
   {
       Prop = 'prop_plastic_cup_02',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
   {
       Prop = 'prop_cs_burger_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
       EmoteMoving = true,
   }},
   ["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
   {
       Prop = 'prop_ecola_can',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Ego Bar", AnimationOptions =
   {
       Prop = 'prop_choc_ego',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
   }},
   ["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Wine", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions =
   {
       Prop = 'prop_champ_flute',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne", AnimationOptions =
   {
       Prop = 'prop_drink_champ',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar", AnimationOptions =
   {
       Prop = 'prop_cigar_02',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigar 2", AnimationOptions =
   {
       Prop = 'prop_cigar_01',
       PropBone = 47419,
       PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitar 2", AnimationOptions =
   {
       Prop = 'prop_acc_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric", AnimationOptions =
   {
       Prop = 'prop_el_guitar_01',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 2", AnimationOptions =
   {
       Prop = 'prop_el_guitar_03',
       PropBone = 24818,
       PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["book"] = {"cellphone@", "cellphone_text_read_base", "Book", AnimationOptions =
   {
       Prop = 'prop_novel_01',
       PropBone = 6286,
       PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet", AnimationOptions =
   {
       Prop = 'prop_snow_flower_02',
       PropBone = 24817,
       PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Teddy", AnimationOptions =
   {
       Prop = 'v_ilev_mr_rasberryclean',
       PropBone = 24817,
       PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["backpack"] = {"move_p_m_zero_rucksack", "idle", "Backpack", AnimationOptions =
   {
       Prop = 'p_michael_backpack_s',
       PropBone = 24818,
       PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["clipboard"] = {"missfam4", "base", "Clipboard", AnimationOptions =
   {
       Prop = 'p_amb_clipboard_01',
       PropBone = 36029,
       PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["map"] = {"amb@world_human_tourist_map@male@base", "base", "Map", AnimationOptions =
   {
       Prop = 'prop_tourist_map_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["beg"] = {"amb@world_human_bum_freeway@male@base", "base", "Beg", AnimationOptions =
   {
       Prop = 'prop_beggers_sign_03',
       PropBone = 58868,
       PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["makeitrain"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Make It Rain", AnimationOptions =
   {
       Prop = 'prop_anim_cash_pile_01',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_xs_celebration",
       PtfxName = "scr_xs_money_rain",
       PtfxPlacement = {0.0, 0.0, -0.09, -80.0, 0.0, 0.0, },
       PtfxInfo = "Press [G] to make it rain.",
       PtfxWait = 500,
   }},
   ["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Camera", AnimationOptions =
   {
       Prop = 'prop_pap_camera_01',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
       PtfxAsset = "scr_bike_business",
       PtfxName = "scr_bike_cfid_camera_flash",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, },
       PtfxInfo = "Press [G] to use camera flash.",
       PtfxWait = 200,
   }},
   ["champagnespray"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Champagne Spray", AnimationOptions =
   {
       Prop = 'ba_prop_battle_champ_open',
       PropBone = 28422,
       PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
       EmoteMoving = true,
       EmoteLoop = true,
       PtfxAsset = "scr_ba_club",
       PtfxName = "scr_ba_club_champagne_spray",
       PtfxPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       PtfxInfo = "Hold [G] to spray champagne",
       PtfxWait = 500,
   }},
   ["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
   {
       Prop = 'p_cs_joint_02',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cig", AnimationOptions =
   {
       Prop = 'prop_amb_ciggy_01',
       PropBone = 47419,
       PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
       EmoteMoving = true,
       EmoteDuration = 2600
   }},
   ["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablet", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablet 2", AnimationOptions =
   {
       Prop = "prop_cs_tablet",
       PropBone = 28422,
       PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Phone Call", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["phone"] = {"cellphone@", "cellphone_text_read_base", "Phone", AnimationOptions =
   {
       Prop = "prop_npc_phone_02",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "Clean", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["clean2"] = {"amb@world_human_maid_clean@", "base", "Clean 2", AnimationOptions =
   {
       Prop = "prop_sponge_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jclean3"] = {"switch@franklin@cleaning_car", "001946_01_gc_fras_v2_ig_5_base", "Clean 3  ", AnimationOptions =
   {
    Prop = "prop_sponge_01",
    PropBone = 28422,
    PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
    EmoteLoop = true,
    EmoteMoving = true,
}},
["jmicro"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Hold a microphone  ", AnimationOptions =
   {
       Prop = "p_ing_microphonel_01",
       PropBone = 18905,
       PropPlacement = {0.11, 0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["jmicro2"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Hold a microphone 2  ", AnimationOptions =
   {
       Prop = "prop_microphone_02",
       PropBone = 18905,
       PropPlacement = {0.11, 0.03, 0.03, -100.0, 0.0, -10.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["jmicro3"] = {"missfra1", "mcs2_crew_idle_m_boom", "Hold a microphone 3 ", AnimationOptions =
   {
       Prop = "prop_v_bmike_01",
       PropBone = 28422,
       PropPlacement = {-0.08, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteMoving = true,
       EmoteLoop = true
   }},
   ["jcamerabig"] = {"missfinale_c2mcs_1", "fin_c2_mcs_1_camman", "Hold A Camera ", AnimationOptions =
   {
       Prop = "prop_v_cam_01",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["jdgrave1"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Digging Grave ", AnimationOptions =
   {
       EmoteMoving = true,
       EmoteLoop = true,
       Prop = 'prop_tool_shovel006',
       PropBone = 28422,
       PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
    }},
    ["rake"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Rake - ~y~New", AnimationOptions =
    {
       Prop = "prop_tool_rake",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["rake2"] = {"anim@amb@drug_field_workers@rake@male_a@idles", "idle_b", "Rake 2 - ~y~New", AnimationOptions =
    {
       Prop = "prop_tool_rake",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["rake3"] = {"anim@amb@drug_field_workers@rake@male_b@base", "base", "Rake 3 - ~y~New", AnimationOptions =
    {
       Prop = "prop_tool_rake",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["rake4"] = {"anim@amb@drug_field_workers@rake@male_b@idles", "idle_d", "Rake 4 - ~y~New", AnimationOptions =
    {
       Prop = "prop_tool_rake",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["broom"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Broom", AnimationOptions =
    {
       Prop = "prop_tool_broom",
       PropBone = 28422,
       PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["broom2"] = {"anim@amb@drug_field_workers@rake@male_a@idles", "idle_b", "Broom 2 - ~y~New", AnimationOptions =
    {
       Prop = "prop_tool_broom",
       PropBone = 28422,
       PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["broom3"] = {"anim@amb@drug_field_workers@rake@male_b@base", "base", "Broom 3 - ~y~New", AnimationOptions =
    {
       Prop = "prop_tool_broom",
       PropBone = 28422,
       PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["broom4"] = {"anim@amb@drug_field_workers@rake@male_b@idles", "idle_d", "Broom 4 - ~y~New", AnimationOptions =
    {
       Prop = "prop_tool_broom",
       PropBone = 28422,
       PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
       EmoteLoop = true,
    }},
    ["clean3"] = {"switch@franklin@cleaning_car", "001946_01_gc_fras_v2_ig_5_base", "Clean 3 - ~y~New", AnimationOptions =
     {
      Prop = "prop_sponge_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
  }},
    ["protest"] = {"rcmnigel1d", "base_club_shoulder", "protest - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_protest_sign_01",
      PropBone = 57005,
      PropPlacement = {0.1820, 0.2400, 0.0600, -69.3774235, 5.9142048, -13.9572354},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["binoculars"] = {"amb@world_human_binoculars@male@idle_b", "idle_f", "Binoculars", AnimationOptions =
    {
      Prop = "prop_binoc_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["binoculars2"] = {"amb@world_human_binoculars@male@idle_a", "idle_c", "Binoculars 2", AnimationOptions =
    {
      Prop = "prop_binoc_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["tennisplay"] = {"move_weapon@jerrycan@generic", "idle", "Tennis Play - ~y~New", AnimationOptions =
    {
      Prop = "prop_tennis_bag_01",
      PropBone = 57005,
      PropPlacement = {0.27, 0.0, 0.0, 91.0, 0.0, -82.9999951},
      SecondProp = 'prop_tennis_rack_01',
      SecondPropBone = 60309,
      SecondPropPlacement = {0.0800, 0.0300, 0.0, -130.2907295, 3.8782324, 6.588224},
      EmoteLoop = true,
      EmoteMoving = true,
  
  
    }},
    ["weights"] = {"amb@world_human_muscle_free_weights@male@barbell@base", "base", "Weights - ~y~New", AnimationOptions =
    {
      Prop = "prop_curl_bar_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["weights2"] = {"amb@world_human_muscle_free_weights@male@barbell@idle_a", "idle_d", "Weights 2 - ~y~New", AnimationOptions =
    {
      Prop = "prop_curl_bar_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["brief3"]  = {"move_weapon@jerrycan@generic", "idle", "Brief 3 - ~y~New", AnimationOptions =
    {
      Prop = "prop_ld_case_01",
      PropBone = 57005,
      PropPlacement = {0.12, 0.0, 0.0, 0.0, 255.0, 80.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["map2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Map 2 - ~y~New", AnimationOptions =
    {
      Prop = "prop_tourist_map_01",
      PropBone = 28422,
      PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["candy"] = {"mp_player_inteat@pnq", "loop", "Candy - ~y~New", AnimationOptions =
    {
      Prop = 'prop_candy_pqs',
      PropBone = 60309,
      PropPlacement = {-0.0300, 0.0180, 0.0, 180.0, 180.0, -88.099},
      EmoteMoving = true,
    }},
    ["whiskeyb"] = {"amb@world_human_drinking@beer@male@idle_a", "idle_a", "Whiskey Bottle - ~y~New", AnimationOptions =
    {
      Prop = 'ba_prop_battle_whiskey_bottle_2_s',
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.05, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["boombox"] = {"move_weapon@jerrycan@generic", "idle", "Boombox - ~y~New", AnimationOptions =
    {
      Prop = "prop_boombox_01",
      PropBone = 57005,
      PropPlacement = {0.27, 0.0, 0.0, 0.0, 263.0, 58.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["toolbox"] = {"move_weapon@jerrycan@generic", "idle", "Toolbox - ~y~New", AnimationOptions =
    {
      Prop = "prop_tool_box_04",
      PropBone = 28422,
      PropPlacement = {0.3960,0.0410,-0.0030, -90.00, 0.0, 90.00},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["toolbox2"] = {"move_weapon@jerrycan@generic", "idle", "Toolbox 2 - ~y~New", AnimationOptions =
    {
      Prop = "imp_prop_tool_box_01a",
      PropBone = 28422,
      PropPlacement = {0.3700,0.0200, 0.0, 90.00, 0.0, -90.00},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["gbag"] = {"missfbi4prepp1", "_idle_garbage_man", "Garbage Bag - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_street_binbag_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0400, -0.0200, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["beerbox"] = {"move_weapon@jerrycan@generic", "idle", "Beer Box 1 - ~y~New", AnimationOptions =
    {
      Prop = "v_ret_ml_beerdus",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["beerbox2"] = {"move_weapon@jerrycan@generic", "idle", "Beer Box 2 - ~y~New", AnimationOptions =
    {
      Prop = "v_ret_ml_beeram",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["beerbox3"] = {"move_weapon@jerrycan@generic", "idle", "Beer Box 3 - ~y~New", AnimationOptions =
    {
      Prop = "v_ret_ml_beerpride",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 48.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["beerbox4"] = {"move_weapon@jerrycan@generic", "idle", "Beer Box 4 - ~y~New", AnimationOptions =
    {
      Prop = "v_ret_ml_beerbar",
      PropBone = 57005,
      PropPlacement = {0.22, 0.0, 0.0, 0.0, 266.0, 60.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["fishing1"] = {"amb@world_human_stand_fishing@idle_a", "idle_a", "Fishing1 - ~y~New", AnimationOptions =
    {
      Prop = 'prop_fishing_rod_01',
      PropBone = 60309,
      PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = false,
    }},
    ["fishing2"] = {"amb@world_human_stand_fishing@idle_a", "idle_b", "Fishing2 - ~y~New", AnimationOptions =
    {
      Prop = 'prop_fishing_rod_01',
      PropBone = 60309,
      PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = false,
    }},
    ["fishing3"] = {"amb@world_human_stand_fishing@idle_a", "idle_c", "Fishing3 - ~y~New", AnimationOptions =
    {
      Prop = 'prop_fishing_rod_01',
      PropBone = 60309,
      PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = false,
    }},
    ["umbrella"] = {"rcmnigel1d", "base_club_shoulder", "Umbrella - ~y~New", AnimationOptions =
    {
      Prop = "p_amb_brolly_01",
      PropBone = 28422,
      PropPlacement = {0.0700, 0.0100, 0.1100, 2.3402393, -150.9605721, 57.3374916},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["fuel"] = {"weapons@misc@jerrycan@", "fire", "fuel - ~y~New", AnimationOptions =
    {
      Prop = "w_am_jerrycan",
      PropBone = 57005,
      PropPlacement = {0.1800, 0.1300, -0.2400, -165.8693883, -11.2122753, -32.9453021},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["fuelcarry"] = {"weapons@misc@jerrycan@franklin", "idle", "Fuel Carry - ~y~New", AnimationOptions =
    {
      Prop = "w_am_jerrycan",
      PropBone = 28422,
      PropPlacement = {0.26, 0.050, 0.0300, 80.00, 180.000, 79.99},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["hitchhike"] = {"random@hitch_lift", "idle_f", "Hitchhike - ~y~New", AnimationOptions =
    {
      Prop = "w_am_jerrycan",
      PropBone = 18905,
      PropPlacement = {0.32, -0.0100, 0.0, -162.423, 74.83, 58.79},
      SecondProp = 'prop_michael_backpack',
      SecondPropBone = 40269,
      SecondPropPlacement = {-0.07, -0.21, -0.11, -144.93, 117.358, -6.16},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign"] = {"rcmnigel1d", "base_club_shoulder", "Steal Stop Sign - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_road_01a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign2"] = {"rcmnigel1d", "base_club_shoulder", "Steal Yield Sign - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_road_02a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign3"] = {"rcmnigel1d", "base_club_shoulder", "Steal Hospital Sign - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_road_03d",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign4"] = {"rcmnigel1d", "base_club_shoulder", "Steal Parking Sign - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_road_04a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign5"] = {"rcmnigel1d", "base_club_shoulder", "Steal Parking Sign 2 - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_road_04w",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign6"] = {"rcmnigel1d", "base_club_shoulder", "Steal Pedestrian Sign - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_road_05a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign7"] = {"rcmnigel1d", "base_club_shoulder", "Steal Street Sign - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_road_05t",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign8"] = {"rcmnigel1d", "base_club_shoulder", "Steal Freeway Sign - ~y~New ", AnimationOptions =
    {
      Prop = "prop_sign_freewayentrance",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["ssign9"] = {"rcmnigel1d", "base_club_shoulder", "Steal Stop Sign Snow - ~y~New ", AnimationOptions =
    {
      Prop = "prop_snow_sign_road_01a",
      PropBone = 60309,
      PropPlacement = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["conehead"] = {"move_m@drunk@verydrunk_idles@", "fidget_07", "Cone Head - ~y~New ", AnimationOptions =
    {
      Prop = "prop_roadcone02b",
      PropBone = 31086,
      PropPlacement = {0.0500, 0.0200, -0.000, 30.0000004, 90.0, 0.0},
      --
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_bs_tray_03",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray2"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 2 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_bs_tray_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray3"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 3 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_cb_tray_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray4"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 4 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_tray_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray5"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 5 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_tray_03",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.0400, -0.1390,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray6"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 6 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_bs_tray_02",
      PropBone = 57005,
      PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
      SecondProp = 'prop_food_bs_tray_03',
      SecondPropBone =18905,
      SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray7"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 7 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_cb_tray_02",
      PropBone = 57005,
      PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
      SecondProp = 'prop_food_cb_tray_02',
      SecondPropBone =18905,
      SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtray8"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 8 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_tray_02",
      PropBone = 57005,
      PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
      SecondProp = 'prop_food_tray_03',
      SecondPropBone =18905,
      SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodtraytray9"] = {"anim@heists@box_carry@", "idle", "Carry Food Tray 9 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_tray_02",
      PropBone = 57005,
      PropPlacement = {0.2500, 0.1000, 0.0700,-110.5483936, 73.3529273, -16.338362},
      SecondProp = 'prop_food_tray_02',
      SecondPropBone =18905,
      SecondPropPlacement = {0.2200, 0.1300, -0.1000, -127.7725487, 110.2074758, -3.5886263},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carrypizza"] = {"anim@heists@box_carry@", "idle", "Carry Pizza Box - ~y~New", AnimationOptions =
    {
      Prop = "prop_pizza_box_02",
      PropBone = 28422,
      PropPlacement = {0.0100, -0.1000, -0.1590,20.0000007, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodbag"] = {"move_weapon@jerrycan@generic", "idle", "Carry Food Bag - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_bs_bag_01",
      PropBone = 57005,
      PropPlacement = {0.3300, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodbag2"] = {"move_weapon@jerrycan@generic", "idle", "Carry Food Bag 2 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_cb_bag_01",
      PropBone = 57005,
      PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["carryfoodbag3"] = {"move_weapon@jerrycan@generic", "idle", "Carry Food Bag 3 - ~y~New", AnimationOptions =
    {
      Prop = "prop_food_bag1",
      PropBone = 57005,
      PropPlacement = {0.3800, 0.0, -0.0300, 0.0017365, -79.9999997, 110.0651988},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["tag"] = {"anim@scripted@freemode@postertag@graffiti_spray@male@", "shake_can_male", "Tagging Shake Can Male - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["tag2"] = {"anim@scripted@freemode@postertag@graffiti_spray@heeled@", "shake_can_female", "Tagging Shake Can Female - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["tag3"] = {"anim@scripted@freemode@postertag@graffiti_spray@male@", "spray_can_var_01_male", "Tagging Male 1 - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["tag4"] = {"anim@scripted@freemode@postertag@graffiti_spray@male@", "spray_can_var_02_male", "Tagging Male 2 - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["tag5"] = {"anim@scripted@freemode@postertag@graffiti_spray@heeled@", "spray_can_var_01_female", "Tagging Female 1 - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["tag6"] = {"anim@scripted@freemode@postertag@graffiti_spray@heeled@", "spray_can_var_02_female", "Tagging Female 2 - ~y~New", AnimationOptions =
    {
      Prop = "prop_cs_spray_can",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0700, 0.0017365, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["beans"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Beans - ~y~New", AnimationOptions =
    {
      Prop = "h4_prop_h4_caviar_tin_01a",
      PropBone = 60309,
      PropPlacement = {0.0, 0.0300, 0.0100,0.0,0.0,0.0},
      SecondProp = 'h4_prop_h4_caviar_spoon_01a',
      SecondPropBone = 28422,
      SecondPropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["newscam"] = {"missfinale_c2mcs_1", "fin_c2_mcs_1_camman", "News Camera - ~y~New", AnimationOptions =
    {
      Prop = "prop_v_cam_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0300, 0.0100,0.0,0.0,0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["newsmic"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "News Microphone - ~y~New", AnimationOptions =
    {
      Prop = "p_ing_microphonel_01",
      PropBone = 4154,
      PropPlacement = {-0.00, -0.0200, 0.1100, 0.00, 0.0, 60.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
     ["newsmic2"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Hold a microphone 2 - ~y~New", AnimationOptions =
     {
         Prop = "prop_microphone_02",
         PropBone = 18905,
         PropPlacement = {0.11, 0.03, 0.03, -100.0, 0.0, -10.0},
         EmoteMoving = true,
         EmoteLoop = true
     }},
  
    ["newsbmic"] = {"missfra1", "mcs2_crew_idle_m_boom", "News Boom Microphone - ~y~New", AnimationOptions =
    {
      Prop = "prop_v_bmike_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["leafblower"] = {"amb@world_human_gardener_leaf_blower@base", "base", "Leaf Blower", AnimationOptions =
    {
      Prop = "prop_leaf_blower_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["bbqf"] = {"amb@prop_human_bbq@male@idle_a", "idle_b", "BBQ ", AnimationOptions =
    {
      Prop = "prop_fish_slice_01",
      PropBone = 28422,
      PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
      EmoteLoop = true,
      EmoteMoving = true,
    }},
    ["pump"] = {"missfbi4prepp1", "idle", "Pumpkin - ~y~New", AnimationOptions =
    {
       Prop = "prop_veg_crop_03_pump",
       PropBone = 28422,
       PropPlacement = {0.0200, 0.0600, -0.1200, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["pump2"] = {"anim@heists@box_carry@", "idle", "Pumpkin 2 - ~y~New", AnimationOptions =
    {
       Prop = "prop_veg_crop_03_pump",
       PropBone = 28422,
       PropPlacement = {0.0100, -0.16000, -0.2100, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["mop"] = {"missfbi4prepp1", "idle", "Mop - ~y~New", AnimationOptions =
    {
       Prop = "prop_cs_mop_s",
       PropBone = 28422,
       PropPlacement = {-0.0200,-0.0600,-0.2000, -13.377, 10.3568, 17.9681},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
    ["mop2"] = {"move_mop", "idle_scrub_small_player", "Mop 2 - ~y~New", AnimationOptions =
    {
       Prop = "prop_cs_mop_s",
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.1200, 0.0, 0.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
    }},
}

DP.Customs = {
    ["darlingpose1"] = {"lunyx@darling@pose001", "darling@pose001", "Darling Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose2"] = {"lunyx@darling@pose002", "darling@pose002", "Darling Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose3"] = {"lunyx@darling@pose003", "darling@pose003", "Darling Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose4"] = {"lunyx@darling@pose004", "darling@pose004", "Darling Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose5"] = {"lunyx@darling@pose005", "darling@pose005", "Darling Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose6"] = {"lunyx@darling@pose006", "darling@pose006", "Darling Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose7"] = {"lunyx@darling@pose007", "darling@pose007", "Darling Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose8"] = {"lunyx@darling@pose008", "darling@pose008", "Darling Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose9"] = {"lunyx@darling@pose009", "darling@pose009", "Darling Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["darlingpose10"] = {"lunyx@darling@pose010", "darling@pose010", "Darling Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["idp1"] = {"lunyx@ichillin@p1", "ichillin@p1", "ICHILLIN' DRAW Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["ots1"] = {"lunyx@ig@v1@01", "ig@v1@01", "On The Streets Pose 01", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots2"] = {"lunyx@ig@v1@02", "ig@v1@02", "On The Streets Pose 02", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots3"] = {"lunyx@ig@v1@03", "ig@v1@03", "On The Streets Pose 03", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots4"] = {"lunyx@ig@v1@04", "ig@v1@04", "On The Streets Pose 04", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots5"] = {"lunyx@ig@v1@05", "ig@v1@05", "On The Streets Pose 05", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots6"] = {"lunyx@ig@v1@06", "ig@v1@06", "On The Streets Pose 06", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots7"] = {"lunyx@ig@v1@07", "ig@v1@07", "On The Streets Pose 07", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots8"] = {"lunyx@ig@v1@08", "ig@v1@08", "On The Streets Pose 08", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots9"] = {"lunyx@ig@v1@09", "ig@v1@09", "On The Streets Pose 09", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots10"] = {"lunyx@ig@v1@10", "ig@v1@10", "On The Streets Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots11"] = {"lunyx@ig@v1@11", "ig@v1@11", "On The Streets Pose 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots12"] = {"lunyx@ig@v1@12", "ig@v1@12", "On The Streets Pose 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots13"] = {"lunyx@ig@v1@13", "ig@v1@13", "On The Streets Pose 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots14"] = {"lunyx@ig@v1@14", "ig@v1@14", "On The Streets Pose 14", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots15"] = {"lunyx@ig@v1@15", "ig@v1@15", "On The Streets Pose 15", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots16"] = {"lunyx@ig@v1@16", "ig@v1@16", "On The Streets Pose 16", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots17"] = {"lunyx@ig@v1@17", "ig@v1@17", "On The Streets Pose 17", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots18"] = {"lunyx@ig@v1@18", "ig@v1@18", "On The Streets Pose 18", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots19"] = {"lunyx@ig@v1@19", "ig@v1@19", "On The Streets Pose 19", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ots20"] = {"lunyx@ig@v1@20", "ig@v1@20", "On The Streets Pose 20", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["justme1"] = {"lunyx@justme001", "justme001", "Just Me Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
 
    ["justme2"] = {"lunyx@justme002", "justme002", "Just Me Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme3"] = {"lunyx@justme003", "justme003", "Just Me Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme4"] = {"lunyx@justme004", "justme004", "Just Me Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme5"] = {"lunyx@justme005", "justme005", "Just Me Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme6"] = {"lunyx@justme006", "justme006", "Just Me Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme7"] = {"lunyx@justme007", "justme007", "Just Me Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme8"] = {"lunyx@justme008", "justme008", "Just Me Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme9"] = {"lunyx@justme009", "justme009", "Just Me Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme10"] = {"lunyx@justme010", "justme010", "Just Me Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["justme11"] = {"lunyx@justme011", "justme011", "Just Me Pose 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["js1"] = {"lunyx@justsit@001", "justsit@001", "Just Sit Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js2"] = {"lunyx@justsit@002", "justsit@002", "Just Sit Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js3"] = {"lunyx@justsit@003", "justsit@003", "Just Sit Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js4"] = {"lunyx@justsit@004", "justsit@004", "Just Sit Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js5"] = {"lunyx@justsit@005", "justsit@005", "Just Sit Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js6"] = {"lunyx@justsit@006", "justsit@006", "Just Sit Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js7"] = {"lunyx@justsit@007", "justsit@007", "Just Sit Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js8"] = {"lunyx@justsit@008", "justsit@008", "Just Sit Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js9"] = {"lunyx@justsit@009", "justsit@009", "Just Sit Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["js10"] = {"lunyx@justsit@010", "justsit@010", "Just Sit Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["lb1"] = {"lunyx@lookbook_v1@pose001", "lookbook_v1@pose001", "Lookbook Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb2"] = {"lunyx@lookbook_v1@pose002", "lookbook_v1@pose002", "Lookbook Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb3"] = {"lunyx@lookbook_v1@pose003", "lookbook_v1@pose003", "Lookbook Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb4"] = {"lunyx@lookbook_v1@pose004", "lookbook_v1@pose004", "Lookbook Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb5"] = {"lunyx@lookbook_v1@pose005", "lookbook_v1@pose005", "Lookbook Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb6"] = {"lunyx@lookbook_v1@pose006", "lookbook_v1@pose006", "Lookbook Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb7"] = {"lunyx@lookbook_v1@pose007", "lookbook_v1@pose007", "Lookbook Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb8"] = {"lunyx@lookbook_v1@pose008", "lookbook_v1@pose008", "Lookbook Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb9"] = {"lunyx@lookbook_v1@pose009", "lookbook_v1@pose009", "Lookbook Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb10"] = {"lunyx@lookbook_v1@pose010", "lookbook_v1@pose010", "Lookbook Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb11"] = {"lunyx@lookbook_v1@pose011", "lookbook_v1@pose011", "Lookbook Pose 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb12"] = {"lunyx@lookbook_v1@pose012", "lookbook_v1@pose012", "Lookbook Pose 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb13"] = {"lunyx@lookbook_v1@pose013", "lookbook_v1@pose013", "Lookbook Pose 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb14"] = {"lunyx@lookbook_v1@pose014", "lookbook_v1@pose014", "Lookbook Pose 14", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb15"] = {"lunyx@lookbook_v1@pose015", "lookbook_v1@pose015", "Lookbook Pose 15", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["lb301"] = {"lunyx@lookbookv3@pose001", "lookbookv3@pose001", "Lookbook V3 Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb302"] = {"lunyx@lookbookv3@pose002", "lookbookv3@pose002", "Lookbook V3 Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb303"] = {"lunyx@lookbookv3@pose003", "lookbookv3@pose003", "Lookbook V3 Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb304"] = {"lunyx@lookbookv3@pose004", "lookbookv3@pose004", "Lookbook V3 Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb305"] = {"lunyx@lookbookv3@pose005", "lookbookv3@pose005", "Lookbook V3 Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb306"] = {"lunyx@lookbookv3@pose006", "lookbookv3@pose006", "Lookbook V3 Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb307"] = {"lunyx@lookbookv3@pose007", "lookbookv3@pose007", "Lookbook V3 Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb308"] = {"lunyx@lookbookv3@pose008", "lookbookv3@pose008", "Lookbook V3 Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb309"] = {"lunyx@lookbookv3@pose009", "lookbookv3@pose009", "Lookbook V3 Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb310"] = {"lunyx@lookbookv3@pose010", "lookbookv3@pose010", "Lookbook V3 Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb311"] = {"lunyx@lookbookv3@pose011", "lookbookv3@pose011", "Lookbook V3 Pose 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb312"] = {"lunyx@lookbookv3@pose012", "lookbookv3@pose012", "Lookbook V3 Pose 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb313"] = {"lunyx@lookbookv3@pose013", "lookbookv3@pose013", "Lookbook V3 Pose 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb314"] = {"lunyx@lookbookv3@pose014", "lookbookv3@pose014", "Lookbook V3 Pose 14", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb315"] = {"lunyx@lookbookv3@pose015", "lookbookv3@pose015", "Lookbook V3 Pose 15", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb316"] = {"lunyx@lookbookv3@pose016", "lookbookv3@pose016", "Lookbook V3 Pose 16", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb317"] = {"lunyx@lookbookv3@pose017", "lookbookv3@pose017", "Lookbook V3 Pose 17", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb318"] = {"lunyx@lookbookv3@pose018", "lookbookv3@pose018", "Lookbook V3 Pose 18", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb319"] = {"lunyx@lookbookv3@pose019", "lookbookv3@pose019", "Lookbook V3 Pose 19", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["lb320"] = {"lunyx@lookbookv3@pose020", "lookbookv3@pose020", "Lookbook V3 Pose 20", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["portrait1"] = {"lunyx@portrait001", "portrait001", "Portrait Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["portrait2"] = {"lunyx@portrait002", "portrait002", "Portrait Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait3"] = {"lunyx@portrait003", "portrait003", "Portrait Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait4"] = {"lunyx@portrait004", "portrait004", "Portrait Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait5"] = {"lunyx@portrait005", "portrait005", "Portrait Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait6"] = {"lunyx@portrait006", "portrait006", "Portrait Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait7"] = {"lunyx@portrait007", "portrait007", "Portrait Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait8"] = {"lunyx@portrait008", "portrait008", "Portrait Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait9"] = {"lunyx@portrait009", "portrait009", "Portrait Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
       ["portrait10"] = {"lunyx@portrait010", "portrait010", "Portrait Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["sweetie1"] = {"lunyx@sweetie@pose001", "sweetie@pose001", "Sweetie Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie2"] = {"lunyx@sweetie@pose002", "sweetie@pose002", "Sweetie Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie3"] = {"lunyx@sweetie@pose003", "sweetie@pose003", "Sweetie Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie4"] = {"lunyx@sweetie@pose004", "sweetie@pose004", "Sweetie Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie5"] = {"lunyx@sweetie@pose005", "sweetie@pose005", "Sweetie Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie6"] = {"lunyx@sweetie@pose006", "sweetie@pose006", "Sweetie Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie7"] = {"lunyx@sweetie@pose007", "sweetie@pose007", "Sweetie Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie8"] = {"lunyx@sweetie@pose008", "sweetie@pose008", "Sweetie Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie9"] = {"lunyx@sweetie@pose009", "sweetie@pose009", "Sweetie Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["sweetie10"] = {"lunyx@sweetie@pose010", "sweetie@pose010", "Sweetie Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["jump1"] = {"syx@jump01", "jump01", "Jump 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jump2"] = {"syx@jump02", "jump02", "Jump 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jump3"] = {"syx@jump03", "jump03", "Jump 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jump4"] = {"syx@jump04", "jump04", "Jump 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jump5"] = {"syx@jump05", "jump05", "Jump 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jump6"] = {"syx@jump06", "jump06", "Jump 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jump7"] = {"syx@jump07", "jump07", "Jump 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["jump8"] = {"syx@jump08", "jump08", "Jump 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
}

local function getEmotes()
    return DP;
end

exports("getEmotes", getEmotes);