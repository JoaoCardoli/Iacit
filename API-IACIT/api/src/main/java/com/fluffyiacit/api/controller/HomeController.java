package com.fluffyiacit.api.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fluffyiacit.api.modal.FiltroModal;
import com.fluffyiacit.api.modal.ViewPrecipitacaoModal;
import com.fluffyiacit.api.modal.ViewPressaoAtmModal;
import com.fluffyiacit.api.modal.ViewRadiacaoglobalModal;
import com.fluffyiacit.api.modal.ViewTemperaturaModal;
import com.fluffyiacit.api.modal.ViewUmidadeModal;
import com.fluffyiacit.api.modal.ViewVentoModal;
import com.fluffyiacit.api.repository.PrecipitacaoRepository;
import com.fluffyiacit.api.repository.PressaoAtmRepository;
import com.fluffyiacit.api.repository.RadiacaoGlobalRepository;
import com.fluffyiacit.api.repository.TemperaturaRepository;
import com.fluffyiacit.api.repository.UmidadeRepository;
import com.fluffyiacit.api.repository.VentoRepository;

@Controller
@RequestMapping
public class HomeController {
	
	//REPOSITORY
		@Autowired(required = true)
		private PrecipitacaoRepository precipitacao;
	
		@Autowired(required = true)
		private PressaoAtmRepository pressao;
		
		@Autowired(required = true)
		private RadiacaoGlobalRepository radiacao;
		
		@Autowired(required = true)
		private TemperaturaRepository temperatura;
		
		@Autowired(required = true)
		private UmidadeRepository umidade;
		
		@Autowired(required = true)
		private VentoRepository vento;
	//
	
	//ENTRAR PAGINA INDEX
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public ModelAndView PaginaIndex() {
		ModelAndView modelAndView = new ModelAndView();

		FiltroModal filtromodal = new FiltroModal();
		
		filtromodal.setEstacao_nome("SP");
		filtromodal.setEstacao_estado("São Paulo");
		filtromodal.setCod_wmo("A702");
		filtromodal.setDatahora_captacao("2022-08-30 22:00:00");
		modelAndView.addObject("filtro", filtromodal);
		
		// Lista Precipitacao
		List<ViewPrecipitacaoModal> envioteste = precipitacao.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
		modelAndView.addObject("teste_precipitacao", envioteste);
		
		// Lista Precipitacao
		List<ViewPressaoAtmModal> teste_atm = pressao.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
		modelAndView.addObject("teste_atm", teste_atm);
		
		// Lista Radiacao
		List<ViewRadiacaoglobalModal> teste_radiacaoglobal = radiacao.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
		modelAndView.addObject("teste_radiacaoglobal", teste_radiacaoglobal);
		
		// Lista Temperatura
		List<ViewTemperaturaModal> teste_temperatura = temperatura.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
		modelAndView.addObject("teste_temperatura", teste_temperatura);
		
		
		// Lista Umidade
		List<ViewUmidadeModal> teste_umidade = umidade.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
		modelAndView.addObject("teste_umidade", teste_umidade);
		
		// Lista Vento
		List<ViewVentoModal> teste_vento = vento.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
		modelAndView.addObject("teste_vento", teste_vento);
		
		//INFORMANDO A PAGINA QUE SERA MOSTRADA
			modelAndView.setViewName("index");
			return modelAndView;
		//
	}
	
	//ENTRAR PAGINA INDEX
	@RequestMapping(value = {"/a"}, method = RequestMethod.POST)
	public ModelAndView a(FiltroModal filtromodal) {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("1:" + filtromodal.getEstacao_nome());
		System.out.println("2:" + filtromodal.getEstacao_estado());
		System.out.println("3:" + filtromodal.getCod_wmo());
		System.out.println("4:" + filtromodal.getDatahora_captacao());
		
		// Lista Precipitacao
		List<ViewPrecipitacaoModal> envioteste = precipitacao.listar(filtromodal.getEstacao_nome(), filtromodal.getEstacao_estado(), filtromodal.getCod_wmo(), Timestamp.valueOf(filtromodal.getDatahora_captacao()));
		modelAndView.addObject("teste_precipitacao", envioteste);
		
		// Lista Precipitacao
		List<ViewPressaoAtmModal> teste_atm = pressao.listar(filtromodal.getEstacao_nome(), filtromodal.getEstacao_estado(), filtromodal.getCod_wmo(), Timestamp.valueOf(filtromodal.getDatahora_captacao()));
		modelAndView.addObject("teste_atm", teste_atm);
		
		// Lista Radiacao
		List<ViewRadiacaoglobalModal> teste_radiacaoglobal = radiacao.listar(filtromodal.getEstacao_nome(), filtromodal.getEstacao_estado(), filtromodal.getCod_wmo(), Timestamp.valueOf(filtromodal.getDatahora_captacao()));
		modelAndView.addObject("teste_radiacaoglobal", teste_radiacaoglobal);
		
		// Lista Temperatura
		List<ViewTemperaturaModal> teste_temperatura = temperatura.listar(filtromodal.getEstacao_nome(), filtromodal.getEstacao_estado(), filtromodal.getCod_wmo(), Timestamp.valueOf(filtromodal.getDatahora_captacao()));
		modelAndView.addObject("teste_temperatura", teste_temperatura);
		
		// Lista Umidade
		List<ViewUmidadeModal> teste_umidade = umidade.listar(filtromodal.getEstacao_nome(), filtromodal.getEstacao_estado(), filtromodal.getCod_wmo(), Timestamp.valueOf(filtromodal.getDatahora_captacao()));
		modelAndView.addObject("teste_umidade", teste_umidade);
		
		// Lista Vento
		List<ViewVentoModal> teste_vento = vento.listar(filtromodal.getEstacao_nome(), filtromodal.getEstacao_estado(), filtromodal.getCod_wmo(), Timestamp.valueOf(filtromodal.getDatahora_captacao()));
		modelAndView.addObject("teste_vento", teste_vento);
		
		filtromodal.getEstacao_nome();
		filtromodal.getEstacao_estado();
		filtromodal.getCod_wmo();
		filtromodal.getDatahora_captacao();
		modelAndView.addObject("filtro", filtromodal);
		
		//INFORMANDO A PAGINA QUE SERA MOSTRADA
			modelAndView.setViewName("index");
			return modelAndView;
		//
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//ENTRAR PAGINA TESTE
		@RequestMapping(value = {"/teste"}, method = RequestMethod.GET)
		public ModelAndView formulario() {
			ModelAndView modelAndView = new ModelAndView();
		
			// Lista Precipitacao
			List<ViewPrecipitacaoModal> envioteste = precipitacao.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
			modelAndView.addObject("teste_precipitacao", envioteste);
			
			// Lista Precipitacao
			List<ViewPressaoAtmModal> teste_atm = pressao.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
			modelAndView.addObject("teste_atm", teste_atm);
			
			// Lista Radiacao
			List<ViewRadiacaoglobalModal> teste_radiacaoglobal = radiacao.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
			modelAndView.addObject("teste_radiacaoglobal", teste_radiacaoglobal);
			
			// Lista Temperatura
			List<ViewTemperaturaModal> teste_temperatura = temperatura.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
			modelAndView.addObject("teste_temperatura", teste_temperatura);
			
			// Lista Umidade
			List<ViewUmidadeModal> teste_umidade = umidade.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
			modelAndView.addObject("teste_umidade", teste_umidade);
			
			// Lista Vento
			List<ViewVentoModal> teste_vento = vento.listar("SP", "São Paulo","A702", Timestamp.valueOf("2022-08-30 22:00:00"));
			modelAndView.addObject("teste_vento", teste_vento);
																					
			//INFORMANDO A PAGINA QUE SERA MOSTRADA
				modelAndView.setViewName("teste");
				return modelAndView;
			
			}
	
		
		
		
		//ENTRAR PAGINA TESTE
				@RequestMapping(value = {"/testeindex"})
				public ModelAndView aa() {
					ModelAndView modelAndView = new ModelAndView();
																							
					//INFORMANDO A PAGINA QUE SERA MOSTRADA
						modelAndView.setViewName("indexx");
						return modelAndView;
					//
					}
}
