# **Food Order Delivery Application**

**Food Order Delivery Application** is a comprehensive solution for managing the entire lifecycle of food ordering and delivery. It includes features for user registration, restaurant and menu management, order placement, and payment processing.

---

## **Features**
- Dynamic Navigation: Smooth and intuitive navigation between pages for a seamless user experience.
- Session Management: User sessions persist during interactions to avoid repeated logins.
- Responsiveness: Fully responsive design using Bootstrap for compatibility across devices.
- Enhanced Security: Hashing and salting of passwords for secure user data storage.
- Scalable Architecture: Designed to support additional features and integrations in the future.

### **User Management**
- **Login & Registration**: Secure user authentication using Servlets, Sessions, and Cookies.  
- **User Details**: Includes fields for confirm password, address, and mobile number in the registration form.  

### **Restaurant Management**
- View restaurant details displayed in structured tables or blocks with navigation options.  
- Each restaurant's page includes menu listings and contact details.  

### **Menu Management**
- Display restaurant-specific menus with details like name, description, price, and availability.  
- Features 'View Details' and 'Order Now' buttons.  

### **Order Management**
- Place orders directly from the menu page by selecting items and quantities.  
- View order history, including details such as order date, time, total amount, and payment status.  
- Update order status (e.g., Delivered, Pending).  

### **Payment Options**
- Supports Cash on Delivery (COD) and online payment methods like UPI, Google Pay, and PhonePe.  

---

### **Advanced Features**
- **Dynamic Navigation**: Smooth and intuitive navigation between pages for a seamless user experience.  
- **Session Management**: User sessions persist during interactions to avoid repeated logins.  
- **Responsiveness**: Fully responsive design using Bootstrap for compatibility across devices.  
- **Enhanced Security**: Hashing and salting of passwords for secure user data storage.  
- **Scalable Architecture**: Designed to support additional features and integrations in the future.  

---

## **Technology Stack**

- **Frontend**: HTML, CSS, JavaScript, Bootstrap  
- **Backend**: Java, Servlets, JSP  
- **Database**: MySQL  
- **Tools**: Maven, Eclipse/IntelliJ IDEA  

---

### **Set Up Dynamic Web Project**
- Ensure the project is set up as a Dynamic Web Project:
- Right-click the project in the Package Explorer.
- Select Properties > Project Facets.
- Enable Dynamic Web Module and set the required version (e.g., 4.0).
- If you don’t have Dynamic Web Module set up, you may need to install the necessary plugins for Eclipse.

---

### **Configure the Server**
- To run the project on a server:
- Go to Run > Run Configurations.
- Select Apache Tomcat (or your preferred server) from the list of servers.
- Click New, choose your Tomcat installation folder, and set the server port (default is 8080).
- Add the Web project to the configuration, if prompted.

---

### **Build and Deploy the Application**
- Right-click the project and select Run As > Run on Server.
- Choose your server (e.g., Apache Tomcat) and click Finish.
- The application will launch in your default browser.

---

### **Test the Application**
- Access the application via http://localhost:8080/Food-Order-Delivery-Application.
- Use the login or registration page to start interacting with the app.

---

## **Setup Instructions for Eclipse Dynamic Web Project**
- Import the Project into Eclipse
- Open Eclipse IDE.
- Go to File > Import > Maven > Existing Maven Projects.
- Select the cloned project folder and click Finish.

---

### **1. Clone the Repository**
Clone the repository from GitHub to your local machine:
```bash
git clone https://github.com/YourUsername/Food-Order-Delivery-Application.git
