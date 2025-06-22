package com.laptopbooking.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

import javax.mail.*;
import javax.mail.internet.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.laptopbooking.model.ServiceRequestModel;

@WebServlet("/BookServiceServlet")
public class BookServiceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get form values
        String customerName = request.getParameter("customerName");
        String laptopName = request.getParameter("laptopName");
        String issue = request.getParameter("issue");
        String phone = request.getParameter("phone");
        String description = request.getParameter("description");

        // 2. Get session and user email
        HttpSession httpSession = request.getSession(false);
        String userEmail = null;

        if (httpSession != null) {
            userEmail = (String) httpSession.getAttribute("userEmail");
        }

        if (userEmail == null) {
            response.sendRedirect("index.jsp"); // Not logged in, redirect
            return;
        }
        


        // 3. Store data in DB
        ServiceRequestModel model = new ServiceRequestModel();
        boolean result = model.bookService(customerName, laptopName, issue, phone, description, userEmail);

        if (result) {
            try {
                // 4. Generate PDF
                String pdfPath = getServletContext().getRealPath("/") + "service-details.pdf";
                Document document = new Document();
                PdfWriter.getInstance(document, new FileOutputStream(pdfPath));
                document.open();
                document.add(new Paragraph("Laptop Service Booking Details"));
                document.add(new Paragraph("--------------------------------------------------"));
                document.add(new Paragraph("Customer Name: " + customerName));
                document.add(new Paragraph("Laptop Name: " + laptopName));
                document.add(new Paragraph("Issue: " + issue));
                document.add(new Paragraph("Phone: " + phone));
                document.add(new Paragraph("Description: " + description));
                document.close();

                // 5. Send Email with PDF
                String to = "j25praveenkumar001@gmail.com";      
                String from = "j25praveenkumar001@gmail.com";      
                String password = "zfpnuslphhmwdlnl";    

                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");

                // Mail session (⚠️ different from HttpSession)
                Session mailSession = Session.getInstance(props, new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                });

                Message message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
                message.setSubject("Laptop Service Booking Confirmation");

                BodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setText("Hi " + customerName + ",\n\nPlease find your service booking details attached as a PDF.\n\nThank you!");

                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);

                MimeBodyPart attachmentPart = new MimeBodyPart();
                DataSource source = new FileDataSource(pdfPath);
                attachmentPart.setDataHandler(new DataHandler(source));
                attachmentPart.setFileName("service-details.pdf");
                multipart.addBodyPart(attachmentPart);

                message.setContent(multipart);
                Transport.send(message);

                System.out.println("Email with PDF sent successfully!");

            } catch (Exception e) {
                e.printStackTrace();
            }

            // 6. Forward to success page
            RequestDispatcher rr = request.getRequestDispatcher("serviceSuccess.jsp");
            rr.forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
