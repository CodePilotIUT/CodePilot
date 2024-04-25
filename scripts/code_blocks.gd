extends Node

var code_blocks = [
	{
		"label": "input",
		"color": [156, 182, 92],
		"has_input": false
	},
	{
		"label": "output",
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
		"label": "jump_from",
		"color": [141, 141, 193],
		"has_input": true
	},
	{
		"label": "jump_from if zero",
		"color": [141, 141, 193],
		"has_input": true
	},
	{
		"label": "jump_from if neg",
		"color": [141, 141, 193],
		"has_input": true
	},
	{
		"label": "jump_to",
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
	if cb_dict == null or cb_dict == {}:
		return null

	const code_block_scene = preload("res://scenes/ingame/elements/code_block.tscn")
	var cb: CodeBlock = code_block_scene.instantiate()
	cb.set_label(cb_dict.get("label"))
	cb.set_background_color(CodeBlocks.get_color(cb_dict.get("color")))
	cb.set_input_visibility(cb_dict.get("has_input"))
	return cb

func get_all_code_blocks() -> Array[CodeBlock]:
	var cbs: Array[CodeBlock] = []
	for cb in code_blocks:
		cbs.append(get_code_block(cb["label"]))
	return cbs
