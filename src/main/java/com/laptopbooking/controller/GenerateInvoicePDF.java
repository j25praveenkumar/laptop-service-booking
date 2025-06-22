package com.laptopbooking.controller;


import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/GenerateInvoicePDF")
public class GenerateInvoicePDF extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String issue = request.getParameter("issue");
        String amount = request.getParameter("amount");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=invoice.pdf");

        try {
            Document document = new Document();
            OutputStream out = response.getOutputStream();
            PdfWriter.getInstance(document, out);

            document.open();
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20);
            Font bodyFont = FontFactory.getFont(FontFactory.HELVETICA, 12);

            document.add(new Paragraph("Laptop Service Invoice", titleFont));
            document.add(new Paragraph(" "));

            document.add(new Paragraph("Customer Name: " + name, bodyFont));
            document.add(new Paragraph("Phone Number: " + phone, bodyFont));
            document.add(new Paragraph("Issue: " + issue, bodyFont));
            document.add(new Paragraph("Amount: ₹" + amount, bodyFont));
            document.add(new Paragraph("Warranty: 6 Months Service Warranty", bodyFont));

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

