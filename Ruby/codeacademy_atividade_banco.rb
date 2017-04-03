class Account
    attr_reader :name, :balance
    def initialize (name, balance=100)
        @name = name
        @balance=balance
    end
    
    private
    
    def pin
        @pin = 1234
    end
    
    def pin_error
        return "Acesso negado: PIN incorreto."
    end
    
    public
    
    def display_balance(pin_number)
        puts pin_number == pin ? "Saldo: $#{@balance}." : pin_error
    end
    
    def withdraw(pin_number,amount)
        if pin_number == pin
            @balance -= amount
            puts "Retirado #{amount}. Novo saldo: $#{@balance}."
        else puts pin_error
        end
    end
end

checking_account=Account.new("Gustavo", 1_000_000_000)
