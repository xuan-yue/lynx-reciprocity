module AsksHelper

	# def card_colors
	# 	 ['91CFFF', '88D0E0', '6EA8A7', 'FFD090', 'F1BBA7', '0DC59C']
	# end
	def get_card_color(card_colors)
		next_color = card_colors.shift
		card_colors.push(next_color)
		return card_colors
	end
end
