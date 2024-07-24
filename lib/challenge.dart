class Challenge {
  final String value;
  final bool all;
  final bool multiplo;
  final String? valueB;

  Challenge({
    required this.value,
    this.all = false,
    this.multiplo = false,
    this.valueB,
  });
}

List<Challenge> challenges = [
  Challenge(
    value: "Beba 3 goles!",
  ),
  Challenge(
    value: "Faça uma para nós. Faça!",
  ),
  Challenge(
    value: "Pode beber quando quiser.",
  ),
  Challenge(
    value: "Sortudo. Ganhou 2 gole-pass.",
  ),
  Challenge(
    value: "Qual é a maior estrela do nosso sistema solar? Se errar, beba 1 shot.",
  ),
  Challenge(
    value: "Beba um shot. Para parar de ser bobo!",
  ),
  Challenge(
    value: "Quem nasce no estado do Rio de Janeiro, é o quê? Se errar, beba 4 goles.",
  ),
  Challenge(
    value: "Tudo bem com você? Beba 2 goles.",
  ),
  Challenge(
    value: "Beba 1 shot de limão com sal!",
  ),
  Challenge(
    value: "Faça uma escolha. Se preferir não beber shots, beba 2 agora. Se preferir, mande alguém beber um shot.",
  ),
  Challenge(
    value: "Você e seus amigos bebem 3 goles.",
  ),
  Challenge(
    value:
        "Desafie alguém para jogar vira o copo, quem perder bebe 2 shots. Detalhes: 3 copos de cerveja cheios até a metade.",
  ),
  Challenge(
    value: "Conte algo que ninguém sabe. Se alguém souber, beba 3 goles.",
  ),
  Challenge(
    value: "Se seu copo estiver cheio, vire-o. Se não, quem estiver à sua direita bebe 4 goles.",
  ),
  Challenge(
    value: "Escolha a pessoa que você acha mais engraçada para beber um shot de tequila com você.",
  ),
  Challenge(
    value:
        "Escolha um jogador para ficar fora por 5 minutos, sem celular. O escolhido deve virar seu copo antes de sair.",
  ),
  Challenge(
    value: "Faça um gesto engraçado. Se ninguém achar engraçado, beba 4 goles.",
  ),
  Challenge(
    value: "Dance na boquinha da garrafa e escolha alguém para beber 2 goles.",
  ),
  Challenge(
    value: "Escolha as próximas 3 músicas.",
  ),
  Challenge(
    value: "Beba um copo d'água. Faz bem!",
  ),
  Challenge(
    value:
        "Escolha um apelido para o jogador à sua esquerda. Todos devem chamá-lo por esse nome até o fim do jogo. Quem falhar bebe 3 goles.",
  ),
  Challenge(
    value: "O que é o que é? Clara e salgada, cabe em um olho e pesa uma tonelada. Se errar, vire o copo.",
  ),
  Challenge(
    value: "Diga um defeito seu. Se a galera concordar, você ganha +5 gole-pass; caso contrário, beba-os.",
  ),
  Challenge(
    value: "Complete seu copo com água e beba tudo.",
  ),
  Challenge(
    value: "Beba 2 goles de cabeça para baixo.",
  ),
  Challenge(
    value: "Pode dar uma pausa de 10 minutos se quiser.",
  ),
  Challenge(
    value: "Não pode levantar da mesa por 20 minutos.",
  ),
  Challenge(
    value: "Escolha alguém para te beijar agora. Se ninguém quiser, você deve beber 1 shot.",
  ),
  Challenge(
    value: "Tente fazer alguém dar risada. Quem rir bebe 3 goles; caso contrário, beba você mesmo.",
  ),
  Challenge(
    value: "Diga um elogio ou faça um gesto engraçado. Quem rir bebe 4 goles.",
  ),
  Challenge(
    value: "Diga o nome de 10 capitais em 20 segundos ou vire seu copo.",
  ),
  Challenge(
    value: "Escolha alguém para beber 2 shots no seu umbigo.",
  ),
  Challenge(
    value: "Nessa cerveja tem muito copo. Escolha alguém para virá-la.",
  ),
  Challenge(
    value: "Sortudo, agora você pode beber quando quiser.",
  ),
  Challenge(
    value:
        "Anote um número de 0 a 9, escolha alguém para adivinhar. Se a pessoa acertar, você bebe o número em goles. Se errar, você ganha o número em gole-pass.",
  ),
  Challenge(
    value: "Qual é a cor do 'S' da Perdigão? Se errar, beba 6 goles.",
  ),
  Challenge(
    value: "Verdade ou consequência? Escolha sabiamente.",
  ),
  Challenge(
    value: "Mostre seu histórico de buscas.",
  ),
  Challenge(
    value: "Beba um copo de soro caseiro.",
  ),
  Challenge(
    value: "Fique tranquilo, não precisa beber nada.",
  ),
  Challenge(
    value: "Quem bebeu a roupa do rei de Roma? Valendo 4 goles.",
  ),
  Challenge(
    value: "Faça uma dança ou beba 4 goles.",
  ),
  Challenge(
    value: "Coma um dente de alho ou tome 1 shot.",
  ),
  Challenge(
    value: "Sortudo, não precisa beber nenhum shot durante o jogo todo.",
  ),
  Challenge(
    value: "Conte uma história engraçada que você já fez. A galera julga se vale ou não. Valendo 6 goles.",
  ),
  Challenge(
    value: "Experimente misturar Coca-Cola com cerveja.",
  ),
  Challenge(
    value: "Parabéns! Ganhou 2 gole-pass! Agora mande alguém tomar 1 shot.",
  ),
  Challenge(
    value: "Encha seu copo e adicione uma dose de álcool (aconselho tequila + sal).",
  ),
  Challenge(
    value: "Troque seu copo por um copo d'água.",
  ),
  Challenge(
    value: "Se você for solteiro, escolha outro solteiro para sentar no seu colo por 2 minutos.",
  ),
  Challenge(
    value: "Qual é o animal que nunca anda sozinho? Quando saem para passear?",
  ),
  Challenge(
    value: "Conte os números ímpares até 31 em 15 segundos ou beba 3 goles.",
  ),
  Challenge(
    value: "Dance se você tiver disposição; se não, beba 5 goles.",
  ),
  // ALL
  Challenge(
    value: "Quem só fala uma língua vira o copo.",
    all: true,
  ),
  Challenge(
    value: "Solteiros bebem 3 goles.",
    all: true,
  ),
  Challenge(
    value: "Comigo é assim, não sei com vocês. Bebam 3 goles.",
    all: true,
  ),
  Challenge(
    value: "Quem beber primeiro paga uma bebida para todos.",
    all: true,
  ),
  Challenge(
    value: "O mais animado da mesa bebe 4 goles.",
    all: true,
  ),
  Challenge(
    value: "O mais calmo da mesa bebe 4 goles.",
    all: true,
  ),
  Challenge(
    value: "Vocês venceram na loteria. Todos bebem um shot.",
    all: true,
  ),
  Challenge(
    value: "Quem tem filhos bebe um shot por filho.",
    all: true,
  ),
  Challenge(
    value: "Quem não tem filhos bebe o tanto que quiser.",
    all: true,
  ),
  Challenge(
    value: "Casados bebem 3 goles.",
    all: true,
  ),
  Challenge(
    value: "Se sua idade for um número par, beba 4 goles.",
    all: true,
  ),
  Challenge(
    value: "Quem vestir uma peça de roupa extra até o fim do jogo ganha um drink de cada jogador na próxima balada.",
    all: true,
  ),
  Challenge(
    value:
        "Divida o dia do seu aniversário pelo mês. Se o resultado for menos de 2, beba um gole. Caso contrário, ganhe 2 gole-pass.",
    all: true,
  ),
  Challenge(
    value: "Escolha quem come mais na mesa. O 'esfomeado' deve comer tudo que tiver em cima da mesa ou beber 2 shots.",
    all: true,
  ),
  Challenge(
    value: "Quem peidar primeiro ganha +2 gole-pass.",
    all: true,
  ),
  Challenge(
    value: "Todos bebem tudo o que tiver na mesa (sem derramar). Quem beber menos paga (vai lá comprar) 8 latas.",
    all: true,
  ),
  Challenge(
    value: "Joguem até alguém errar. Quem perder vira o copo.",
    all: true,
  ),
  Challenge(
    value: "Por conta da casa. Todos encham seus copos.",
    all: true,
  ),
  Challenge(
    value: "Quem escreve com a mão esquerda bebe 4 goles.",
    all: true,
  ),
  Challenge(
    value: "Todos bebem.",
    all: true,
  ),
  Challenge(
    value: "Todos fazem um elogio.",
    all: true,
  ),
  Challenge(
    value: "Mulheres bebem.",
    all: true,
  ),
  Challenge(
    value: "Homens bebem.",
    all: true,
  ),
  Challenge(
    value: "Quem tocar no celular bebe 2 shots.",
    all: true,
  ),
  Challenge(
    value: "Fumantes bebem 3 goles.",
    all: true,
  ),
  Challenge(
    value: "Quem já fumou maconha bebe 3 goles.",
    all: true,
  ),
  Challenge(
    value: "Quem já usou substâncias ilícitas bebe 4 goles.",
    all: true,
  ),
  Challenge(
    value: "Quem não é respeitoso não tem vez. Beba 1 shot.",
    all: true,
  ),
  Challenge(
    value: "Em festa só para mulheres, as garotas gritam 'segura aí' e viram seus copos.",
    all: true,
  ),
  Challenge(
    value: "Cada um mete o dedo no copo à sua direita.",
    all: true,
  ),
  // MULTIPLO
  Challenge(
    value: "Agora é o ajudante de ",
    valueB: " por 10 minutos.",
    multiplo: true,
  ),
  Challenge(
    value: "Chupe o dedo de ",
    valueB: " ou beba 4 goles.",
    multiplo: true,
  ),
  Challenge(
    value: "Lambe o braço de ",
    valueB: " ou beba 1 shot.",
    multiplo: true,
  ),
  Challenge(
    value: "Vire o copo de ",
    valueB: "",
    multiplo: true,
  ),
  Challenge(
    value: "Adesso toca a Plinio. ",
    valueB: " Beba 4 goles.",
    multiplo: true,
  ),
  Challenge(
    value: "Desafie ",
    valueB: " para ver quem consegue encarar o outro por mais tempo. Quem perder bebe 1 shot.",
    multiplo: true,
  ),
  Challenge(
    value: "Pegue o próximo desafio de ",
    valueB: "",
    multiplo: true,
  ),
  Challenge(
    value: "Pense em uma cor primária. ",
    valueB: " Tente adivinhar a cor. Quem perder bebe dois goles, quem ganhar recebe +2 gole-pass.",
    multiplo: true,
  ),
  Challenge(
    value: "Doe seus gole-pass para ",
    valueB: " e vire seu copo.",
    multiplo: true,
  ),
  Challenge(
    value: "Escolha alguém para virar o copo de ",
    valueB: ". E vá pagar uma bebida para todos.",
    multiplo: true,
  ),
];
