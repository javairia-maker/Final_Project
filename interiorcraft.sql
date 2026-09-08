CREATE DATABASE interiorcraft;
USE interiorcraft;
CREATE TABLE users(
    id int AUTO_INCRMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(250) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    project_name VARCHAR(150) NOT NULL,
    design_type VARCHAR(50) NOT NULL,
    room_type VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS uploaded_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    image_name VARCHAR(255) NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    ai_suggestion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ai_designs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    prompt TEXT NOT NULL,
    design_result TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    project_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,

    FOREIGN KEY (project_id)
    REFERENCES projects(id)
    ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS user_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    theme VARCHAR(50) DEFAULT 'light',
    notifications TINYINT(1) DEFAULT 1,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);
CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO rooms (room_name, description) VALUES
('Living Room', 'Design your dream living space for relaxation and comfort.'),
('Bedroom', 'Create a relaxing and comfortable bedroom.'),
('Kitchen', 'Design a modern and functional kitchen.'),
('Bathroom', 'Create a clean and stylish bathroom.'),
('Dining Room', 'Design a perfect space for family meals.'),
('Study Room', 'Create a productive and inspiring workspace.');

CREATE TABLE styles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    style_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO styles (style_name, description) VALUES
('Modern', 'Clean lines and elegant modern furniture'),
('Luxury', 'Premium interior design with rich decoration'),
('Minimalist', 'Simple clutter free space with modern look'),
('Industrial', 'Dark Urban theme with raw texture'),
('Scandinavian', 'Light colors, natural material and functional furniture'),
('Japanese', 'Zen inspired calm and balanced interior design'),
('Traditional', 'Timeless classic and warm interior design'),
('Bohemian', 'Vibrant artistic and naturally eclectic style');

CREATE TABLE designs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT NOT NULL,
    style_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (room_id) REFERENCES rooms(id),
    FOREIGN KEY (style_id) REFERENCES styles(id)
);