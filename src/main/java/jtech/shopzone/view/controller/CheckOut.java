package jtech.shopzone.view.controller;

import com.google.gson.Gson;
import jtech.shopzone.controller.CartController;
import jtech.shopzone.controller.TransactionsController;
import jtech.shopzone.controller.impl.CartControllerImpl;
import jtech.shopzone.controller.impl.TransactionsControllerImpl;
import jtech.shopzone.model.entity.TransactionReport;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @author Mohamed Mahrous
 */
@WebServlet(name = "CheckOut", urlPatterns = {"/CheckOut"})
public class CheckOut extends HttpServlet {
    private TransactionsController transactionsController;
    @Override
    public void init() throws ServletException {
        super.init();
        transactionsController = TransactionsControllerImpl.newInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: get user id from session
        int userId = 1;
        ArrayList<TransactionReport>  transactionReports = transactionsController.checkOut(userId);
       // Gson gson = new Gson();
//        String transactionReportsJSON = gson.toJson(transactionReports);
        request.getSession().setAttribute("transactions",transactionReports);
        response.sendRedirect("/checkout.jsp");
    }
}
