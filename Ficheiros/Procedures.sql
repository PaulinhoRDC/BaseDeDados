DELIMITER $$
CREATE PROCEDURE `visualizarClientes` ()
BEGIN
	SELECT * FROM cliente;
END $$

DELIMITER $$
CREATE PROCEDURE `visualizarFuncionarios` ()
BEGIN
	SELECT * FROM funcionario;
END $$

DELIMITER $$
CREATE PROCEDURE `visualizarVeiculos` ()
BEGIN
	SELECT * FROM veiculo;
END $$

DELIMITER $$
CREATE PROCEDURE `visualizarEncomenda` ()
BEGIN
	SELECT * FROM encomenda;
END $$

call visualizarClientes();
call visualizarFuncionarios();
call visualizarVeiculos();
call visualizarEncomenda();
