CREATE TABLE coin (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    ticker VARCHAR(10) NOT NULL,       
    abbreviation VARCHAR(10) NOT NULL,  
    rate_usd DECIMAL(10, 2) NOT NULL     
);

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,   
    name VARCHAR(100) NOT NULL,           
    phone_number VARCHAR(15) NOT NULL     
);

CREATE TABLE amount (
    coin_id INT,                         
    user_id INT,                         
    amount DECIMAL(10, 2) NOT NULL,        
    PRIMARY KEY (coin_id, user_id),       
    FOREIGN KEY (coin_id) REFERENCES coin(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE 
);


INSERT INTO coin (id, ticker, abbreviation, rate_usd)
VALUES
    (1, 'USD', 'USD', 1.0000000000),
    (2, 'Bitcoin', 'BTC', 96185.8000000000),
    (3, 'Ethereum', 'ETH', 3568.8700000000),
    (4, 'Tether', 'USDT', 1.0000000000),
    (5, 'Solana', 'SOL', 239.7200000000),
    (6, 'Uniswap', 'UNI', 12.7700000000),
    (7, 'Dai', 'DAI', 0.9999000000),
    (8, 'Usdc', 'USDC', 0.9999000000);

INSERT INTO user (id, name, phone_number)
VALUES
    (1, 'Diana', '123'),
    (2, 'Rami', '234'),
    (3, 'Sami', '345');

INSERT INTO amount (coin_id, user_id, amount)
VALUES
    (1, 1, 1000.0000000000),  
    (2, 1, 0.0100000000),     
    (3, 1, 2.5000000000),    
    (1, 2, 500.0000000000),   
    (4, 2, 50.0000000000),   
    (5, 2, 1.0000000000),         
    (1, 3, 200.0000000000), 
    (6, 3, 5.0000000000),    
    (7, 3, 10.0000000000);

