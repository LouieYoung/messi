package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {
	private static final String driver = "com.mysql.jdbc.Driver";
	// �������ݿ��url��ַ
	private static final String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi?useUnicode=true&characterEncoding=UTF-8";
	private static final String username = "201l115222";
	private static final String password = "wzh54l43zk0iil25w2435z4h5i451m4jx4x2wh5h";
	private static Connection conn = null;

//��̬����鸺��������� 
	static {
		try {
			Class.forName(driver);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

//����ģʽ�������ݿ����Ӷ���
	public static Connection getConnection() throws Exception {
		if (conn == null) {
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		return conn;
	}

	public static void main(String[] args) {
		try {
			Connection conn = DBHelper.getConnection();
			if (conn != null) {
				System.out.println("���ݿ�����������");
			} else {
				System.out.println("���ݿ������쳣��");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}