CREATE TRIGGER tr_cancelar_assinatura_data_fim
ON assinaturas
AFTER UPDATE
AS
BEGIN

    UPDATE a
    SET 

        a.data_fim = GETDATE(),

        a.status_assinatura = 'I'
    FROM assinaturas a
    INNER JOIN inserted i ON a.id = i.id
    INNER JOIN deleted d ON d.id = i.id

    WHERE i.id_motivo_cancelamento IS NOT NULL
      AND d.id_motivo_cancelamento IS NULL;
END

