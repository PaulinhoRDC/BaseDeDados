Use `uminhoentregas`;

CREATE INDEX idxClienteNIF 
	ON encomenda (cliente_id);
    
CREATE INDEX idxFuncionarioID
	ON encomenda (funcionario_id);
    
CREATE INDEX idxEstadoEncomenda
	ON encomenda (Estado);
    
-- DROP INDEX idxClienteNIF  ON encomenda;
-- DROP INDEX idxFuncionarioID ON encomenda;
-- DROP INDEX idxEstadoEncomenda ON encomenda;