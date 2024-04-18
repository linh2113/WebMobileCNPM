package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import Model.User;

/**
 * contain operations with account table
 *
 */
public class AccountDAO {
	public boolean exists(String email) throws NamingException, SQLException {
		Connection conn = new DBContext().getConnection();
		String sql = "select count(*) as count from user where email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, email);
		ResultSet rs = stmt.executeQuery();
		int count = 0;
		if (rs.next()) {
			count = rs.getInt("count");
		}
		rs.close();
		stmt.close();
		conn.close();
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}
	// Tạo ra phương thức đăng nhập lấy thông tin từ cơ sở dữ liệu
	public User loginUser(String email, String pass) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String select = "select * from user where email =? and pass =?";
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopclothes", "root",
				"");

				// Tạo câu lệnh sử dụng đối tượng kết nối
				PreparedStatement preparedStatement = connection.prepareStatement(select)) {
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, pass);

			// thực hiện chọn truy vấn
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getInt(7));
			}

		} catch (SQLException e) {
			e.getStackTrace();
		}
		return null;
	}

	public void updatePassword(String email, String password) throws NamingException, SQLException {
		Connection conn = new DBContext().getConnection();
		String sql = "update user set pass=? where email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, password);
		stmt.setString(2, email);
		stmt.executeUpdate();
		stmt.close();
	}


}
