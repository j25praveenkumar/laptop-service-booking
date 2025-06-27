# 💻 Laptop Service Booking System

A web-based application to allow users to book laptop servicing online and for admins to manage service requests. Built using **Java**, **JSP**, **Servlets**, and **JDBC**, following the **MVC architecture**.

---

## 🚀 Features

🔹 User Sign Up and Login  
🔹 Book a new laptop service request  
🔹 View service history  
🔹 Admin login panel  
🔹 Admin can view and manage all service bookings  
🔹 Generate PDF invoice for service with customer details and service cost  
🔹 Session tracking and logout support  

---

## 🛠️ Tech Stack

- **Frontend**: HTML, CSS, JSP  
- **Backend**: Java Servlets  
- **Database**: MySQL  
- **Tools Used**: Eclipse IDE (Enterprise Edition), Git, GitHub  
- **Architecture**: MVC (Model-View-Controller)

---

## 📁 Project Structure

LaptopServiceBooking/
│
├── src/
│ └── main/
│ └── java/
│ └── com.laptopbooking
│ ├── controller/
│ └── model/
│
├── webapp/
│ ├── css/
│ ├── images/
│ ├── JSP Pages (index.jsp, viewHistory.jsp, etc.)
│ └── HTML Pages (Admin.html, etc.)
│
├── .gitignore
└── README.md

---

## 📝 How to Run

1. Open Eclipse IDE and import the project.
2. Make sure Apache Tomcat is configured.
3. Create MySQL database and update DB config in Java files.
4. Run the project on server.
5. Access via browser:
http://localhost:8080/laptop-service-booking/