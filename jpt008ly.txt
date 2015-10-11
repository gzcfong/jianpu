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
  % scoreTitleMarkup = \markup { \center-column { \fill-line { \magnify #1.5 { \bold { \fromproperty #'header:dedication } } \magnify #1.5 { \bold { \fromproperty #'header:title } } \fromproperty #'header:composer } \fill-line { \fromproperty #'header:instrument \fromproperty #'header:subtitle \smaller{\fromproperty #'header:subsubtitle } } } }
}

\score {
<< \override Score.BarNumber #'break-visibility = #end-of-line-invisible
\set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)

% === BEGIN JIANPU STAFF ===
    \new RhythmicStaff \with {
    % Get rid of the stave but not the barlines.
    % This changes between Lilypond versions.
    \remove Staff_symbol_engraver \consists "Accidental_engraver" % worked pre-2.18, but 2.18 results in missing barlines (adding Barline_engraver won't help).
    \override StaffSymbol #'line-count = #0 % tested in 2.15.40, 2.16.2, 2.18.0 and 2.18.2
    \override BarLine #'bar-extent = #'(-2 . 2) % LilyPond 2.18: please make barlines as high as the time signature even though we're on a RhythmicStaff (2.16 and 2.15 don't need this although its presence doesn't hurt; Issue 3685 seems to indicate they'll fix it post-2.18)
    }
    { \new Voice="jianpu" {
    \override Staff.TimeSignature #'style = #'numbered
    \override Staff.Stem #'transparent = ##t
    \override Beam #'transparent = ##f % (needed for LilyPond 2.18 or the above switch will also hide beams)
    \override Stem #'direction = #DOWN
    \override Stem #'length-fraction = #0
    \override Beam #'beam-thickness = #0.1
    \override Beam #'length-fraction = #0.5
    \override Voice.Rest #'style = #'neomensural % this size tends to line up better (we'll override the appearance)
    \override Accidental #'font-size = #-4
    \override Tie #'staff-position = #2.5
    \override TupletBracket #'bracket-visibility = ##t
    \tupletUp

\time 3/4
\partial 4
#(define (note-seven grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "7")))))))
  \applyOutput #'Voice #note-seven b4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-five grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "5")))))))
|
  \applyOutput #'Voice #note-five g'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
#(define (note-four grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "4")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four fis'8[
#(define (note-three grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "3")))))))
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-four fis'4[ ~
#(define (note-dashfour grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashfour fis'4
  \applyOutput #'Voice #note-seven b4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-three e'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
#(define (note-two grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "2")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
#(define (note-one grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "1")))))))
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-two d'4[ ~
#(define (note-dashtwo grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashtwo d'4
  \applyOutput #'Voice #note-five g4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-one c'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
#(define (note-six grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "6")))))))
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8]-\tweak #'X-offset #0.6 _.
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-three e'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
|
  \applyOutput #'Voice #note-six a'4[
  \applyOutput #'Voice #note-six a'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-four fis'4[ ~
  \applyOutput #'Voice #note-dashfour fis'4
  \applyOutput #'Voice #note-seven b4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-five g'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four fis'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-four fis'4[ ~
  \applyOutput #'Voice #note-dashfour fis'4
  \applyOutput #'Voice #note-seven b4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-three e'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-two d'4[ ~
  \applyOutput #'Voice #note-dashtwo d'4
  \applyOutput #'Voice #note-five g4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-one c'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8]-\tweak #'X-offset #0.6 _.
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-three e'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8]
  \applyOutput #'Voice #note-four fis'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-three e'4[ ~
#(define (note-dashthree grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashthree e'4
  \applyOutput #'Voice #note-five g'4]
|
  \applyOutput #'Voice #note-seven b'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8[^.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-six a'4[ ~
#(define (note-dashsix grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashsix a'4
  \applyOutput #'Voice #note-two d''4]^.
|
  \applyOutput #'Voice #note-seven b'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-four fis'4[ ~
  \applyOutput #'Voice #note-dashfour fis'4
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four fis'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-three e'4[ ~
  \applyOutput #'Voice #note-dashthree e'4
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four fis'8
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
|
  \applyOutput #'Voice #note-two d'4[
  \applyOutput #'Voice #note-seven b'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8]
~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-six a'4[ ~
  \applyOutput #'Voice #note-dashsix a'4]
#(define (note-nought grob grob-origin context)
  (if (grob::has-interface grob 'rest-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "0")))))))
|
  \applyOutput #'Voice #note-nought r4[
  \applyOutput #'Voice #note-nought r4
  \applyOutput #'Voice #note-two d'4]
|
  \applyOutput #'Voice #note-seven b'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8[^.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-six a'4[ ~
  \applyOutput #'Voice #note-dashsix a'4
  \applyOutput #'Voice #note-two d''4]^.
|
  \applyOutput #'Voice #note-seven b'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-four fis'4[ ~
  \applyOutput #'Voice #note-dashfour fis'4
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four fis'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-three e'4[ ~
  \applyOutput #'Voice #note-dashthree e'4
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four fis'8
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
|
  \applyOutput #'Voice #note-two d'4[
  \applyOutput #'Voice #note-two d''4.^.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8]
~
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8]
~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-seven b'4[ ~
#(define (note-dashseven grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashseven b'4]
|
  \applyOutput #'Voice #note-nought r4[
  \applyOutput #'Voice #note-nought r4
  \applyOutput #'Voice #note-seven b4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-five g'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four fis'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-four fis'4[ ~
  \applyOutput #'Voice #note-dashfour fis'4
  \applyOutput #'Voice #note-seven b4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-three e'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-two d'4[ ~
  \applyOutput #'Voice #note-dashtwo d'4
  \applyOutput #'Voice #note-five g4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-one c'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8]-\tweak #'X-offset #0.6 _.
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-three e'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8]
  \applyOutput #'Voice #note-four fis'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-three e'4[ ~
  \applyOutput #'Voice #note-dashthree e'4]
\bar "|."
} }
% === END JIANPU STAFF ===

\new Lyrics = "IX" { \lyricsto "jianpu" { hi- ka ru u- mi ni ka su mu fu- ne ha sa yo na ra no ki te- ki no ko shi ma su yu ru i sa- ka wo o ri te yu ke ba na- tsu i- ro no ka- ze ni a e ru ka shi ra wa ta shi no a- i so re ha me ro dei ta ka ku hi ku ku u- ta u no wa ta shi no a- i so re ha ka mo me ta ka ku hi ku ku to bu no yu- u hi no na ka yo n de mi ta ra ya sa shi i a na ta ni a e ru ka shi ra } } \new Lyrics = "IY" { \lyricsto "jianpu" { 光 　 る 海 　 に か す む 船 　 は さ よ な ら の 汽 笛 　 の こ し ま す ゆ る い 坂 　 を お り て ゆ け ば 夏 　 色 　 の 風 　 に あ え る か し ら わ た し の 愛 　 そ れ は メ ロ ディー た か く ひ く く 　歌 　 う の わ た し の 愛 　 そ れ は カ モ メ た か く ひ く く 飛 ぶ の 夕 　 陽 の な か 呼 ん で み た ら や さ し い あ な た に 逢 え る か し ら } } \new Lyrics = "IZ" { \lyricsto "jianpu" { da re ka ga hi ku pi a no no o- to u- mi na ri mi ta i ni ki  ko e ma su o so i go go wo yu ki ka u hi to na- tsu i- ro no yu- me wo ha ko bu ka shi ra wa ta shi no a- i so re ha dai a rii hi bi no pe i ji tsu du ru no wa ta shi no a- i so re ha ko bu- ne so- ra no u- mi wo yu ku no yu- u hi no na ka o ri ka- e re  ba a na ta ha wa ta shi wo sa- ga su ka shi ra } } \new Lyrics = "Ia" { \lyricsto "jianpu" { だ れ か が 弾 く ピ ア ノ の 音 　 海 　 鳴 り み た い に き こ え ま す お そ い 午 後 を 往 き 交 う ひ と 夏 　 色 　 の 夢 　 を は こ ぶ か し ら わ た し の 愛 　 そ れ は ダイ ア リー 日 々 の ペ ー ジ つ づ る の わ た し の 愛 　 そ れ は 小 舟 　 空 　 の 海 　 を ゆ く の 夕 　 陽 の な か 降 り 返 　 れ ば あ な た は わ た し を 探 　 す か し ら } } \new Lyrics = "Ib" { \lyricsto "jianpu" { sa- n po mi- chi ni yu re ru ki gi  ha sa yo na ra no ka- ge wo o to shi ma su fu- ru i cha pe ru ka- za mi  no to ri na- tsu i- ro no ma- chi ha mi e ru ka shi ra ki no u no a- i so re ha na- mi- da ya  ga te ka wa ki ki e ru no a shi ta no a- i so re ha ru fu ran o wa ri no na i ko- to ba yu- u hi no na ka me gu ri a e ba a na ta ha wa ta shi wo da ku 　 ka shi ra } } \new Lyrics = "Ic" { \lyricsto "jianpu" { 散 　 歩 道 　 に ゆ れ る 木 々 は さ よ な ら の 影 　 を お と し ま す 古 　 い チャ ペ ル 風 　 見 の鶏 (と り) 夏 　 色 　 の 街 　 は み え る か し ら き の う の 愛 　 そ れ は 涙 　 　 や が て か わ き 消 え る の あ し た の 愛 　 そ れ は ル フ ラン お わ り の な い 言 　 葉 夕 　 陽 の な か め ぐ り 逢 え ば あ な た は わ た し を 抱 く 　 か し ら } } 
>>
\layout{} }
\score {
\unfoldRepeats
<< 

% === BEGIN MIDI STAFF ===
    \new Staff { \new Voice="midi" {
\time 3/4 \partial 4 b4 | g'4. g'8 fis'8 e'8 | fis'4 ~ fis'4 b4 | e'4. e'8 d'8 c'8 | d'4 ~ d'4 g4 | c'4. c'8 b8 a8 | g8 b8 e'4. g'8 | a'4 a'4. e'8 | fis'4 ~ fis'4 b4 | g'4. g'8 fis'8 e'8 | fis'4 ~ fis'4 b4 | e'4. e'8 d'8 c'8 | d'4 ~ d'4 g4 | c'4. c'8 b8 a8 | g8 b8 e'4. g'8 | a'8 a'8 fis'4. d'8 | e'4 ~ e'4 g'4 | b'4. b'8 c''8 b'8 | a'4 ~ a'4 d''4 | b'4. b'8 a'8 g'8 | fis'4 ~ fis'4 g'8 fis'8 | e'4 ~ e'4 fis'8 e'8 | d'4 b'4. g'8 | e'8 a'8 ~ a'4 ~ a'4 | r4 r4 d'4 | b'4. b'8 c''8 b'8 | a'4 ~ a'4 d''4 | b'4. b'8 a'8 g'8 | fis'4 ~ fis'4 g'8 fis'8 | e'4 ~ e'4 fis'8 e'8 | d'4 d''4. a'8 ~ | a'8 b'8 ~ b'4 ~ b'4 | r4 r4 b4 | g'4. g'8 fis'8 e'8 | fis'4 ~ fis'4 b4 | e'4. e'8 d'8 c'8 | d'4 ~ d'4 g4 | c'4. c'8 b8 a8 | g8 b8 e'4. g'8 | a'8 a'8 fis'4. d'8 | e'4 ~ e'4
} }
% === END MIDI STAFF ===

>>
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 130 4)}} }
