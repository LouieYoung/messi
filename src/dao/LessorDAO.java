package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Lessor;
import util.DBHelper;


//出租者信息业务逻辑类
public class LessorDAO {
	
	// 获得所有的出租者信息
		public ArrayList<Lessor> getAllLessors() {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			ArrayList<Lessor> list = new ArrayList<Lessor>();// 出租者集合
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from Lessor;";// sql语句
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					Lessor lessor = new Lessor();
					lessor.setID(rs.getInt("id_lessor"));
					lessor.setName(rs.getString("name"));
					lessor.setPassword(rs.getString("password"));
					lessor.setPhone(rs.getString("phone"));
					lessor.setEmail(rs.getString("email"));
					lessor.setAddress(rs.getString("address"));
					lessor.setIdentity(rs.getLong("pessoncard"));
					list.add(lessor);// 加入集合
				}
				return list;// 返回集合

			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {

				// 释放数据集对象
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					rs = null;
				}
				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					stmt = null;
				}

			}
		}
		
		
		
	// 根据出租者姓名获得出租者信息
		public Lessor getLessorByID(int id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from Lessor where id_lessor=?;";// sql语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if (rs.next()) {
					Lessor lessor = new Lessor();
					lessor.setID(rs.getInt("id_lessor"));
					lessor.setName(rs.getString("name"));
					lessor.setPassword(rs.getString("password"));
					lessor.setPhone(rs.getString("phone"));
					lessor.setEmail(rs.getString("email"));
					lessor.setAddress(rs.getString("address"));
					lessor.setIdentity(rs.getLong("pessoncard"));
					return lessor;
				} else {
					return null;
				}

			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {
				// 释放数据集对象
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					rs = null;
				}

				// 释放语句对象
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					stmt = null;
				}

			}
		}
}
