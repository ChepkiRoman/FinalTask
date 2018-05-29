package by.tc.web.dao;

import by.tc.web.entity.Administrator;
import by.tc.web.service.HashGenerator;
import by.tc.web.service.ServiceFactory;
import by.tc.web.service.UserService;
import by.tc.web.service.exception.ServiceException;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class AbstractDAOTest {
    private UserService<Administrator> administratorService;

    @Before
    public void setUp(){
        administratorService = ServiceFactory.getInstance().getAdministratorService();
    }


    @Test
    public void registrationTest() throws ServiceException {
        String email = "admin@gmail.com";
        String password = "Admin123";
        String hashedPassword = HashGenerator.encryptPassword(password);
        Administrator administrator = new Administrator();
        administrator.setLogin(email);
        administrator.setPassword(hashedPassword);


        Administrator checkAdmin = administratorService.readByLoginAndPassword(email,hashedPassword);
        String checkEmail = checkAdmin.getLogin();
        String checkPass = checkAdmin.getPassword();

        boolean actualEmail = checkEmail.equals(email);
        boolean actualPass = checkPass.equals(password);
        boolean result = true;
        if(actualEmail && actualPass){
            result = false;
        }
        Assert.assertTrue(result);

    }


}