package br.com.casadocodigo.loja.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.models.Produto;

@Controller
public class RelatorioProdutosController {

	@Autowired
	private ProdutoDAO dao;

	@RequestMapping(method = RequestMethod.GET, value = "/relatorio-produto")
	@ResponseBody
	public List<Produto> geraRelatorioProduto(@RequestParam(value = "data", required = false) String data) {

		if (data == null) {
			return dao.listar();

		} else {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(sdf.parse(data));

				return dao.listar(calendar);

			} catch (ParseException e) {
				throw new RuntimeException(e);
			}
		}
	}
}
