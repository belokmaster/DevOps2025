CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES 
('Alice', 'alice@gmail.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@mail.ru'),
('VENIK', 'doter228@yandex.ru'),
('Gay', 'gay@example.com');