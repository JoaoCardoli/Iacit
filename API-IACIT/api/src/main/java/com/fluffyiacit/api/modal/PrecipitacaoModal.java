package com.fluffyiacit.api.modal;



import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.type.BigDecimalType;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity(name = "precipitacao")
@Table(name = "precipitacao")
@Getter
@Setter
@ToString
public class PrecipitacaoModal {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_precipitacao")
	private Integer cod_precipitacao;
	
	@ManyToOne
    @JoinColumn(name = "estacao", referencedColumnName = "cod_wmo")
	private EstacaoModal cod_wmo;
	
	@Column(name = "precipitacaototal")
	private BigDecimalType precipitacaototal;
	
	@Column(name= "datahora_captacao",nullable = false)
	private Timestamp datahora_captacao;
	

	
	
}