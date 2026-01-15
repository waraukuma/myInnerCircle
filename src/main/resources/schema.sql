/* 1. users */
CREATE TABLE users (
                       user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       email VARCHAR(100),
                       reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* 2. contacts */
CREATE TABLE contacts (
                          contact_id INTEGER AUTO_INCREMENT PRIMARY KEY,
                          user_id INTEGER NOT NULL,
                          name VARCHAR(100) NOT NULL,
                          relation_type VARCHAR(50),
                          phone VARCHAR(30),
                          memo STRING,
                          reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (user_id) REFERENCES users(user_id)
);

/* 3. anniversaries */
CREATE TABLE anniversaries (
                               anniv_id INTEGER AUTO_INCREMENT PRIMARY KEY,
                               contact_id INTEGER NOT NULL,
                               anniv_type VARCHAR(50),
                               anniv_date DATE NOT NULL,
                               FOREIGN KEY (contact_id) REFERENCES contacts(contact_id)
);

/* 4. preferences */
CREATE TABLE preferences (
                             pref_id INTEGER AUTO_INCREMENT PRIMARY KEY,
                             contact_id INTEGER NOT NULL,
                             category VARCHAR(50),
                             content STRING,
                             like_type VARCHAR(20) CHECK (like_type IN ('LIKE','DISLIKE')),
                             FOREIGN KEY (contact_id) REFERENCES contacts(contact_id)
);

/* 5. greeting_history */
CREATE TABLE greeting_history (
                                  hist_id INTEGER AUTO_INCREMENT PRIMARY KEY,
                                  contact_id INTEGER NOT NULL,
                                  greeting_type VARCHAR(50),
                                  content STRING,
                                  greeting_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  FOREIGN KEY (contact_id) REFERENCES contacts(contact_id)
);

