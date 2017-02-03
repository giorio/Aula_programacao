/*Parte 01*/
	//Crie o objeto chamado cashRegister 
	//e inicialize a propriedade total
	var cashRegister = {
		total: 0
	};

	//Mude a propriedade total usando a notação de ponto

	cashRegister.total = 2.99;

/*Parte 02*/

	var cashRegister = {
	    total:0,
	    add: function(itemCost){
	        this.total += itemCost;
	    }
	};
	//chame o metodo add para nossos itens

	Ovos = cashRegister.add (0.98);
	Leite = cashRegister.add (1.23);
	Revista = cashRegister.add (4.99);
	Chocolate = cashRegister.add (0.45);

	//Mostre o total da conta
	console.log('Sua compra totalizou '+cashRegister.total);

/*Parte 03*/

	var cashRegister = {
	    total:0,
	//insira o método add aqui    
		add: function(itemCost) {
			this.total += itemCost
		},
	    scan: function(item) {
	        switch (item) { 
	        case "ovos": 
	            this.add(0.98); 
	            break;
	        case "leite": 
	            this.add(1.23); 
	            break;
		//Adicione mais 2 itens aqui
			case "revista":
				this.add(4.99);
				break;
			case "chocolate":
				this.add(0.45);
				break;
	        }
	        return true;
	    }
	};
	//Procure por 2 ovos e 3 revistas
		Ovos1 = cashRegister.scan("ovos");
		Ovos2 = cashRegister.scan("ovos");
		Revistas1 = cashRegister.scan("revista");
		Revistas2 = cashRegister.scan("revista");
		Revistas3 = cashRegister.scan("revista");
	//Mostra a conta total
	console.log('Sua conta é '+cashRegister.total);

/*Parte 04*/

	var cashRegister = {
	    total:0,
	    add: function(itemCost){
	        this.total += itemCost;
	    },
	    scan: function(item, quantidade) {
	        switch (item) {
	        case "ovos": this.add(0.98 * quantidade); break;
	        case "leite": this.add(1.23 * quantidade); break;
	        case "revista": this.add(4.99 * quantidade); break;
	        case "chocolate": this.add(0.45 * quantidade); break;
	        }
	    }
	};

	// escaneie cada item 4 vezes
	cashRegister.scan("ovos", 4);
	cashRegister.scan("leite", 4);
	cashRegister.scan("revista", 4);
	cashRegister.scan("chocolate", 4);

	//Mostra o total da conta
	console.log('Sua conta é '+cashRegister.total);

/*Parte 05*/

	var cashRegister = {
	    total:0,
	    //Nao se esqueca de adicionar sua propriedade
	    add: function(itemCost) {
	        this.total +=  itemCost;
	        lastTransactionAmount = itemCost;
	    },
	    scan: function(item,quantity) {
	        switch (item) {
	        case "ovos": this.add(0.98 * quantity); break;
	        case "leite": this.add(1.23 * quantity); break;
	        case "revista": this.add(4.99 * quantity); break;
	        case "chocolate": this.add(0.45 * quantity); break;
	        }
	        return true;
	    },
	    //Adicione o metodo voidLastTransaction aqui
	    voidLastTransaction: function(){
	    	this.total -= lastTransactionAmount;
	    }
	};

	cashRegister.scan('ovos',1);
	cashRegister.scan('leite',1);
	cashRegister.scan('revista',1);
	cashRegister.scan('chocolate',4);

	//Anule a ultima transacao e entao adicione 3
	cashRegister.voidLastTransaction();
	cashRegister.scan('chocolate',3);
	//Mostre o total da conta
	console.log('Your bill is '+cashRegister.total);

/*Parte 06*/

	// crie um construtor para a classe StaffMember
	function StaffMember(name, discountPercent) {
		this.name = name;
		this.discountPercent = discountPercent;
	}

	var sally = new StaffMember("Sally",5);
	var bob = new StaffMember("Bob",10);

	//Crie um StaffMember para si mesmo, chamado "me"

	var me = new StaffMember("Gustavo", 20);

/*Parte 07*/

	function StaffMember(name,discountPercent){
	    this.name = name;
	    this.discountPercent = discountPercent;
	}

	var sally = new StaffMember("Sally",5);
	var bob = new StaffMember("Bob",10);

	// Crie a si mesmo como 'me' com um desconto de funcionario de 20%
	var me = new StaffMember("Gustavo", 20);

	var cashRegister = {
	    total:0,
	    lastTransactionAmount: 0,
	    add: function(itemCost){
	        this.total += (itemCost || 0);
	        this.lastTransactionAmount = itemCost;
	    },
	    scan: function(item,quantity){
	        switch (item){
	        case "ovos": this.add(0.98 * quantity); break;
	        case "leite": this.add(1.23 * quantity); break;
	        case "revista": this.add(4.99 * quantity); break;
	        case "chocolate": this.add(0.45 * quantity); break;
	        }
	        return true;
	    },
	    voidLastTransaction : function(){
	        this.total -= this.lastTransactionAmount;
	        this.lastTransactionAmount = 0;
	    },
	    // Crie aqui um novo método applyStaffDiscount
	    applyStaffDiscount: function (employee) {
	    	this.total -= this.total  * (employee.discountPercent / 100);
	    }
	    
	};

	cashRegister.scan('ovos',1);
	cashRegister.scan('leite',1);
	cashRegister.scan('revista',3);
	// Aplique seu desconto de funcionário passando o objeto 'me' 
	// para applyStaffDiscount
	cashRegister.applyStaffDiscount(me)

	// Mostre o total da conta
	console.log('Sua conta é '+cashRegister.total.toFixed(2));
