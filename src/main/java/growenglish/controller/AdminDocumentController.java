package growenglish.controller;

import growenglish.dao.FreeDocumentDAO;
import growenglish.model.FreeDocument;
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

@WebServlet("/admin/documents")
@MultipartConfig 
public class AdminDocumentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FreeDocumentDAO docDAO;

    @Override
    public void init() {
        docDAO = new FreeDocumentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<FreeDocument> list = docDAO.getAllFreeDocuments();
        req.setAttribute("documents", list);
        req.getRequestDispatcher("/adminDocuments.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            docDAO.deleteFreeDocument(id);
        } else {
            String title = req.getParameter("title");
            String desc = req.getParameter("description");
            String type = req.getParameter("videoOrWord");
            
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

            if ("create".equals(action)) {
                FreeDocument newDoc = new FreeDocument(0, title, desc, imagePath, type);
                docDAO.insertFreeDocument(newDoc);
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                FreeDocument doc = new FreeDocument(id, title, desc, imagePath, type);
                docDAO.updateFreeDocument(doc);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin/documents");
    }
}