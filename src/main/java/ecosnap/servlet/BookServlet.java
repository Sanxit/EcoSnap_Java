package ecosnap.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecosnap.controller.UserControllerImplements;
import ecosnap.model.BookTable;

@WebServlet("/book")
public class BookServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// Controller instance to handle database operations
	private UserControllerImplements userController = new UserControllerImplements();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String activeUser = (String) session.getAttribute("activeUser");

		if (activeUser == null) {
			// Save intended page before redirecting to login
			session.setAttribute("redirectAfterLogin", "book.jsp");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if ("admin".equals(activeUser)) {
			// Admin can see all bookings
			request.setAttribute("bookData", userController.userBooks());
			request.getRequestDispatcher("book.jsp").forward(request, response);
		} else {
			// Normal user, show booking form
			request.getRequestDispatcher("book.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String activeUser = (String) session.getAttribute("activeUser");

		if (activeUser == null) {
			// Not logged in, redirect to login
			session.setAttribute("redirectAfterLogin", "book.jsp");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		// If normal user submits booking
		if (!"admin".equals(activeUser)) {
			BookTable booking = new BookTable();
			booking.setCity(request.getParameter("city"));
			booking.setShootType(request.getParameter("shootType"));
			booking.setPreferredDate(request.getParameter("preferredDate"));
			booking.setAlternateDate(request.getParameter("alternateDate"));
			booking.setFullname(request.getParameter("fullname"));
			booking.setEmail(request.getParameter("email"));
			booking.setPhone(request.getParameter("phone"));
			booking.setWhatsapp(request.getParameter("whatsapp"));

			boolean success = userController.userBooks(booking);

			if (success) {
				request.setAttribute("booksuccess", "Booking successful!");
			} else {
				request.setAttribute("bookfail", "Booking failed. Please try again.");
			}

			request.getRequestDispatcher("book.jsp").forward(request, response);
		} else {
			// Admin cannot submit booking, redirect
			response.sendRedirect("home.jsp");
		}
	}
}
