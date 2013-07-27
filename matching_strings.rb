# レーベンシュタイン距離の計算
# str1, str2の文字列の距離を返す
# 距離の値が小さい程、文字列は類似している
def levenshteinDistance(str1, str2)
	matrix = []
	(str1.length + 1).times {|i|
		matrix[i] = []
	}

	(str1.length + 1).times {|i|
		matrix[i][0] = i
	}

	(str2.length + 1).times {|j|
		matrix[0][j] = j
	}

	for i in 1..(str1.length) do
		for j in 1..(str2.length) do
			base = 1
			if (str1[i - 1] == str2[j -1])
				base = 0
			end
			compare = []
			compare << (matrix[i - 1][j] + 1)
			compare << (matrix[i][j - 1] + 1)
			compare << (matrix[i - 1][j- 1] + base)
		    matrix[i][j] = compare.min
		end
	end
	print "[#{str1}] , [#{str2}] : distance = #{matrix[str1.length][str2.length]}\n"
	return matrix[str1.length][str2.length]
end

# テキストの店名から、最も近い店の名前を調査対象リストから抽出する
#	引数 f: テキスト
#		1行目: 入力した店名
#		2行目以降: 調査対象リスト
def shop_reccomend(f)
	# 入力した店名
	input = f.gets.strip

	# 調査対象文字列
	min_point = 10000
	recommend_shop = ""
	while shop = f.gets
		shop.strip!
		score = levenshteinDistance(input, shop)
		if (score < min_point)
			# 入力店名と類似している店名と、その距離を記録
			recommend_shop = shop
			min_point = score
		end
	end
	print("recommend shop is #{recommend_shop}")
	return recommend_shop
end

f = open("shop.txt")
shop_reccomend(f)
f.close

