package br.com.casadocodigo.loja.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.Usuario;

@Repository
@Transactional
public class RoleDAO {

	@PersistenceContext
	private EntityManager manager;

	public void gravar(Role role) {
		manager.persist(role);
	}

	public List<Role> listar() {
		return manager.createQuery("select r from Role r", Role.class).getResultList();
	}

	public void editarRole(Usuario usuario, List<String> roles) {
		manager.merge(usuario);
		List<Role> listRole = new ArrayList<>();
		
		for(int index = 0; index < roles.size(); index++) {
			Role role = new Role();
			role.setNome(roles.get(index).toString());
			listRole.add(role);
		}
		
		usuario.setRoles(listRole);
	}
}
