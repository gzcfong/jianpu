\version "2.18.2"
#(set-global-staff-size 20)

% un-comment the next line to remove Lilypond tagline:
% \header { tagline="" }

\paper {
  print-all-headers = ##t % allow per-score headers

  % un-comment the next line for A5:
  % #(set-default-paper-size "a5" )

  % un-comment the next line for no page numbers:
  % print-page-number = ##f

  % un-comment the next 3 lines for a binding edge:
  % two-sided = ##t
  % inner-margin = 20\mm
  % outer-margin = 10\mm

  % un-comment the next line for a more space-saving header layout:
   %scoreTitleMarkup = \markup { \center-column { \fill-line { \magnify #1.5 { \bold { \fromproperty #'header:dedication } } \magnify #1.5 { \bold { \fromproperty #'header:title } } \fromproperty #'header:composer } \fill-line { \fromproperty #'header:instrument \fromproperty #'header:subtitle \smaller{\fromproperty #'header:subsubtitle } } } }
}

\score {
<< %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
%\set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)
% === BEGIN MIDI STAFF ===
    \new Staff { \new Voice="jianpu" {
\relative c'' {
\key g \major
\time 3/4 \partial 4 
b4 | g'4. g8 fis8 e8 | fis2 b,4 | e4. e8 d8 c8 | d2 g,4 | c4. c8 b8 a8 | g8 b8 e4. g8 | a4 a4. e8 | fis2 b,4 | g'4. g8 fis8 e8 | fis2 b,4 | e4. e8 d8 c8 | d2 g,4 | c4. c8 b8 a8 | g8 b8 e4. g8 | a8 a8 fis4. d8 | e2 g4 | b4. b8 c8 b8 | a2 d4 | b4. b8 a8 g8 | fis2 g8 fis8 | e2 fis8 e8 | d4 b'4. g8 | e8 a8 ~ a2 | r2 d,4 | b'4. b8 c8 b8 | a2 d4 | b4. b8 a8 g8 | fis2 g8 fis8 | e2 fis8 e8 | d4 d'4. a8 ~ | a8 b8 ~ b2 | r2 b,4 | g'4. g8 fis8 e8 | fis2 b,4 | e4. e8 d8 c8 | d2 g,4 | c4. c8 b8 a8 | g8 b8 e4. g8 | a8 a8 fis4. d8 | e2
\bar "|."
}
} }
% === END MIDI STAFF ===


\new Lyrics = "IX" { \lyricsto "jianpu" { hi- ka ru u- mi ni ka su mu fu- ne ha sa yo na ra no ki te- ki no ko shi ma su yu ru i sa- ka wo o ri te yu ke ba na- tsu i- ro no ka- ze ni a e ru ka shi ra wa ta shi no a- i so re ha me ro dei ta ka ku hi ku ku u- ta u no wa ta shi no a- i so re ha ka mo me ta ka ku hi ku ku to bu no yu- u hi no na ka yo n de mi ta ra ya sa shi i a na ta ni a e ru ka shi ra } } \new Lyrics = "IY" { \lyricsto "jianpu" { 光 　 る 海 　 に か す む 船 　 は さ よ な ら の 汽 笛 　 の こ し ま す ゆ る い 坂 　 を お り て ゆ け ば 夏 　 色 　 の 風 　 に あ え る か し ら わ た し の 愛 　 そ れ は メ ロ ディー た か く ひ く く 　歌 　 う の わ た し の 愛 　 そ れ は カ モ メ た か く ひ く く 飛 ぶ の 夕 　 陽 の な か 呼 ん で み た ら や さ し い あ な た に 逢 え る か し ら } } \new Lyrics = "IZ" { \lyricsto "jianpu" { da re ka ga hi ku pi a no no o- to u- mi na ri mi ta i ni ki  ko e ma su o so i go go wo yu ki ka u hi to na- tsu i- ro no yu- me wo ha ko bu ka shi ra wa ta shi no a- i so re ha dai a rii hi bi no pe i ji tsu du ru no wa ta shi no a- i so re ha ko bu- ne so- ra no u- mi wo yu ku no yu- u hi no na ka o ri ka- e re  ba a na ta ha wa ta shi wo sa- ga su ka shi ra } } \new Lyrics = "Ia" { \lyricsto "jianpu" { だ れ か が 弾 く ピ ア ノ の 音 　 海 　 鳴 り み た い に き こ え ま す お そ い 午 後 を 往 き 交 う ひ と 夏 　 色 　 の 夢 　 を は こ ぶ か し ら わ た し の 愛 　 そ れ は ダイ ア リー 日 々 の ペ ー ジ つ づ る の わ た し の 愛 　 そ れ は 小 舟 　 空 　 の 海 　 を ゆ く の 夕 　 陽 の な か 降 り 返 　 れ ば あ な た は わ た し を 探 　 す か し ら } } \new Lyrics = "Ib" { \lyricsto "jianpu" { sa- n po mi- chi ni yu re ru ki gi  ha sa yo na ra no ka- ge wo o to shi ma su fu- ru i cha pe ru ka- za mi  no to ri na- tsu i- ro no ma- chi ha mi e ru ka shi ra ki no u no a- i so re ha na- mi- da ya  ga te ka wa ki ki e ru no a shi ta no a- i so re ha ru fu ran o wa ri no na i ko- to ba yu- u hi no na ka me gu ri a e ba a na ta ha wa ta shi wo da ku 　 ka shi ra } } \new Lyrics = "Ic" { \lyricsto "jianpu" { 散 　 歩 道 　 に ゆ れ る 木 々 は さ よ な ら の 影 　 を お と し ま す 古 　 い チャ ペ ル 風 　 見 の鶏 (と り) 夏 　 色 　 の 街 　 は み え る か し ら き の う の 愛 　 そ れ は 涙 　 　 や が て か わ き 消 え る の あ し た の 愛 　 そ れ は ル フ ラン お わ り の な い 言 　 葉 夕 　 陽 の な か め ぐ り 逢 え ば あ な た は わ た し を 抱 く 　 か し ら } } 
>>
\layout {}
\midi {
\tempo 4=120
}
}
%\score {
%\unfoldRepeats

%\midi { 
%  \context { 
    %\Score tempoWholesPerMinute = #(ly:make-moment 130 4)
%}
%} 
%}
