package jtech.shopzone.view.controller;

import jtech.shopzone.controller.CartController;
import jtech.shopzone.controller.impl.CartControllerImpl;
import jtech.shopzone.model.dal.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SetProductQuantityIntoCart" , urlPatterns = {"/SetProductQuantityIntoCart"})
public class SetProductQuantityIntoCart extends HttpServlet {
    CartController cartController;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO get userid from session
        int userId = 1;
        int productQuantity= Integer.valueOf(request.getParameter("quantity"));
        int productId= Integer.valueOf(request.getParameter("productId"));
        cartController = CartControllerImpl.newInstance();
        Status status = cartController.updateProductQuantities(userId,productId,productQuantity);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}