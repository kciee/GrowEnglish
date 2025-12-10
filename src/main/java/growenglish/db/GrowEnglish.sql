CREATE DATABASE GrowEnglish;
GO

USE GrowEnglish;
GO


CREATE TABLE users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,  
    email VARCHAR(100),
    full_name NVARCHAR(100),
    birth_year INT,
    phonenumber VARCHAR(15),
    avatar_url VARCHAR(255) DEFAULT 'assets/images/default-avatar.png',
    role VARCHAR(20) DEFAULT 'user'  
);
GO

 
CREATE TABLE Course (  
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255),
    shortDescription NVARCHAR(MAX),
    price FLOAT
);
GO

 
CREATE TABLE free_documents (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255),
    description NVARCHAR(MAX),
    image_path VARCHAR(255),
    video_or_word VARCHAR(50)  
);
GO

 
CREATE TABLE free_document_details (
    DocumentId INT PRIMARY KEY,  
    Content NVARCHAR(MAX),
    FOREIGN KEY (DocumentId) REFERENCES free_documents(id) ON DELETE CASCADE
);
GO

 
CREATE TABLE learning_documents (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50),
    DocumentId INT,
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE,
    FOREIGN KEY (DocumentId) REFERENCES free_documents(id) ON DELETE CASCADE
);
GO

 
CREATE TABLE paid_documents (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255),
    Description NVARCHAR(MAX),
    ImagePath VARCHAR(255),
    VideoOrWord VARCHAR(50),
    Price FLOAT
);
GO

 
CREATE TABLE orders (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50),
    total_price FLOAT,
    status VARCHAR(50) DEFAULT 'pending', 
    order_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);
GO

 
CREATE TABLE quizzes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255),
    description NVARCHAR(MAX)
);
GO

 
CREATE TABLE questions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    quiz_id INT,
    text NVARCHAR(MAX),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);
GO

 
CREATE TABLE answers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    question_id INT,
    text NVARCHAR(MAX),
    is_correct BIT,  
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);
GO

 
CREATE TABLE user_answers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50),
    question_id INT,
    answer_id INT,
    is_correct BIT,
    timestamp DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (username) REFERENCES users(username),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (answer_id) REFERENCES answers(id)
);
GO
 
CREATE TABLE chat_messages (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50),
    content NVARCHAR(MAX),
    timestamp DATETIME DEFAULT GETDATE()
);
GO

 
INSERT INTO users (username, password, email, full_name, role) VALUES 
('admin', '$2a$10$R/h.gq.tq.q.w.e.r.t.y.u.i.o.p', 'admin@gmail.com', N'Quản trị viên', 'admin'),
('user1', '$2a$10$R/h.gq.tq.q.w.e.r.t.y.u.i.o.p', 'user1@gmail.com', N'Nguyen Van A', 'user');
GO

 
INSERT INTO Course (name, shortDescription, price) VALUES 
(N'Tiếng Anh Giao Tiếp Cơ Bản', N'Khóa học dành cho người mới bắt đầu.', 50.0),
(N'Luyện Thi TOEIC 500+', N'Cam kết đầu ra 500+ điểm.', 80.0),
(N'IELTS Writing Masterclass', N'Chuyên sâu kỹ năng viết.', 120.0);
GO

 
INSERT INTO free_documents (title, description, image_path, video_or_word) VALUES 
(N'3000 Từ vựng thông dụng', N'Bộ từ vựng Oxford cốt lõi.', 'assets/images/vocab.jpg', 'word'),
(N'Video luyện nghe TedTalk', N'Luyện nghe qua các bài diễn thuyết.', 'assets/images/ted.jpg', 'video');
GO

 
INSERT INTO free_document_details (DocumentId, Content) VALUES
(1, N'<h1>Danh sách từ vựng</h1><p>Hello: Xin chào</p><p>Goodbye: Tạm biệt</p>');
GO
 
INSERT INTO paid_documents (Title, Description, ImagePath, VideoOrWord, Price) VALUES 
(N'Ebook Bí kíp 9.0 IELTS', N'Sách điện tử độc quyền.', 'assets/images/ielts.jpg', 'word', 15.0),
(N'Combo Video phát âm chuẩn Mỹ', N'Trọn bộ 50 video.', 'assets/images/pronun.jpg', 'video', 25.0);
GO

  
INSERT INTO quizzes (name, description) VALUES (N'Kiểm tra ngữ pháp căn bản', N'Bài test 15 phút về thì hiện tại đơn.');
 
INSERT INTO questions (quiz_id, text) VALUES 
(1, N'She _____ to school every day.'),
(1, N'They _____ football now.');

 
INSERT INTO answers (question_id, text, is_correct) VALUES 
(1, N'go', 0), (1, N'goes', 1), (1, N'going', 0), (1, N'went', 0);

 
INSERT INTO answers (question_id, text, is_correct) VALUES 
(2, N'play', 0), (2, N'plays', 0), (2, N'are playing', 1), (2, N'played', 0);
GO