package by.tc.web.controller.impl.account;

import by.tc.web.controller.ControllerCommand;
import by.tc.web.entity.Driver;
import by.tc.web.entity.Point;
import by.tc.web.service.*;
import by.tc.web.service.exception.ServiceException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.tc.web.controller.impl.constant.ControllerConstants.*;

public class DriverRegistrationCommandImpl implements ControllerCommand {
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
        if (!Validator.isSurnameValid(surname)) {
            displayError("Please provide a valid surname ", request, response);
            return;
        }
        String car_model = request.getParameter(DRIVER_CAR_MODEL);
        if (!Validator.isCarModelValid(car_model)) {
            displayError("Please provide a valid car model ", request, response);
            return;
        }
        String car_number = request.getParameter(DRIVER_CAR_NUMBER);
        if (Validator.isCarNumberValid(car_number)) {
            displayError("Please provide a valid car number like xTAXxxx ", request, response);
            return;
        }
        double localtion_x = LocationHandler.getRandomCoordinate();
        double location_y = LocationHandler.getRandomCoordinate();
        Point point = new Point();
        point.setX(localtion_x);
        point.setY(location_y);
        Driver driver = new Driver();

        try {
            String hashedPassword = HashGenerator.encryptPassword(password);
            driver.setLogin(login);
            driver.setPassword(hashedPassword);
            driver.setName(name);
            driver.setSurname(surname);
            driver.setCarNumber(car_number);
            driver.setCarModel(car_model);
            driver.setLocation(point);
            driver.setFree(true);
            driver.setBanned(false);
            driver.setConfirmed(false);

            UserService<Driver> driverService = ServiceFactory.getInstance().getDriverService();
            Driver checkDriver = driverService.readByLoginAndPassword(login, hashedPassword);
            if (checkDriver == null) {
                driverService.save(driver);
            }else {
                displayError("This user already exists", request, response);
                return;
            }
        } catch (ServiceException e) {
            displayError("An error has occurred. Please try again later.", request, response);
        }

        request.getSession().setAttribute(DRIVER_ROLE, driver);
        response.sendRedirect(INDEX_PAGE);
    }

    private void displayError(String error, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(ERROR, error);
        request.getRequestDispatcher(DRIVER_REG).forward(request, response);
    }
}
