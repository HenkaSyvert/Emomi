extends TextureButton

@export var texture: Texture2D


func _on_pressed() -> void:
	var image: Image = texture.get_image()
	var png_data: PackedByteArray = image.save_png_to_buffer()
	var base64: String = Marshalls.raw_to_base64(png_data)

	var js: String = (
		"""
    	const a = document.createElement('a');
    	a.href = "data:image/png;base64,%s";
    	a.download = "download.png";
    	document.body.appendChild(a);
    	a.click();
    	document.body.removeChild(a);
		"""
		% base64
	)
	JavaScriptBridge.eval(js)
