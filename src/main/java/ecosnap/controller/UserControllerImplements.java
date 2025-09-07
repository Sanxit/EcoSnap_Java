package ecosnap.controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import ecosnap.model.BookTable;
import ecosnap.model.UserTable;
import org.apache.commons.codec.digest.DigestUtils;

public class UserControllerImplements {

	// USER SIGNUP
	public boolean userSignup(String username, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String sql = "INSERT INTO usertable (username, password) VALUES (?, ?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			String hashPassword = DigestUtils.md5Hex(password.getBytes());
			pstm.setString(1, username);
			pstm.setString(2, hashPassword);
			int row = pstm.executeUpdate();
			pstm.close();
			conn.close();
			return row > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// CHECK IF USER EXISTS
	public boolean userExists(String username, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String sql = "SELECT * FROM usertable WHERE username=? AND password=?";
			String hashPassword = DigestUtils.md5Hex(password.getBytes());
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, username);
			pstm.setString(2, hashPassword);
			ResultSet rs = pstm.executeQuery();
			boolean exists = rs.next();
			rs.close();
			pstm.close();
			conn.close();
			return exists;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// GET ALL USER DATA
	public List<UserTable> allData() {
		List<UserTable> userList = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String sql = "SELECT * FROM usertable";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				UserTable ut = new UserTable();
				ut.setId(rs.getInt("id"));
				ut.setUsername(rs.getString("username"));
				ut.setPassword(rs.getString("password"));
				userList.add(ut);
			}
			rs.close();
			pstm.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	// INSERT NEW BOOKING
	public boolean userBooks(BookTable booking) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String sql = "INSERT INTO bookingtable (city, shoot_type, preferred_date, alternate_date, fullname, email, phone, whatsapp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, booking.getCity());
			pstm.setString(2, booking.getShootType());
			pstm.setString(3, booking.getPreferredDate());
			pstm.setString(4, booking.getAlternateDate());
			pstm.setString(5, booking.getFullname());
			pstm.setString(6, booking.getEmail());
			pstm.setString(7, booking.getPhone());
			pstm.setString(8, booking.getWhatsapp());

			int row = pstm.executeUpdate();
			pstm.close();
			conn.close();

			return row > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// FETCH ALL BOOKINGS FOR ADMIN
	public List<BookTable> userBooks() {
		List<BookTable> bookings = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String sql = "SELECT * FROM bookingtable";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				BookTable bt = new BookTable();
				bt.setId(rs.getInt("id"));
				bt.setCity(rs.getString("city"));
				bt.setShootType(rs.getString("shoot_type"));
				bt.setPreferredDate(rs.getString("preferred_date"));
				bt.setAlternateDate(rs.getString("alternate_date"));
				bt.setFullname(rs.getString("fullname"));
				bt.setEmail(rs.getString("email"));
				bt.setPhone(rs.getString("phone"));
				bt.setWhatsapp(rs.getString("whatsapp"));
				bookings.add(bt);
			}
			rs.close();
			pstm.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookings;
	}
}
