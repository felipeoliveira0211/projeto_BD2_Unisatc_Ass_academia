--Qual a idade dos alunos ativos e como isso pode ajudar a entender o perfil da academia?

CREATE FUNCTION dbo.fn_calcular_idade
(
    @data_nascimento DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @idade INT;

    SET @idade = DATEDIFF(YEAR, @data_nascimento, GETDATE());

    IF DATEADD(YEAR, @idade, @data_nascimento) > GETDATE()
        SET @idade = @idade - 1;

    RETURN @idade;
END;
GO
