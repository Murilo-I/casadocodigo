package br.com.casadocodigo.loja.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Usuario;

@Repository
public class UsuarioDAO implements UserDetailsService{

	@PersistenceContext
	private EntityManager manager;
	
	private final String queryEmail = "select u from Usuario u where email = :email";

	public Usuario loadUserByUsername(String email) {
		List<Usuario> usuarios = manager.createQuery(queryEmail, Usuario.class)
				.setParameter("email", email)
				.getResultList();
		
		if(usuarios.isEmpty()) {
			throw new UsernameNotFoundException("Usuario " + email + " não foi encontrado");
		}
		
		return usuarios.get(0);
	}

	public void gravar(Usuario usuario) {
		manager.persist(usuario);
	}

	public List<Usuario> listar() {
		return manager.createQuery("select distinct(u) from Usuario u join fetch u.roles", Usuario.class)
				.getResultList();
	}

	public boolean jaExiste(Usuario usuario) {
		Usuario result = manager.createQuery(queryEmail, Usuario.class)
				.setParameter("email", usuario.getEmail()).getSingleResult();
		
		if(result != null) {
			return true;
		}
		
		return false;
	}
}


