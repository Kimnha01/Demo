/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mytags;

import dto.Account;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Kim Nha
 */
public class Welcome extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            PageContext page = (PageContext) getJspContext();
            Account acc = (Account) page.getAttribute("LoginedAccount", PageContext.SESSION_SCOPE);
            if (acc != null) {
                out.print("<h3>Welcome " + acc.getEmail() + "</h3");
                out.print("<h3><a href='#'>logout</a></h3>");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
