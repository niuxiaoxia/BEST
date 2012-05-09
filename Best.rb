require 'rubygems'
require 'highline/import'

require './Goods.rb' 
require './Basket.rb'
say("\n\n<%= color('\t\t\t欢迎光临BEST(百思特)便利店\n\n', :YELLOW,:BOLD) %> ")
#登录模块
module Login
	  def password
	    h=ask("\t\t\t请输入口令继续:  ") { |q| q.echo = "*" }
	   while("#{h}"!="123")
	      puts "\t\t\t密码输入不正确，请重新输入！"
	      h=ask("\t\t\t请再次输入口令继续:  ") { |q| q.echo = "*" }
	   end
	      puts "\t\t\t密码输入正确！"
	      say("<%= color('-'*60, :RED,:bold) %>")
	    end
		 say("<%= color('-'*60, :RED,:bold) %>")
end

include Login
	password

#界面信息友好提示
	say("\n\n<%= color('\t\t\t欢迎光临BEST(百思特)便利店\n', :YELLOW,:BOLD) %> ")
    	say("\n\n<%= color('\t（本店实行购物满100打95折，火腿肠买2送1的活动！）\n', :GREEN,:BOLD) %> ")
	say("\n\n<%= color('\t\t\t回车键继续购物，q键退出\n', :RED,:BOLD) %> ")
	t=Time.now
    	say("\n<%= color('\t\t 本次购物时间为：#{t.strftime("%Y年%m月%d日  %H:%M:%S")} ', :YELLOW,:BOLD) %>")
 	say("\n\n<%= color('-'*60,  :RED,:bold) %>")
	goods_list=[]
	File.open("goods.txt").each_line do |line|
	  goods_list << Goods.new(line)
	end
#购物
basket = Basket.new
str=gets

while(str == "\n")
        input=ask("\t\<%= color('选择您所需要的物品:', :GREEN,:BOLD) %> " ) 
	selected = goods_list.find {|item| item.id == input }
	basket.goods << selected
	num=ask("\t<%= color('选择您所购面的物品个数：', :GREEN,:BOLD) %> " )     
	say("\n\n\t\t\t\t<%= color('打印小票', :yellow,:bold) %>\n\n")
	basket.display(num)
        total=basket.total(num)
	str=gets
     
end
#输出小票
 	say("\t\t\t\t\t<%= color('合计:', :RED,:BOLD) %>#{basket.total(num)}元")
	if(basket.total(num)>100)
		 say("\t\t\t\t\t<%= color('优惠后:', :GREEN,:BOLD) %>#{basket.total(num).to_f*0.95}元")
		 shou=ask("\t\t\t\t\t<%= color('实收:', :RED,:BOLD) %> " ) 
   		 printf("\t\t\t\t\t找零：%0.1f元\n", shou.to_f-(basket.total(num).to_f*0.95).to_f)
	else
 	shou=ask("\t\t\t\t\t<%= color('实收:', :RED,:BOLD) %> " ) 
   	printf("\t\t\t\t\t找零：%0.1f元\n", shou.to_f-total.to_f)

	end

  
    
	


