package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import entity.HouseResource;
import util.DBHelper;

//房屋信息业务逻辑类
public class HouseDAO {

	// 获得所有的房源信息
	public ArrayList<HouseResource> getAllHouses() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<HouseResource> list = new ArrayList<HouseResource>();// 房屋集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from houseresource;";// sql语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				HouseResource house = new HouseResource();
				house.setID(rs.getInt("id_houseResource"));
				house.setAcreage(rs.getDouble("acreage"));
				house.setPrice(rs.getDouble("rent"));
				house.setIsRented(rs.getInt("isRented"));
				house.setArchitecturalType(rs.getString("architecturalType"));
				house.setCity(rs.getString("city"));
				house.setDistrict(rs.getString("district"));
				house.setStreet(rs.getString("street"));
				house.setPicture(rs.getString("picture"));
				house.setOwnerID(rs.getInt("id_lessor"));
				house.setEvaluation(rs.getInt("evaluation"));
				house.setRecommendationIndex();
				list.add(house);// 加入集合
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
	
	
	// 根据推荐指数对所有房源排序，按推荐指数由高到低返回前9个房源
	
	// 获得所有的房源信息
		public ArrayList<HouseResource> getNineHouses() {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			ArrayList<HouseResource> list = new ArrayList<HouseResource>();// 房屋集合
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from houseresource;";// sql语句
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					HouseResource house = new HouseResource();
					house.setID(rs.getInt("id_houseResource"));
					house.setAcreage(rs.getDouble("acreage"));
					house.setPrice(rs.getDouble("rent"));
					house.setIsRented(rs.getInt("isRented"));
					house.setArchitecturalType(rs.getString("architecturalType"));
					house.setCity(rs.getString("city"));
					house.setDistrict(rs.getString("district"));
					house.setStreet(rs.getString("street"));
					house.setPicture(rs.getString("picture"));
					house.setOwnerID(rs.getInt("id_lessor"));
					house.setEvaluation(rs.getInt("evaluation"));
					house.setRecommendationIndex();
					list.add(house);// 加入集合
				}
			//冒泡排序
			for (int i = 0; i < list.size() - 1; i++) {
				for (int j = 0; j < list.size() - 1 - i; j++) {
					if (list.get(j).getRecommendationIndex() < list.get(j + 1).getRecommendationIndex()) {
						Collections.swap(list, j, j+1);
					}
				}
			}
			//返回前9个房源
			ArrayList<HouseResource> listnine = new ArrayList<HouseResource>();
			for (int i = 0; i < 9; i++)
			{
				listnine.add(list.get(i));
			}
			return listnine;// 返回集合
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

	// 根据房屋ID获得房屋信息
	public HouseResource getHouseResourceByID(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from houseresource where id_houseResource=?;";// sql语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				HouseResource house = new HouseResource();
				house.setID(rs.getInt("id_houseResource"));
				house.setAcreage(rs.getDouble("acreage"));
				house.setPrice(rs.getDouble("rent"));
				house.setIsRented(rs.getInt("isRented"));
				house.setArchitecturalType(rs.getString("architecturalType"));
				house.setCity(rs.getString("city"));
				house.setDistrict(rs.getString("district"));
				house.setStreet(rs.getString("street"));
				house.setPicture(rs.getString("picture"));
				house.setOwnerID(rs.getInt("id_lessor"));
				house.setEvaluation(rs.getInt("evaluation"));
				house.setRecommendationIndex();
				return house;
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
	
	// 根据建筑类型或地址获得房屋信息
	public ArrayList<HouseResource> getHouseResourceBySearch(String search) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<HouseResource> list = new ArrayList<HouseResource>();// 房屋集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from houseresource where architecturalType=? or city=? or district=? or street=?;";// sql语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, search);
			stmt.setString(2, search);
			stmt.setString(3, search);
			stmt.setString(4, search);
			rs = stmt.executeQuery();
			while (rs.next()) {
				HouseResource house = new HouseResource();
				house.setID(rs.getInt("id_houseResource"));
				house.setAcreage(rs.getDouble("acreage"));
				house.setPrice(rs.getDouble("rent"));
				house.setIsRented(rs.getInt("isRented"));
				house.setArchitecturalType(rs.getString("architecturalType"));
				house.setCity(rs.getString("city"));
				house.setDistrict(rs.getString("district"));
				house.setStreet(rs.getString("street"));
				house.setPicture(rs.getString("picture"));
				house.setOwnerID(rs.getInt("id_lessor"));
				house.setEvaluation(rs.getInt("evaluation"));
				house.setRecommendationIndex();
				list.add(house);// 加入集合
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


	// 获取最近浏览的前五条房屋信息
	public ArrayList<HouseResource> getViewList(String list) {
		ArrayList<HouseResource> houselist = new ArrayList<HouseResource>();
		int iCount = 5;// 每次返回前五条记录
		if (list != null && list.length() > 0) {
			String[] arr = list.split("a");
			// 如果商品记录大于等于5条
			if (arr.length >= 5) {
				for (int i = arr.length - 1; i >= arr.length - iCount; i--) {
					Integer houseResourceId = Integer.parseInt(arr[i]);
					if(houseResourceId!=null)
					{
						houselist.add(getHouseResourceByID(houseResourceId));
					}
				}
			} else {
				for (int i = arr.length - 1; i >= 0; i--) {
					Integer houseResourceId = Integer.parseInt(arr[i]);
					if(houseResourceId!=null)
					{
						houselist.add(getHouseResourceByID(houseResourceId));
					}
				}
			}
			return houselist;
		} else {
			return null;
		}
	}
}
