require 'spec_helper'

describe CreditCalc do
	before do
		@calculated = CreditCalc.new(12, 10, 100)
		@calculated.calc
	end
	describe "#calc" do

		it 'should be arrays' do
			expect(@calculated.all_pay).to be_instance_of Array
			expect(@calculated.main_pay).to be_instance_of Array
			expect(@calculated.payment_without_perc).to be_instance_of Array
			expect(@calculated.month_perc).to be_instance_of Array
		end
		it 'main_pay on second month' do
			expect(@calculated.main_pay[1].round(2)).to be_equal 91.67
		end
		it 'all_pay on second month' do
			expect(@calculated.all_pay[1].round(2)).to be_equal 9.1
		end
		it 'payment_without_perc' do
			expect(@calculated.payment_without_perc.first.round(2)).to be_equal 8.33
		end
		it 'month_perc on second month' do
			expect(@calculated.month_perc[1].round(2)).to be_equal 0.76
		end
	end	
end