INSERT INTO airline (name, country)
VALUES
    ('Swiss International Air Lines', 'Switzerland'),
    ('Edelweiss Air', 'Switzerland'),
    ('Helvetic Airways', 'Switzerland'),
    ('Swiss Global Air Lines', 'Switzerland'),
    ('Chair Airlines', 'Switzerland'),
    ('EasyJet Switzerland', 'Switzerland'),
    ('Delta Airlines', 'United States'),
    ('British Airways', 'United Kingdom'),
    ('Lufthansa', 'Germany'),
    ('ANA', 'Japan');

INSERT INTO aircraft (capacity, type, airline_id)
VALUES
    (150, 'Airbus A320', 1),
    (220, 'Airbus A330', 1),
    (100, 'Airbus A220', 2),
    (100, 'Embraer 190', 3),
    (150, 'Airbus A320', 3),
    (100, 'Airbus A220', 4),
    (150, 'Airbus A320', 4),
    (150, 'Airbus A320', 5),
    (180, 'Airbus A320', 6),
    (200, 'Boeing 767', 7),
    (200, 'Boeing 767', 8),
    (200, 'Boeing 767', 9),
    (200, 'Boeing 767', 10),
    (300, 'Boeing 777', 10);

INSERT INTO passenger (address, first_name, last_name)
VALUES
    ('Bahnhofstrasse 1, 4001 Basel', 'Hans', 'Muster'),
    ('Bahnhofstrasse 2, 4001 Basel', 'Peter', 'Meier'),
    ('Bahnhofstrasse 3, 4001 Basel', 'Anna', 'Schmidt'),
    ('Bahnhofstrasse 4, 4001 Basel', 'Maria', 'Müller'),
    ('Bahnhofstrasse 5, 4001 Basel', 'Thomas', 'Keller'),
    ('Bahnhofstrasse 6, 4001 Basel', 'Hans', 'Moser'),
    ('Bahnhofstrasse 7, 4001 Basel', 'Peter', 'Keller'),
    ('Bahnhofstrasse 8, 4001 Basel', 'Anna', 'Moser'),
    ('Bahnhofstrasse 9, 4001 Basel', 'Maria', 'Keller'),
    ('Bahnhofstrasse 10, 4001 Basel', 'Thomas', 'Moser'),
    ('Bahnhofstrasse 11, 4001 Basel', 'Hans', 'Keller'),
    ('Bahnhofstrasse 12, 4001 Basel', 'Peter', 'Moser'),
    ('Bahnhofstrasse 13, 4001 Basel', 'Anna', 'Keller'),
    ('Bahnhofstrasse 14, 4001 Basel', 'Maria', 'Moser'),
    ('Bahnhofstrasse 15, 4001 Basel', 'Thomas', 'Keller'),
    ('Bahnhofstrasse 16, 4001 Basel', 'Hans', 'Moser'),
    ('Bahnhofstrasse 17, 4001 Basel', 'Peter', 'Keller'),
    ('Bahnhofstrasse 18, 4001 Basel', 'Anna', 'Moser'),
    ('Bahnhofstrasse 19, 4001 Basel', 'Maria', 'Keller'),
    ('Bahnhofstrasse 20, 4001 Basel', 'Thomas', 'Moser');