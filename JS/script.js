let jogadores = [];

fetch("API/jogadores.php")
    .then(response => response.json())
    .then(dados => {

        jogadores = dados;

        carregarTabela(jogadores);
        atualizarCards(jogadores);
        carregarFiltroSelecoes(jogadores);

    })
    .catch(erro => console.error(erro));

function carregarTabela(listaJogadores) {

    const tabela = document.getElementById("tabelaJogadores");

    tabela.innerHTML = "";

    listaJogadores.forEach(jogador => {

        let bandeira = "";

        switch (jogador.Selecao) {

            case "Brasil":
                bandeira = "";
                break;

            case "França":
                bandeira = "";
                break;

            case "Espanha":
                bandeira = "";
                break;

            case "Inglaterra":
                bandeira = "";
                break;

            default:
                bandeira = "🌍";

        }

        tabela.innerHTML += `
            <tr>
                <td>${jogador.JogadorId}</td>
                <td>${jogador.Nome}</td>
                <td>${jogador.Clube}</td>
                <td>${bandeira} ${jogador.Selecao}</td>
                <td>€ ${Number(jogador.ValorMercado).toLocaleString("pt-BR")}</td>
                <td>${jogador.Gols}</td>
                <td>${jogador.Assistencias}</td>
            </tr>
        `;

    });

}

function atualizarCards(listaJogadores) {

    document.getElementById("totalJogadores").textContent = listaJogadores.length;

    let gols = 0;
    let assistencias = 0;
    let valorMercado = 0;

    listaJogadores.forEach(jogador => {

        gols += Number(jogador.Gols);
        assistencias += Number(jogador.Assistencias);
        valorMercado += Number(jogador.ValorMercado);

    });

    document.getElementById("totalGols").textContent = gols;

    document.getElementById("totalAssistencias").textContent = assistencias;

    document.getElementById("valorMercado").textContent =
        valorMercado.toLocaleString("pt-BR", {
            style: "currency",
            currency: "EUR"
        });

}

function carregarFiltroSelecoes(listaJogadores) {

    const filtro = document.getElementById("filtroSelecao");

    filtro.innerHTML = `<option value="">Todas as Seleções</option>`;

    const selecoes = [...new Set(listaJogadores.map(j => j.Selecao))];

    selecoes.sort();

    selecoes.forEach(selecao => {

        const option = document.createElement("option");

        option.value = selecao;

        option.textContent = selecao;

        filtro.appendChild(option);

    });

}

const pesquisa = document.getElementById("pesquisa");

const filtroSelecao = document.getElementById("filtroSelecao");

pesquisa.addEventListener("input", aplicarFiltros);

filtroSelecao.addEventListener("change", aplicarFiltros);

function aplicarFiltros() {

    const texto = pesquisa.value.toLowerCase();

    const selecao = filtroSelecao.value;

    const resultado = jogadores.filter(jogador => {

        const correspondePesquisa =

            jogador.Nome.toLowerCase().includes(texto) ||

            jogador.Clube.toLowerCase().includes(texto) ||

            jogador.Selecao.toLowerCase().includes(texto);

        const correspondeSelecao =

            selecao === "" ||

            jogador.Selecao === selecao;

        return correspondePesquisa && correspondeSelecao;

    });

    carregarTabela(resultado);

    atualizarCards(resultado);

}

const botaoTema = document.getElementById("tema");

botaoTema.addEventListener("click", () => {

    document.body.classList.toggle("light");

});