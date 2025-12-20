# Ecommerce Web App (Servlet/JSP)

This project is a Java MVC web application using Servlet/JSP, JSTL, Ant (NetBeans) for build, and Tomcat for deployment. Source code is organized into `control`, `dao`, `entity`, and views under the `web` folder.

## Tech Stack
- Java 8+ (JDK)
- Apache Tomcat 8.5+ (recommended 8.5.34)
- Apache Ant 1.7.1+
- Microsoft SQL Server 2017+ (JDBC driver `mssql-jdbc`)
- JSTL (bundled under project libraries)
- Client: jQuery, HTML, CSS, JS, Ajax, Bootstrap
- Integrations: SMTP (email), Google OAuth2

## Features

- CRUD data
- Admin Dashboard
- Seller Dashboard
- Online shopping

## Requirements
- Windows (verified on Windows 10/11)
- `JAVA_HOME` pointing to a JDK
- Tomcat and Ant installed and available on PATH

## Project Structure
```text
SWP391_SE1754_G1/
├─ build.xml
├─ build/ (generated)
├─ nbproject/
│  ├─ ant-deploy.xml
│  ├─ build-impl.xml
│  └─ private/
├─ src/
│  ├─ conf/
│  │  └─ MANIFEST.MF
│  └─ java/
│     ├─ constant/
│     ├─ context/
│     │  └─ DBContext.java
│     ├─ control/
│     │  ├─ AuthentController.java
│     │  ├─ ForgotPassword.java
│     │  ├─ HomeController.java
│     │  ├─ admin/
│     │  └─ seller/
│     ├─ dao/
│     ├─ entity/
│     ├─ filter/
│     ├─ helper/
│     └─ model/
├─ web/
│  ├─ index.html
│  ├─ assets/ …
│  ├─ app-assets/ …
│  ├─ META-INF/
│  │  └─ context.xml
│  ├─ views/
│  │  ├─ admin/
│  │  └─ common/
│  └─ WEB-INF/
│     ├─ web.xml
│     ├─ classes/
│     └─ lib/
└─ Library/
  └─ JSTL Library/
```

## Database Setup
Default SQL Server connection (local):
- Host: `localhost:1433`
- Database: `SWP391_SE1754_G1`
- Username: `sa`
- Password: `123`

Adjust in [src/java/context/DBContext.java](src/java/context/DBContext.java#L21-L39):
```java
String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391_SE1754_G1";
String user = "sa";
String password = "123";
```
Make sure the JDBC driver `mssql-jdbc` is present in [web/WEB-INF/lib/](web/WEB-INF/lib/) or properly included on the build classpath.

## Run with NetBeans (recommended)
1. Open the project in NetBeans.
2. Assign a Tomcat server (Tools → Servers → Add → Tomcat).
3. Press Run or Deploy for automatic build & deploy.
4. Visit: http://localhost:8080/SWP391_SE1754_G1

## Build & Deploy with Ant (CLI)
NetBeans generates Ant tasks that you can also invoke from the command line.

### 1) Prepare properties
- Tomcat home example: `C:\\Program Files\\apache-tomcat-8.5.34`
- NetBeans properties (auto-created if you opened the project in NetBeans):
  - `C:\\Users\\<USER>\\AppData\\Roaming\\NetBeans\\13\\build.properties`
  - `C:\\Users\\<USER>\\AppData\\Roaming\\NetBeans\\13\\tomcat90.properties`

Alternatively, pass properties directly via command line.

### 2) Build WAR
```powershell
# Specify server home if running outside NetBeans
ant -f build.xml -Dj2ee.server.home="C:\Program Files\apache-tomcat-8.5.34" dist
```
WAR will be created at `dist/SWP391_SE1754_G1.war`.

### 3) Deploy to Tomcat using Ant
Project has an Ant deploy script at [nbproject/ant-deploy.xml](nbproject/ant-deploy.xml). The default target deploys the WAR when `deploy.ant.enabled=true`.
```powershell
# Using NetBeans tomcat properties (recommended)
ant -f nbproject/ant-deploy.xml -Ddeploy.ant.enabled=true -Dtomcat.password="<MANAGER_PASSWORD>"

# Manual property passing
ant -f nbproject/ant-deploy.xml -Ddeploy.ant.enabled=true \
  -Ddeploy.ant.archive="dist/SWP391_SE1754_G1.war" \
  -Dtomcat.home="C:\Program Files\apache-tomcat-8.5.34" \
  -Dtomcat.url="http://localhost:8080" \
  -Dtomcat.username="admin" \
  -Dtomcat.password="<MANAGER_PASSWORD>"
```
After deployment, visit: http://localhost:8080/SWP391_SE1754_G1

### 4) Manual Deployment (without Ant)
1. Copy `dist/SWP391_SE1754_G1.war` to `TOMCAT_HOME/webapps/`.
2. Start Tomcat (`bin/startup.bat`).
3. Visit: http://localhost:8080/SWP391_SE1754_G1

## Quick Commands (Windows PowerShell)
```powershell
# Clean + Build WAR
ant -f build.xml -Dj2ee.server.home="C:\Program Files\apache-tomcat-8.5.34" clean dist

# Deploy (requires Tomcat Manager credentials or properties files)
ant -f nbproject/ant-deploy.xml -Ddeploy.ant.enabled=true -Dtomcat.password="<MANAGER_PASSWORD>"
```
For undeploy, use Tomcat Manager UI or adapt [nbproject/ant-deploy.xml](nbproject/ant-deploy.xml) to expose a public target that calls its internal `-undeploy-ant`.

## Notes
- If `ant dist` complains about missing server classpath, provide `-Dj2ee.server.home` or point `-Duser.properties.file` to your NetBeans `build.properties`.
- Ensure SQL Server TCP is enabled on port 1433 and credentials are valid.
- Context path is defined in [web/META-INF/context.xml](web/META-INF/context.xml#L2) as `/SWP391_SE1754_G1`.
- Include JSTL and JDBC libraries under [web/WEB-INF/lib/](web/WEB-INF/lib/) when packaging.

---

## API Reference

### Google Login (example)

```http
GET /login-google
```
Response contains tokens returned from Google:

| Parameter | Type | Description |
| :-------- | :--- | :---------- |
| access_token | string | Required. Google access_token |
| expires_in | string | Required. access_token validity |
| id_token | string | Required. Google ID token |
| token_type | string | Required. Token type |

Basic profile from Google:

| Parameter | Type | Description |
| :-------- | :--- | :---------- |
| id | string | Google account id |
| email | string | Google account email |
| verified_email | string | Email verification flag |
| name | string | Full name |
| given_name | string | Given name |
| family_name | string | Family name |
| picture | string | Avatar URL |

Note: Adjust the callback path (`/login-google`) to match your deployment if different.

### Authentication Endpoints (verified)

```http
GET /authen?action=login
POST /authen?action=login
POST /authen?action=register
GET /ForgotPassword
```

- Login and registration are handled by `AuthentController` mapped in [web/WEB-INF/web.xml](web/WEB-INF/web.xml#L23-L34) and [web/WEB-INF/web.xml](web/WEB-INF/web.xml#L52-L63).
- Forgot password is handled by `ForgotPassword` mapped in [web/WEB-INF/web.xml](web/WEB-INF/web.xml#L39-L45).

## Setup Notes (OAuth2 & SMTP)

- Google OAuth2: create OAuth client (Web) in Google Cloud Console, configure Authorized redirect URIs to point to your callback (e.g., `http://localhost:8080/SWP391_SE1754_G1/login-google`). Store Client ID/Secret in a secure config and wire to your servlet that processes the callback.
- SMTP (Gmail): the app uses Gmail SMTP (`smtp.gmail.com:587`, TLS). Replace hardcoded credentials with secure configuration and app passwords. See email sending in `ForgotPassword`.

## Contributing

Feel free to contribute by forking this repository, making some changes, and submitting pull requests.

## License

This project is developed for educational purposes.

## Authors

- [@halleluujahh](https://github.com/halleluujahh)


