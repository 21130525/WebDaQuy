package controller;

import model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/RemoveItemCart")
public class RemoveItemsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        try{
            PrintWriter out = resp.getWriter();
            String id = req.getParameter("id");
            if(id!=null){
                ArrayList<Cart> cart_list = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
                if (cart_list!=null){
                    for(Cart c : cart_list){
                        if(c.getId()==Integer.parseInt(id)){
                            cart_list.remove(cart_list.indexOf(c));
                            break;
                        }
                    }
                    resp.sendRedirect("shoppingcart.jsp");
                }
            }else {
                resp.sendRedirect("shoppingcart.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
