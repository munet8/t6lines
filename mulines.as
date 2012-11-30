;-------------------------------------------------------------------------------
; �R���p�C���I�v�V����
#packopt name "mulines.exe"
#packopt type 0
#packopt xsize 320
#packopt ysize 480
#pack "fon_cha1.png"
#pack "fon_ball.png"

;-------------------------------------------------------------------------------

; �t�H���g�摜�̕����T�C�Y
#const global g_font_png_x 16
#const global g_font_png_y 32

; �t�H���g�T�C�Y�i�X�N���[���T�C�Y��j
;#const global g_font_x 12
;#const global g_font_y 24
g_font_x = ginfo_winx / 25
g_font_y = ginfo_winy / 20

; �{�[���̑傫��
g_ball_size = 48

; �X�N���[���T�C�Y
;#const global g_screen_x 320
;#const global g_screen_y 480
g_screen_x = ginfo_winx
g_screen_y = ginfo_winy

g_screen_view_y = g_screen_y - ( g_font_y * 2)

#module
#defcfunc log10 int _x
	; log10(x)
	; ��p�ΐ��i�؎̂āj��Ԃ�
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
	;	(�摜���g�p�����t�H���g�\�����s�Ȃ��܂�)
	;	"message" : �\�����郁�b�Z�[�W
	;	�\�����W�́Apos�Ŏw�肵���ʒu����
	;	���p�J�i�͑S�p�t�H���g�摜���ǂݎ��
	;
	i = 0: st = _p1
	fx = double( 1.0 * g_font_x@ / g_font_png_x@ )
	fy = double( 1.0 * g_font_y@ / g_font_png_y@ )

	gmode 5, 0, 0, _alpha

	repeat
		a1 = peek(st, i) :i++
		if a1 = 0 :break
		if a1 = 13 { ; ���s
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

; �ړ��\���T������֌W���W���[��
#module
#deffunc MovableArrInit
	; �z�񏉊���
	dim r, 9, 9
	return

#deffunc MovableArrSet int _x, int _y
	; �ړ��\��ݒ�ċA���[�`��
	; _x : ���ݒnx���W
	; _y : ���ݒny���W
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
	; �Ԃ�l : 0�Ȃ�ړ��s�A1�Ȃ�ړ��\
	return r( _x, _y )
#global

#module
#defcfunc EvalScore int _x
	; �����������ɉ����ē��T���Q�b�g
	; 5->10 6->12 7->18 8->28 9->42 ...
	; y = 2x^2 - 20x + 60

	y = ( 2 * _x * _x ) - ( 20 * _x ) + 60
	return y

#global