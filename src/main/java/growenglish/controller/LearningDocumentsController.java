package growenglish.controller;

import growenglish.dao.FreeDocumentDAO;
import growenglish.dao.LearningDocumentDAO;
import growenglish.model.FreeDocument;
import growenglish.model.LearningDocument;
import growenglish.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LearningDocumentsController", value = "/learningDocuments")
public class LearningDocumentsController extends HttpServlet {
<<<<<<< HEAD
    private static final long serialVersionUID = 1L;

=======

    private static final long serialVersionUID = 1L;


>>>>>>> e18aefb (update)
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
<<<<<<< HEAD
        if (user == null) {
        	response.sendRedirect(request.getContextPath() + "/login.jsp");
        	return;
        }
        FreeDocumentDAO freeDocumentDAO = new FreeDocumentDAO();
        LearningDocumentDAO dao = new LearningDocumentDAO();
        List<LearningDocument> learningDocumentList = dao.getIdDocumentByUsername(user.getUsername());
=======
        FreeDocumentDAO freeDocumentDAO = new FreeDocumentDAO();

        LearningDocumentDAO dao = new LearningDocumentDAO();

        List<LearningDocument> learningDocumentList = dao.getIdDocumentByUsername(user.getUsername());

>>>>>>> e18aefb (update)
        List<FreeDocument> listFreeDocument = new ArrayList<FreeDocument>();
        for (LearningDocument learningDocument : learningDocumentList) {
            FreeDocument freeDocument = freeDocumentDAO.getFreeDocumentById(learningDocument.getDocumentId());
            listFreeDocument.add(freeDocument);
<<<<<<< HEAD
        }
        session.setAttribute("listFreeDocument", listFreeDocument);
        request.getRequestDispatcher("learningDocuments.jsp").forward(request, response);
    }

=======

        }


        session.setAttribute("listFreeDocument", listFreeDocument);

        request.getRequestDispatcher("learningDocuments.jsp").forward(request, response);

    }


>>>>>>> e18aefb (update)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

