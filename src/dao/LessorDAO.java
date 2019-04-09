package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Lessor;
import util.DBHelper;


//��������Ϣҵ���߼���
public class LessorDAO {
	
	// ������еĳ�������Ϣ
		public ArrayList<Lessor> getAllLessors() {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			ArrayList<Lessor> list = new ArrayList<Lessor>();// �����߼���
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from Lessor;";// sql���
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
					list.add(lessor);// ���뼯��
				}
				return list;// ���ؼ���

			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {

				// �ͷ����ݼ�����
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					rs = null;
				}
				// �ͷ�������
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
		
		
		
	// ���ݳ�����������ó�������Ϣ
		public Lessor getLessorByID(int id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from Lessor where id_lessor=?;";// sql���
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
				// �ͷ����ݼ�����
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					rs = null;
				}

				// �ͷ�������
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
