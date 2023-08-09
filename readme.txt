Munet lines

概要

  ・見づらいカラーラインゲーム。
  ・これもまた我が青春。

利用規約

  ・修正BSDライセンス http://www.freebsd.org/ja/copyright/freebsd-license.html に従います。
  ・著作権は m-ushi に帰属します。
  ・修正BSDライセンスはこのテキストの末尾に添付しています。

必要環境

  ・Windows 32bit版 と思われます。
  ・iOS、Android用にビルドしてもいけるらしい。

開発環境

  ・HSP3Dish https://hsp.tv/ v3.6
  ・Win11 22H2 64bit

履歴
  ・v1.3
    ソフトウェアから終了させる意味がないため、本機能を削除。
    久しぶりに触る前に画像に関する微修正・10万点以上のスコア表示への対応をしたらしい。
  ・v1.2
    tan6ブランドとして設定。
    ボールの絵を改善。
  ・v1.1
    画面端（上と左）をクリックすると選択状態になる微妙バグを修正。
    色を微調整。
    readmeが途中からmuwormになってた。
  ・v1.0
    初版。

操作方法（常時）

  ・石をクリック（ゲーム中のみ）
      石を選択する、または選択した石を目的地に移動する。
  ・「Retry」
      再度ゲームをプレイ

遊び方

  ・７色の石があります。
  ・石は上下左右隣接している場所になら移動できます。
  ・一度石を移動させるとNEXTにある色の石がランダムの場所に生成されます。
  ・同じ色の石を縦・横・斜め方向に５つ以上集めたら消えます。
  ・画面が全部石で埋まったらゲームオーバー。
  ・ちょっと緩い十字消しを採用しています。

十字消しの対象になる例

  ..... ..... ..... .....
  ..O.. ..O.. ..O.. .O...
  .OOO. .OOOO OOOOO OOOOO
  ..O.. ..O.. ..O.. .O...
  ..... ..... ..... .....

十字消しの対象にならない例

  ..... ..... ..... .....
  .O... ...O. .O... O....
  .OOO. .OOO. .OOOO OOOOO
  .O... .O... .O... O....
  ..... ..... ..... ..... （十字消しの対象にならないが、５つ並んでいる石は消える）

利用フォント

  ・VLゴシックフォントファミリ http://vlgothic.dicey.org/

修正BSDライセンス（英文）

    2012-2013 (C) Masayuki Ushijima.

      Redistribution and use in source and binary forms, with or without modification, 
    are permitted provided that the following conditions are met:

        1.  Redistributions of source code must retain the above copyright notice,
          this list of conditions and the following disclaimer.
        2.  Redistributions in binary form must reproduce the above copyright notice,
          this list of conditions and the following disclaimer in the documentation
          and/or other materials provided with the distribution.

      THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT ``AS IS'' AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
    SHALL THE FREEBSD PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.

      The views and conclusions contained in the software and documentation are those
    of the authors and should not be interpreted as representing official policies,
    either expressed or implied, of the FreeBSD Project.
