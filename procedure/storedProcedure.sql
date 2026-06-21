DELIMITER $$

CREATE PROCEDURE sp_vender_plano(
    IN p_id_aluno INT,
    IN p_id_plano INT,
    IN p_id_func_venda INT
)
BEGIN
    DECLARE v_valor_mensal DECIMAL(10,2);
    DECLARE v_duracao_meses TINYINT;
    DECLARE v_id_assinatura INT;
    DECLARE v_data_vencimento DATE;

    -- Busca o valor e a duração do plano escolhido
    SELECT valor_mensal, duracao_meses 
    INTO v_valor_mensal, v_duracao_meses
    FROM planos 
    WHERE id = p_id_plano;

    -- Insere a nova assinatura (Inicia hoje)
    INSERT INTO assinaturas (
        id_aluno, id_plano, id_funcionario_venda,
        data_inicio, status_assinatura, renovacao_automatica
    ) VALUES (
        p_id_aluno, p_id_plano, p_id_func_venda,
        CURRENT_DATE(), 'A', 1
    );

    -- Pega o ID da assinatura que acabou de ser gerada
    SET v_id_assinatura = LAST_INSERT_ID();

    -- Define o vencimento da primeira fatura para daqui a 5 dias (exemplo)
    SET v_data_vencimento = DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY);

    -- Gera a primeira fatura de pagamento para essa assinatura
    INSERT INTO faturas_pagamento (
        id_assinatura, data_vencimento, valor_fatura, 
        status_pagamento, mes_referencia, ano_referencia
    ) VALUES (
        v_id_assinatura, v_data_vencimento, v_valor_mensal, 
        'P', MONTH(CURRENT_DATE()), YEAR(CURRENT_DATE())
    );

END$$

DELIMITER ;