-- Michael O'Rourke Design Project SQL file.




-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- Table Creation

-- Holds the information about what username the person has 
-- and what their name is
drop table if exists Users;
Create Table Users (
	Username 	text Not Null,
	PersonName 	text Not Null,
	Primary Key(Username)
);

-- Holds information on Character level and money
drop table if exists Character_Level;
Create Table Character_Level (
	Username 	text Not Null,
	InfamyLevel	int Not Null,
	CharacterLevel	int Not Null,
	OffshoreMoney	int Not Null,
	SpendingMoney	int Not Null,
	Primary Key(Username)
);

-- holds information on which infamy bonuses have been chosen/unlocked
drop table if exists Bonus_Chosen;
Create Table Bonus_Chosen (
	BonusChosen		text Not Null,
	Username		text Not Null,
	InfamyLevelChosenAt	int Not Null,
	Primary Key (BonusChosen, Username)
);

-- holds information on active inventory items
drop table if exists Inventory;
Create Table Inventory (
	Username 	text Not Null,
	PrimaryWeapon	text Not Null,
	SecondaryWeapon	text Not Null,
	MeleeID		text Not Null,
	GrenadeID	text Not Null,
	ArmorID		text Not Null,
	EquipmentID	text Not Null,
	MaskID		text Not Null,
	CharacterID	text Not Null,
	SDeckID		text Not Null,
	PDeckID		text Not Null,
	Primary Key(Username)
);

-- holds information on the skill decks the user has created
drop table if exists Skill_Deck;
Create Table Skill_Deck (
	SDeckID		text Not Null,
	SDeckName	text Not Null,
	PointsToSpend	int Not Null,
	Primary Key(SDeckID)
);

-- holds information on the perk decks the user has unlocked
drop table if exists Perk_Deck;
Create Table Perk_Deck (
	PDeckID		text Not Null,
	PerkDeckName	text,
	Description	text,
	PointsToSpend	int Not Null,
	Primary Key(PDeckID)
);

-- holds inforamtion about how many points a skill deck has 
-- and specifies how many are in each tree
drop table if exists Skill_Deck_Specifics;
Create Table Skill_Deck_Specifics (
	SDeckID 		text Not Null,
	PointsMastermind	int Not Null,
	PointsEnforcer		int Not Null,
	PointsTechnician	int Not Null,
	PointsGhost		int Not Null,
	PointsFugative		int Not Null,
	Primary Key(SDeckID)
);

-- holds information about how many points a perk deck has
-- and if it is completed and how many parts are complete
drop table if exists Perk_Deck_Specifics;
Create Table Perk_Deck_Specifics (
	PDeckID		text Not Null,
	PerkDeckName	text Not Null,
	Description	text Not Null,
	IsCompleted	boolean Not Null,
	DeckPartsComplete int Not Null,
	Primary Key(PDeckID, PerkDeckName)
);

-- holds information about what primary weapons the user has
-- specifies what the gun is named and what type of gun it is
drop table if exists Primary_Weapon;
Create Table Primary_Weapon (
	PrimaryWeapon 	text Not Null,
	WeaponName	text Not Null,
	GunType		text Not Null,
	Primary Key(PrimaryWeapon)
);

-- holds information about what secondary weapons the user has
-- specifies what the gun is named and what type of gun it is
drop table if exists Secondary_Weapon;
Create Table Secondary_Weapon (
	SecondaryWeapon text Not Null,
	WeaponName	text Not Null,
	GunType		text Not Null,
	Primary Key(SecondaryWeapon)
);

-- holds information about what melee weapons the user has
drop table if exists Melee;
Create Table Melee (
	MeleeID		text Not Null,
	WeaponName	text Not Null,
	Primary Key(MeleeID)
);

-- holds information about what grenades the user has
drop table if exists Grenade;
Create Table Grenade (
	GrenadeID	text Not Null,
	GrenadeType	text Not Null,
	Primary Key(GrenadeID)
);

-- holds information about what armor the user has
-- specifies what each armor is good for
drop table if exists Armor;
Create Table Armor (
	ArmorID		text Not Null,
	ArmorName	text Not Null,
	Description	text Not Null,
	Primary Key(ArmorID)
);

-- holds information about what equipment the user has
-- specifies what each piece of equipment does
drop table if exists Equipment;
Create Table Equipment (
	EquipmentID	text Not Null,
	EquipmentName	text Not Null,
	Description	text Not Null,
	Primary Key(EquipmentID)
);

-- holds information about what masks the user has
-- specifies the detailing of the mask 
drop table if exists Mask;
Create Table Mask (
	MaskID		text Not Null,
	MaskName	text Not Null,
	MaskType	text Not Null,
	Color		text Not Null,
	Pattern		text Not Null,
	Primary Key(MaskID)
);



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- Inputting data

-- populates the users table with 3 users
Insert Into Users 
(Username, PersonName)
values 
('MOR3', 'Mike ORourke'),
('J007', 'James Bond'),
('GenericGuy', 'John Smith');

select *
from users

-- populates the characters with levels and money
Insert into Character_level
(Username, InfamyLevel, CharacterLevel, OffshoreMoney, SpendingMoney)
values
('MOR3', 3, 72, 3000000, 4000000),
('J007', 7, 52, 5000000, 3500000),
('GenericGuy', 15, 97, 1000000, 9000000);

select *
from Character_level

-- populates table with infamy bonuses chosen
Insert into Bonus_Chosen
(BonusChosen, Username, InfamyLevelChosenAt)
values
('unlocking the infamy tree', 'MOR3', 1),
('The Assasin Set', 'MOR3', 2),
('The Slaughterhouse Set', 'MOR3', 3),
('unlocking the infamy tree', 'J007', 1),
('The Assasin Set', 'J007', 2),
('Set of the Corrupted', 'J007', 3),
('The Slaughterhouse Set', 'J007', 4),
('Set of the Ingenious', 'J007', 5),
('More xp1', 'J007', 6),
('More xp2', 'J007', 7),
('unlocking the infamy tree', 'GenericGuy', 1),
('The Assasin Set', 'GenericGuy', 2),
('Set of the Ingenious', 'GenericGuy', 3),
('Set of the Corrupted', 'GenericGuy', 4),
('The Slaughterhouse Set', 'GenericGuy', 5),
('More xp1', 'GenericGuy', 6),
('More xp2', 'GenericGuy', 7),
('More xp3', 'GenericGuy', 8),
('More xp4', 'GenericGuy', 9),
('More xp5', 'GenericGuy', 10),
('More xp6', 'GenericGuy', 11),
('More xp7', 'GenericGuy', 12),
('More xp8', 'GenericGuy', 13),
('Lurker', 'GenericGuy', 14),
('DemonShank', 'GenericGuy', 15);

select *
from Bonus_Chosen

-- Populates the table inventory with active items for each user
Insert into Inventory
(Username, PrimaryWeapon, SecondaryWeapon, MeleeID, GrenadeID, ArmorID, EquipmentID, MaskID, CharacterID, SDeckID, PDeckID)
values
('MOR3', 'Thanatos .50 cal Sniper Rifle', 'Compact-5 Submachine Gun', 'Survival Tomahawk', 'Frag Grenade', 'Improved Combined Tactical Vest', 'Ammo Bag', 'Surprised Santa', 'Dragan', 'Techforcer', 'Gambler'),
('J007', 'Akimbo Bernetti 9 Pistols', 'Signature .40 Pistol', 'Weapon Butt', 'Frag Grenade', 'Two-Piece Suit', 'ECM Jammer', 'The Heat', 'Hoxton', 'Stealth', 'Hitman'),
('GenericGuy', 'Golden AK.762 Rifle', 'Street Sweeper Shotgun', 'Bayonett Knife', 'Molotov Cocktail', 'Combined Tactical Vest', 'Sentry Gun', 'Mr. Mannequin', 'Dallas', 'Tech build', 'Muscle');

select *
from Inventory

-- populates the table of skill decks and remaining points to spend
Insert into Skill_Deck
(SDeckID, SDeckName, PointsToSpend)
values
('MOR3-1', 'Techforcer', 2),
('MOR3-2', 'Saw', 0),
('MOR3-3', 'Stealth', 4),
('MOR3-4', 'Build #4', 86),
('J007-1', 'Undercover (stealth)', 0),
('J007-2', 'Dodge Mastermind', 2),
('J007-3', 'Loud Armor', 3),
('J007-4', 'Dodge Tech', 6),
('J007-5', 'Undercover (tech)', 1),
('GenericGuy-1', 'Loud', 7),
('GenericGuy-2', 'Quiet', 4),
('GenericGuy-3', 'Loud Tech', 3),
('GenericGuy-4', 'Quiet Saw', 2),
('GenericGuy-5', 'Loud Saw', 6);

select *
from Skill_Deck

-- populates the table of perk decks and remaining points to spend
Insert into Perk_Deck
(PDeckID, PerkDeckName, Description, PointsToSpend)
values 
('MOR-10', 'Gambler', 'When collecting ammo drops player gets ', 0),
('J007-5', 'Hitman', 'Increased concealment', 0),
('GenericGuy-2', 'Muscle', 'Intimidation and health increase', 0);

select *
from Perk_Deck

-- populates table with all possibilities of perk decks for each user
Insert into Skill_Deck_Specifics
(SDeckID, PointsMasterMind, PointsEnforcer, PointsTechnician, PointsGhost, PointsFugative)
values
('MOR3-1', 6, 56, 10, 6, 3),
('MOR3-2', 6, 26, 15, 35, 15),
('MOR3-3', 6, 6, 0, 45, 25),
('MOR3-4', 0, 0, 0, 0, 0),
('J007-1', 6, 6, 0, 44, 25),
('J007-2', 30, 6, 0, 10, 50),
('J007-3', 6, 8, 48, 6, 3),
('J007-4', 6, 8, 35, 6, 46),
('J007-5', 6, 54, 20, 4, 6),
('GenericGuy-1', 6, 8, 48, 6, 3),
('GenericGuy-2', 6, 6, 0, 45, 25),
('GenericGuy-3', 6, 8, 35, 6, 46),
('GenericGuy-4', 6, 26, 15, 35, 15),
('GenericGuy-5', 6, 56, 10, 6, 3);

select *
from Skill_Deck_Specifics

-- populates table with the perk decks that the user has completed and how much
Insert into Perk_Deck_Specifics
(PdeckID, PerkDeckName, Description, IsCompleted, DeckPartsComplete)
values
('MOR-1', 'Crew Cheif', 'Increases user health and gives team bonuses', True,9),
('MOR-2', 'Muscle', 'Intimidation and health increase', True,9),
('MOR-3', 'Armorer', 'Improved armor and increased armor recovery time', False,0),
('MOR-4', 'Rouge', 'Increase dodge chance and weapon switching', True,9),
('MOR-5', 'Hitman', 'Increased concealment', True,9),
('MOR-6', 'Crook', 'Increases dodge chance with ballistic vests', True,9),
('MOR-7', 'Burglar', 'General bonuses to stealth oriented skills', False,5),
('MOR-8', 'Infiltrator', 'Increases damage when surrounded by enemies', True,9),
('MOR-9', 'Sociopath', 'increases armor and armor regen in close quarters combat', False,0),
('MOR-10', 'Gambler', 'When collecting ammo drops player gets', True,9),
('J007-1', 'Crew Cheif', 'Increases user health and gives team bonuses', True,9),
('J007-2', 'Muscle', 'Intimidation and health increase', True,9),
('J007-3', 'Armorer', 'Improved armor and increased armor recovery time', True,9),
('J007-4', 'Rouge', 'Increase dodge chance and weapon switching', True,9),
('J007-5', 'Hitman', 'Increased concealment', True,9),
('J007-6', 'Crook', 'Increases dodge chance with ballistic vests', True,9),
('J007-7', 'Burglar', 'General bonuses to stealth oriented skills', True,9),
('J007-8', 'Infiltrator', 'Increases damage when surrounded by enemies', True,9),
('J007-9', 'Sociopath', 'increases armor and armor regen in close quarters combat', True,9),
('J007-10', 'Gambler', 'When collecting ammo drops player gets ', True,9),
('GenericGuy-1', 'Crew Cheif', 'Increases user health and gives team bonuses', True,9),
('GenericGuy-2', 'Muscle', 'Intimidation and health increase', True,9),
('GenericGuy-3', 'Armorer', 'Improved armor and increased armor recovery time', True,9),
('GenericGuy-4', 'Rouge', 'Increase dodge chance and weapon switching', True,9),
('GenericGuy-5', 'Hitman', 'Increased concealment', True,9),
('GenericGuy-6', 'Crook', 'Increases dodge chance with ballistic vests', True,9),
('GenericGuy-7', 'Burglar', 'General bonuses to stealth oriented skills', True,9),
('GenericGuy-8', 'Infiltrator', 'Increases damage when surrounded by enemies', True,9),
('GenericGuy-9', 'Sociopath', 'increases armor and armor regen in close quarters combat', True,9),
('GenericGuy-10', 'Gambler', 'When collecting ammo drops player gets ', True,9);

select *
from Perk_Deck_Specifics

-- populates the table with the primary weapons the user can select for use
Insert into Primary_weapon
(PrimaryWeapon, WeaponName, GunType)
values
('PW1', 'Thanatos .50 cal Sniper Rifle', 'Sniper'),
('PW2', 'R93', 'Sniper'),
('PW3', 'Golden AK.762 Rifle', 'Assault Rifle'),
('PW4', 'AMR-16', 'Assualt Rifles'),
('PW5', 'Car-4', 'Assault Rifles'),
('PW6', 'M308', 'Assault Rifle'),
('PW7', 'Gewehr 3', 'Assault Rifle'),
('PW8', 'Buzzsaw 42', 'Light Machine Guns'),
('PW9', 'RPK', 'Light Machine Guns'),
('PW10', 'OVE9000', 'Special'),
('PW11', 'FlameThrower', 'Special'),
('PW12', 'HRL-7', 'Special'),
('PW13', 'BJoceline O/U 12G', 'Shotguns'),
('PW14', 'Locomotive 12G', 'Shotguns'),
('PW15', 'Akimbo Bernetti 9 Pistols', 'Akimbo Pistols'),
('PW16', 'Akimbo Deagle', 'Akimbo Pistols'),
('PW17', 'Akimbo Interceptor 45', 'Akimbo Pistols');

select *
from Primary_Weapon

-- populates the table with the secondary weapons the user can select for use
Insert into Secondary_weapon
(SecondaryWeapon, WeaponName, GunType)
values
('SW1', 'Interceptor 45', 'Pistol'),
('SW2', 'Signature .40 Pistol', 'Pistol'),
('SW3', 'Bernetti 9', 'Pistol'),
('SW4', 'Deagle', 'Pistol'),
('SW5', 'Compact-5', 'Submachine guns'),
('SW6', 'Uzi', 'Submachine guns'),
('SW7', 'Patchett L2A1', 'Submachine guns'),
('SW8', 'Mark 10', 'Submachine guns'),
('SW9', 'The Judge', 'Shotguns'),
('SW10', 'Street Sweeper', 'Shotguns');

select *
from Secondary_Weapon

-- populates the table with the melee weapons the user can select for use
Insert into Melee
(MeleeID, WeaponName)
values
('MW1', 'Weapon Butt'),
('MW2', '350K Brass Knuckles'),
('MW3', 'Money Bundle'),
('MW4', 'Psycho Knife'),
('MW5', 'Spear of Freedom'),
('MW6', 'Surival Tomahawk');

Select *
from Melee

-- populates the table with the grenades the user can select for use
Insert into Grenade
(GrenadeID, GrenadeType)
values
('G1', 'Frag Grenade'),
('G2', 'Molotov Cocktail');

Select *
from Grenade

-- populates the table with the armors the user can select for use
Insert into Armor
(ArmorID, ArmorName, Description)
values
('AR1', 'Two-Piece Suit', 'This is the standard two-piece suit that any self-respecting criminal should wear'),
('AR2', 'Ballistic Vest', 'It offers good protection from small-caliber handgun and shotgun projectiles, making it essential for anyone in the line of fire'),
('AR3', 'Lightweight Ballistic Vest', 'It offers a specially developed trauma liner which provides effective blunt trauma protection, making it a good choice to protect yourself'),
('AR4', 'Heavy Ballistic Vest', 'It is a modern body armor combining a ballistic vests with shoulder and side protection armor components, making it a great protection of choice'),
('AR5', 'Flak Jacket', 'The flak jacket by GenSec Security Industries is a modern take on the classic version. It absorbs the impact from firearm projectiles and shrapnel from explosions'),
('AR6', 'Combined Tactical Vest', ' It is made of high performance ballistic materials and is designed to carry heavy loads, such as ammo pouches, radios and other accessories'),
('AR7', 'Improved Combined Tactical Vest', ' The perfectly fitted interlocking fiber layers rightly woven together with metal plates are specially angled to deflect projectiles and shield from explosions. In short, it provides complete protection');

Select *
from Armor

-- populates the table with equipment the user can select
Insert into Equipment
(EquipmentID, EquipmentName, Description)
values
('EQ1', 'Ammo Bag', 'The ammo bag is a portable bag, originally intended to allow soldiers to carry extra ammunition'),
('EQ2', 'Armor Bag', 'The Armor Bag is a portable bag used to transport an armor of your choice that can be used during a heist'),
('EQ3', 'Body Bag Case', 'The body bag case is a case containing body bags that are designed to contain a human body, used for the storage and transportation of corpses'),
('EQ4', 'Doctor Bag', 'The doctor bag is a portable bag, usually used by a physician or other medical progression to transport medical supplies and medicine'),
('EQ5', 'ECM Jammer', 'An electronic countermeasure (ECM) is an electronic device designed to trick radar, sonar and other detection systems'),
('EQ6', 'First Aid Kit', 'The first aid kit is a collection of supplies and equipment for use in giving first aid'),
('EQ7', 'Sentry Gun', 'A sentry gun is a gun that automatically aims and fires at targets that are detected by its sensors. Historically, military sentry guns were used for detecting and destroying short range incoming missiles and enemy aircrafts'),
('EQ8', 'Trip Mine', 'The trip mine is an explosive device and is designed to destroy safes and disable enemy targets as they pass over or near the trip mine');

Select *
from Equipment


-- populates the table with the masks the user has created and can select
Insert into Mask
(MaskID, MaskName, MaskType, Color, Pattern)
values
('M1', 'Silent Night', 'Happy Santa', 'Default', 'Default'),
('M2', 'Anonymous', 'Mr. Mannequin', 'White', 'Money'),
('M3', 'Nixon', 'The 37th', 'Green and Blue', 'Monkey'),
('M4', 'Flames', 'The Devil', 'Red', 'Default'),
('M5', 'Not So Silent Night', 'Surprised Santa', 'Default', 'Luchador');

Select *
from Mask

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- Views


-- Specifically grabs the 
-- Username, Name, Infamy level, and Character Level 
-- and displays them in one table for a simple character overview
Create View NameLevel
As
Select Distinct Users.Username, Users.PersonName, Character_Level.InfamyLevel, Character_level.Characterlevel
from Users join
	Character_level on
	Users.Username = Character_Level.Username;



select *
from NameLevel


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- queries

-- queries the gun from options and if a user has it active
select Primary_Weapon.PrimaryWeapon, Primary_Weapon.WeaponName, Inventory.Username
from Inventory join
	Primary_Weapon on
	Primary_Weapon.PrimaryWeapon = Inventory.PrimaryWeapon
where Primary_Weapon.guntype = 'Sniper'


-- queries the gun from options and if a user has it active
select Secondary_Weapon.SecondaryWeapon, Secondary_Weapon.WeaponName, Inventory.Username
from Inventory join
	Secondary_Weapon on
	Secondary_Weapon.SecondaryWeapon = Inventory.PrimaryWeapon
where Secondary_Weapon.guntype = 'Pistol'


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- store procedures

Create or Replace Function GunNameChange (text, refcursor) returns refcursor as $$
declare 
	name_gun int := $1;
	resultset refcursor := $2;
begin
	open resultset for 
	select PrimaryWeapon, WeaponName
	from PrimaryWeapon;
end;
$$
language plpgsql;


select GunNameChange (0, 'results');
Fetch all from results;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- security

-- admin
Create Role Admin
Grant select, insert, update, delete
on all tables in schema public
to Admin

-- user
Create Role Users
grant select
on all tables in schema public
to Users
























