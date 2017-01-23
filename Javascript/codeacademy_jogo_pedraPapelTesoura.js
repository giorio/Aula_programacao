var compare = function(choice1,choice2) {
    if (choice1 === choice2)
        {
        	return "O resultado é um empate!";
        }
    else
        if (choice1 === "pedra")
        {
           if (choice2 ==="tesoura")
                {
                	return "pedra vence";
                }
            else
                {
                	return "papel vence";
                }
        }
    else
        if (choice1 === "papel")
        {
            if (choice2 ==="tesoura")
                {
                	return "tesoura vence";
                }
            else
                {
                	return "papel vence";
                }
        }
    else
        if (choice1 === "tesoura")
        {
            if (choice2 ==="papel")
                {
                	return "tesoura vence";
                }
            else
                {
                	return "pedra vence";
                }
        }
};

var userChoice = prompt("Você escolhe pedra, papel ou tesoura?");
var computerChoice = Math.random();

if ((computerChoice >= 0) && (computerChoice < 0.34))

{ computerChoice = "pedra" }

else

{
    if ((computerChoice >= 0.34) && (computerChoice < 0.67))
    { computerChoice = "papel"}
    else
    { computerChoice = "tesoura"};
};


console.log("A escolha do jogador foi " + userChoice);
console.log("A escolha do computador foi " + computerChoice);
console.log(compare(userChoice,computerChoice));