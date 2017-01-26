var friends = new Object();

	friends.bill = new Object();
		friends.bill.firstName = "Bill";
		friends.bill.lastName = "Mcteste";
		friends.bill.number = "(555)2233-2211";
		friends.bill.address = ['av. teste', 'teste', 588, 'CA', 'USA'];
	friends.steve = {
		firstName: "Steve",
		lastName: "Join",
		number: "(555)3364-8779",
		address: ['av. teste', 'teste', 588, 'CA', 'USA']
};

var list = function(obj) {
		for (var prop in obj) {
			console.log(prop);
		}
};

var search = function(name){
	  for(var prop in friends) {
    	if(friends[prop].firstName === name) {
     		console.log(friends[prop]);
      		return friends[prop];
    	}
  	}	
};
