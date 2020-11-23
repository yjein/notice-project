package firstProject.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestbookDAO {
	public ArrayList<GuestbookDTO> getList() {
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		
		ArrayList<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from guestbook");
//			pstmt.setString(1, id);
//			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestbookDTO dto = new GuestbookDTO();
				
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setDate(rs.getString("date"));
				dto.setName(rs.getString("name"));
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return dto;
		return list;
	}
	
	public int addGuestbook(String title, String contents, String name) {
		int result = 0;
		Connection conn;
		PreparedStatement pstmt;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(
					"insert into guestbook(title, contents, date, name) "
					+ "values(?, ?, now(), ?)");
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, name);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int upGuestbook(int no, String title, String contents, String name) {
		int result = 0;
		Connection conn;
		PreparedStatement pstmt;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(
					"update guestbook set title=?, contents=?, name=? where no=?");
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, name);
			pstmt.setInt(4, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delGuestbook(int no) {
		int result = 0;
		Connection conn;
		PreparedStatement pstmt;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(
					"delete from guestbook where no=?");
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
