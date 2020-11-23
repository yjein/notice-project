package firstProject.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException{
		try {
			//Class.forName("드라이버명");
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(
		// "jdbc:mysql://IP(또는 도메인):포트/db이름?서버타임존세팅", "아이디", "비밀번호";
		// 서버타임존의 UTC는 세계협정시를 말하는 것으로 윈도우의 기본값이다.
			"jdbc:mysql://15:3306/testdb?serverTimezone=UTC","root", "1234");
				
	}
}
