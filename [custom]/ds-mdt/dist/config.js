
var licensesData = [ //add new license here use same id as your license name in database.
    {
        id: 'weapon',
        color : 'red',
        description : "Weapon License"
    },
    {
        id: 'driver',
        color : 'green',
        description : "Driving License"
    },

    {
        id: 'business',
        color : 'red',
        description : "Business License"
    },
]


var Language = {
    dashboard: "Dashboard",
    incidents: "Incidents",
    profiles: "Profiles",
    vehicles: "Vehicles",
    reports: "Reports",
    evidence: "Evidence",
    warrants: "Warrants",
    charges: "Charges",
    config: "Config",
    welcome: "Welcome",
    badge: "Badge: ",
    duty: "ON DUTY",
    editprofile: "Edit Profile",
    submitevi: "Submit Evidence",
    createreport: "Create Report",
    editreport: "Edit Report",
    editvehicle: "Edit Vehicle",
    bolo: "BOLO",
    invreport: "Investigative Report",
    civreport: "Civilian Report",
    reporttype: "Report Type",
    search: "Search",
    approved: "Approved",
    papproval: "Pending Approval",
    rapproval: "Approval Rejected",
    expirein: "expires in",
    ago: "ago",
    officerin: "Officers Involved",
    personin: "Person Involved",
    criminalsc: "Add Criminal Scum",
    vehiclein: "Vehicle Involved",
    documenthere: "Document content goes here",
    warrsec: "Warrant action successful",
    maintitle: "Title",
    imgurl: "Profile Image URL",
    profileloaded: "Profile Loaded with CitizenID",
    profilesaved: "Profile saved with CitizenID",
    licenseRemoved: "License Removed",
    evidencealready: 'Evidence already added! 1',
    evidencenot: "Evidence not found!",
    evidenceid: "Evidence ID",
    evidenceass: 'Evidence assigned ID 1',
    assievi: "Assign Evidence",
    assign: "ASSIGN",
    createevi: "Create Evidence",
    type: "Type",
    imgurl2: "Image URL",
    description: "Description",
    evicreated: "Evidence created ID",
    create: "CREATE",
    close: "CLOSE",
    name: "Name",
    stateid: "SlateID",
    alreadyin: "ALREADY ADDED",
    add: "ADD",
    editcharges: "Edit Charges",
    arrwarr: "Warrant for Arrest",
    reductions: "Reductions",
    inprg: "In Progress",
    expired: "Expired",
    expires: "Expires",
    guilty: "Pleaded Guilty",
    processed: "Processed",
    month: "month(s)",
    final: "Final",
    incsaved: "Incident saved with ID",
    incloaded: 'Incident loaded with ID 1',
    reportloaded: "Report loaded with ID",
    reportsaved: "Report saved with ID",
    photo: "Photo",
    bullets: "Bullets",
    blood: "Blood",
    vehicle: "Vehicle",
    other: "Other",
    evidencesaved: "Evidence created with ID",
    extendedsidebar: "Extended Sidebar",
    dtheme: "Dark Theme",
    save: "SAVE",
    mrights: "You have the right to remain silent. Anything you say can and will be used against you in a court of law. You have the right to an attorney. If you cannot afford an attorney, one will be provided for you. Do you understand the rights I have just read to you? With these rights in mind, do you wish to speak to me?",
    configsaved: "Config Saved Successfully",
    success: "Success",
    error: "Error",
    empty: "Empty Fields",
    assperson: "Assign Person",
    citizenid: 'CitizenID',
    incident: "Incident",
    report: "Report",
    incin: "Incidents Involved",
    reportinv: "Reports Involved",
    fine: "Fine",
    seized: "Seized",
    vsaved: "Vehicle saved with PlateID",
    vloaded: "Vehicle loaded with PlateID",
    vimage: "Vehicle Image URL",
    vowner: "Owner",
    vmodel: "Model",
}

var mdtLogo = "https://cdn.discordapp.com/attachments/804364568511512626/851695091877150740/CityofLosSantos.png"


var mdtCharges = [{
    name: "Simple Assault",
    fine: 500,
    time: 5,
    color: "green",
    description: "Attempts to or commits an injury upon another person without the use of a weapon."
}, {
    name: "Assault",
    fine: 700,
    time: 10,
    color: "green",
    description: "Causes bodily injury to another, threatens another with imminent bodily injury, or causes physical contact that should reasonably be considered offensive or provocative."
}, {
    name: "Accomplice to an crime",
    fine: 1e3,
    time: 10,
    color: "green",
    description: "A person who helps another commit a crime."
}, {
    name: "Aggravated Assault",
    fine: 3e3,
    time: 15,
    color: "green",
    description: "Attempts to or commits serious or grievous bodily injury upon someone with a weapon."
}, {
    name: "Sexual Assault",
    fine: 2e4,
    time: 20,
    color: "red",
    description: "Sexual assault is an act in which a person intentionally sexually touches another person without that person's consent, or coerces or physically forces a person to engage in a sexual act against their will ."
}, {
    name: "Involuntary Manslaughter",
    fine: 2e3,
    time: 20,
    color: "green",
    description: "Recklessly or accidentally kills another person."
}, {
    name: "Vehicular Manslaughter",
    fine: 3e3,
    time: 30,
    color: "green",
    description: "Recklessly or accidentally kills another person while driving a motor vehicle."
}, {
    name: "Voluntary Manslaughter",
    fine: 5e3,
    time: 35,
    color: "red",
    description: "Recklessly or accidentally kills another person with intent to physically hurt the person."
}, {
    name: "Second Degree Murder",
    fine: 1e4,
    time: 40,
    color: "red",
    description: "Kills another person with the intent to kill."
}, {
    name: "First Degree Murder",
    fine: 15e3,
    time: 50,
    color: "red",
    description: "Kills another person with the intent to kill with premeditation and deliberation."
}, {
    name: "Unlawful Imprisonment",
    fine: 2e3,
    time: 10,
    color: "green",
    description: "Restricts a person's movement within any area without justification or consent."
}, {
    name: "Kidnapping",
    fine: 2500,
    time: 20,
    color: "green",
    description: "Abducts another person and holds them against their will for an extended period of time."
}, {
    name: "Kidnapping of a Public Servant",
    fine: 3500,
    time: 25,
    color: "green",
    description: "Abducts a Public Servant and holds them against their will for an extended period of time."
}, {
    name: "Hostage Taking",
    fine: 1250,
    time: 10,
    color: "green",
    description: "Holds a person with a threat to their life or well being with intent or declaration of using them for leverage for escape or personal gain."
}, {
    name: "Criminal Threats",
    fine: 1e3,
    time: 5,
    color: "green",
    description: "Any person who willfully utters a threat to commit a crime which will result in death or bodily injury to another person."
}, {
    name: "Reckless Endangerment",
    fine: 2e3,
    time: 10,
    color: "green",
    description: "Disregard for one's own life or the life of another."
}, {
    name: "Harassment",
    fine: 3e3,
    time: 15,
    color: "green",
    description: "Intimidates or pressures another person aggressively with unwelcome words, deeds, actions, or gestures. Continued harassment aggravates the charge leading to $10,000 per occurrence being added to the charge."
}, {
    name: "Sexual Harassment",
    fine: 5e3,
    time: 10,
    color: "red",
    description: "Involving the use of explicit or implicit sexual overtones, including the unwelcome or inappropriate promise of rewards in exchange for sexual favors."
}, {
    name: "Petty Theft",
    fine: 800,
    time: 0,
    color: "green",
    description: "Steals property in the value of less than $1,000 from another person."
}, {
    name: "Grand Theft",
    fine: 2500,
    time: 10,
    color: "green",
    description: "Steals property in the value of more than $1,000 from another person."
}, {
    name: "Joyriding",
    fine: 1e3,
    time: 10,
    color: "green",
    description: "The action or practice of driving fast and dangerously in a stolen car for enjoyment."
}, {
    name: "Grand Theft Auto (A)",
    fine: 2e3,
    time: 15,
    color: "green",
    description: "Unlawfully taking a vehicle belonging to another, or driving the vehicle without the owner's consent, with the intent to permanently or temporarily deprive the owner of the vehicle."
}, {
    name: "Grand Theft Auto (B)",
    fine: 3e3,
    time: 15,
    color: "green",
    description: "Government Vehicle: If covered in P.C. 1205, double."
}, {
    name: "Burglary",
    fine: 1750,
    time: 15,
    color: "green",
    description: "Enters knowingly or remains unlawfully in a building with intent to commit a crime."
}, {
    name: "Robbery",
    fine: 2500,
    time: 10,
    color: "green",
    description: "Theft of money or property from an individual or business."
}, {
    name: "Bank Robbery",
    fine: 3500,
    time: 15,
    color: "green",
    description: "Robs or attempts to rob a bank, jeweler or financial institution."
}, {
    name: "Federal Bank Robbery",
    fine: 5e3,
    time: 20,
    color: "green",
    description: "Robbing institutions insured by the FDIC (Pac Standard and Vangelico's)."
}, {
    name: "Extortion",
    fine: 2e3,
    time: 10,
    color: "green",
    description: "Uses threats or force to obtain monetary or material gain."
}, {
    name: "Fraud",
    fine: 5e3,
    time: 15,
    color: "green",
    description: "Wrongfully decepts intending to receive financial or personal gain."
}, {
    name: "Impersonating",
    fine: 2e3,
    time: 15,
    color: "green",
    description: "Impersonates another person that could make them civilly or criminally liable, signing under a false name or providing documentation of another person."
}, {
    name: "Impersonating a Government employee",
    fine: 4e3,
    time: 30,
    color: "green",
    description: "Impersonates a Government employee that could make them civilly or criminally liable, signing under their name or providing documentation, and exercising authority."
}, {
    name: "Impersonating a Judge",
    fine: 1e4,
    time: 35,
    color: "red",
    description: "Impersonates a Judge."
}, {
    name: "Forgery",
    fine: 2500,
    time: 15,
    color: "red",
    description: "Possessing or creating any false government document including but not limited to ID cards and license plates."
}, {
    name: "Antitrust",
    fine: 5e3,
    time: 30,
    color: "red",
    description: "Taking actions that engage in the creation of a monopoly are deemed criminal. This includes predatory acts to gain or hold monopoly power, price fixing limited markets (Car Sales, Store Shops and Mechanic Hubs) or malicious sabotage of a competitor's stock. All individuals that manage, work for or own shares (majority or minority) in a business or participate with an individual that engages in these tactics are liable if found to have not reported these actions even when  they were aware they were being undertaken."
}, {
    name: "Trespassing",
    fine: 800,
    time: 5,
    color: "green",
    description: "Enters knowingly or remains unlawfully in or upon government premises or private property. (Police holding, military installations, Braddock Farm etc..)"
}, {
    name: "Possession of Items Used In The Commission Of A Crime",
    fine: 1e3,
    time: 10,
    color: "green",
    description: "Possession of any items used in the commission of a felony, misdemeanor or infraction. This includes Advance lockpicks,lockpicks,Tuner,Thermite,VPN."
}, {
    name: "Arson",
    fine: 3e3,
    time: 15,
    color: "green",
    description: "The willful and malicious burning or charring of property or persons."
}, {
    name: "Vandelism",
    fine: 1500,
    time: 0,
    color: "green",
    description: "Intentionally causing damage to property they do not own."
}, {
    name: "Vandalism of Government Property",
    fine: 3e3,
    time: 15,
    color: "green",
    description: "Intentionally causing damage to Government Property"
}, {
    name: "Bribery",
    fine: 3e3,
    time: 10,
    color: "green",
    description: "Confers, or agrees to confer, any benefit upon a public servant upon an agreement or understanding that such public servant's vote, opinion, judgment, action, decision or exercise of discretion as a public servant will thereby be influenced."
}, {
    name: "Contempt of Court",
    fine: 5e3,
    time: 50,
    color: "red",
    description: "The act of being disobedient to or discourteous towards a court of law and its officers in the form of behavior that opposes or defies the authority, justice and dignity of the court. Time/Fine is Judge Discretion."
}, {
    name: "Criminal Possession of Stolen Property",
    fine: 1e3,
    time: 5,
    color: "green",
    description: "Possesses any physical property that is reported stolen."
}, {
    name: "Escaping",
    fine: 3e3,
    time: 15,
    color: "green",
    description: "Escapes the custody of the government of their own free will."
}, {
    name: "Jailbreak",
    fine: 8e3,
    time: 40,
    color: "green",
    description: "Breaks into government buildings designated for detainment or imprisonment with intent to break a prisoner out."
}, {
    name: "Disorderly Conduct",
    fine: 1e3,
    time: 5,
    color: "green",
    description: "Engages in behavior intending to cause public inconvenience."
}, {
    name: "Perjury",
    fine: 7e3,
    time: 20,
    color: "red",
    description: "Knowingly lies under oath verbally or through writing in judicial proceedings."
}, {
    name: "Violating a Court Orde",
    fine: 5e3,
    time: 20,
    color: "red",
    description: "Willful disobedience of the terms written in a court order."
}, {
    name: "Failure to Appear",
    fine: 1e4,
    time: 20,
    color: "red",
    description: "Failure to Appear in Court when summoned"
}, {
    name: "Unlawful Practice",
    fine: 1e4,
    time: 15,
    color: "red",
    description: "Practices law or medicine without proper state-sanctioned licensing."
}, {
    name: "Embezzlement",
    fine: 1e4,
    time: 20,
    color: "red",
    description: "Steals or misappropriated funds that are used for a specific purpose."
}, {
    name: "Conspiracy - Misdemeanor",
    fine: 2e3,
    time: 0,
    color: "green",
    description: "Any act of conspiracy (See definition at the top) to commit a misdemeanor. This is also called a [Wobbler]."
}, {
    name: "Conspiracy to Commit Fraud",
    fine: 3e3,
    time: 15,
    color: "green",
    description: "Any act of conspiracy (See definition at the top) to defraud someone out of money or property. This can be filed as a misdemeanor or as a felony based on the facts of the case and criminal history."
}, {
    name: "Violation of Restraining Order",
    fine: 3500,
    time: 20,
    color: "green",
    description: "Violating a lawful restraining order."
}, {
    name: "Anti-Mask Law",
    fine: 500,
    time: 0,
    color: "green",
    description: "Willfully wears a mask and refuses to remove it in a public institution (Police stations, hospitals, courthouses) or in hindrance of law enforcement duties."
}, {
    name: "Operating without a permit",
    fine: 1e4,
    time: 10,
    color: "red",
    description: "The illegal act of operation of an activity that requires a valid permit. The fine can not exceed 110% of the permit price."
}, {
    name: "Disobeying a Peace Officer",
    fine: 800,
    time: 0,
    color: "green",
    description: "Willfully refusing or failing to comply with a lawful order, signal, or direction of any peace officer."
}, {
    name: "Disturbing the Peace",
    fine: 1500,
    time: 0,
    color: "green",
    description: "Unlawfully fighting, or challenging another person to fight, in a public place. Disturbing another person by loud and unreasonable noise; if this is done willfully and maliciously. Using offensive words in a public place, if the words are likely to provoke an immediate violent reaction."
}, {
    name: "False Reporting",
    fine: 1e3,
    time: 5,
    color: "green",
    description: "Reports a false or non-existent crime."
}, {
    name: "Obstruction of justice",
    fine: 8e3,
    time: 15,
    color: "green",
    description: "Willfully tampers with the discovery, apprehension, conviction or punishment of a crime after a crime has been committed or charged."
}, {
    name: "Inciting a Riot",
    fine: 1e4,
    time: 30,
    color: "green",
    description: "Organizes an event/assembly which results in violent conduct or creates a risk of causing public harm with a group of at least four people."
}, {
    name: "Loitering",
    fine: 2e3,
    time: 0,
    color: "green",
    description: "Intentionally standing or waiting idly without apparent purpose."
}, {
    name: "Tampering",
    fine: 750,
    time: 5,
    color: "green",
    description: "Tampering with property of another person or entity with intent to cause substantial inconvenience or gain unlawful access for monetary gain. Must be caught in the act with item from P.C. 1204."
}, {
    name: "Tampering with Evidence",
    fine: 1e4,
    time: 25,
    color: "red",
    description: "Tampering with evidence obtained from the scene of the crime with intent to cause substantial inconvenience that can affect the end result of an ongoing session in court."
}, {
    name: "Animal Cruelty",
    fine: 2e3,
    time: 10,
    color: "green",
    description: "Maliciously and intentionally wounds or kills an animal."
}, {
    name: "Reckless Driving",
    fine: 1500,
    time: 10,
    color: "green",
    description: "Driving with a willful or wanton disregard for the safety of others, or a willful disregard of the potential consequences of one’s actions"
}, {
    name: "Government Corruption",
    fine: 2e4,
    time: 20,
    color: "red",
    description: "The use of powers by government officials or their network contacts for illegitimate private/personal gain."
}, {
    name: "Vigilantism",
    fine: 1e3,
    time: 15,
    color: "green",
    description: "Law enforcement undertaken without legal authority by a self-appointed group or person."
}, {
    name: "Government Grand Larceny",
    fine: 3e3,
    time: 10,
    color: "red",
    description: "The unlawful taking of government property worth more than $2000.00. See PC. 2203 (B) for vehicles."
}, {
    name: "Unlawful Assembly",
    fine: 5e3,
    time: 5,
    color: "green",
    description: "Participates in an event/assembly which results in violent conduct or creates a risk of causing public harm with a group of at least four people."
}, {
    name: "Possession of Controlled substance Class A",
    fine: 2500,
    time: 10,
    color: "green",
    description: "Possession of meth"
}, {
    name: "Possession of Controlled substance with the intent to distribute class A",
    fine: 4500,
    time: 15,
    color: "green",
    description: "The sale or trade of meth."
}, {
    name: "Possession of Controlled substance class B",
    fine: 1e3,
    time: 10,
    color: "green",
    description: "Possession of Cocaine and oxycontin."
}, {
    name: "Possession of controlled substance with the intent to distribute class B",
    fine: 4500,
    time: 5,
    color: "green",
    description: "The Sale or trade of Cocaine and oxycontin."
}, {
    name: "Possession of  Controlled substance class C",
    fine: 1500,
    time: 5,
    color: "green",
    description: "Possession of marijuana without a valid permit."
}, {
    name: "Possession of Controlled substance with the intent to distribute class C",
    fine: 2e3,
    time: 10,
    color: "green",
    description: "The sale ,trade or offering of marijuana without sales permit for monetary, materials or social "
}, {
    name: "Possession of controlled substance with intent to distribute ",
    fine: 3e3,
    time: 10,
    color: "green",
    description: "Sells a controlled substance."
}, {
    name: "Possession of Illegal Tools",
    fine: 2e3,
    time: 10,
    color: "green",
    description: "Illegal tools or materials. Refer to P.C. 1204b."
}, {
    name: "Prostitution",
    fine: 500,
    time: 0,
    color: "green",
    description: "Offering, for payment, the services of prostitution or offering payment for prostitution."
}, {
    name: "Criminal Possession of Firearm Class 1 ",
    fine: 2e3,
    time: 5,
    color: "green",
    description: "Possess an illegal Class 1 Weapon; Walther P99 | Pistol"
}, {
    name: "Criminal Possession of Firearm Class 2",
    fine: 4e3,
    time: 15,
    color: "green",
    description: "Possess a Class 2 weapon; refer to P.C. 1202."
}, {
    name: "Criminal Possession of Firearm Class 3",
    fine: 5e3,
    time: 15,
    color: "green",
    description: "Possess a Class 3 weapon; refer to P.C. 1203."
}, {
    name: "Criminal Sale of Firearm [Class 1]",
    fine: 5e3,
    time: 15,
    color: "red",
    description: "Sells a Class 1 weapon to a person who does not own a gun license or sells a Pistol MK2."
}, {
    name: "Criminal Sale of Firearm [Class 2]",
    fine: 7e3,
    time: 20,
    color: "red",
    description: "Sells a Class 2 weapon"
}, {
    name: "Criminal Sale of Firearm [Class 3]",
    fine: 1e4,
    time: 25,
    color: "red",
    description: "Sells a Class 3 weapon."
}, {
    name: "Criminal Use of Firearm",
    fine: 2e3,
    time: 15,
    color: "green",
    description: "Discharges a firearm for no legal reason."
}, {
    name: "Brandishing",
    fine: 1500,
    time: 20,
    color: "green",
    description: "it is unlawful for you to draw or exhibit a deadly weapon in a rude, angry, or threatening way in the presence of another person and not in self defense or in defense of someone."
}, {
    name: "Illegal stop on highway or freeway",
    fine: 1500,
    time: 10,
    color: "green",
    description: "it is unlawful for you to draw or exhibit a deadly weapon in a rude, angry, or threatening way in the presence of another person and not in self defense or in defense of someone."
}, {
    name: "Resisting Arrest",
    fine: 1e3,
    time: 5,
    color: "green",
    description: "Flees from a police officer to avoid being apprehended, detained, or arrested while on foot."
}, {
    name: "Jaywalking",
    fine: 500,
    time: 0,
    color: "green",
    description: "Crossing  a road without the use of a crosswalk."
}, {
    name: "Terrorism",
    fine: 4e4,
    time: 100,
    color: "red",
    description: "Causes mass destruction using explosives, sickness, or extreme violence."
}, {
    name: "Driving While Intoxicated",
    fine: 750,
    time: 5,
    color: "green",
    description: "Drives while affected by drug or alcohol intoxication."
}, {
    name: "Evading",
    fine: 1250,
    time: 5,
    color: "green",
    description: "Flees from a police officer in a vehicle to avoid being apprehended, detained, or arrested."
}, {
    name: "Reckless Evading",
    fine: 1500,
    time: 10,
    color: "green",
    description: "Dangerously flees from a police officer in a vehicle to avoid being apprehended, detained, or arrested in a way which clearly shows blatant disregard for civilian life. This charge already implies Evading and Reckless Endangerment/Driving, do not stack."
}, {
    name: "Failure to Yield to Emergency Vehicle",
    fine: 1e3,
    time: 0,
    color: "green",
    description: "Does not pull to the side of the road when an emergency vehicle is trying to pass with sirens enabled."
}, {
    name: "Failure to Obey Traffic Control Devices",
    fine: 750,
    time: 0,
    color: "green",
    description: "Does not obey a sign or signal defined as regulatory."
}, {
    name: "Nonfunctional Vehicle",
    fine: 1e3,
    time: 0,
    color: "green",
    description: "Drives a nonfunctional vehicle e.g. smashed windows, illegal window tint (Fully blacked out windows), doors, etc."
}, {
    name: "Negligent Driving",
    fine: 800,
    time: 0,
    color: "green",
    description: "Drives in a way that is negligent, demonstrating a lack of proper regard or attention to safety."
}, {
    name: "Reckless Driving",
    fine: 1e3,
    time: 10,
    color: "green",
    description: "Drives in a way that is careless and with gross disregard for human life."
}, {
    name: "Third Degree Speeding",
    fine: 500,
    time: 0,
    color: "green",
    description: "Speeds in excess of 0 mph to 35 mph."
}, {
    name: "Second Degree Speeding",
    fine: 800,
    time: 0,
    color: "green",
    description: "Speeds in excess of 36 mph to 55 mph."
}, {
    name: "First Degree Speeding",
    fine: 1e3,
    time: 0,
    color: "green",
    description: "Speeds in excess of more than 55 mph. Driver's License may be subject to removal."
}, {
    name: "Unlicensed Operation of Vehicle",
    fine: 1e3,
    time: 0,
    color: "green",
    description: "Drives a car without a proper license."
}, {
    name: "Illegal U-turn",
    fine: 750,
    time: 0,
    color: "green",
    description: "Performing a U-turn that is within City Limits, or crosses lanes of traffic."
}, {
    name: "Illegal passing",
    fine: 800,
    time: 0,
    color: "green",
    description: "Passing another vehicle by a shoulder, median, or solid lines. Passing must be completely made without interfering with safe operation of any approaching vehicle from the opposite direction."
}, {
    name: "Failure to maintain lane",
    fine: 500,
    time: 0,
    color: "green",
    description: "Failure to maintain control of a vehicle within an appropriate lane of travel."
}, {
    name: "Illegal Turn",
    fine: 600,
    time: 0,
    color: "green",
    description: "Performing a turn at a stop sign or red light without coming to a full and complete stop, or failure to yield to traffic and pedestrians. Making a left-hand turn where signs posted prohibit such a turn."
}, {
    name: "Failure to Stop",
    fine: 500,
    time: 0,
    color: "green",
    description: "Failure to come to a complete and full stop at a posted stop sign, or red light. Right on red is permitted when a full stop is completed and after yielding to traffic and pedestrians."
}, {
    name: "Unauthorized Parking",
    fine: 1e3,
    time: 0,
    color: "green",
    description: "Parks in a non-designated area."
}, {
    name: "Hit and Run",
    fine: 2e3,
    time: 10,
    color: "green",
    description: "The act of causing a traffic collision and failing to stop and identify oneself afterwards."
}, {
    name: "Airspace Violation",
    fine: 3500,
    time: 25,
    color: "green",
    description: "Flying in an unauthorized area, flying without a license or landing an aircraft outside helipads and airports when not responding to an emergency call."
}, {
    name: "Driving w/o Headlights or Signals",
    fine: 750,
    time: 0,
    color: "green",
    description: "Driving after dusk and before dawn or in other poor visibility conditions without headlights or in a vehicle without brake lights or other signals."
}, {
    name: "Excessive Vehicle Noise",
    fine: 500,
    time: 0,
    color: "green",
    description: "Creating vehicle noise that is disruptive or otherwise inappropriate, such as excessive honking, loud music, spinning tires, damaged muffler, etc."
}, {
    name: "Street Racing",
    fine: 3e3,
    time: 10,
    color: "green",
    description: "Participating in a race with a motorized vehicle on a public street."
}];