DROP DATABASE IF EXISTS real_estate;

CREATE DATABASE real_estate;

USE real_estate;

CREATE TABLE Property (
    addr varchar(50),
    ownerName varchar(30),
    price int,
    PRIMARY KEY (addr)

);

CREATE TABLE House (
    bedrooms int,
    bathrooms int,
    h_size int,
    addr varchar(50)
);

CREATE TABLE BusinessProperty (
    p_type char(20),
    p_size int,
    addr varchar(50)
);

CREATE TABLE Firm (
    id int,
    f_name varchar(30),
    addr varchar(50),
    Primary Key (id)
);

CREATE TABLE Agent (
    agentId int,
    a_name varchar(30),
    phone char(20),
    firmId int,
    dateStarted date,
    PRIMARY KEY (agentId),
    FOREIGN KEY (firmId) REFERENCES Firm(id)
);

CREATE TABLE Listings (
    mlsNumber int,
    addr varchar(50),
    agentId int,
    dateListed date,
    PRIMARY KEY (mlsNumber),
    FOREIGN KEY (addr) REFERENCES Property(addr),
    FOREIGN KEY (agentId) REFERENCES Agent(agentId)
);

CREATE TABLE Buyer (
    id int,
    b_name varchar(30),
    phone char(12),
    propertyType char(20),
    bedrooms int,
    bathrooms int,
    businessPropertyType char(20), 
    minimumPreferredPrice int,
    maximumPreferredPrice int,
    PRIMARY KEY (id)
);
CREATE TABLE Works_With (
    buyerId int,
    agentId int,
    FOREIGN KEY (agentId) REFERENCES Agent(agentId),
    FOREIGN KEY (buyerId) REFERENCES Buyer(id)
);

#Business Buyers
Insert into Buyer (id, b_name, phone, propertyType, businessPropertyType, minimumPreferredPrice, maximumPreferredPrice) VALUES (001,"John Daly", "123-456-7890", "business", "Sports Bar", 300000, 1200000);
Insert into Buyer (id, b_name, phone, propertyType, businessPropertyType, minimumPreferredPrice, maximumPreferredPrice) VALUES (002,"Tom Brady", "234-567-8901", "business", "Office Space", 150000, 425000);
Insert into Buyer (id, b_name, phone, propertyType, businessPropertyType, minimumPreferredPrice, maximumPreferredPrice) VALUES (003,"Will Smith", "345-678-9012", "business", "Office Space", 185000, 275000);
Insert into Buyer (id, b_name, phone, propertyType, businessPropertyType, minimumPreferredPrice, maximumPreferredPrice) VALUES (004,"Patrick Queen", "456-789-0123", "business", "Retail Store", 575000, 825000);
Insert into Buyer (id, b_name, phone, propertyType, businessPropertyType, minimumPreferredPrice, maximumPreferredPrice) VALUES (005,"Ray Lewis", "012-345-6789", "business", "Warehouse", 275000, 950000);

#House Buyers
Insert into Buyer (id, b_name, phone, propertyType, bedrooms, bathrooms, minimumPreferredPrice, maximumPreferredPrice) VALUES (006,"Calvin Johnson", "567-890-1234", "house", 3, 2, 150000, 725000);
Insert into Buyer (id, b_name, phone, propertyType, bedrooms, bathrooms, minimumPreferredPrice, maximumPreferredPrice) VALUES (007,"Roger Federer", "789-012-3456", "house", 4, 2, 175000, 550000);
Insert into Buyer (id, b_name, phone, propertyType, bedrooms, bathrooms, minimumPreferredPrice, maximumPreferredPrice) VALUES (008,"Tom Cruise", "890-123-4567", "house", 5, 3, 250000, 975000);
Insert into Buyer (id, b_name, phone, propertyType, bedrooms, bathrooms, minimumPreferredPrice, maximumPreferredPrice) VALUES (009,"Jimmy Butler", "901-234-5678", "house", 5, 4, 200000, 825000);
Insert into Buyer (id, b_name, phone, propertyType, bedrooms, bathrooms, minimumPreferredPrice, maximumPreferredPrice) VALUES (010,"Lebron James", "213-456-7890", "house", 3, 2, 275000, 480000);

#Firm
INSERT into firm(id, f_name, addr) VALUES (001, "Watson Realty", "800 Basin Street"); 
INSERT into firm(id, f_name, addr) VALUES (002, "Blackrock", "61 Tamar Court");
INSERT into firm(id, f_name, addr) VALUES (003, "Fidelity", "12359 Cinderella Court");
INSERT into firm(id, f_name, addr) VALUES (004, "Goldman Sachs", "5481 Legacy Drive");
INSERT into firm(id, f_name, addr) VALUES (005, "Berkshire Hathaway", "5782 Varsity Lane");

#Agents
Insert into Agent(agentId, a_name, phone, firmId, dateStarted) VALUES (001, "Saquon Barkely", "132-456-7890", 001, "2023-09-30");
Insert into Agent(agentId, a_name, phone, firmId, dateStarted) VALUES (002, "Rory Mcilroy", "132-567-8910", 002, "2021-07-24");
Insert into Agent(agentId, a_name, phone, firmId, dateStarted) VALUES (003, "Jason Witten", "132-678-9012", 003, "2024-01-11");
Insert into Agent(agentId, a_name, phone, firmId, dateStarted) VALUES (004, "Michael Jordan", "132-789-0123", 004, "2024-02-12");
Insert into Agent(agentId, a_name, phone, firmId, dateStarted) VALUES (005, "Kobe Bryant", "132-890-1234", 005, "2024-03-13");

#Properties
Insert into Property(addr, ownerName, price) VALUES ("12465 Ivy Woods Court", "Lebron James", 435000);
Insert into Property(addr, ownerName, price) VALUES ("6240 Earline Circle S", "Justin Jefferson", 215000);
Insert into Property(addr, ownerName, price) VALUES ("14495 Cherry Lake Drive W", "Michael Phelps", 720000);
Insert into Property(addr, ownerName, price) VALUES ("4941 Verdis Street", "Trevor Lawerence", 580000);
Insert into Property(addr, ownerName, price) VALUES ("5656 Ribbon Rose Drive", "Jared Goff", 275000);
Insert into Property(addr, ownerName, price) VALUES ("12154 Chaseborough Way", "Mike Williams", 475000);
Insert into Property(addr, ownerName, price) VALUES ("4245 Metron Drive", "Aaron Rodgers", 895000);
Insert into Property(addr, ownerName, price) VALUES ("11132 Turnbridge Drive", "Michael Thomas", 1140000);
Insert into Property(addr, ownerName, price) VALUES ("1616 Wilburn Park Lane", "Cam Newton", 380000);
Insert into Property(addr, ownerName, price) VALUES ("573 Richmond Drive", "Jordan Speith", 595000);

#Houses
Insert into House(bedrooms, bathrooms, h_size, addr) VALUES (4, 3, 2340, "12465 Ivy Woods Court");
Insert into House(bedrooms, bathrooms, h_size, addr) VALUES (3, 2, 1560, "6240 Earline Circle S");
Insert into House(bedrooms, bathrooms, h_size, addr) VALUES (6, 4, 3870, "14495 Cherry Lake Drive W");
Insert into House(bedrooms, bathrooms, h_size, addr) VALUES (5, 3, 3250, "4941 Verdis Street");
Insert into House(bedrooms, bathrooms, h_size, addr) VALUES (3, 2, 1980, "5656 Ribbon Rose Drive");

#Business Properties
INSERT into BusinessProperty(p_type, p_size, addr) VALUES ("Office Space", 25500, "12154 Chaseborough Way");
INSERT into BusinessProperty(p_type, p_size, addr) VALUES ("Restaurant", 14500, "4245 Metron Drive");
INSERT into BusinessProperty(p_type, p_size, addr) VALUES ("Sports Bar", 18250, "11132 Turnbridge Drive");
INSERT into BusinessProperty(p_type, p_size, addr) VALUES ("Office Space", 2300, "1616 Wilburn Park Lane");
INSERT into BusinessProperty(p_type, p_size, addr) VALUES ("Retail Store", 32400, "573 Richmond Drive");

#Listings
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (001, "12465 Ivy Woods Court", 002, "2024-09-25");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (002, "6240 Earline Circle S", 001, "2024-07-16");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (003, "14495 Cherry Lake Drive W", 004, "2024-08-18");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (004, "4941 Verdis Street", 003, "2024-04-19");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (005, "5656 Ribbon Rose Drive", 003, "2024-06-28");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (006, "12154 Chaseborough Way", 003, "2024-03-24");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (007, "4245 Metron Drive", 001, "2024-08-19");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (008, "11132 Turnbridge Drive", 005, "2024-10-09");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (009, "1616 Wilburn Park Lane", 001, "2024-04-25");
INSERT into Listings(mlsNumber, addr, agentId, dateListed) VALUES (010, "573 Richmond Drive", 002, "2024-01-07");

#Works_With
INSERT into Works_With(buyerId,agentId) VALUES (001,003);
INSERT into Works_With(buyerId,agentId) VALUES (002,002);
INSERT into Works_With(buyerId,agentId) VALUES (003,001);
INSERT into Works_With(buyerId,agentId) VALUES (004,004);
INSERT into Works_With(buyerId,agentId) VALUES (005,005);
INSERT into Works_With(buyerId,agentId) VALUES (006,001);
INSERT into Works_With(buyerId,agentId) VALUES (007,003);
INSERT into Works_With(buyerId,agentId) VALUES (008,005);
INSERT into Works_With(buyerId,agentId) VALUES (009,001);
INSERT into Works_With(buyerId,agentId) VALUES (010,004);

