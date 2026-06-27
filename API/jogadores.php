<?php

require_once __DIR__ . "/../CONFIG/conexao.php";

$sql = "
SELECT
    j.JogadorId,
    j.Nome,
    j.Clube,
    j.ValorMercado,
    j.Gols,
    j.Assistencias,
    s.Nome AS Selecao,
    s.Grupo
FROM Jogadores j
INNER JOIN Selecoes s
ON j.SelecaoId = s.SelecaoId
";

$resultado = $conn->query($sql);

$dados = [];

while ($linha = $resultado->fetch_assoc()) {
    $dados[] = $linha;
}

header("Content-Type: application/json");

echo json_encode($dados, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);