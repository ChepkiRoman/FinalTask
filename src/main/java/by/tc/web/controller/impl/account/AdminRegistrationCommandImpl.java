package by.tc.web.controller.impl.account;

import by.tc.web.controller.ControllerCommand;
import by.tc.web.entity.Administrator;
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

public class AdminRegistrationCommandImpl implements ControllerCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter(LOGIN);
        if (!Validator.isEmailValid(login)) {
            displayError("Please provide a valid email ", request, response);
            return;
        }
        String password = request.getParameter(PASSWORD);
        if (!Validator.isPasswordValid(password)) {
            displayError("Please provide a valid password ", request, response);
            return;
        }
        String name = request.getParameter(USER_NAME);
        if (!Validator.isNameValid(name)) {
            displayError("Please provide a valid name ", request, response);
            return;
        }
        String surname = request.getParameter(USER_SURNAME);
        if(!Validator.isSurnameValid(surname)){
            displayError("Please provide a valid surname ", request, response);
            return;
        }
        String hashedPassword = null;
        Administrator admin = new Administrator();
        try {
            hashedPassword = HashGenerator.encryptPassword(password);
            admin.setLogin(login);
            admin.setPassword(hashedPassword);
            admin.setName(name);
            admin.setSurname(surname);
            admin.setRole(ADMIN_ROLE);


            UserService<Administrator> administratorService = ServiceFactory.getInstance().getAdministratorService();
            administratorService.save(admin);
        } catch (ServiceException e) {
            displayError("An error has occurred. Please try again later.", request, response);

        }
        response.sendRedirect(ACCOUNT_PAGE);
    }

    private void displayError(String error, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(ERROR, error);
        request.getRequestDispatcher("/account").forward(request, response);
    }
}
