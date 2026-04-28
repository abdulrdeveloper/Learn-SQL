CREATE TABLE ipl_players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    team VARCHAR(50),
    role VARCHAR(50),
    runs_scored INT CHECK (runs_scored >= 0),
    wickets_taken INT CHECK (wickets_taken >= 0),
    auction_price_crores INT
);


ALTER TABLE ipl_players
ADD COLUMN nickname VARCHAR(50);

-- If you want to use select * from ipl_players; you need to comment out the all the code written on the above of the insert statement. Otherwise, you will get an error because the table already exists and the column nickname already exists. So, to avoid that error, you can comment out the code above the insert statement and then run the select statement to see the data in the table.

INSERT INTO ipl_players
(name, team, role, runs_scored, wickets_taken, auction_price_crores, nickname)
VALUES
('Virat Kohli', 'RCB', 'Batsman', 12000, 1, 15, 'King Kohli'),
('MS Dhoni', 'CSK', 'Wicketkeeper Batsman', 10500, 1, 12, 'Captain Cool'),
('Rohit Sharma', 'MI', 'Batsman', 9000, 1, 14, 'Hit Man'),
('Jasprit Bumrah', 'MI', 'Bowler', 500, 150, 7, 'Boom Boom'),
('AB de Villiers', 'RCB', 'Batsman', 9500, 2, 11, 'AB de V'),
('Hardik Pandya', 'GT', 'All-rounder', 3500, 60, 10, 'Hardik Hero'),
('Ravindra Jadeja', 'CSK', 'All-rounder', 2500, 170, 9, 'Jadeja'),
('KL Rahul', 'LSG', 'Batsman', 5000, 0, 11, 'KL Rahul'),
('Shubman Gill', 'GT', 'Batsman', 3000, 0, 8, 'Shubman Gill'),
('Rashid Khan', 'GT', 'Bowler', 800, 180, 13, 'Rashid Khan');


SELECT * FROM ipl_players;
-- it will select all data from the ipl_players table and display it in a tabular format. You will see all the columns and rows of the table, including the player_id, name, team, role, runs_scored, wickets_taken, auction_price_crores, and nickname for each player.

SELECT name, team, role FROM ipl_players;
-- it will select only the name, team, and role columns from the ipl_players table