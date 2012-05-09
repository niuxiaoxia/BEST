require 'rubygems'
require 'highline/import'


class Basket
  attr_reader :goods
 
  def initialize
    @goods = []
  end

  def display num
      say("<%= color('\t编号\t商品名称\t单价\t数量\t总价\n', :RED,:BOLD) %> ")
   
	 @goods.each do |item|
 		if(item.id=='147')
                   num=num.to_i-num.to_i/3 
		end                
        
     end

      @goods.each do |item|
 		if(item.name.length==6||item.name.length==9)
                   say("<%= color('\t#{item.id}\t #{item.name}\t\t #{item.price}\t #{num}\t#{item.price.to_f*num.to_f}\n', :magenta,:BOLD) %> ")
                   
                 else   
                   say("<%= color('\t#{item.id}\t #{item.name}\t #{item.price}\t #{num}\t#{item.price.to_f*num.to_f}\n', :magenta,:BOLD) %> ")

                 end
        
     end
  	
  end

   def total num
    	total_price = 0.0
     	@goods.each do |item|
        total_price +=item.price.to_f*num.to_f
   end
 
   total_price
   end

end
