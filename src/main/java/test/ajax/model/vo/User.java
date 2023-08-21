package test.ajax.model.vo;
import java.util.Objects;

public class User implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 118103535094965442L;

    private String userid;
    private String userpwd;
    private String username;
    private int age;
    private String email;
    private String phone;

    public User() {
		super();
	}
    

	public User(String userid, String userpwd, String username, int age, String email, String phone) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.age = age;
		this.email = email;
		this.phone = phone;
	}


	/**
     * @return String return the userid
     */
    public String getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * @return String return the userpwd
     */
    public String getUserpwd() {
        return userpwd;
    }

    /**
     * @param userpwd the userpwd to set
     */
    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    /**
     * @return String return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return int return the age
     */
    public int getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }

    /**
     * @return String return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return String return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }


	@Override
	public String toString() {
		return "User [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", age=" + age
				+ ", email=" + email + ", phone=" + phone + "]";
	}
    
}
