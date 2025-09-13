package ecosnap.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import ecosnap.controller.UserControllerImplements;

@WebServlet("/forgotpassword")
public class ForgotPasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Forward GET requests to the JSP page
		request.getRequestDispatcher("forgot.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		UserControllerImplements uc = new UserControllerImplements();
		HttpSession session = request.getSession();

		if (uc.updatePassword(email, oldPassword, newPassword)) {
			session.setAttribute("passchange", "Password updated successfully! Please log in.");
			response.sendRedirect("login.jsp");
		} else {
			session.setAttribute("passerror", "Failed to update password. Check your old password!");
			response.sendRedirect("forgot.jsp");
		}
	}
}
