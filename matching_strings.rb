def matching(input, shop_list)
	p shop_list
	i = 0
	max = 0
	hit = -1
	shop_list.each { |shop|
		score = 0
		shop_strs = shop.split("")
		shop_strs.each {|shop_str|
			if (input.include?(shop_str))
				score += 1
			end
		}
		if (score > max)
			max = score
			hit = i
		end
		i += 1
		p score
	}
	print("shop is #{shop_list[hit]}")
end

def shop_reccomend(f)
	# “ü—Í‚µ‚½“X–¼
	input = f.gets.strip

	# ’²¸‘ÎÛ•¶š—ñ
	shop_list = []
	while name = f.gets
		name.strip!
		puts name
		shop_list << name
	end

	matching(input, shop_list)
end

f = open("shop.txt")
shop_reccomend(f)
f.close


