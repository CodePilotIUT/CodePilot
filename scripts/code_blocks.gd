extends Node

var code_blocks = [
	{
		"label": "inbox",
		"color": [156, 182, 92],
		"has_input": false
	},
	{
		"label": "outbox",
		"color": [156, 182, 92],
		"has_input": true
	},
	{
		"label": "copyfrom",
		"color": [200, 106, 84],
		"has_input": true
	},
	{
		"label": "copyto",
		"color": [200, 106, 84],
		"has_input": true
	},
	{
		"label": "add",
		"color": [199, 141, 98],
		"has_input": true
	},
	{
		"label": "sub",
		"color": [199, 141, 98],
		"has_input": true
	},
	{
		"label": "bump -",
		"color": [199, 141, 98],
		"has_input": false
	},
	{
		"label": "bump +",
		"color": [199, 141, 98],
		"has_input": false
	},
	{
		"label": "goto",
		"color": [141, 141, 193],
		"has_input": true
	},
	{
		"label": "goto if zero",
		"color": [141, 141, 193],
		"has_input": true
	},
	{
		"label": "goto if negative",
		"color": [141, 141, 193],
		"has_input": true
	},
	{
		"label": "label",
		"color": [141, 141, 193],
		"has_input": true
	}
]

func get_color(rgb):
	return Color(rgb[0]/255.0, rgb[1]/255.0, rgb[2]/255.0)
