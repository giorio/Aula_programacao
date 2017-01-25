var user = prompt("Você está indo em direção a um vale morto. A paisagem é repleta de árvores mortas, ao centro você vê uma torre, erguendo solitáriamente da terra em direção ao ceú. O que você vai fazer? Irá observar o ambiente (SEE), ir até a torre (GO), ou ir embora (RUN)!").toUpperCase();

switch(user){
	case 'SEE':
		var observar = prompt("Qual é o seu modificador total em observar");
		var ouvir = prompt("Qual é o seu modificador total em Ouvir")
		if (observar >= 20 && ouvir >= 20) {
			console.log("Você repara que a torre está no meio de cemitério e que sua parede externa possui ossos e ouve uns barulhos vindo por perto");
		} else if (observar >= 20 && ouvir < 20) {
			console.log("Você repara que a torre está no meio de cemitério e que sua parede externa possui ossos");
		} else if (observar < 20 && ouvir >= 20){
			console.log("Ouve uns barulhos vindo por perto");
		} else {
			console.log("Você é mais surdo que a velha surda da praça nossa e o Ceguinho vê mais coisa que você.");
		}
		break;
	case 'GO':
		var percepcao = prompt("Você verificou o ambiente, sim ou não?").toUpperCase();
		var forca = prompt("Seu grupo é forte?, sim ou não").toUpperCase();
		if (percepcao === "SIM" && forca === "SIM") {
			console.log("Você chega na torre sem muito trabalho!");
		} else if (percepcao === "SIM" || forca ==="SIM") {
			console.log("Você tem um trabalho enorme, mas chega na torre!");
		} else {
			console.log("Você é locou? Como um bando de fracote e cego tenta fazer uma travessia dessa? Você morreu.");
		}
		break;
	case 'RUN':
		console.log("Você corre igual a uma garota deixando a torre para longe.");
		break;
	default:
		console.log("Você tem certeza que selecionou uma opção valida? Segue uma dica: 'Não olhe para trá e não demore'");
}
