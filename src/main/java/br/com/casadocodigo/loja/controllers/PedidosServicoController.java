package br.com.casadocodigo.loja.controllers;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.models.Pedidos;

@Controller
public class PedidosServicoController {

	@Autowired
	private RestTemplate rest;

	@RequestMapping("/pedidos")
	public Callable<ModelAndView> listarPedidos() {

		return () -> {
			try {
				ModelAndView view = new ModelAndView("produtos/pedidos");
				URI uri = new URI("https://book-payment.herokuapp.com/orders");

				ResponseEntity<Pedidos[]> response = rest.exchange(uri, HttpMethod.GET, null, Pedidos[].class);
				Pedidos[] pedidos = response.getBody();
				view.addObject("pedidos", pedidos);

				return view;

			} catch (RestClientException | URISyntaxException e) {
				throw new RuntimeException(e);
			}
		};
	}
}
