package data;

import java.io.IOException;
import java.net.URLDecoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }
        
        // Retrieve values stored in cookies
        String email = "";
        String username = "";
        String password = "";
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    email = URLDecoder.decode(cookie.getValue(), "UTF-8");
                } else if (cookie.getName().equals("username")) {
                    username = URLDecoder.decode(cookie.getValue(), "UTF-8");
                } else if (cookie.getName().equals("password")) {
                    password = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        
        // Set attributes to auto-fill fields on index.jsp
        request.setAttribute("email", email);
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        
        // Redirect to index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
