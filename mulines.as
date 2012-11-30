;-------------------------------------------------------------------------------
; コンパイルオプション
#packopt name "mulines.exe"
#packopt type 0
#packopt xsize 320
#packopt ysize 480
#pack "fon_cha1.png"
#pack "fon_ball.png"

;-------------------------------------------------------------------------------

; フォント画像の分割サイズ
#const global g_font_png_x 16
#const global g_font_png_y 32

; フォントサイズ（スクリーンサイズ比）
;#const global g_font_x 12
;#const global g_font_y 24
g_font_x = ginfo_winx / 25
g_font_y = ginfo_winy / 20

; ボールの大きさ
g_ball_size = 48

; スクリーンサイズ
;#const global g_screen_x 320
;#const global g_screen_y 480
g_screen_x = ginfo_winx
g_screen_y = ginfo_winy

g_screen_view_y = g_screen_y - ( g_font_y * 2)

#module
#defcfunc log10 int _x
	; log10(x)
	; 常用対数（切捨て）を返す
	if ( _x <= 0 ) {
		ret = 0
	} else {
		ret = int ( logf(_x) / logf(10) )
	}
	return ret
#global

#module
#deffunc fprint str _p1, int _alpha
	;	fprint "message"
	;	(画像を使用したフォント表示を行ないます)
	;	"message" : 表示するメッセージ
	;	表示座標は、posで指定した位置から
	;	半角カナは全角フォント画像より読み取る
	;
	i = 0: st = _p1
	fx = double( 1.0 * g_font_x@ / g_font_png_x@ )
	fy = double( 1.0 * g_font_y@ / g_font_png_y@ )

	gmode 5, 0, 0, _alpha

	repeat
		a1 = peek(st, i) :i++
		if a1 = 0 :break
		if a1 = 13 { ; 改行
			a1 = peek(st, i)
			if a1 = 10 :i++
			continue
		} else {
			if ( a1 & 128 ) {
				celput 3 , a1 - 160, fx, fy
			} else {
				celput 2 , a1 - 32, fx, fy
			}
		}
	loop

	return
#global

; 移動可能先を探索する関係モジュール
#module
#deffunc MovableArrInit
	; 配列初期化
	dim r, 9, 9
	return

#deffunc MovableArrSet int _x, int _y
	; 移動可能先設定再帰ルーチン
	; _x : 現在地x座標
	; _y : 現在地y座標
	r(_x, _y) = 1
	if ( 0 < _x ) {
		if ( arr_field@(_x-1, _y) = 0 ) & ( r(_x-1, _y) = 0 ) :MovableArrSet _x-1, _y
	}
	if ( _x < 8 ) {
		if (( arr_field@(_x+1, _y) = 0 ) & ( r(_x+1, _y) = 0 )) :MovableArrSet _x+1, _y
	}
	if ( 0 < _y ) {
		if (( arr_field@(_x, _y-1) = 0 ) & ( r(_x, _y-1) = 0 )) :MovableArrSet _x, _y-1
	}
	if ( _y < 8 ) {
		if (( arr_field@(_x, _y+1) = 0 ) & ( r(_x, _y+1) = 0 )) :MovableArrSet _x, _y+1
	}
	return

#defcfunc MovableArrGet int _x, int _y
	; 返り値 : 0なら移動不可、1なら移動可能
	return r( _x, _y )
#global

#module
#defcfunc EvalScore int _x
	; 消した枚数に応じて特典をゲット
	; 5->10 6->12 7->18 8->28 9->42 ...
	; y = 2x^2 - 20x + 60

	y = ( 2 * _x * _x ) - ( 20 * _x ) + 60
	return y

#global