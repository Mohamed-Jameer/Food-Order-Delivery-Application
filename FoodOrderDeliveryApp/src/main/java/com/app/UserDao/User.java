package com.app.UserDao;

public class User {
	    private int id;
	    private String userName;
	    private String email;
	    private String password;
	    private int mobile;
	    private String address;
	    private String roleUser ;
	    
	    


		public User(int id, String userName, String email, String password, int mobile, String address,
				String roleUser) {
			super();
			this.id = id;
			this.userName = userName;
			this.email = email;
			this.password = password;
			this.mobile = mobile;
			this.address = address;
			this.roleUser = roleUser;
		}

		public String getRoleUser() {
			return roleUser;
		}

		public void setRoleUser(String roleUser) {
			this.roleUser = roleUser;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		// Constructors
	    public User() {
	        super();
	    }

	    public User(int id, String userName, String email, String password, int mobile,String address) {
	        super();
	        this.id = id;
	        this.userName = userName;
	        this.email = email;
	        this.password = password;
	        this.mobile = mobile;
	        this.address = address;
	    }
	    
	    

	    public User(String userName, String email, String password, int mobile, String address, String roleUser) {
			super();
			this.userName = userName;
			this.email = email;
			this.password = password;
			this.mobile = mobile;
			this.address = address;
			this.roleUser = roleUser;
		}

		public User(String userName, String email, String password, int mobile,String address) {
	        super();
	        this.userName = userName;
	        this.email = email;
	        this.password = password;
	        this.mobile = mobile;
	        this.address = address;
	    }

	    public User(int id, String email) {
	        this.id = id;
	        this.email = email;
	    }

	    // Getters and Setters
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getUserName() {
	        return userName;
	    }

	    public void setUserName(String userName) {
	        this.userName = userName;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public int getMobile() {
	        return mobile;
	    }

	    public void setMobile(int mobile) {
	        this.mobile = mobile;
	    }

		@Override
		public String toString() {
			return "User [id=" + id + ", userName=" + userName + ", email=" + email + ", password=" + password
					+ ", mobile=" + mobile + ", address=" + address + ", roleUser=" + roleUser + "]";
		}

		

	
	}


