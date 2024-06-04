package user;

public class User {
	
	private String ID;
	private String PW;
	private String name;
	private String age;
	private String gender;
	private String introduction;

	public String getID() {				// ID
		return ID;
	}
	public void setID(String ID) {
		this.ID = ID;
	}
	
	public String getPW() {				// PW
		return PW;
	}
	public void setPW(String PW) {				
		this.PW = PW;
	}
	
	public String getname() {				// Name
		return name;
	}
	public void setname(String name) {				
		this.name = name;
	}
	
	public String getage() {				// Age
		return age;
	}
	public void setage(String age) {				
		this.age = age;
	}
	
	public String getgender() {				// Gender
		return gender;
	}
	public void setgender(String gender) {				
		this.gender = gender;
	}
	
	public String getintroduction() {				// introduction
		return introduction;
	}
	public void setIntroduction(String introduction) {				
		this.introduction = introduction;
	}
}