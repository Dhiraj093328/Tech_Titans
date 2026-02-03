-- =========================
-- CHAT MODULE TABLES
-- =========================

-- Chat room between ONE user and ONE therapist/admin
CREATE TABLE chat_room (
    chat_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    therapist_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_chat_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_chat_therapist
        FOREIGN KEY (therapist_id)
        REFERENCES therapist(therapist_id)
        ON DELETE CASCADE
);

-- Messages inside a chat room
CREATE TABLE chat_message (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    chat_id INT NOT NULL,
    sender_role VARCHAR(20) NOT NULL,  
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_chat_message_room
        FOREIGN KEY (chat_id)
        REFERENCES chat_room(chat_id)
        ON DELETE CASCADE
);
