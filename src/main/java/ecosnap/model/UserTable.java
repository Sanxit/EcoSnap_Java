package ecosnap.model;

// Model Class - Data definition of MYSQL Table

public class UserTable {

    private int id;
    private String email;   // ✅ changed from username → email
    private String password;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {   // ✅ changed
        return email;
    }

    public void setEmail(String email) {   // ✅ changed
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
