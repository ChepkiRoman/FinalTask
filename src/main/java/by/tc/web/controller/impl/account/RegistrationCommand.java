package by.tc.web.controller.impl.account;

import by.tc.web.controller.ControllerCommand;
import by.tc.web.entity.Customer;
import by.tc.web.service.HashGenerator;
import by.tc.web.service.ServiceFactory;
import by.tc.web.service.UserService;
import by.tc.web.service.Validator;
import by.tc.web.service.exception.ServiceException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.tc.web.controller.impl.constant.ControllerConstants.*;


public class RegistrationCommand implements ControllerCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter(LOGIN);
        if(!Validator.isEmailValid(login)){
            displayError("Please provide a valid email ", request, response);
            return;
        }
        String password = request.getParameter(PASSWORD);
        if(!Validator.isPasswordValid(password)){
            displayError("Please provide a valid password ", request, response);
            return;
        }
        String hashedPassword = null;
        String name = request.getParameter(USER_NAME);
        if(!Validator.isNameValid(name)){
            displayError("Please provide a valid name ", request, response);
            return;
        }
        String surname = request.getParameter(USER_SURNAME);
        if(!Validator.isSurnameValid(surname)){
            displayError("Please provide a valid surname ", request, response);
            return;
        }
        Customer user = new Customer();
        try {
            hashedPassword = HashGenerator.encryptPassword(password);
            user.setLogin(login);
            user.setPassword(hashedPassword);
            user.setName(name);
            user.setSurname(surname);


            UserService<Customer> customerService = ServiceFactory.getInstance().getCustomerService();
            Customer checkUser = customerService.readByLoginAndPassword(login,hashedPassword);
            if(checkUser == null){
                customerService.save(user);
            }else {
                displayError("This user already exists", request, response);
                return;
            }



        } catch (ServiceException e) {
            displayError("An error has occurred. Please try again later.", request, response);
        }

        request.getSession().setAttribute(USER_ROLE, user);
        response.sendRedirect(INDEX_PAGE);

    }

    private void displayError(String error, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(ERROR, error);
        request.getRequestDispatcher(SIGNUP).forward(request, response);
    }
}
