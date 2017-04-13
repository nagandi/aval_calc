class CreditCalc
	attr_reader :main_pay, :all_pay, :payment_without_perc, :month_perc
	def initialize(term, percent, credit)
		@term 	 = term.to_i
		@percent = percent.to_f
		@main_pay  = [credit.to_f]	
	end

	def calc
		@payment_without_perc = [@main_pay.first/@term]
		@month_perc = []
		@all_pay = []
		year_perc = @percent / 1200


		@term.times { |t|
			@month_perc << @main_pay.last*(year_perc)
			@all_pay 		<< @payment_without_perc.last + @month_perc.last
			@main_pay 	<< @main_pay.last - @payment_without_perc.last
		}
	end

end



class AnnuitetCredit < CreditCalc

	def calc
		@month_perc =[]
		@payment_without_perc = []
		year_perc = @percent / 1200
		@all_pay = [@main_pay.first * ( year_perc + ( year_perc / ( ( 1 + year_perc ) ** @term - 1 ) ) )]
    
    @term.times do
      @month_perc << @main_pay.last * year_perc
      @payment_without_perc << @all_pay.last - @month_perc.last
      @main_pay << @main_pay.last - @payment_without_perc.last
    end
	end
end
