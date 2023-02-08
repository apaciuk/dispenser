class ATM < ApplicationRecord
    has_many :transactions
    has_many :users, through: :transactions


    def atm(total, denominations)
        raw_data = denominations.inject({}) do |hash, denomination|
            hash[denomination] = total.divmod(denomination)
            total -= total.divmod(denomination).first * denomination
            hash
        end
    end
end
