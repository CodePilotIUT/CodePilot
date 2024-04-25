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
		"has_input": false
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

func get_code_block_dict(label: String) -> Dictionary:
	for block in code_blocks:
		if block["label"] == label:
			return block
	return {}

func get_code_block(label: String) -> CodeBlock:
	var cb_dict = get_code_block_dict(label)
	if cb_dict == null:
		return null

	const code_block_scene = preload("res://scenes/ingame/elements/code_block.tscn")
	var cb: CodeBlock = code_block_scene.instantiate()
	cb.set_label(cb_dict.get("label"))
	cb.set_background_color(CodeBlocks.get_color(cb_dict.get("color")))
	cb.set_input_visibility(cb_dict.get("has_input"))
	return cb
