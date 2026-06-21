DELIMITER $$

CREATE TRIGGER tr_cancelar_assinatura_data_fim
BEFORE UPDATE ON assinaturas
FOR EACH ROW
BEGIN
    -- Verifica se o motivo de cancelamento mudou de NULL para um valor válido
    IF NEW.id_motivo_cancelamento IS NOT NULL AND OLD.id_motivo_cancelamento IS NULL THEN
        -- Define a data de fim como a data atual
        SET NEW.data_fim = CURRENT_DATE();
        
        -- Opcional: Garante que o status também muda para Inativo 'I'
        SET NEW.status_assinatura = 'I';
    END IF;
END$$

DELIMITER ;