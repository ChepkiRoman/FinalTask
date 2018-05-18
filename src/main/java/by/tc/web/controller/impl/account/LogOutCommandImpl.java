package by.tc.web.controller.impl.account;

import by.tc.web.controller.ControllerCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.tc.web.controller.impl.constant.ControllerConstants.INDEX_PAGE;

public class LogOutCommandImpl implements ControllerCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(INDEX_PAGE);


    }
}
