package ecosnap.controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import ecosnap.model.BookTable;
import ecosnap.model.UserTable;
import org.apache.commons.codec.digest.DigestUtils;

public class UserControllerImplements {

	public boolean userSignup(String email, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String sql = "INSERT INTO usertable (email, password) VALUES (?, ?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			String hashPassword = DigestUtils.md5Hex(password.getBytes());
			pstm.setString(1, email);
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

	public boolean userExists(String email, String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String sql = "SELECT * FROM usertable WHERE email=? AND password=?";
			String hashPassword = DigestUtils.md5Hex(password.getBytes());
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
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
				ut.setEmail(rs.getString("email"));
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

	public boolean updatePassword(String email, String oldPassword, String newPassword) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecosnap", "root", "");
			String selectSql = "SELECT password FROM usertable WHERE email=?";
			PreparedStatement psSelect = conn.prepareStatement(selectSql);
			psSelect.setString(1, email);
			ResultSet rs = psSelect.executeQuery();
			if (rs.next()) {
				String storedHash = rs.getString("password");
				String oldHash = DigestUtils.md5Hex(oldPassword.getBytes());
				if (!storedHash.equals(oldHash)) {
					rs.close();
					psSelect.close();
					conn.close();
					return false;
				}
				String newHash = DigestUtils.md5Hex(newPassword.getBytes());
				String updateSql = "UPDATE usertable SET password=? WHERE email=?";
				PreparedStatement psUpdate = conn.prepareStatement(updateSql);
				psUpdate.setString(1, newHash);
				psUpdate.setString(2, email);
				int row = psUpdate.executeUpdate();
				psUpdate.close();
				rs.close();
				psSelect.close();
				conn.close();
				return row > 0;
			} else {
				rs.close();
				psSelect.close();
				conn.close();
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
