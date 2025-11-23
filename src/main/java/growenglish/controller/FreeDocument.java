package growenglish.controller;

import growenglish.dao.FreeDocumentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FreeDocument", value = "/FreeDocument")
public class FreeDocument extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FreeDocumentDAO freeDocumentDAO = new FreeDocumentDAO();
        List<growenglish.model.FreeDocument> documentList = freeDocumentDAO.getAllFreeDocuments();
        request.setAttribute("listDocs", documentList);
        request.getRequestDispatcher("/freeDocuments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}