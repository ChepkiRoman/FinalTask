package by.tc.web.controller.impl.administrator;

import by.tc.web.controller.ControllerCommand;
import by.tc.web.controller.impl.constant.ControllerConstants;
import by.tc.web.entity.Order;
import by.tc.web.service.OrderService;
import by.tc.web.service.exception.ServiceException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ShowAllOrdersCommand implements ControllerCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        OrderService orderService = new OrderService();
        List<Order> orderList = null;

            orderList = orderService.getAllOrders();
            if (orderList != null) {
                request.setAttribute(ControllerConstants.ORDER_LIST_ATTR, orderList);
                request.getRequestDispatcher(ControllerConstants.ORDERS_PAGE).forward(request,response);
            }else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }

        } catch (ServiceException e) {
            response.sendRedirect("/error");
        }

    }
}
