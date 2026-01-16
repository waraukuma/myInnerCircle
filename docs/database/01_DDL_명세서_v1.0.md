# myInnerCircle DDL 명세서 v1.0

**생성일**: 2026.01.15  
**DBMS**: CUBRID 11.x  
**DB명**: myinnerdb (localhost:33000)  
**작성자**: waraukuma

---

## 📋 테이블 개요 (5개)

| 테이블명 | 용도 | 예상 레코드 수 |
|---------|------|---------------|
| `users` | 사용자정보 | 1,000 |
| `contacts` | 지인목록 | 10,000 |
| `anniversaries` | 기념일 | 5,000 |
| `preferences` | 선호사항 | 20,000 |
| `greeting_history` | 인사기록 | 50,000 |

---

## 테이블 상세 명세

### 1. `users` - 사용자 테이블

```sql
-- 1. users (사용자)
CREATE TABLE users (
    user_id         INTEGER AUTO_INCREMENT PRIMARY KEY,  -- 사용자ID
    username        VARCHAR(100) UNIQUE NOT NULL,        -- 로그인ID  
    password        VARCHAR(255) NOT NULL,               -- 비밀번호(해시)
    email           VARCHAR(100),                        -- 이메일
    reg_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- 가입일시
);

-- 2. contacts (지인)
CREATE TABLE contacts (
    contact_id      INTEGER AUTO_INCREMENT PRIMARY KEY,  -- 지인ID
    user_id         INTEGER NOT NULL,                    -- 소유자ID
    name            VARCHAR(100) NOT NULL,               -- 이름
    relation_type   VARCHAR(50),                         -- 관계(가족/친구...)
    phone           VARCHAR(30),                         -- 전화번호
    memo            STRING,                              -- 메모
    reg_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 등록일시
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 3. anniversaries (기념일)
CREATE TABLE anniversaries (
    anniv_id        INTEGER AUTO_INCREMENT PRIMARY KEY,  -- 기념일ID
    contact_id      INTEGER NOT NULL,                    -- 지인ID
    anniv_type      VARCHAR(50),                         -- 타입(생일/기념일)
    anniv_date      DATE NOT NULL,                       -- 날짜
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id)
);

-- 4. preferences (선호사항)
CREATE TABLE preferences (
    pref_id         INTEGER AUTO_INCREMENT PRIMARY KEY,  -- 선호ID
    contact_id      INTEGER NOT NULL,                    -- 지인ID
    category        VARCHAR(50),                         -- 카테고리(음식/음료...)
    content         STRING,                              -- 내용
    like_type       VARCHAR(20) CHECK (like_type IN ('LIKE','DISLIKE')), -- 좋아함/싫어함
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id)
);

-- 5. greeting_history (인사기록)  
CREATE TABLE greeting_history (
    hist_id         INTEGER AUTO_INCREMENT PRIMARY KEY,  -- 기록ID
    contact_id      INTEGER NOT NULL,                    -- 지인ID
    greeting_type   VARCHAR(50),                         -- 인사유형(SMS/문자...)
    content         STRING,                              -- 인사내용
    greeting_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 인사일시
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id)
);

