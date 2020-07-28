package br.com.casadocodigo.loja.models;

import java.util.List;

public class EditRole {

	private List<String> roles;
	private String userEmail;
	
	public List<String> getRoles() {
		return roles;
	}
	public void setRoles(List<String> roles) {
		this.roles = roles;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	@Override
	public String toString() {
		return "EditRole [roles=" + roles + ", userEmail=" + userEmail + "]";
	}	
}
