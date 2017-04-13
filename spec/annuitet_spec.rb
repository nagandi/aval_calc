require 'spec_helper'

describe AnnuitetCredit do
	before do
		@calculated = AnnuitetCredit.new(12, 10, 100)
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
			expect(@calculated.main_pay[1].round(2)).to be_equal 92.04
		end
		it 'all_pay' do
			expect(@calculated.all_pay.first.round(2)).to be_equal 8.79
		end
		it 'payment_without_perc on second month' do
			expect(@calculated.payment_without_perc[1].round(2)).to be_equal 8.02
		end
		it 'month_perc on second month' do
			expect(@calculated.month_perc[1].round(2)).to be_equal 0.77
		end
	end	
end