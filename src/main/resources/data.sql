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

INSERT INTO seat (seat_number, flight_id, passenger_id)
VALUES
    ('',,);

INSERT INTO flight (departure_time, destination, origin, airline_id, aircraft_id)
VALUES 
    ('2024-04-19 08:00:00', 'Zurich', 'Paris', 5, 5),
    ('2024-04-19 10:15:00', 'Geneva', 'London', 6, 6),
    ('2024-04-19 13:00:00', 'Zurich', 'Berlin', 7, 7),
    ('2024-04-19 14:30:00', 'Bern', 'Vienna', 8, 8),
    ('2024-04-19 16:45:00', 'Basel', 'Amsterdam', 9, 9),
    ('2024-04-19 18:30:00', 'Geneva', 'Madrid', 10, 10),
    ('2024-04-19 20:15:00', 'Zurich', 'Rome', 5, 11),
    ('2024-04-19 21:45:00', 'Bern', 'Barcelona', 6, 12),
    ('2024-04-19 23:30:00', 'Geneva', 'Brussels', 7, 13),
    ('2024-04-20 06:30:00', 'Zurich', 'Munich', 11, 14),
    ('2024-04-20 08:00:00', 'Geneva', 'Lisbon', 12, 15),
    ('2024-04-20 09:30:00', 'Basel', 'Vienna', 13, 16),
    ('2024-04-20 11:00:00', 'Bern', 'Stockholm', 14, 17),
    ('2024-04-20 12:30:00', 'Zurich', 'Oslo', 15, 18),
    ('2024-04-20 14:00:00', 'Geneva', 'Copenhagen', 16, 19),
    ('2024-04-20 15:30:00', 'Basel', 'Dublin', 17, 20),
    ('2024-04-20 17:00:00', 'Bern', 'Helsinki', 18, 21),
    ('2024-04-20 18:30:00', 'Zurich', 'Prague', 19, 22),
    ('2024-04-20 20:00:00', 'Geneva', 'Warsaw', 20, 23),
    ('2024-04-20 21:30:00', 'Basel', 'Budapest', 21, 24),
    ('2024-04-20 23:00:00', 'Bern', 'Krakow', 22, 25);

