package maven.model;

public class ContactModel {

	private String name;
	private int roll;
	private String mentor;
	private String issue;
	public ContactModel(String name, int roll, String mentor, String issue) {
		super();
		this.name = name;
		this.roll = roll;
		this.mentor = mentor;
		this.issue = issue;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRoll() {
		return roll;
	}
	public void setRoll(int roll) {
		this.roll = roll;
	}
	public String getMentor() {
		return mentor;
	}
	public void setMentor(String mentor) {
		this.mentor = mentor;
	}
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	
	
}
