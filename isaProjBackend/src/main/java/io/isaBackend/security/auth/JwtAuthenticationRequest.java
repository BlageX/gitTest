package io.isaBackend.security.auth;

//Klasa koja sluzi da ne saljem 2 odvojena parametra vec da u jednoj klasi posaljem i username i password u sustini DTO
//Koristi se u prvoj metodi klase AuthentificationController
public class JwtAuthenticationRequest {
	
    private String username;
    private String password;

    public JwtAuthenticationRequest() {
        super();
    }

    public JwtAuthenticationRequest(String username, String password) {
        this.setUsername(username);
        this.setPassword(password);
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
