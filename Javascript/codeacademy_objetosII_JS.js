/*Atividade 01*/
	var james = {
	    // adicione propriedades a este objeto!
	    job: "programador",
	    married: false
	};

	function Person(job, married) {
	    this.job = job;
	    this.married = married;
	}

	// crie um objeto "gabby" usando o construtor Person!

	var gabby = new Person("estudante", true);

/*Atividade 02*/

	function Person(job, married) {
	    this.job = job;
	    this.married = married;
	    // adicione um metodo "speak" a Person!
	    this.speak = function speak() {
	    	console.log("Alô!");
	    };
	}

	var user = new Person("Aluno da Codecademy",false);
	user.speak();

/*Atividade 03*/

	var james = {
	    job: "programador",
	    married: false,
	    speak: function(strig) {
	        console.log("Alô, estou me sentindo " + strig);
	    }
	};

	james.speak("ótimo");
	james.speak("bem");

/*Atividade 04*/

	var james = {
	    job: "programador",
	    married: false,
	    sayJob: function() {
	        // complete este metodo
	        console.log("Oi, sou um " + this.job);
	    }
	};

	// primeiro emprego de james
	james.sayJob();

	// mude o emprego de james para "super programador" aqui
	james.job = "Super programador";

	// segundo emprego de james
	james.sayJob();

/*Atividade 05*/

	var james = {
	    job: "programador",
	    married: false
	};

	// iguale a primeira propriedade de "james"
	var aProperty = "job"

	// exiba o valor da primeira propriedade de  "james" 
	// usando a variavel "aProperty"

	console.log(james[aProperty]);

/*Atividade 06*/

	// complete essas definições para que tenham
	// os tipos apropriados
	var anObj = { job: "Sou um objeto!" };
	var aNumber = 42;
	var aString = "Sou uma string!";

	console.log(typeof anObj); // irá imprimir "object"
	console.log(typeof aNumber); // irá imprimir "number"
	console.log(typeof aString); // irá imprimir "string"

/*Atividade 07*/

	var myObj = {
	    // preencha com propriedades myObj
	    name: "name"
	};

	console.log( myObj.hasOwnProperty('name') ); // deve exibir true
	console.log( myObj.hasOwnProperty('nickname') ); // deve exibir false

/*Atividade 08*/

	var suitcase = {
	    shirt: "Hawaiano"
	};

	if (suitcase.hasOwnProperty('shorts')) {
		console.log(suitcase.shorts);
	} else {
		suitcase.shorts = "Militar";
		console.log(suitcase.shorts);
	}

/*Atividade 09*/

	var nyc = {
	    fullName: "Nova York",
	    mayor: "Bill de Blasio",
	    population: 8000000,
	    boroughs: 5
	};

	for (var property in nyc) {
		console.log(property);
	}

/*Atividade 10*/

	var nyc = {
	    fullName: "Nova York",
	    mayor: "Bill de Blasio",
	    population: 8000000,
	    boroughs: 5
	};

	// escreva um laço for-in para exibir o valor das propriedades de nyc

	for (var property in nyc) {
		console.log(nyc[property]);
	}

/*Atividade 11*/

	function Person(name,age) {
	  this.name = name;
	  this.age = age;
	}

	// Vamos criar bob novamente, usando nosso construtor
	var bob = new Person("Bob Smith", 30);
	var susan = new Person("Susan Jordan", 35);

	// crie sua própria classe aqui

	function Circle(radius) {
		this.radius = radius;
	}

	var circulo = new Circle(30);

/*Atividade 12*/

	function Dog (breed) {
	  this.breed = breed;
	}

	// aqui criamos buddy e o ensinamos a latir
	var buddy = new Dog("Golden Retriever");
	buddy.bark = function() {
	  console.log("Au");
	};
	buddy.bark();

	// aqui criamos snoopy
	var snoopy = new Dog("Beagle");
	// precisamos que voce ensine snoopy a latir aqui
	snoopy.bark = function(){
		console.log("Au");
	};
	// isso causa um erro, porque snoopy nao sabe latir!
	snoopy.bark();

/*Atividade 13*/

	function Person(name,age) {
	  this.name = name;
	  this.age = age;
	}
	// uma função que exibe o nome de qualquer pessoa
	var printPersonName = function (p) {
	  console.log(p.name);
	};

	var bob = new Person("Bob Smith", 30);
	printPersonName(bob);

	// crie uma pessoa chamada "me" com seu nome e idade
	// então, use printPersonName para exibir seu nome

	var me = new Person("Gustavo Di Iorio", 29);
	printPersonName(me);

/*Atividade 15*/

	function Cat(name, breed) {
	    this.name = name;
	    this.breed = breed;
	}

	// vamos criar algusn gatos!
	var cheshire = new Cat("Cheshire", "Britanico de pelo curto");
	var gary = new Cat("Gary", "Domestico de pelo curto");

	// adicione um metodo "meow" a classe Cat que permitira
	// a todos os gatos exibir "Meow!" no console
	Cat.prototype.meow = function(){
		console.log("Miau!");
	}
	// adicione código aqui para fazer os gatos miarem!

	cheshire.meow();
	gary.meow();

/*Atividade 16*/

	// crie aqui sua classe Animal
	function Animal(name, numLegs) {
		this.name = name;
		this.numLegs = numLegs;
	}
	// crie o metodo sayName method para Animal
	Animal.prototype.sayName = function() {
		console.log("Oi, meu nome é " + this.name)
	}
	// codigo fornecido para testar o construtor e metodo acima
	var penguin = new Animal("Capitão Cook", 2);
	penguin.sayName();

/*Atividade 17*/

	function Animal(name, numLegs) {
	    this.name = name;
	    this.numLegs = numLegs;
	}
	Animal.prototype.sayName = function() {
	    console.log("Oi, meu nome é " + this.name);
	};


	// crie aqui um construtor Penguin
	function Penguin (name, numLegs) {
		this.name = name;
		this.numLegs = numLegs;
	}
	// crie aqui um metodo sayName para Penguins
	Penguin.prototype.sayName = function() {
		console.log("Oi, meu nome é " + this.name);
	};

	// our test code
	var theCaptain = new Penguin("Capitão Cook", 2);
	theCaptain.sayName();

/*Atividade 18*/

	// a classe Animal e método sayName originais
	function Animal(name, numLegs) {
	    this.name = name;
	    this.numLegs = numLegs;
	}
	Animal.prototype.sayName = function() {
	    console.log("Oi, meu nome é" + this.name);
	};

	// defina uma classe Penguin
	function Penguin (name) {
		this.name = name;
		this.numLegs = 2;
	}

	// faca seu protótipo ser uma nova instância de Animal
	Penguin.prototype = new Animal();

/*Atividade 19*/

	// a classe Animal e método sayName originais
	function Animal(name, numLegs) {
	    this.name = name;
	    this.numLegs = numLegs;
	}
	Animal.prototype.sayName = function() {
	    console.log("Oi, meu nome é" + this.name);
	};

	// defina uma classe Penguin
	function Penguin (name) {
		this.name = name;
		this.numLegs = 2;
	}

	// faca seu protótipo ser uma nova instância de Animal
	Penguin.prototype = new Animal();
	var penguin = new Penguin("penguin");
	penguin.sayName();

	//Era para chamar a função "Penguin()" e verificar se iria funcionar a função "sayName()"

/*Atividade 20*/

	function Penguin(name) {
	    this.name = name;
	    this.numLegs = 2;
	}
	// crie aqui sua classe Emperor e faca-a herdar de Penguin
	function Emperor(name) {
		this.name = name;
	}

	Emperor.prototype = new Penguin();
	// crie um objeto "emperor" e exiba o numero de pernas que ele tem
	var emperor = new Emperor("Gustavo");
	console.log(emperor.numLegs);

/*Atividade 21*/

	// original classes
	function Animal(name, numLegs) {
	    this.name = name;
	    this.numLegs = numLegs;
	    this.isAlive = true;
	}
	function Penguin(name) {
	    this.name = name;
	    this.numLegs = 2;
	}
	function Emperor(name) {
	    this.name = name;
	    this.saying = "Waddle waddle";
	}

	// set up the prototype chain
	Penguin.prototype = new Animal();
	Emperor.prototype = new Penguin();

	var myEmperor = new Emperor("Jules");

	console.log(myEmperor.saying); // deve imprimir "Waddle waddle"
	console.log(myEmperor.numLegs); // deve imprimir 2
	console.log(myEmperor.isAlive); // deve imprimir true

/*Atividade 22*/

	function Person(first,last,age) {
	   this.firstName = first;
	   this.lastName = last;
	   this.age = age;
	}

	var john = new Person('John','Smith',30);
	var myFirst = john.firstName;
	var myLast = john.lastName;

	//declare a variable myAge igual a idade do objeto john.

	var myAge = john.age

/*Atividade 23*/

	function Person(first,last,age) {
	   this.firstname = first;
	   this.lastname = last;
	   this.age = age;
	   var bankBalance = 7500;
	}

	// crie seu Person 
	var john = new Person("John","Smith",50);
	// tente exibir seu bankBalance
	console.log(john.bankBalance);

/*Atividade 24*/

	function Person(first,last,age) {
	   this.firstname = first;
	   this.lastname = last;
	   this.age = age;
	   var bankBalance = 7500;
	  
	   this.getBalance = function() {
	   		return bankBalance;
	   };
	}

	var john = new Person('John','Smith',30);
	console.log(john.bankBalance);

	// crie uma nova variavel myBalance que chame getBalance()

	var myBalance = john.getBalance();
	console.log(myBalance);

/*Atividade 25*/

	function Person(first,last,age) {
	   this.firstname = first;
	   this.lastname = last;
	   this.age = age;
	   var bankBalance = 7500;
	  
	   var returnBalance = function() {
	      return bankBalance;
	   };
	       
	   // crie a nova função aqui
	   this.askTeller = function() {
	   		return returnBalance;
	   }
	}

	var john = new Person('John','Smith',30);
	console.log(john.returnBalance);
	var myBalanceMethod = john.askTeller();
	var myBalance = myBalanceMethod();
	console.log(myBalance);

/*Atividade 26*/

	function Person(first,last,age) {
	   this.firstname = first;
	   this.lastname = last;
	   this.age = age;
	   var bankBalance = 7500;
	  
	   this.askTeller = function(pass) {
	     if (pass == 1234) return bankBalance;
	     else return "Senha incorreta.";
	   };
	}

	var john = new Person('John','Smith',30);
	/* a variável myBalance deve acessar askTeller()
	   com uma senha como argumento  */

	var myBalance = john.askTeller(1234);
	console.log(myBalance);

/*Atividade 27*/

	var languages = {
	    english: "Hello!",
	    french: "Bonjour!",
	    notALanguage: 4,
	    spanish: "Hola!"
	};

	// exiba "alô" nos 3 diferentes idiomas

	for (var property in languages) {
		if (isNaN(languages[property])) {
			console.log(languages[property]);
		}
	}

/*Atividade 28*/

	function Dog (breed) {
		this.breed = breed;
	};

	// adicione o metodo sayHello a classe Dog 
	// para que todos os cachorros possam dizer alo
	Dog.prototype.sayHello = function () {
		console.log("Alô, este é um cahorro " + this.breed);
	}

	var yourDog = new Dog("golden retriever");
	yourDog.sayHello();

	var myDog = new Dog("dachshund");
	myDog.sayHello();

/*Atividade 29*/

	// O que é esse "Object.prototype" afinal...?
	var prototypeType = typeof Object.prototype;
	console.log(prototypeType);

	// agora vamos examiná-lo!
	var hasOwn = Object.prototype.hasOwnProperty("hasOwnProperty");
	console.log(hasOwn);

/*Atividade 30*/

	function StudentReport() {
	    var grade1 = 4;
	    var grade2 = 2;
	    var grade3 = 1;
	    this.getGPA = function() {
	        return (grade1 + grade2 + grade3) / 3;
	    };
	}

	var myStudentReport = new StudentReport();

	for(var x in myStudentReport) {
	    if(typeof myStudentReport[x] !== "function") {
	        console.log("Muahaha! " + myStudentReport[x]);
	    }
	}

	console.log("Sua nota media e " + myStudentReport.getGPA());