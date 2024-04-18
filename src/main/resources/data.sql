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
