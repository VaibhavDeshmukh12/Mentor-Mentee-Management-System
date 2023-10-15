package maven.dao;

import java.util.List;

import maven.model.ContactModel;
import maven.model.Login;
import maven.model.Mentor;
import maven.model.Register;

public interface RegisterDao {

	public int addRecord(Register reg);

	public int addMentor(Mentor ment);

	public List<Mentor> validateMentor(Login log);

	public List<Register> validateMentee(Login log);

	public int updateRecord(Register reg);

	public int updateMentorRecord(Mentor ment);

	public List<Register> displayAll();

	public List<Register> displayAllStud(String name);
	
	public int addIssue(ContactModel cm);
	
	public List<ContactModel> displayIssues(String name);
	
	public boolean deleteStudent(int id);
	
	public boolean deleteIssue(int id);
	
	int updateStudent(Login log);
	
	int updateMentor(Login log);
	
	public List<Register> searchStudent(int id,String mentor);
	
}
