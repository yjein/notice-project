package firstProject.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException{
		try {
			//Class.forName("����̹���");
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(
		// "jdbc:mysql://IP(�Ǵ� ������):��Ʈ/db�̸�?����Ÿ��������", "���̵�", "��й�ȣ";
		// ����Ÿ������ UTC�� ���������ø� ���ϴ� ������ �������� �⺻���̴�.
			"jdbc:mysql://15:3306/testdb?serverTimezone=UTC","root", "1234");
				
	}
}
