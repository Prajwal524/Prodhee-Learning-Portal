package in.ps.studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.studentapp.connection.Connector;
import in.ps.studentapp.dto.Student;

public class StudentDAOImpl implements StudentDAO {

	private Connection con;
	
	public StudentDAOImpl() {
		this.con=Connector.requestConnection();
	}
	
	@Override
	public boolean insertStudent(Student s) {
		String query="INSERT INTO STUDENT VALUES (0,?,?,?,?,SYSDATE())";
		Integer i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getMail());
			ps.setString(4, s.getPassword());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean updateStudent(Student s) {
		String query =
				"UPDATE STUDENT SET NAME=?, PHONE=?, MAIL=? WHERE ID=?";
		Integer i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);

			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getMail());
			ps.setInt(4, s.getId());
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0){
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean deleteStudent(int id) {
		String query="DELETE FROM STUDENT WHERE ID=?";
		Integer i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public Student getStudent(String mail, String password) {
		String query="SELECT * FROM STUDENT WHERE MAIL=? AND PASSWORD=?";
		Student s=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				
				s.setId(rs.getInt("id"));	
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone")); 
				s.setMail(rs.getString("mail"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return s;
	}

	@Override
	public Student getStudent(long phone, String mail) {
		String query="SELECT * FROM STUDENT WHERE PHONE=? AND MAIL=?";
		Student s=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMail(rs.getString("mail"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public ArrayList<Student> getStudent() {
		String query="SELECT * FROM STUDENT WHERE ID!=1";
		ArrayList<Student> studentList=new ArrayList<>();
		Student s=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMail(rs.getString("mail"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
				studentList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return studentList;
	}

	@Override
	public Student getStudentById(Integer id) {
		String query="SELECT * FROM STUDENT WHERE ID=?";
		Student s=null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setMail(rs.getString("mail"));
				s.setPhone(rs.getLong("phone"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	
	
	@Override
	public boolean updatePassword(int id, String password) {

	    String query =
	            "UPDATE STUDENT SET PASSWORD=? WHERE ID=?";

	    int i = 0;

	    try {

	        System.out.println("UPDATE PASSWORD METHOD CALLED");
	        System.out.println("ID = " + id);
	        System.out.println("PASSWORD = " + password);

	        PreparedStatement ps =
	                con.prepareStatement(query);

	        ps.setString(1, password);
	        ps.setInt(2, id);

	        i = ps.executeUpdate();

	        System.out.println("ROWS UPDATED = " + i);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return i > 0;
	}
}
