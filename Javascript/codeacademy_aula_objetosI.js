//(((3 * 90) === 270) || !(false && (!false)) || "bex".toUpperCase() === "BEX"); como estava

var answer = ((3 * 90) === 270);
var verNo = !(false && (!false));
var txt = bex;

console.log(answer, verNo, txt.toUpperCase());

// Aqui está um array de múltiplos de 8. Mas ele está correto?
var multiplesOfEight = [8,16,24,32,40,58];

// Teste para ver se um número da array NÃO é um múltiplo de oito
// de verdade. Múltiplos reais retornarão falsos.
var answer = multiplesOfEight[5] % 8 !== 0;
console.log(answer);

var num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

for (var i = 0; i <= 19; i++) {
	if (num[i] % 3 === 0 && num[i] % 5 !== 0) {
		console.log("Fizz");
	} else if (num[i] % 3 !== 0 && num[i] % 5 === 0) {
		console.log("Buzz");
	} else if (num[i] % 3 === 0 && num[i] % 5 === 0){
		console.log("FizzBuzz");
	} else {
		console.log(num[i]);
	}
};

var getReview = function(movie) {
	switch(movie){
			case 'Toy Story 2':
				return "Grande história. Mineiro ruim.";
				break;
			case 'Procurando Nemo':
				return "Animação legal e tartarugas engraçadas.";
				break;
			case 'O Rei Leão':
				return "Grandes músicas.";
				break;
			default:
				return "Eu não sei!";
		}
};

getReview("O Rei Leão");

var bob = {};

var me = {
	age: 29,
	country: "Brasil"
};

var bob = {
  name: "Bob Smith",
  age: 30
};
var susan = {
  name: "Susan Jordan",
  age: 25
};
// aqui salvamos as informacoes de Bob
var name1 = bob.name;
var age1 = bob.age;
// finalize este codigo salvando as informacoes de Susan
var name2 = susan.name;
var age2 = susan.age;

// De uma olhada no nosso proximo exemplo de objeto, um cachorro
var dog = {
  species: "sabujo",
  weight: 60,
  age: 4
};

var species = dog["species"];
// preencha o codigo para salvar o peso e idade usando notacao de colchetes
var weight = dog["weight"];
var age = dog["age"];

// Seu objeto bob novamente, mas criado usando um construtor dessa vez 
var bob = new Object();
bob.name = "Bob Smith";
bob.age = 30;
// Aqui esta susan1, em notacao literal
var susan1 = {
  name: "Susan Jordan",
  age: 24
};
// Crie um novo objeto susan2, usando um construtor
var susan2 = new Object();
	susan2.name = "Susan Jordan";
	susan2.age = 24;

// Nos ajude a criar snoopy usando notacao literal
// Lembre-se que snoopy e um "beagle" com 10 anos de idade.
var snoopy = {
	species: "beagle",
	age: 10
};

// ajude a ceirar buddy usando notacao de construtor
// buddy e um "golden retriever" com 5 anos de idade
var buddy = new Object();
	buddy.species = "golden retriever";
	buddy.age = 5;

var bicycle = new Object();
	bicycle.speed = 0;
	bicycle.gear = 1;
	bicycle.frame_material = "carbon fiber";

// Aceita um numero x como entrada e retorna seu quadrado
var square = function (x) {
  return x * x;
};

// Escreva a funcao multiply abaixo
// Ela deve tomar dois parametros e retornar o produto

var multiply = function(x, y){
	return x * y;
};

multiply(4,2);

// aqui esta bob de novo, com suas propriedades costumeiras
var bob = new Object();
bob.name = "Bob Smith";
bob.age = 30;
// seta vez adicionamos um metodo, setAge
bob.setAge = function (newAge){
  bob.age = newAge;
};
// aqui atribuimos 40 a idade de bob
bob.setAge(40);
// bob esta se sentindo velho. Use nosso metodo para atribuir 20 a idade de bob
bob.setAge(20);
/*Atividade 17*/
// aqui definimos nosso metodo usando "this", antes mesmo de apresentarmos bob
var setAge = function (newAge) {
  this.age = newAge;
};
// agora criamos bob
var bob = new Object();
bob.age = 30;
// e aqui simplesmente usamos o metodo que ja criamos
bob.setAge = setAge;
  
// mude aqui a idade de bob para 
bob.setAge(50);

// aqui definimos nosso metodo usando "this", antes mesmo de apresentarmos bob
var setAge = function (newAge) {
  this.age = newAge;
};
// agora criamos bob
var bob = new Object();
bob.age = 30;
bob.setAge = setAge;
  
// crie susan aqui, e primeiros demos a ela uma idade de 25
var susan = new Object();
	susan.age = 25;
	susan.setAge = setAge;
// aqui, atualize a idade de Susan para 35 usando o metodo
	susan.setAge(35);
/*Atividade 18*/
var rectangle = new Object();
rectangle.height = 3;
rectangle.width = 4;
// aqui esta nosso metodo para definir a altura
rectangle.setHeight = function (newHeight) {
  this.height = newHeight;
};
// ajude finalizando este metodo
rectangle.setWidth = function(newWidth){
	this.width = newWidth;
};
// aqui, mude a largura para 8 e a altura para 6 usando nossos novos metodos
rectangle.setHeight(6);
rectangle.setWidth(8);
/*Atividade 19*/
var square = new Object();
square.sideLength = 6;
square.calcPerimeter = function() {
  return this.sideLength * 4;
};
// nos ajude a definir um método de area aqui
square.calcArea = function() {
	return this.sideLength * this.sideLength;
};
var p = square.calcPerimeter();
var a = square.calcArea();
/*Atividade 20*/
// aqui criamos bob usando o construtor Object
var bob = new Object();
bob.name = "Bob Smith";
// adicione a idade de bob aqui e iguale-a a 20
bob.age = 20;
/*Atividade 21*/
function Person(name,age) {
  this.name = name;
  this.age = age;
}

// Vamos criar bob e susan novamente, usando nosso construtor
var bob = new Person("Bob Smith", 30);
var susan = new Person("Susan Jordan", 25);
// ajude-nos a criar george, cujo nome e "George Washington" e idade e 275
var george = new Person("George Washington", 275);
/*Atividade 22*/
function Cat(age, color) {
  this.age = age;
  this.color = color;
}

// crie um construtor Dog aqui
function Dog(nome, raca) {
	this.nome = nome;
	this.raca = raca;
};
/*Atividade 23*/
function Person(name,age) {
  this.name = name;
  this.age = age;
  this.species = "Homo Sapiens";
}

var sally = new Person("Sally Bowles", 39);
var holden = new Person("Holden Caulfield", 16);
console.log("a espécie de sally é " + sally.species + " e a idade dela é " + sally.age);
console.log("a espécie de holden é " + holden.species + " e a idade dele é " + holden.age);
/*Atividade 24*/
function Rectangle(height, width) {
  this.height = height;
  this.width = width;
  this.calcArea = function() {
      return this.height * this.width;
  };
  // coloque sua função de cálculo do perimetro aqui!
  	this.calcPerimeter = function() {
		return (2 * this.height) + (2 * this.width);
  	}
}

var rex = new Rectangle(7,3);
var area = rex.calcArea();
var perimeter = rex.calcPerimeter();

console.log("O perimetro é " + perimeter + " e a área é " + area + " para o retangulo com valores " + rex.height +", " + rex.width);
/*Atividade 25*/
function Rabbit(adjective) {
    this.adjective = adjective;
    this.describeMyself = function() {
        console.log("Eu sou um " + this.adjective + " coelho");
    };
}

// agora podemos fazer facilmente todos os nossos coelhos

var rabbit1 = new Rabbit("fofinho");
var rabbit2 = new Rabbit("alegre");
var rabbit3 = new Rabbit("sonolento");
/*Atividade 26*/
// Nosso construtor person
function Person (name, age) {
    this.name = name;
    this.age = age;
}

// Agora, podemos fazer um array de pessoas
var family = new Array();
family[0] = new Person("alice", 40);
family[1] = new Person("bob", 42);
family[2] = new Person("michelle", 8);
// acrescente o último membro da família, "timmy", que tem 6 anos de idade
family[3] = new Person("timmy", 6);
/*Atividade 27*/
function Person(name, age) {
	this.name = name;
	this.age = age;
}

var family = new Array();
family[0] = new Person("alice", 40);
family[1] = new Person("bob", 42);
family[2] = new Person("michelle", 8);
family[3] = new Person("timmy", 6);

for (var i = 0; i >= 3; i++) {
	console.log(family[i].name);
}
/*Atividade 28*/
// Nosso construtor person
function Person (name, age) {
    this.name = name;
    this.age = age;
}

// Podemos fazer uma função que toma pessoas como argumentos
// Esta computa a diferença de idade entre duas pessoas
var ageDifference = function(person1, person2) {
    return person1.age - person2.age;
}

var alice = new Person("Alice", 30);
var billy = new Person("Billy", 25);

// obtenha a diferença de idade entre alice e billy usando nossa função
var diff = ageDifference(alice,billy);
/*Atividade 29*/
// Nosso construtor person
function Person (name, age) {
    this.name = name;
    this.age = age;
}

// Podemos fazer uma função que toma pessoas como argumentos
// Esta computa a diferença de idades entre duas pessoas
var ageDifference = function(person1, person2) {
    return person1.age - person2.age;
};

// Faça uma nova função, olderAge, para retornar a idade da
// mais velha das duas pessoas
var olderAge =function(person1, person2) {
	if (person1.age > person2.age) {
		return person1.age;
	} else {
		return person2.age;
	}
}

// Vamos trazer alice e billy de volta para testar nossa nova função
var alice = new Person("Alice", 30);
var billy = new Person("Billy", 25);

console.log("A idade da pessoa mais velha é " + olderAge(alice, billy));
/*Atividade 30*/
var spencer = {
  age: 22,
  country: "United States"
};

// crie spencer2 aqui com notação de construtor
var spencer2 = new Object();
	spencer2.age = 22;
	spencer2.country = "United States";

/*Atividade 31*/
var snoopy = new Object();
snoopy.species = "beagle";
snoopy.age = 10;

// salvar a idade e a espécie de Snoopy em variáveis
// usar dot notation para a espécie de snoopy
var species = snoopy.species;
    
// usar bracket notation para a idade de snoopy
var age = snoopy['age'];
/*Atividade 32*/
// 3 linhas necessarias para criar harry_potter
var harry_potter = new Object();
harry_potter.pages = 350;
harry_potter.author = "J.K. Rowling";

// Um construtor personalizado para book
function Book (pages, author) {
    this.pages = pages;
    this.author = author;
}

// Use nosso novo construtor para criar the_hobbit em uma linha
var the_hobbit = new Book(320, "J.R.R. Tolkien");
/*Atividade 33*/
function Circle (radius) {
    this.radius = radius;
    this.area = function () {
        return Math.PI * this.radius * this.radius;
        
    };
    // defina um método para cálculo do perimetro aqui
	this.perimeter = function () {
		return (2 * Math.PI * this.radius);
	};
}
