--CRIACAO DA TABELA ESTACAO
CREATE TABLE estacao (
	cod_wmo VARCHAR(4) NOT NULL,
	estacao_nome VARCHAR(60) UNIQUE NOT NULL,
	estacao_regiao VARCHAR(60) NOT NULL,
	estacao_estado CHAR(2) NOT NULL,
	estacao_longitude NUMERIC NOT NULL,
	estacao_latitude NUMERIC NOT NULL,
	estacao_altitude NUMERIC NOT NULL,
	estacao_datafundacao DATE,
	estacao_status CHAR(1) NOT NULL DEFAULT('A'),
	
	--CHAVE PRIMARIA ESTACAO
	CONSTRAINT pk_est_cod_wmo PRIMARY KEY (cod_wmo)
);


--CRIACAO DA TABELA RADICACAO GLOBAL
CREATE TABLE radiacao_global(
	cod_radiacao SERIAL,
	cod_wmo VARCHAR(4) NOT NULL,
	radiacao_global NUMERIC,
	datahora_captacao TIMESTAMP NOT NULL,
	
	--UNIQUE RADIACAO_GLOBAL
	CONSTRAINT uk_rad_wmo_datahora UNIQUE (cod_wmo, datahora_captacao),
	
	--CHAVE PRIMARIA RADIACAO_GLOBAL
	CONSTRAINT pk_cod_radiacao PRIMARY KEY (cod_radiacao),
	--CHAVE ESTRANGEIRA TABELA ESTACAO(COD_WMO)
	CONSTRAINT fk_rad_cod_wmo FOREIGN KEY (cod_wmo)
		REFERENCES estacao(cod_wmo)
); 


--CRIACAO DA TABELA PRECIPITACAO
CREATE TABLE precipitacao(
	cod_precipitacao SERIAL,
	cod_wmo VARCHAR(4) NOT NULL,
	precipitacaototal NUMERIC,
	datahora_captacao TIMESTAMP NOT NULL,
	
	--UNIQUE PRECIPTACAO
	CONSTRAINT uk_prec_wmo_datahora UNIQUE (cod_wmo, datahora_captacao),
	
	--CHAVE PRIMARIA PRECIPTACAO
	CONSTRAINT pk_cod_precipitacao PRIMARY KEY (cod_precipitacao),
	--CHAVE ESTRANGEIRA TABELA ESTACAO(COD_WMO)
	CONSTRAINT fk_prec_cod_wmo FOREIGN KEY (cod_wmo)
		REFERENCES estacao(cod_wmo)
);


--CRIACAO DA TABELA VENTO
CREATE TABLE vento(
	cod_vento SERIAL,
	cod_wmo VARCHAR(4) NOT NULL,
	vento_velocidade NUMERIC,
	vento_rajada_max NUMERIC,
	vento_direcao_horario NUMERIC,
	datahora_captacao TIMESTAMP NOT NULL,
	
	--UNIQUE VENTO
	CONSTRAINT uk_vento_wmo_datahora UNIQUE (cod_wmo, datahora_captacao),
	
	--CHAVE PRIMARIA VENTO
	CONSTRAINT pk_cod_vento PRIMARY KEY (cod_vento),
	--CHAVE ESTRANGEIRA TABELA ESTACAO(COD_WMO)
	CONSTRAINT fk_vento_cod_wmo FOREIGN KEY (cod_wmo)
		REFERENCES estacao(cod_wmo)
);


--CRIACAO DA TABELA PRESSAO ATMOSFERICA
CREATE TABLE pressao_atmosferica(
	cod_pressao_atm SERIAL,
	cod_wmo VARCHAR(4) NOT NULL,
	pressao_atm_estacao NUMERIC,
	pressao_atm_min NUMERIC,
	pressao_atm_max NUMERIC,
	datahora_captacao TIMESTAMP NOT NULL,
	
	--UNIQUE PRESSAO ATMOSFERICA
	CONSTRAINT uk_pressao_wmo_datahora UNIQUE (cod_wmo, datahora_captacao),
	
	--CHAVE PRIMARIA PRESSAO ATMOSFERICA
	CONSTRAINT pk_cod_pressao_atm PRIMARY KEY (cod_pressao_atm),
	--CHAVE ESTRANGEIRA TABELA PRESSAO ATMOSFERICA(COD_WMO)
	CONSTRAINT fk_pressao_cod_wmo FOREIGN KEY (cod_wmo)
		REFERENCES estacao(cod_wmo)
);


--CRIACAO DA TEMPERATURA
CREATE TABLE temperatura(
	cod_temperatura SERIAL,
	cod_wmo VARCHAR(4) NOT NULL,
	temperatura_ar NUMERIC,
	temperatura_min NUMERIC,
	temperatura_max NUMERIC,
	temperatura_ponto_orvalho NUMERIC,
	temperatura_orvalho_min NUMERIC,
	temperatura_orvalho_max NUMERIC,
	datahora_captacao TIMESTAMP NOT NULL,
	
	--UNIQUE TEMPERATURA
	CONSTRAINT uk_temp_wmo_datahora UNIQUE (cod_wmo, datahora_captacao),
	
	--CHAVE PRIMARIA TEMPERATURA
	CONSTRAINT pk_cod_temperatura PRIMARY KEY (cod_temperatura),
	--CHAVE ESTRANGEIRA TABELA TEMPERATURA
	CONSTRAINT fk_temp_cod_wmo FOREIGN KEY (cod_wmo)
		REFERENCES estacao(cod_wmo)
);


--CRIAÇÃO DA UMIDADE
CREATE TABLE umidade(
	cod_umidade SERIAL,
	cod_wmo VARCHAR(4) NOT NULL,
	umidade_relativa_ar NUMERIC,
	umidade_relativa_min NUMERIC,
	umidade_relativa_max NUMERIC,
	datahora_captacao TIMESTAMP NOT NULL,
	
	--UNIQUE UMIDADE
	CONSTRAINT uk_umid_wmo_datahora UNIQUE (cod_wmo, datahora_captacao),
	
	--CHAVE PRIMARIA TEMPERATURA
	CONSTRAINT pk_cod_umidade PRIMARY KEY (cod_umidade),
	--CHAVE ESTRANGEIRA TABELA UMIDADE
	CONSTRAINT fk_umid_cod_wmo FOREIGN KEY (cod_wmo)
		REFERENCES estacao(cod_wmo)
);


--CRIAÇÃO DA PERMISSAO
CREATE TABLE permissao(
	cod_permissao SERIAL,
	permissao_nome VARCHAR(50),
	permissao_descricao VARCHAR(200),
	
	--CHAVE PRIMARIA PERMISSAO
	CONSTRAINT pk_cod_permissao PRIMARY KEY (cod_permissao)
);


--CRIAÇÃO DA TABELA USUARIO
CREATE TABLE usuario(
	cod_usuario SERIAL,
	usuario_username VARCHAR(20) NOT NULL,
	usuario_senha VARCHAR(20) NOT NULL,
	usuario_nome VARCHAR (60) NOT NULL,
	usuario_datahora_criacao TIMESTAMP NOT NULL,
	usuario_cadastrante INTEGER NOT NULL,
	cod_permissao INTEGER NOT NULL,
	
	--CHAVE PRIMARIA USUARIO
	CONSTRAINT pk_cod_usuario PRIMARY KEY (cod_usuario),
	
	--CHAVE ESTRANGEIRA USUARIO E PERMISSAO
	CONSTRAINT fk_cadastrante FOREIGN KEY (usuario_cadastrante)
		REFERENCES usuario(cod_usuario),
	CONSTRAINT fk_cod_permissao FOREIGN KEY (cod_permissao)
		REFERENCES permissao(cod_permissao)
);


--CRIAÇÃO DA TABELA LOG USUARIO
CREATE TABLE log_usuario(
	log_usuario_cod SERIAL,
	log_usuario_colunaafetada VARCHAR(60) NOT NULL,
	log_usuario_valorantigo VARCHAR(60) NOT NULL,
	log_usuario_valornovo VARCHAR(60) NOT NULL,
	log_usuario_datahora TIMESTAMP NOT NULL,
	cod_usuario_alterado INTEGER NOT NULL,
	cod_usuario_alterou INTEGER NOT NULL,
	
	--CHAVE PRIMARIA LOG USUARIO
	CONSTRAINT pk_log_usuario_cod PRIMARY KEY (log_usuario_cod),
	
	--CHAVE ESTRANGEIRA USUARIO ALTERADO E USUARIO ALTEROU
	CONSTRAINT fk_cod_usuario_alterado FOREIGN KEY (cod_usuario_alterado)
		REFERENCES usuario(cod_usuario),
	CONSTRAINT fk_cod_usuario_alterou FOREIGN KEY (cod_usuario_alterou)
		REFERENCES usuario(cod_usuario)
);


--CRIAÇÃO DA TABELA LOG ESTACAO
CREATE TABLE log_usuarioestacao(
	log_usuarioestacao_cod SERIAL,
	log_usuarioestacao_colunaafetada VARCHAR(60) NOT NULL,
	log_usuarioestacao_valorantigo VARCHAR(60) NOT NULL,
	log_usuarioestacao_valornovo VARCHAR(60) NOT NULL,
	log_usuarioestacao_datahora TIMESTAMP NOT NULL,
	cod_wmo VARCHAR(4) NOT NULL,
	cod_usuario_alterou INTEGER NOT NULL,
	
	--CHAVE PRIMARIA LOG USUARIO ESTACAO
	CONSTRAINT pk_log_usuarioestacao_cod PRIMARY KEY (log_usuarioestacao_cod),
	
	--CHAVE PRIMARIA COD_WMO E USUARIO ALTEROU
	CONSTRAINT fk_estacao_cod_wmo FOREIGN KEY (cod_wmo)
		REFERENCES estacao(cod_wmo),
	CONSTRAINT fk_cod_usuario_alterou FOREIGN KEY (cod_usuario_alterou)
		REFERENCES usuario(cod_usuario)
);

--INSERÇÃO DAS PERMISSOES
INSERT INTO permissao VALUES (1,'Administrator','Esse é uma permissao de administrator');
INSERT INTO permissao VALUES (2,'Usuario','Esse é uma permissao de usuario');


--CRIAÇÃO DE USUARIO ADMINISTRADOR
CREATE ROLE fluffyapi WITH PASSWORD 'fluaffy123';
	--DAR TODOS PRIVILEGIOS AO ADM
	GRANT ALL PRIVILEGES ON estacao TO fluffyapi; 
	GRANT ALL PRIVILEGES ON temperatura TO fluffyapi; 
	GRANT ALL PRIVILEGES ON preciptacao TO fluffyapi; 
	GRANT ALL PRIVILEGES ON pressao_atmosferica TO fluffyapi; 
	GRANT ALL PRIVILEGES ON radiacao_global TO fluffyapi; 
	GRANT ALL PRIVILEGES ON umidade TO fluffyapi; 
	GRANT ALL PRIVILEGES ON vento TO fluffyapi; 
