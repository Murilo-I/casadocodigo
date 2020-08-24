package br.com.casadocodigo.loja.models;

public class UsuarioDTO {

	private String email;
	private String senha;
	private String confirmaSenha;
	private String nome;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getConfirmaSenha() {
		return confirmaSenha;
	}
	public void setConfirmaSenha(String confirmaSenha) {
		this.confirmaSenha = confirmaSenha;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public Usuario parseUser() {
		return new Usuario(email, senha, nome);
	}
}
