package Controllers;

import DAOs.VoucherDAO;
import Models.Voucher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/vouchersList")
public class VoucherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> voucherList = voucherDAO.getAllVouchers();
        request.setAttribute("voucherList", voucherList);
        request.getSession().setAttribute("tabId", 9); // Set tabId to 9 for voucher list
        request.getRequestDispatcher("customer.jsp").forward(request, response);
    }
}
