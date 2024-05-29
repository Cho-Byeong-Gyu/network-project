package user;

public class User {
	
	private String ID;
	private String PW;
	private String Name;
	private String Age;
	private String Gender;
	private String Introduction;

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
	
	public String getName() {				// Name
		return Name;
	}
	public void setName(String Name) {				
		this.Name = Name;
	}
	
	public String getAge() {				// Age
		return Age;
	}
	public void setAge(String Age) {				
		this.Age = Age;
	}
	
	public String getGender() {				// Gender
		return Gender;
	}
	public void setGender(String Gender) {				
		this.Gender = Gender;
	}
	
	public String getIntroduction() {				// introduction
		return Introduction;
	}
	public void setIntroduction(String Introduction) {				
		this.Introduction = Introduction;
	}
}