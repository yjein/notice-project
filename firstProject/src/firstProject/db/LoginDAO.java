package firstProject.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	public LoginDTO login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		LoginDTO dto = new LoginDTO();
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select id, name from users where id=? and pw=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setResult(true);
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				System.out.println("로그인 성공: " + dto.getName());
			}else {
				System.out.println("로그인 실패 ID: " + id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
