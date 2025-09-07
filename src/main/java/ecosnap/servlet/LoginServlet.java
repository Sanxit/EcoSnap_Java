package ecosnap.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecosnap.model.UserTable;
import ecosnap.model.BookTable;
import ecosnap.controller.UserControllerImplements;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// Display login page
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	// Handle login form submission
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserControllerImplements uc = new UserControllerImplements();

		if (uc.userExists(username, password)) {

			request.setAttribute("username", username);

			List<UserTable> userList = uc.allData(); // fetch all users
			request.setAttribute("userData", userList);

			HttpSession session = request.getSession();
			session.setAttribute("activeUser", username);

			if ("admin".equals(username) && "admin".equals(password)) {

				// Fetch all bookings for admin
				List<BookTable> bookingList = uc.userBooks(); // make sure userBooks() returns List<BookTable>
				request.setAttribute("bookingData", bookingList);

				request.getRequestDispatcher("home.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}

		} else {
			request.setAttribute("error", "Username or Password Incorrect!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
