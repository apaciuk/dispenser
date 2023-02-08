require 'rails_helper'

    def atm(total, denominations)
        raw_data = denominations.inject({}) do |hash, denomination|
            hash[denomination] = total.divmod(denomination)
            total -= total.divmod(denomination).first * denomination
            hash
        end
        raw_data.each_with_object({}) do |(key, value), hash|
            hash[key] = value.first
        end
    end

RSpec.describe 'ATM' do
  it 'dispenses the correct denominations to users' do
    expect(atm 110, [100, 20, 10, 5]). to eq({100=>1, 20=>0, 10=>1, 5=>0})
    expect(atm 245, [20, 10, 5]). to eq({20=>12, 10=>0, 5=>1})
  end
end