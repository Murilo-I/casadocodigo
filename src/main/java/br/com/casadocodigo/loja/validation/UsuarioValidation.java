package br.com.casadocodigo.loja.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.casadocodigo.loja.dao.UsuarioDAO;
import br.com.casadocodigo.loja.models.UsuarioDTO;

@Component
public class UsuarioValidation implements Validator {

	@Autowired
	private UsuarioDAO dao;

	@Override
	public boolean supports(Class<?> clazz) {
		return UsuarioDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "email", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "senha", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "confirmaSenha", "field.required");

		UsuarioDTO novoUsuario = (UsuarioDTO) target;
		if (novoUsuario.getSenha().length() < 5) {
			errors.rejectValue("senha", "field.password");
		}

		if (!novoUsuario.getSenha().contentEquals(novoUsuario.getConfirmaSenha())) {
			errors.rejectValue("confirmaSenha", "field.confirmPassword");
		}

		if (dao.existe(novoUsuario.getEmail())) {
			errors.rejectValue("email", "field.jaExiste");
		}
	}
}
