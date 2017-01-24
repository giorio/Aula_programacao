var slaying = true;
var youHit = Math.floor(Math.random() * 2);
var damageThisRound = Math.floor(Math.random() * 5 + 1);
var totalDamage = 0;

while(slaying) {
	if (youHit == 1) {
		console.log("Você matou o dragão.");
		totalDamage += damageThisRound;
		if (totalDamage >= 4) {
			console.log("Você matou o dragão.");
			slaying = false;
		} else {
			youHit = Math.floor(Math.random() * 2);
		}
	} else {
		console.log("O dragão o derrotou.")
	}
	slaying = false;
}
