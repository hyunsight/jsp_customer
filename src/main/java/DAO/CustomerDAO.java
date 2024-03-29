package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Customer;

public class CustomerDAO {
	//DB 연결
	final static String JDBC_DRiVER = "oracle.jdbc.driver.OracleDriver";
	final static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public Connection open() {
		Connection conn = null;
		
		try {
			Class.forName(JDBC_DRiVER);
			conn = DriverManager.getConnection(JDBC_URL, "test", "test1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

	
	//고객 리스트 가져오는 메소드
	public ArrayList<Customer> getList() throws Exception {
		Connection conn = open();
		ArrayList<Customer> customerList = new ArrayList<>();
		
		String sql = "SELECT id, name, phone, point, grade FROM customer ORDER BY id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				Customer customer = new Customer();
				
				customer.setId(rs.getInt("id"));
				customer.setName(rs.getString("name"));
				customer.setPhone(rs.getString("phone"));
				customer.setPoint(rs.getInt("point"));
				customer.setGrade(rs.getString("grade"));	
				
				customerList.add(customer);
			}
			
			return customerList;
		}
	}
	
	
	//고객 상세 정보 가져오는 메소드
	public Customer getView(int id) throws Exception {
		Connection conn = open();
		Customer customer = new Customer();
		
		String sql = "SELECT id, name, address, phone, gender, age, img, point, grade, to_char(reg_date, 'yyyy.mm.dd') reg_date FROM CUSTOMER WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
	
		try(conn; pstmt; rs) {
			while(rs.next()) {
				customer.setId(rs.getInt("id"));
				customer.setName(rs.getString("name"));
				customer.setAddress(rs.getString("address"));
				customer.setPhone(rs.getString("phone"));
				customer.setGender(rs.getString("gender"));
				customer.setAge(rs.getInt("age"));
				customer.setImg(rs.getString("img"));
				customer.setPoint(rs.getInt("point"));
				customer.setGrade(rs.getString("grade"));	
				customer.setReg_date(rs.getString("reg_date"));
			}
		
		}
		
		return customer;
	}
	
	
	//고객 등록하는 메소드
	public void insertCustomer(Customer customer) throws Exception {
		Connection conn = open();
		
		String sql = "INSERT INTO customer values(customer_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, customer.getName());
			pstmt.setString(2, customer.getAddress());
			pstmt.setString(3, customer.getPhone());
			pstmt.setString(4, customer.getGender());
			pstmt.setInt(5, customer.getAge());
			pstmt.setString(6, customer.getImg());
			pstmt.setInt(7, customer.getPoint());
			pstmt.setString(8, customer.getGrade());
			
			pstmt.execute();
		}		
	}
	
	
	//고객 삭제하는 메소드
	public void deleteCustomer(int id) throws Exception {
		Connection conn = open();
		
		String sql = "DELETE FROM customer WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setInt(1, id);
			
			if(pstmt.executeUpdate() != 1) {
				throw new Exception("삭제된 글이 없습니다.");
			}
		}		
	}
	
}


