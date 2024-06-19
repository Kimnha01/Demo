/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mytags;

import dao.ItemDAO;
import dto.Item;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Kim Nha
 */
public class ItemTag extends SimpleTagSupport {

    private int id;

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            ItemDAO d = new ItemDAO();
            Item i = d.getItem(id);
            out.print("<div style=\"float: left; margin: 5%\">");
            out.print("<img src='" + i.getImageurl() + "' style=\"width: 100px; height: 100px\"/>");
            out.print("<p>");
            out.print("ID: " + i.getItemid() + "<br/>");
            out.print("Name: " + i.getItemname() + "<br/>");
            out.print("Price: " + i.getPrice() + "<br/>");
            out.print("<a href='AddToCartServlet?itemid=" + i.getItemid() + "'>buy</a>");
            out.print("</p>\n" +
"        </div>");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
