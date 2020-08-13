package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.UsuarioDAO;
import br.com.casadocodigo.loja.models.Usuario;
import br.com.casadocodigo.loja.validation.UsuarioValidation;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioDAO userDao;
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
		
		criptografarSenha(usuario);
		userDao.gravar(usuario);
		redirectAttributes.addFlashAttribute("message", "Usuário cadastrado com sucesso!");

		return new ModelAndView("redirect:/usuarios");
	}

	@RequestMapping("/form")
	public ModelAndView usuarioForm(Usuario usuario) {
		return new ModelAndView("/userForm");
	}

	private void criptografarSenha(Usuario usuario) {
		String senha = usuario.getSenha();
		String senha2 = usuario.getConfirmaSenha();
		String salt1 = BCrypt.gensalt();
		String salt2 = BCrypt.gensalt();
		
		usuario.setSenha(BCrypt.hashpw(senha, salt1));
		usuario.setConfirmaSenha(BCrypt.hashpw(senha2, salt2));
	}
}
