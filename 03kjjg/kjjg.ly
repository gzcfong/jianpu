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
    \override Stem #'length-fraction = #0.5
    \override Beam #'beam-thickness = #0.1
    \override Beam #'length-fraction = #0.5
    \override Voice.Rest #'style = #'neomensural % this size tends to line up better (we'll override the appearance)
    \override Accidental #'font-size = #-4
    \override Tie #'staff-position = #2.5
    \override TupletBracket #'bracket-visibility = ##t
    \tupletUp

#(define (note-five grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "5")))))))
  \applyOutput #'Voice #note-five g4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-one grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "1")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-one c'16]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8.[
(
#(define (note-seven grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "7")))))))
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-seven b16]-\tweak #'X-offset #0.6 _.
)
  \applyOutput #'Voice #note-one c'4
|
  \applyOutput #'Voice #note-five g4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-two grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "2")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two d'16]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8.[
(
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-one cis'16]
)
  \applyOutput #'Voice #note-two d'4
|
  \applyOutput #'Voice #note-five g4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-three grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "3")))))))
  \applyOutput #'Voice #note-three e'4
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8.
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two dis'16]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8.[
#(define (note-four grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "4")))))))
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-four f'16]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8.[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two d'16]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
)
|
  \applyOutput #'Voice #note-seven b4.[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8]-\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-five g'4[
  \applyOutput #'Voice #note-five g'4]
|
  \applyOutput #'Voice #note-three e'4[
  \applyOutput #'Voice #note-one c'4
  \applyOutput #'Voice #note-two d'4
  \applyOutput #'Voice #note-one c'4]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8.[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two d'16]
)
  \applyOutput #'Voice #note-two d'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8.
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-seven b16]-\tweak #'X-offset #0.6 _.
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four f'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-five g'4[ ~
#(define (note-dashfive grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashfive g'4]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-five g'4[ ~
  \applyOutput #'Voice #note-dashfive g'4
#(define (note-six grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "6")))))))
  \applyOutput #'Voice #note-six a'4
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-six a'16]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8.[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-six a'16]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four f'8]
)
  \applyOutput #'Voice #note-three e'4[
(
  \applyOutput #'Voice #note-two d'4]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-one c'4[ ~
#(define (note-dashone grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashone c'4
  \applyOutput #'Voice #note-one c'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-six a4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-six a4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-six a4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-five gis4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-six a4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-seven b4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-seven b16]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8.[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-seven b16]-\tweak #'X-offset #0.6 _.
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-three e'4[ ~
#(define (note-dashthree grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashthree e'4
  \applyOutput #'Voice #note-two d'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
|
  \applyOutput #'Voice #note-two d'4[
  \applyOutput #'Voice #note-two d'4
  \applyOutput #'Voice #note-three e'4
  \applyOutput #'Voice #note-four f'4]
|
  \applyOutput #'Voice #note-three e'4[
  \applyOutput #'Voice #note-two d'4
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-one c'16]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8.[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-three e'16]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-six a4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _. ~
#(define (note-dashsix grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashsix a4
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8.-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-five g16]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8.[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-five g16]-\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-one c'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8]-\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-three e'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
|
  \applyOutput #'Voice #note-five g'4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-two d'4[ ~
#(define (note-dashtwo grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashtwo d'4]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8.[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two d'16]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four f'8]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8.[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-six a'16]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8[
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-four f'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-three e'4[ ~
  \applyOutput #'Voice #note-dashthree e'4
~
  \applyOutput #'Voice #note-three e'4
  \applyOutput #'Voice #note-two d'4]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-one c'4[ ~
  \applyOutput #'Voice #note-dashone c'4
~
  \applyOutput #'Voice #note-one c'4
#(define (note-nought grob grob-origin context)
  (if (grob::has-interface grob 'rest-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "0")))))))
  \applyOutput #'Voice #note-nought r4]
\bar "|."
} }
% === END JIANPU STAFF ===

\new Lyrics = "IX" { \lyricsto "jianpu" { 凌 雲 御 風 去 報 國 把 志 伸 遨 遊 崑 崙 上 空 俯 瞰 太 平 洋 濱 看 五 嶽 三 江 雄 關 要 塞  美 麗 的 錦 繡 河 山 輝 映 著 無 敵 機 群 緬 懷 先 烈 莫 　 辜 負 創 業 艱 辛 發 揚 光 大 尤 　  賴 我 空 軍 軍 人 同 志 們 努 力 努 力 矢 勇 矢 勤 國 祚 皇 皇 萬 世 榮 } } \new Lyrics = "IY" { \lyricsto "jianpu" { 盡 瘁 為 空 軍 報 國 把 志 伸 那 怕 風 霜 雨 露 只 信 雙 手 萬 能 看 鐵 翼 蔽 空 馬 達 齊 鳴  美 麗 的 錦 繡 河 山 輝 映 著 無 敵 機 群 我 們 要 使 技 術 發 明 日 　 日 新 我 們 要 用 血 汗 永  固 中 　 華 魂 同 志 們 努 力 努 力 同 德 同 心 國 祚 皇 皇 萬 世 榮 } } 
%>>
%\layout{} }
%\score {
%\unfoldRepeats
%<< 

% === BEGIN MIDI STAFF ===
    \new Staff { \new Voice="midi" {
      %g4 c'8. c'16 c'8. ( b16 ) c'4 | g4 d'8. d'16 d'8. ( cis'16 ) d'4 | g4 e'4 e'8. dis'16 e'8. f'16 | e'8 ( c'8 ) d'8 ( e'8 ) d'8. d'16 d'8 ( c'8 ) | b4. g8 g'4 g'4 | e'4 c'4 d'4 c'4 | e'8. ( d'16 ) d'4 c'8. ( b16 ) c'8 d'8 | e'8 ( d'8 ) e'8 ( f'8 ) g'2 | g'2 a'4 a'8. a'16 | g'8. ( a'16 ) g'8 ( f'8 ) e'4 ( d'4 ) | c'2 c'4. b8 | a4 a4 a4 gis4 | a4 b4 c'8. b16 d'8. ( b16 ) | e'2 d'4. d'8 | d'4 d'4 e'4 f'4 | e'4 d'4 e'8. c'16 d'8. ( e'16 ) | a2 g8. g16 g8. g16 | c'4. g8 e'4. c'8 | g'4. c'8 d'2 | c'8. ( d'16 ) e'8 ( f'8 ) g'8. ( a'16 ) g'8 ( f'8 ) | e'2. d'4 | c'2. r4
\relative c'' {
g c8. c16 c8. ( b16 ) c4 | g4 d'8. d16 d8. ( cis16 ) d4 | g,4 e'4 e8. dis16 e8. f16 | e8 ( c8 ) d8 ( e8 ) d8. d16 d8 ( c8 ) | b4. g8 g'4 g4 | e4 c4 d4 c4 | e8. ( d16 ) d4 c8. ( b16 ) c8 d8 | e8 ( d8 ) e8 ( f8 ) g2 | g2 a4 a8. a16 | g8. ( a16 ) g8 ( f8 ) e4 ( d4 ) | c2 c4. b8 | a4 a4 a4 gis4 | a4 b4 c8. b16 d8. ( b16 ) | e2 d4. d8 | d4 d4 e4 f4 | e4 d4 e8. c16 d8. ( e16 ) | a,2 g8. g16 g8. g16 | c4. g8 e'4. c8 | g'4. c,8 d2 | c8. ( d16 ) e8 ( f8 ) g8. ( a16 ) g8 ( f8 ) | e2. d4 | c2. r4
}
} }
% === END MIDI STAFF ===

>>
\layout {}
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 124 4)}} }
