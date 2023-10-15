package maven.model;

public class Register {
	private String name;
	private int roll;
	private String phone;
	private String year;
	private String gender;
	private String email;
	private String username;
	private String password;
	private String mentor;
	
	public Register()
	{
		super();
	}

	public Register(String name, int roll, String phone, String year, String gender, String email, String username,
			String password, String mentor) {
		this.name = name;
		this.roll = roll;
		this.phone = phone;
		this.year = year;
		this.gender = gender;
		this.email = email;
		this.username = username;
		this.password = password;
		this.mentor = mentor;
	}

	public Register(String name, int roll, String phone, String year, String gender, String email, String mentor) {
		super();
		this.name = name;
		this.roll = roll;
		this.phone = phone;
		this.year = year;
		this.gender = gender;
		this.email = email;
		this.mentor = mentor;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMentor() {
		return mentor;
	}

	public void setMentor(String mentor) {
		this.mentor = mentor;
	}

}
