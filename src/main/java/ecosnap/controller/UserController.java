package ecosnap.controller;

import java.util.List;
import ecosnap.model.UserTable;
import ecosnap.model.BookTable;

public interface UserController {

	// Methods
	
	boolean userSignup(String username, String password);

	boolean userExists(String username, String password);

	List<UserTable> allData();

	boolean userBooks(BookTable booking);

	List<BookTable> bookData();
}
