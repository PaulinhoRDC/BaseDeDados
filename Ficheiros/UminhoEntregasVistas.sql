Use `uminhoentregas`;

CREATE VIEW vwInfoFatura AS
	SELECT encomenda.id , encomenda.ValorFatura , encomenda.DataFatura FROM encomenda;

CREATE VIEW vwMedias AS
	SELECT AVG(encomenda.peso) AS MediaPeso , AVG(encomenda.taxa) AS MediaTaxa , AVG(encomenda.ValorFatura) AS MediaValorFatura FROM encomenda;

-- DROP VIEW vwInfoFatura;
-- SELECT * FROM vwInfoFatura;

-- DROP VIEW vwMedias;
-- SELECT * FROM vwMedias;