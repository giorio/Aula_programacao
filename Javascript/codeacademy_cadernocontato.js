var bob = {
    firstName: "Bob",
    lastName: "Jones",
    phoneNumber: "(650) 777-777",
    email: "bob.jones@example.com"
};

console.log(bob.firstName);
console.log(bob.lastName);
console.log(bob.email);

var mary = {
	firstName: "Mary",
	lastName: "Johnson",
	phoneNumber: "(650) 888-8888",
	email:"mary.johnson@example.com"
};

var contacts = [bob, mary];

console.log(mary.phoneNumber);

function printPerson(person) {
	console.log(person.firstName + " " + person.lastName);
}

printPerson(contacts[0]);
printPerson(contacts[1]);

function list() {
	var contactsLength = contacts.length;
	for (var i = 0; i <= contactsLength - 1; i++) {
		printPerson(contacts[i]);
	}
};

list();

function search(lastName) {
	var contactsLength = contacts.length;
	for (var i = 0; i <= contactsLength - 1; i++) {
		if (lastName === contacts[i].lastName) {
			console.log(printPerson(contacts[i]));
		}
	}
};

search("Jones");

function add(firstName, lastName, phoneNumber, email) {
	contacts[contacts.length] = {
	firstName: firstName,
	lastName: lastName,
	phoneNumber: phoneNumber,
	email:email
	};
}

add("Gustavo", "Di Iorio", "(31) 9999-8888", "gaguiar@example.com");
list();
