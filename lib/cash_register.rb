require "pry"
class CashRegister
    attr_accessor :total, :last, :items_arr
    attr_reader :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @last = 0
        @items_arr = []
    end
    
    def add_item(title, price, quantity=1)
        self.total += price*quantity.to_i
        @last= price*quantity.to_i
        quantity.times {self.items_arr << title} #{@items_arr << title}
    end

    def apply_discount
        if self.discount > 0
            self.total -= self.total*self.discount/100.to_i
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
             "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total= (total - last) # total and last - methods and they return @total and @last?
          #self.total= (@total - @last) #instance  variables?
        #self.total -= @last self.total= self.total - @last
        #@total -= @last 
    end

    def items
        @items_arr
    end
end
