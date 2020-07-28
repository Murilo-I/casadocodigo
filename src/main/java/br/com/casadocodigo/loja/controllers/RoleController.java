package br.com.casadocodigo.loja.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.RoleDAO;
import br.com.casadocodigo.loja.dao.UsuarioDAO;
import br.com.casadocodigo.loja.models.EditRole;
import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.Usuario;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private UsuarioDAO userDao;
	@Autowired
	private RoleDAO roleDao;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView editarRole(EditRole editRole, RedirectAttributes redirectAttributes) {
		Usuario usuario = userDao.loadUserByUsername(editRole.getUserEmail());
		roleDao.editarRole(usuario, editRole.getRoles());
		redirectAttributes.addFlashAttribute("message", "Role alterada com sucesso");
		return new ModelAndView("redirect:/usuarios");
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView roleForm(@RequestParam String email) {
		ModelAndView view = new ModelAndView("/userRole");
		
		Usuario u = userDao.loadUserByUsername(email);
		view.addObject("usuario", u);
		
		List<Role> roles = roleDao.listar();
		view.addObject("roles", roles);
		
		view.addObject("editRole", new EditRole());
		return view;
	}
}
