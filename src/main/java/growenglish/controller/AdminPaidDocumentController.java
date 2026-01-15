package growenglish.controller;

import growenglish.dao.PaidDocumentDAO;
import growenglish.model.PaidDocument;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet("/admin/paid-documents")
@MultipartConfig
public class AdminPaidDocumentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PaidDocumentDAO docDAO;

    @Override
    public void init() {
        docDAO = new PaidDocumentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<PaidDocument> list = docDAO.getAllPaidDocuments();
        req.setAttribute("documents", list);
        req.getRequestDispatcher("/adminPaidDocuments.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            docDAO.deletePaidDocument(id);
        } else {
            String title = req.getParameter("title");
            String desc = req.getParameter("description");
            String type = req.getParameter("videoOrWord");
            double price = 0.0;
            try {
                price = Double.parseDouble(req.getParameter("price"));
            } catch (NumberFormatException e) {
                price = 0.0;
            }
            Part filePart = req.getPart("image"); 
            String imagePath = req.getParameter("currentImage"); 
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                
                filePart.write(uploadPath + File.separator + fileName);
                imagePath = "assets/images/" + fileName; 
            }
            if (imagePath == null || imagePath.isEmpty()) {
                imagePath = "assets/images/default-doc.jpg"; 
            }
            if ("create".equals(action)) {
                PaidDocument newDoc = new PaidDocument(0, title, desc, imagePath, type, price);
                docDAO.insertPaidDocument(newDoc);
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                PaidDocument doc = new PaidDocument(id, title, desc, imagePath, type, price);
                docDAO.updatePaidDocument(doc);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/paid-documents");
    }
}