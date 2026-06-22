# ProDhee Student Courses Portal

A full-stack Java web application for student course management with authentication, enrollment, and admin features. Built with Java Servlets, JSP, MySQL, and Tailwind CSS.

## 📸 Features

### Student Features
- ✅ User Registration & Login
- ✅ View & Edit Profile
- ✅ Change Password
- ✅ Browse & Search Courses
- ✅ Enroll in Courses
- ✅ View My Courses
- ✅ Payment Processing
- ✅ Transaction History

### Admin Features
- ✅ View All Students
- ✅ Add/Update/Delete Courses
- ✅ View Payments
- ✅ Delete Student Accounts
- ✅ Manage Course Information

## 🛠 Technology Stack

| Component | Technology |
|-----------|-----------|
| **Backend** | Java 11, Servlets, JSP |
| **Database** | MySQL 8.0+ |
| **Frontend** | Tailwind CSS, Font Awesome Icons |
| **Build** | Maven 3.9.16 |
| **Server** | Apache Tomcat 10.1+ |
| **Version Control** | Git & GitHub |

## 📋 Project Structure

```
Prodhee-Student-App/
├── src/main/
│   ├── java/in/ps/studentapp/
│   │   ├── connection/       (Database connection & transaction management)
│   │   ├── dao/              (Data Access Objects - Student, Courses, Payments)
│   │   ├── dto/              (Data Transfer Objects - Student, Courses, Payment)
│   │   ├── servlet/          (Controllers - Login, Register, UpdateProfile, etc.)
│   │   └── admin/            (Admin utilities)
│   └── webapp/
│       ├── *.jsp             (Web pages - login, dashboard, courses, etc.)
│       ├── CSS/              (Styling)
│       └── WEB-INF/
│           ├── web.xml       (Servlet configuration)
│           └── MANIFEST.MF
├── pom.xml                   (Maven dependencies & build configuration)
├── student_db.sql            (Database schema & initial data)
├── README.md                 (This file)
└── .gitignore                (Git ignore rules)
```

## 🚀 Quick Start

### Prerequisites
- Java 11+
- MySQL 8.0+
- Apache Tomcat 10.1+
- Maven 3.9+
- Eclipse IDE (optional, for development)

### 1. Database Setup

```bash
# Open MySQL Command Line or MySQL Workbench
mysql -u root -p

# Execute these commands:
CREATE DATABASE student_db;
USE student_db;
SOURCE student_db.sql;
```

Or in MySQL Workbench:
1. File → Open SQL Script
2. Select `student_db.sql`
3. Click Lightning Bolt (Execute)

### 2. Build the Project

```bash
# Navigate to project directory
cd Prodhee-Student-App

# Build with Maven
mvn clean install
```

### 3. Deploy to Tomcat

**Option A: Using Eclipse**
1. Right-click project → Run on Server
2. Select Apache Tomcat 10.1+
3. Click Finish

**Option B: Manual Deployment**
1. Navigate to: `target/prodhee-student-app.war`
2. Copy to: `$CATALINA_HOME/webapps/`
3. Start Tomcat
4. Access: `http://localhost:8080/prodhee-student-app`

### 4. Access the Application

- **URL:** `http://localhost:8080/prodhee-student-app`
- **Default Page:** Login/Signup

## 👤 Default Test Credentials

### Admin Account
- **Email:** admin@prodhee.com
- **Password:** admin123

### Sample Student Account
- **Email:** student@prodhee.com
- **Password:** student123

**Note:** Create your own account via Signup for testing.

## 🔐 Security Features

✅ **Implemented:**
- SQL Injection Prevention (PreparedStatements)
- Session-based Authentication
- Role-based Access Control (Student/Admin)
- Secure Password Storage

⚠️ **Not Implemented (Future Enhancement):**
- Password Hashing (BCrypt)
- HTTPS/SSL
- CSRF Token Protection
- Rate Limiting on Login

## 📦 Dependencies

| Dependency | Version | Purpose |
|-----------|---------|---------|
| Jakarta Servlet API | 5.0.0 | Servlet/JSP support |
| MySQL Connector | 8.0.33 | Database driver |
| Tomcat Embed Core | 10.1.24 | Embedded Tomcat (optional) |
| Tomcat Embed Jasper | 10.1.24 | JSP support (optional) |
| JUnit | 4.13.2 | Testing |

## 🗄 Database Schema

### STUDENT Table
```sql
CREATE TABLE STUDENT (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(100),
  MAIL VARCHAR(100) UNIQUE,
  PASSWORD VARCHAR(100),
  PHONE BIGINT,
  CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### COURSES Table
```sql
CREATE TABLE COURSES (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  TITLE VARCHAR(200),
  DESCRIPTION TEXT,
  PRICE DOUBLE,
  INSTRUCTOR VARCHAR(100),
  DURATION INT,
  CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### ENROLLMENT Table
```sql
CREATE TABLE ENROLLMENT (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  STUDENT_ID INT,
  COURSE_ID INT,
  ENROLLED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(ID),
  FOREIGN KEY (COURSE_ID) REFERENCES COURSES(ID)
);
```

### PAYMENT Table
```sql
CREATE TABLE PAYMENT (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  STUDENT_ID INT,
  COURSE_ID INT,
  AMOUNT DOUBLE,
  PAYMENT_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  TRANSACTION_ID VARCHAR(100) UNIQUE,
  STATUS VARCHAR(50),
  FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(ID),
  FOREIGN KEY (COURSE_ID) REFERENCES COURSES(ID)
);
```

## 🔧 Configuration

### Database Connection (Connector.java)

Default configuration (localhost):
```java
String dbHost = System.getenv("DB_HOST");      // defaults to "localhost"
String dbUser = System.getenv("DB_USER");      // defaults to "root"
String dbPassword = System.getenv("DB_PASSWORD"); // defaults to "root"
String dbName = System.getenv("DB_NAME");      // defaults to "student_db"
```

To change defaults, edit: `src/main/java/in/ps/studentapp/connection/Connector.java`

### Tomcat Port

Default: `8080`

To change, edit `$CATALINA_HOME/conf/server.xml` and modify `port="8080"`

## 📝 API Endpoints (Servlets)

| Servlet | URL | Method | Purpose |
|---------|-----|--------|---------|
| Login | `/login` | POST | User login |
| Signup | `/signup` | POST | New user registration |
| Logout | `/logout` | GET | Session termination |
| UpdateProfile | `/updateProfile` | POST | Update user info |
| ChangePassword | `/changePassword` | POST | Change password |
| ForgotPassword | `/forgotPassword` | POST | Password recovery |
| SearchCourses | `/searchCourses` | GET/POST | Search courses |
| MyCourses | `/myCourses` | GET | View enrolled courses |
| CoursesInfo | `/coursesInfo` | GET | View course details |
| Payments | `/payments` | GET/POST | Payment processing |

## 🐛 Known Issues & Limitations

1. **Plain Text Passwords** - Passwords stored as plain text (should use BCrypt)
2. **No Email Verification** - Password reset doesn't validate email ownership
3. **No Transaction Management** - Multi-step operations not atomic
4. **Limited Error Handling** - Generic error messages shown to users
5. **No Logging Framework** - Uses System.out.println (use Log4j/SLF4J for production)

## 🚀 Future Enhancements

- [ ] Implement BCrypt password hashing
- [ ] Add Email verification (OTP/verification links)
- [ ] Implement transaction management
- [ ] Add proper logging (Log4j/SLF4J)
- [ ] Create REST API (Spring Boot migration)
- [ ] Add unit & integration tests
- [ ] Implement caching (Redis)
- [ ] Add payment gateway integration (Stripe/PayPal)
- [ ] Implement course ratings & reviews
- [ ] Add admin analytics dashboard

## 📚 Learning Outcomes

This project demonstrates:
- ✅ Java Servlet & JSP development
- ✅ MVC architecture pattern
- ✅ JDBC & database operations
- ✅ Session management & authentication
- ✅ HTML/CSS frontend design (Tailwind CSS)
- ✅ Git version control
- ✅ Maven build automation
- ✅ SQL database design

## 🤝 Contributing

This is an educational project. Feel free to fork and modify for learning purposes.

## 📄 License

Educational Project - ProDhee Learning Initiative

---

## 📞 Support

For issues or questions:
1. Check the README thoroughly
2. Review the source code comments
3. Check Tomcat logs: `$CATALINA_HOME/logs/catalina.out`
4. Open a GitHub issue

---

**Last Updated:** June 2026  
**Status:** ✅ Fully Functional (Local Deployment)  
**Ready for:** Portfolio, Internship, Learning
