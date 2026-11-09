draw_self()
var linha = 20

draw_text(x,y,string(global.coringa_ativo))
draw_text(x,y+linha,(global.acerto_consecutivo))
draw_text(x,y + 2*linha,(global.coringa))
draw_text(x,y+ 3*linha,(global.usou_coringa))
