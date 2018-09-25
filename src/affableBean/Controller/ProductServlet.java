package affableBean.Controller;

// Import required java libraries
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

// Extend HttpServlet class
public class ProductServlet extends HttpServlet {

    public void init() throws ServletException {
        // Do required initialization
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String cmd = request.getParameter("cmd");

        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("info");
        String categoryID = request.getParameter("category");


        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println(name+"<br/>");
        out.println(price+"<br/>");
        out.println(description+"<br/>");
        out.println(categoryID+"<br/>");

        Context envContext = null;
        String sql = "";
        try {
            envContext = new InitialContext();
            Context initContext = (Context) envContext.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) initContext.lookup("jdbc/affablebean");
            Connection connection = dataSource.getConnection();

            if (cmd != null && cmd.equals("d")) {
                // Delete product
                sql = "DELETE FROM product WHERE id = ?";
                PreparedStatement stmt=connection.prepareStatement(sql);
                stmt.setInt(1,Integer.parseInt(id));
                stmt.execute();

            } else if (cmd != null && cmd.equals("u")) {

                sql = "UPDATE product SET name = ?, price = ?, description = ?, category_id = ? WHERE id = ?";
                PreparedStatement stmt=connection.prepareStatement(sql);
                stmt.setString(1,name);
                stmt.setDouble(2,Double.parseDouble(price));
                stmt.setString(3,description);
                stmt.setInt(4,Integer.parseInt(categoryID));
                stmt.setInt(5,Integer.parseInt(id));
                stmt.execute();
            } else {
                sql = "insert into product (name, price, description, category_id) values (?, ?, ?, ?)";

                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, name);
                statement.setDouble(2, Double.parseDouble(price));
                statement.setString(3, description);
                statement.setInt(4, Integer.parseInt(categoryID));

                int r = statement.executeUpdate();
            }



            response.sendRedirect("product2.jsp");

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }

    }

    public void destroy() {
        // do nothing.
    }
}