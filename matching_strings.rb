# ���[�x���V���^�C�������̌v�Z
# str1, str2�̕�����̋�����Ԃ�
# �����̒l�����������A������͗ގ����Ă���
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

# �e�L�X�g�̓X������A�ł��߂��X�̖��O�𒲍��Ώۃ��X�g���璊�o����
#	���� f: �e�L�X�g
#		1�s��: ���͂����X��
#		2�s�ڈȍ~: �����Ώۃ��X�g
def shop_reccomend(f)
	# ���͂����X��
	input = f.gets.strip

	# �����Ώە�����
	min_point = 10000
	recommend_shop = ""
	while shop = f.gets
		shop.strip!
		score = levenshteinDistance(input, shop)
		if (score < min_point)
			# ���͓X���Ɨގ����Ă���X���ƁA���̋������L�^
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

