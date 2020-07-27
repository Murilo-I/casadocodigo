package br.com.casadocodigo.loja.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.RoleDAO;
import br.com.casadocodigo.loja.dao.UsuarioDAO;
import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.Usuario;
import br.com.casadocodigo.loja.validation.UsuarioValidation;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioDAO userDao;
	@Autowired
	private RoleDAO roleDao;
	@Autowired
	private UsuarioValidation usuarioValidation;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(usuarioValidation);
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listarUsuarios() {
		List<Usuario> usuarios = userDao.listar();
		ModelAndView modelAndView = new ModelAndView("/userList");
		modelAndView.addObject("usuarios", usuarios);
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView cadastrarUsuario(@Valid Usuario usuario, BindingResult result,
			RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return usuarioForm(usuario);
		}

		userDao.gravar(usuario);
		redirectAttributes.addFlashAttribute("message", "Usuário cadastrado com sucesso!");

		return new ModelAndView("redirect:/usuarios");
	}

	@RequestMapping("/form")
	public ModelAndView usuarioForm(Usuario usuario) {
		return new ModelAndView("/userForm");
	}

	@RequestMapping(value = "/role", method = RequestMethod.POST)
	public ModelAndView editarRole(Usuario usuario, ArrayList<Role> roles, RedirectAttributes redirectAttributes) {
		roleDao.editarRole(usuario, roles);
		redirectAttributes.addFlashAttribute("message", "Role alterada com sucesso");
		return new ModelAndView("redirect:/usuarios");
	}

	@RequestMapping(value = "/role", method = RequestMethod.GET)
	public ModelAndView roleForm(@RequestParam String email) {
		ModelAndView view = new ModelAndView("/userRole");
		Usuario u = userDao.loadUserByUsername(email);
		view.addObject("usuario", u);
		List<Role> roles = roleDao.listar();
		view.addObject("roles", roles);
		return view;
	}
}
