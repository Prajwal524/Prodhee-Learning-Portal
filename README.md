# ProDhee Student Courses Portal

Full-stack Java web application for student course management with authentication, enrollment, and admin features.

## ⚡ Quick Start

### Local Development

1. **Database Setup**
   ```bash
   mysql -u root -p
   CREATE DATABASE student_db;
   USE student_db;
   SOURCE student_db.sql;
   ```

2. **Build & Run**
   ```bash
   mvn clean install
   mvn tomcat7:run
   ```
   Access: `http://localhost:8080/prodhee-student-app`

3. **Default Credentials**
   - Admin: ID=1 (any registered account with ID=1 is admin)
   - Student: Create via signup page

### Render Deployment

1. **Set Environment Variables in Render Dashboard:**
   ```
   DB_HOST=your-mysql-host.render.com
   DB_USER=your-db-user
   DB_PASSWORD=your-db-password
   DB_NAME=student_db
   ```

2. **Push to GitHub** (this repository)

3. **Connect to Render:**
   - Create new Web Service
   - Connect GitHub repo
   - Select branch → Deploy

4. **Restore Database:**
   - Use `student_db.sql` to initialize schema in Render MySQL

## 📋 Features

**Student**
- Signup/Login/Logout
- View & edit profile
- Change password
- Browse & search courses
- Enroll in courses
- Make payments

**Admin**
- View all students
- Add/update/delete courses
- View payments
- Delete students

## 🛠 Technology Stack

- **Backend**: Java 11, Servlets, JSP
- **Database**: MySQL 8.0+
- **Frontend**: Tailwind CSS, Font Awesome
- **Build**: Maven
- **Server**: Apache Tomcat 10.1+

## 📁 Project Structure

```
src/main/
├── java/in/ps/studentapp/
│   ├── connection/  → Database connection (Connector.java)
│   ├── dao/         → Data access layer
│   ├── dto/         → Data transfer objects
│   └── servlet/     → Controllers
└── webapp/
    ├── *.jsp        → Web pages
    ├── WEB-INF/
    │   └── web.xml  → Servlet configuration
    └── student_db.sql → Database schema
```

## 🔧 Database Configuration

The app uses environment variables for database connection:

**Local (Development)**: Falls back to `localhost:3306` with user `root`/password `root`

**Production (Render)**: Uses environment variables set in Render dashboard

Edit `src/main/java/in/ps/studentapp/connection/Connector.java` to change defaults.

## 🔐 Security

✅ **Implemented**:
- SQL Injection Prevention (PreparedStatements)
- Session-based Authentication
- Role-based access control

⚠️ **Missing** (add for production):
- Password hashing (BCrypt)
- HTTPS/SSL
- CSRF tokens

## 📦 Dependencies

- Jakarta Servlet API 5.0.0
- MySQL Connector 8.0.33
- JUnit 4.13.2 (testing)

## 🚀 Deployment Checklist

- [ ] Database schema imported
- [ ] Environment variables configured
- [ ] Maven build successful
- [ ] All servlets mapped in web.xml
- [ ] Test login flow locally first

## 📄 License

Educational project for learning Java web development.

---

**Status**: Ready for Render deployment  
**Last Updated**: June 2026
"# Prodhee-Learning-Portal" 
