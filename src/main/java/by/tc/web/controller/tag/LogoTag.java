package by.tc.web.controller.tag;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.GregorianCalendar;

public class LogoTag extends TagSupport {
        @Override
        public int doStartTag() throws JspException {
            GregorianCalendar gc = new GregorianCalendar();
            String time = "<img src=\"images/logo.png\" alt=\"Your Happy Family\">";
            try {
                JspWriter out = pageContext.getOut();
                out.write(time);
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
            return SKIP_BODY;
        }

        @Override
        public int doEndTag()  {
            return EVAL_PAGE;
        }

}
