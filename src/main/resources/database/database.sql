CREATE TABLE
users(
userid INT(10) NOT NULL UNIQUE,
    username VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    password VARCHAR(128) NOT NULL
);

CREATE TABLE game(
    game_id INT(16) PRIMARY KEY,
    white_player VARCHAR(20) NOT NULL,
    black_player VARCHAR(20) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    winner CHAR(1)NOT NULL,
    win_by CHAR(1) NOT NULL,
    FOREIGN KEY(white_player) REFERENCES users(username),
    FOREIGN KEY(black_player) REFERENCES users(username),
    CONSTRAINT chk_winner CHECK(winner IN('W','B','D','A','P')),
    CONSTRAINT chk_win_by CHECK(win_by IN('C','R','S','A','P','N','T'))
);

CREATE TABLE friend(
    username VARCHAR(20) NOT NULL,
    friend VARCHAR(20) NOT NULL,
    PRIMARY KEY(username,friend),
    FOREIGN KEY(username) REFERENCES users(username),
    FOREIGN KEY(friend) REFERENCES users(username)
);

CREATE TABLE moves(
    move_id INT(16) PRIMARY KEY,
    game_id INT(16) NOT NULL,
    name VARCHAR(8) NOT NULL,
    source_x INT(1)NOT NULL,
    source_y INT(1) NOT NULL,
    dest_x INT(1) NOT NULL,
    dest_y INT(1) NOT NULL,
    turn CHAR(1) NOT NULL,
    piece CHAR(1) NOT NULL,
    time DATETIME,
    FOREIGN KEY(game_id) REFERENCES game(game_id),
    CONSTRAINT chk_turn CHECK (turn IN('W','B')),
    CONSTRAINT chk_piece CHECK(piece IN('P','N','B','R','Q'))
);

ALTER TABLE moves ADD CONSTRAINT chk_src_x CHECK(source_x >=0 AND source_x <8);
ALTER TABLE moves ADD CONSTRAINT chk_src_y CHECK(source_y >=0 AND source_y <8);
ALTER TABLE moves ADD CONSTRAINT chk_dest_x CHECK(dest_y >=0 AND dest_y <8);
ALTER TABLE moves ADD CONSTRAINT chk_dest_y CHECK(dest_y >=0 AND dest_y <8);
