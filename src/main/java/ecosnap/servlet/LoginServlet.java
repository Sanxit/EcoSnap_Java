package ecosnap.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ecosnap.controller.UserControllerImplements;
import ecosnap.model.UserTable;
import ecosnap.model.BookTable;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserControllerImplements uc = new UserControllerImplements();
		HttpSession session = request.getSession();

		if (uc.userExists(email, password)) {
			session.setAttribute("activeUser", email);

			if ("admin@ecosnap.com".equals(email)) {
				List<UserTable> userList = uc.allData();
				List<BookTable> bookingList = uc.userBooks();

				session.setAttribute("usertable", userList);
				session.setAttribute("bookingtable", bookingList);

				response.sendRedirect("dashboard.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}

		} else {
			session.setAttribute("error", "Email or Password Incorrect!");
			response.sendRedirect("login.jsp");
		}
	}
}
