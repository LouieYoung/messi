package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {
	private static final String driver = "com.mysql.jdbc.Driver";
	// 连接数据库的url地址
	private static final String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_messi?useUnicode=true&characterEncoding=UTF-8";
	private static final String username = "201l115222";
	private static final String password = "wzh54l43zk0iil25w2435z4h5i451m4jx4x2wh5h";
	private static Connection conn = null;

//静态代码块负责加载驱动 
	static {
		try {
			Class.forName(driver);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

//单例模式返回数据库连接对象
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
				System.out.println("数据库连接正常！");
			} else {
				System.out.println("数据库连接异常！");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}