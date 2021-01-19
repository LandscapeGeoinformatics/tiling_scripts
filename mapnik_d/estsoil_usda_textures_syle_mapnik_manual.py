import mapnik

m = mapnik.Map(2048, 2048)
mapnik.load_map(m, "estsoil_usda_textures_syle_mapnik_manual.xml")
m.zoom_all()
mapnik.render_to_file(m, "estsoil_usda_textures_syle_mapnik_manual.png")
