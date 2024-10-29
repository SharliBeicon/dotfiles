local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 30,
	color = colors.bar.bg,
	padding_right = 2,
	padding_left = 2,
	y_offset = 6,
	margin = 5,
})
