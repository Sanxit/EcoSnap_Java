package ecosnap.controller;

import java.util.List;
import ecosnap.model.UserTable;
import ecosnap.model.BookTable;

public interface UserController {

	// Methods

	boolean userSignup(String email, String password);

	boolean userExists(String email, String password);

	List<UserTable> allData();

	boolean userBooks(BookTable booking);

	List<BookTable> bookData();

	boolean updatePassword(String email, String oldPassword, String newPassword);

}
