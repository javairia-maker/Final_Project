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
   ame VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    image VARCHAR(255),
    model_3d VARCHAR(255),
    default_width DECIMAL(10,2) DEFAULT 100,
    default_depth DECIMAL(10,2) DEFAULT 100,
    default_height DECIMAL(10,2) DEFAULT 100,
    price DECIMAL(10,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); description TEXT NOT NULL
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
CREATE TABLE furniture (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    image VARCHAR(255),
    model_3d VARCHAR(255),
    default_width DECIMAL(10,2) DEFAULT 100,
    default_depth DECIMAL(10,2) DEFAULT 100,
    default_height DECIMAL(10,2) DEFAULT 100,
    price DECIMAL(10,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Example furniture data

INSERT INTO furniture
(name, category, image, model_3d, default_width, default_depth, default_height, price)
VALUES
('Modern Sofa', 'Sofa', 'sofa.jpg', 'sofa.glb', 220, 90, 85, 50000),

('Double Bed', 'Bed', 'bed.jpg', 'bed.glb', 200, 180, 100, 75000),

('Dining Table', 'Table', 'table.jpg', 'table.glb', 160, 90, 75, 40000),

('Chair', 'Chair', 'chair.jpg', 'chair.glb', 50, 50, 90, 10000),

('Wardrobe', 'Storage', 'wardrobe.jpg', 'wardrobe.glb', 180, 60, 200, 65000),

('Study Table', 'Table', 'study_table.jpg', 'study_table.glb', 120, 60, 75, 30000),

('TV Cabinet', 'Cabinet', 'tv_cabinet.jpg', 'tv_cabinet.glb', 180, 45, 60, 35000),

('Coffee Table', 'Table', 'coffee_table.jpg', 'coffee_table.glb', 100, 60, 45, 20000);

CREATE TABLE design_projects (
    id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,
    room_id INT NOT NULL,
    style_id INT,

    design_name VARCHAR(150) NOT NULL,

    room_width DECIMAL(10,2) NOT NULL,
    room_depth DECIMAL(10,2) NOT NULL,
    room_height DECIMAL(10,2) NOT NULL,

    view_mode ENUM('2D','3D') DEFAULT '2D',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE,

    FOREIGN KEY (room_id) REFERENCES rooms(id)
        ON DELETE CASCADE,

    FOREIGN KEY (style_id) REFERENCES styles(id)
        ON DELETE SET NULL
);
CREATE TABLE design_items (
    id INT AUTO_INCREMENT PRIMARY KEY,

    design_id INT NOT NULL,
    furniture_id INT NOT NULL,

    pos_x DECIMAL(10,2) DEFAULT 0,
    pos_y DECIMAL(10,2) DEFAULT 0,
    pos_z DECIMAL(10,2) DEFAULT 0,

    rotation_x DECIMAL(10,2) DEFAULT 0,
    rotation_y DECIMAL(10,2) DEFAULT 0,
    rotation_z DECIMAL(10,2) DEFAULT 0,

    item_width DECIMAL(10,2),
    item_depth DECIMAL(10,2),
    item_height DECIMAL(10,2),

    FOREIGN KEY (design_id) REFERENCES design_projects(id)
        ON DELETE CASCADE,

    FOREIGN KEY (furniture_id) REFERENCES furniture(id)
        ON DELETE CASCADE
);