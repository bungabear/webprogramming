package Member;

public class MemberDTO {
	
	public MemberDTO(String id, String password){
		this.id = id;
		this.password = password;
	}

	private String id;
	private String password;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
