package entity;

//��������Ϣ��
public class Lessor {
	private int ID;
	private String name;
	private String password;
	private String phone;
	private String email;
	private String address;
    private long identity;
    
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getIdentity() {
		return identity;
	}
	public void setIdentity(long identity) {
		this.identity = identity;
	}
}
