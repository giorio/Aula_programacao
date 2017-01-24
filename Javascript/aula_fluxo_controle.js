var isEven = function(number) {
  // Seu código vai aqui!
  if (number % 2 === 0) {
  	return true
  } else {
  	return false
  }
};

isEven(10);

var isEven = function(number) {
	if (number % 2 === 0) {
		return true
	} else if (isNaN(number)) {
		return "A variável informada não é um número!"
	}
};

isEven("Gustavo");

for (var i = 1000; i >= 5 ; i -= 125) {
	console.log(i);
}

var color = prompt("Qual e sua cor primaria favorita?","Digite sua cor favorita aqui");

switch(color) {
 	case 'vermelho':
		console.log("Vermelho é uma boa cor!");
    	break;
  	case 'azul':
    	console.log("Essa é minha cor favorita tambem!");
    	break;
  	//Adicione seu caso aqui!
    case 'Amarelo':
    	console.log("Essa cor é do amarelão!");
  
  	default:
    	console.log("Eu nao acho que essa seja uma cor primária!");
}

var candy = prompt("Qual e seu doce favorito?","Digite seu doce favorito aqui.");

switch(candy) {
	case 'alcacuz':
	   	console.log("Credo!");
	    break;
	case 'chiclete':
	    console.log("Eu gosto de chiclete!");
	    break;
	  case 'beterraba':
	    console.log("isso... é um doce?");
	    break;
	// Adicione seu codigo aqui!
  	default:
  		console.log("Você tem certeza que isso é um doce?");
}

var answer = prompt("Qual o seu jogo de PS4 favorito?","Digite seu jogo favorito aqui");

switch(answer) {
 	case 'destiny':
   		console.log("Você gosta de repetir ação, mas é um bom FPS");
   		break;
   	case 'FIFA', 'PES':
   		console.log("Você é louco?");
   		break;
   	case 'COD':
   		console.log('Você tem 1 minuto para a palavra do viajante?');
   		break;
   	case 'FF', 'Dragonborn', 'RPG', 'Dragon Age':
   		console.log("Também acho, mas Você tem tempo para eles?");
   		break;
   	default:
   		console.log("tem certeza que isso é jogavel?");
}

// Declare suas variáveis aqui!
var hungry = true;
var foodHere = true;
var eat = function() {
	// Adicione sua declaração if/else aqui!
	if (hungry && foodHere === true) {
		return true;
	} else {
		return false;
	}
};

// Declare suas variaveis aqui
var tired = false;
var bored = true;

var nap = function() {
	// Adicione sua declaracao if/else aqui!
	if (tired || bored) {
		return true;
	} else {
		return false;
	}
};

// Declare sua variaveis aqui!
var programming = false;

var happy = function() {
	// Adicione sua declaracao if/else aqui!
	if (!programming) {
		return true;
	} else {
		return false;
	}
};
