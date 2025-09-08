package ecosnap.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ecosnap.controller.UserControllerImplements;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("activeUser") != null) {
			response.sendRedirect("index.jsp");
			return;
		}
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserControllerImplements uc = new UserControllerImplements();
		HttpSession session = request.getSession();

		if (uc.userSignup(email, password)) {
			session.setAttribute("signupsuccessful", "Signed Up Successfully! Please Log In");
			response.sendRedirect("login.jsp");
		} else {
			session.setAttribute("signupfail", "Sign Up Failed! Try Again!");
			response.sendRedirect("signup.jsp");
		}
	}
}
