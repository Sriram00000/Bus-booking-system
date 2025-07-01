


# 🚌 Bus Booking System

A complete bus ticket booking backend application built with Spring Boot. It supports role-based authentication for **Admin**, **Conductor**, and **Passenger**, and enables **QR-code-based ticketing**, **route-based fare estimation**, and **conductor-side validation**.

---

## 🔑 Roles & Features

### 👤 Passenger (User)

- ✅ Register and log in using JWT
- 📍 Select source and destination stops from available bus routes
- 🔢 Enter number of passengers
- 💰 Get real-time **fare estimation**:
Fare = ₹10 base fare + ₹3 × number of intermediate stops

yaml
Copy
Edit
- 🎫 Book ticket and receive a downloadable QR Code with:
- Ticket ID
- Bus Route
- Journey details
- Fare amount
- 📦 View ticket details and journey info
- ❌ Cannot reuse the same ticket (scanned tickets are marked as used)

---

### 🧍 Conductor

- ✅ Login via JWT (only after **admin approval**)
- 🔍 Access a QR Code scanner endpoint or upload QR image to validate ticket
- 🆔 Retrieve passenger ticket data from QR content
- ✔️ Mark ticket as **used**
- ⚠️ Show message like:
- “✅ Ticket validated successfully”
- “❌ Ticket already used”

---

### 👨‍💼 Admin

- 🛡️ Login using default credentials (can be pre-set)
- ✅ Approve/reject **Conductor** accounts
- 📊 View list of all registered users, conductors, and bookings
- 📈 Monitor system logs, QR generation stats, and active routes

---

### 📷 QR Code Ticketing

- QR Code is generated after successful booking
- Stored under `/qrcodes/` folder (ignored in `.gitignore`)
- Ticket contains encoded JSON data:
```json

{
  "ticketId": 1023,
  "routeNumber": "42B",
  "source": "Ameerpet",
  "destination": "Koti",
  "fare": 16,
  "passengerCount": 2,
  "valid": true
}
```



🔁 Fare Estimation Logic
Given:

₹10 fixed base fare

₹3 per stop between source and destination

Example:

Ameerpet	Koti -	2 stops
₹10 + 2×3 = ₹16
LB Nagar	Secunderabad	5 stops
₹10 + 5×3 = ₹25

🛠️ Tech Stack
Java 17

Spring Boot

Spring Security + JWT

MySQL (JPA/Hibernate)

Swagger (OpenAPI UI)

ZXing (QR code)

JSON for dynamic route loading

Lombok

🔗 API Access
Role	Endpoint	Description
Public	/api/auth/register	Passenger registration
Public	/api/auth/login	Login for all users
Passenger	/api/tickets/fare	Get fare for source → destination
Passenger	/api/tickets/book	Book ticket with route and passenger count
Conductor	/api/scan/validate	Validate a QR ticket
Admin	/api/admin/approve-conductor/{id}	Approve a conductor account

⚙️ How to Run
Clone project:

bash
Copy
Edit
git clone https://github.com/yourusername/bus-booking-system.git
cd bus-booking-system
Set up your MySQL and update:

properties
Copy
Edit
spring.datasource.url=jdbc:mysql://localhost:3306/bus_booking
spring.datasource.username=root
spring.datasource.password=yourpassword
Run it:

bash
Copy
Edit
mvn clean install
mvn spring-boot:run

bash
Copy
Edit

📂 Directory Structure
bash
Copy
```
Edit
├── config/             # JWT filters, CORS, security config
├── controller/         # REST endpoints
├── dto/                # DTOs for requests/responses
├── entity/             # JPA models
├── repository/         # Spring Data interfaces
├── service/            # Business logic
├── util/               # QRCode + JSON route loader
├── resources/
│   ├── application.properties
│   └── bus_routes.json
├── qrcodes/            # Generated tickets (gitignored)
└── BusBookingSystemApplication.java
```

✅ To-Do & Future Enhancements
🔄 Payment gateway integration

📱 Mobile app frontend (React Native )

📍 Google Maps API for real-time route mapping

📥 Email/SMS ticket delivery

👨‍💻 Author
Built with 💻 and ☕ by @Sriram00000

Want to contribute or customize? Fork the repo and go for it!
