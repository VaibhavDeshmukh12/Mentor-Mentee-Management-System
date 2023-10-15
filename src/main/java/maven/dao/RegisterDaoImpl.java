package maven.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import maven.db.DatabaseCon;
import maven.model.ContactModel;
import maven.model.Login;
import maven.model.Mentor;
import maven.model.Register;

public class RegisterDaoImpl implements RegisterDao {

	@Override
	public int addRecord(Register reg) {
		int i = 0;

		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("insert into mentee values(?,?,?,?,?,?,?,?,?)");
			pstate.setString(1, reg.getName());
			pstate.setInt(2, reg.getRoll());
			pstate.setString(3, reg.getPhone());
			pstate.setString(4, reg.getYear());
			pstate.setString(5, reg.getGender());
			pstate.setString(6, reg.getEmail());
			pstate.setString(7, reg.getUsername());
			pstate.setString(8, reg.getPassword());
			pstate.setString(9, reg.getMentor());
			i = pstate.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return i;
	}

	@Override
	public int addMentor(Mentor ment) {
		int i = 0;

		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("insert into mentor values(?,?,?,?,?,?,?)");
			pstate.setString(1, ment.getName());
			pstate.setInt(2, ment.getId());
			pstate.setString(3, ment.getPhone());
			pstate.setString(4, ment.getGender());
			pstate.setString(5, ment.getUsername());
			pstate.setString(6, ment.getPassword());
			pstate.setString(7, ment.getEmail());
			i = pstate.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return i;
	}

	@Override
	public List<Mentor> validateMentor(Login log) {
		List<Mentor> mlist = new ArrayList<Mentor>();
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("select * from mentor where username=? and password=?");
			pstate.setString(1, log.getUsername());
			pstate.setString(2, log.getPassword());

			ResultSet res = pstate.executeQuery();
			if (res.next()) {
				
				Mentor ment = new Mentor(res.getInt(2), res.getString(1), res.getString(3), res.getString(4),
						res.getString(5), res.getString(6), res.getString(7));
				mlist.add(ment);
			}
			System.out.println("List added!");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return mlist;
	}

	@Override
	public List<Register> validateMentee(Login log) {
		List<Register> list =  new ArrayList<Register>();;
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("select * from mentee where username=? and password=?");
			pstate.setString(1, log.getUsername());
			pstate.setString(2, log.getPassword());

			ResultSet res = pstate.executeQuery();
			if (res.next()) {
				
				Register reg = new Register(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),
						res.getString(5), res.getString(6), res.getString(7), res.getString(8), res.getString(9));
				list.add(reg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public int updateRecord(Register reg) {
		int i = 0;

		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		try {
			PreparedStatement pstate = con.prepareStatement(
					"update mentee set name=? ,phone=?, year=?,gender=?,email=?,username=?,mentor=? where roll=? and password=?");
			pstate.setString(1, reg.getName());

			pstate.setString(2, reg.getPhone());
			pstate.setString(3, reg.getYear());
			pstate.setString(4, reg.getGender());
			pstate.setString(5, reg.getEmail());
			pstate.setString(6, reg.getUsername());
			pstate.setString(9, reg.getPassword());
			pstate.setString(7, reg.getMentor());
			pstate.setInt(8, reg.getRoll());
			i = pstate.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return i;
	}

	@Override
	public int updateMentorRecord(Mentor ment) {
		int i = 0;
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		try {
			PreparedStatement pstate = con.prepareStatement(
					"update mentor set name=? ,gender=? ,username=? ,email=? where id=? and password=?");
			pstate.setString(1, ment.getName());

			pstate.setString(2, ment.getGender());
			pstate.setString(3, ment.getUsername());
			pstate.setString(6, ment.getPassword());
			pstate.setString(4, ment.getEmail());
			pstate.setInt(5, ment.getId());
			i = pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}

	@Override
	public List<Register> displayAll() {
		List<Register> list = new ArrayList<>();
		Register reg = null;
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		String str = "select * from mentee order by roll";

		try {
			Statement state = con.createStatement();
			ResultSet res = state.executeQuery(str);
			while (res.next()) {
				reg = new Register(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),
						res.getString(5), res.getString(6), res.getString(7), res.getString(8), res.getString(9));
				list.add(reg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<Register> displayAllStud(String name) {
		List<Register> list = new ArrayList<>();
		Register reg = null;
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		System.out.print(name);
		// String str = "select * from menteeView where mentor=?";
		try {
			PreparedStatement pstate = con.prepareStatement("select * from menteeView where mentor=?");
			pstate.setString(1, name);
			ResultSet res = pstate.executeQuery();
			while (res.next()) {
				reg = new Register(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),
						res.getString(5), res.getString(6), res.getString(7));
				list.add(reg);
			}
			System.out.println("List Added");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public int addIssue(ContactModel cm) {
		int i = 0;

		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("insert into complaint values(?,?,?,?)");
			pstate.setString(1,cm.getName());
			pstate.setInt(2, cm.getRoll());
			pstate.setString(3, cm.getMentor());
			pstate.setString(4, cm.getIssue());
			i = pstate.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;	
	}

	@Override
	public List<ContactModel> displayIssues(String name) {
		
		List<ContactModel> list = new ArrayList<>();
		ContactModel reg = null;
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		System.out.print(name);
		// String str = "select * from menteeView where mentor=?";
		try {
			PreparedStatement pstate = con.prepareStatement("select * from complaint where mentor=?");
			pstate.setString(1, name);
			ResultSet res = pstate.executeQuery();
			while (res.next()) {
				reg = new ContactModel(res.getString(1),res.getInt(2),res.getString(3),res.getString(4));
				list.add(reg);
			}
			System.out.println("List Added");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	@Override
	public boolean deleteStudent(int id) {
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		boolean b=false;
		try {
			String str="delete from MenteeView where roll=?";
			PreparedStatement pState=con.prepareStatement(str);
			pState.setInt(1, id);
			int i=pState.executeUpdate();
			if(i>0)
			{
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public int updateStudent(Login log) {
		int i=0;
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("update mentee set password=? where username=?");
			pstate.setString(1, log.getPassword());
			pstate.setString(2, log.getUsername());
			i=pstate.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}

	@Override
	public int updateMentor(Login log) {
		int i=0;
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();

		try {
			PreparedStatement pstate = con.prepareStatement("update mentor set password=? where username=?");
			pstate.setString(2, log.getUsername());
			pstate.setString(1, log.getPassword());
			i=pstate.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;                                                                                                   
	}

	@Override
	public boolean deleteIssue(int id) {
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		boolean b=false;
		try {
			String str="delete from Complaint where roll=?";
			PreparedStatement pState=con.prepareStatement(str);
			pState.setInt(1, id);
			int i=pState.executeUpdate();
			if(i>0)
			{
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<Register> searchStudent(int id,String mentor) {
		List<Register> list = new ArrayList<>();
		DatabaseCon db = new DatabaseCon();
		Connection con = db.myConnection();
		System.out.println(id+mentor);
		Register reg=null;
		try {
			PreparedStatement pstate = con.prepareStatement("select * from menteeView where roll=? and mentor=?");
			pstate.setInt(1,id);
			pstate.setString(2, mentor);
			ResultSet res = pstate.executeQuery();
			if(res.next()) {
				 reg= new Register(res.getString(1), res.getInt(2), res.getString(3), res.getString(4),
						res.getString(5), res.getString(6), res.getString(7));
				 list.add(reg);
				System.out.println("Hello Bhaiyya");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}
	
	
	
}