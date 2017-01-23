var text = "Lorem ipsum dolor sit Gustavo amet, consectetur adipiscing elit. Aenean hendrerit vehicula gravida. Vestibulum pharetra, sem ut luctus Gustavo pharetra, quam dolor sagittis nibh, sit amet consectetur nunc lectus Gustavo a dolor. Mauris ante magna, elementum posuere nisi eu, molestie facilisis diam. Gustavo Aenean.";
var myName = "Gustavo";
var hits = [];

for ( var i = 0; i <= text.length; i++) {
    if (text[i] == "G") {
    	for (var j = i; j < (myName.length + i); j++) {
    		hits.push(text[j]);
    	}
    }
}

if (hits.length === 0) {
	console.log("Seu nome não foi necontrado!");
} else {
	console.log(hits)
}
