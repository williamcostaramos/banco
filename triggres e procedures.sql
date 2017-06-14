use venda;

create view v_vendas as
select v.idvenda, v.cliente, p.descricao,p.valor, iv.quant_item, iv.valor_venda
from venda v, item_venda iv, produto p where iv.idvenda = v.idvenda and iv.idproduto = p.idproduto; 



DELIMITER $

CREATE TRIGGER Tg_ItensVenda AFTER INSERT
ON item_venda
FOR EACH ROW
BEGIN
	UPDATE produto SET quant_estoque = quant_estoque - NEW.quant_item
WHERE idproduto = NEW.idproduto;
END$

CREATE TRIGGER Tg_ItensVenda AFTER DELETE
ON item_venda
FOR EACH ROW
BEGIN
	UPDATE produto SET quant_estoque = quant_estoque + OLD.quant_item
WHERE idproduto = OLD.idproduto;
END$

DELIMITER ;




DELIMITER $$

CREATE PROCEDURE selecionar_produtos(IN quantidade INT)
BEGIN
	SELECT * FROM produto
	LIMIT quantidade;
END $$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE selecionar_produtos(IN quantidade INT, IN nome VARCHAR)
BEGIN
	SELECT * FROM produto where descricao = nome
	LIMIT quantidade;
END $$
DELIMITER ;



call selecionar_produtos(1000);

insert into produto (descricao, valor, quant_estoque)values("Geladeira", 1500, 3);

insert into venda(idvenda,cliente, `data`)values(2 ,"WILLIAM RAMOS", '2017-08-15');

insert into item_venda(idvenda, idproduto, valor_venda, quant_item)values(2,1,4500, 3);

select * from v_vendas;
select * from produto;






