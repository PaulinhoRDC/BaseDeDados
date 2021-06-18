Use `uminhoentregas`;

CREATE USER 'SrManuel'@'localhost' IDENTIFIED BY 'gerenteUminhoEntregas';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'UminhoEntregas2020';

GRANT SELECT,UPDATE ON uminhoentregas.* TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE insereCliente TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE insereFuncionario TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE insereEncomenda TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE insereVeiculo TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE insereContacto TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE insereUtiliza TO 'SrManuel'@'localhost';
GRANT EXECUTE ON FUNCTION calculaValor TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE visualizarClientes TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE visualizarFuncionarios TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE visualizarEncomenda TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE visualizarVeiculos TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE encomendasDeCliente TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE encomendasEntreguesPorFuncionario TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE valorPendenteCliente TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE top3Clientes TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE desempenhoDosFuncionariosNoDia TO 'SrManuel'@'localhost';
GRANT EXECUTE ON PROCEDURE utilizacaoVeiculos TO 'SrManuel'@'localhost';

GRANT UPDATE (Estado) ON uminhoentregas.encomenda TO 'funcionario'@'localhost';
GRANT EXECUTE ON PROCEDURE visualizarEncomenda TO 'funcionario'@'localhost';
GRANT SELECT ON uminhoentregas.contacto TO 'funcionario'@'localhost';
