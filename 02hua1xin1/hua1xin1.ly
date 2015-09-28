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

\repeat volta 2 {
#(define (note-nought grob grob-origin context)
  (if (grob::has-interface grob 'rest-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "0")))))))
  \applyOutput #'Voice #note-nought r4.[
#(define (note-five grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "5")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8]-\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-five g4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-six grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "6")))))))
  \applyOutput #'Voice #note-six a4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-nought r4[
#(define (note-one grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "1")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8
#(define (note-two grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "2")))))))
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
#(define (note-three grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "3")))))))
  \applyOutput #'Voice #note-three e'4[
  \applyOutput #'Voice #note-one c'4]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two d'16
(
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-three e'16]
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
#(define (note-seven grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "7")))))))
  \applyOutput #'Voice #note-seven b4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8-\tweak #'X-offset #0.6 _.
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-one c'4[ ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 #(define (note-dashone grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashone c'4 ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
  \applyOutput #'Voice #note-dashone c'4]
|
  \applyOutput #'Voice #note-nought r4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
  \applyOutput #'Voice #note-five g'4[
  \applyOutput #'Voice #note-six a'4]
|
  \applyOutput #'Voice #note-nought r4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8^.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8]^.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8[^.
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
)
  \applyOutput #'Voice #note-five g'4
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-six a'16
(
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-one c''16]^.
)
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
  \applyOutput #'Voice #note-three e'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-five g'4[ ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 #(define (note-dashfive grob grob-origin context)
  (if (grob::has-interface grob 'note-head-interface)
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashfive g'4 ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashfive g'4 ~
  \applyOutput #'Voice #note-dashfive g'4]
|
  \applyOutput #'Voice #note-nought r4.[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8]-\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-five g4[-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-six a4]-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
|
  \applyOutput #'Voice #note-nought r4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
  \applyOutput #'Voice #note-three e'4[
  \applyOutput #'Voice #note-one c'4]
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-one c''4[^.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-five g'4[ ~
  \applyOutput #'Voice #note-dashfive g'4
(
  \applyOutput #'Voice #note-three e'4
  \applyOutput #'Voice #note-five g'4]
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-three e'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-two d'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
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
  \applyOutput #'Voice #note-one c'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-one c'4[ ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
  \applyOutput #'Voice #note-dashone c'4]
|
  \applyOutput #'Voice #note-nought r4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
  \applyOutput #'Voice #note-five g'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8]^.
)
~
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8[^.
  \applyOutput #'Voice #note-one c''4.^.
~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-one c''4^. ~
  \applyOutput #'Voice #note-dashone c''4]
|
  \applyOutput #'Voice #note-nought r4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8^.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-one c''16^.
(
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two d''16]^.
)
  \applyOutput #'Voice #note-one c''4[^.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
)
|
  \applyOutput #'Voice #note-five g'4.[
(
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-six a'16
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-five g'16]
)
  \applyOutput #'Voice #note-three e'4[
(
  \applyOutput #'Voice #note-five g'4]
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-three e'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-two d'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
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
  \applyOutput #'Voice #note-one c'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-one c'4[ ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
  \applyOutput #'Voice #note-dashone c'4]
|
  \applyOutput #'Voice #note-nought r4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
  \applyOutput #'Voice #note-five g'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8]^.
)
~
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8[^.
  \applyOutput #'Voice #note-one c''4.^.
~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-one c''4^. ~
  \applyOutput #'Voice #note-dashone c''4]
|
  \applyOutput #'Voice #note-nought r4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c''8^.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-one c''16^.
(
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-two d''16]^.
)
  \applyOutput #'Voice #note-one c''4[^.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
)
|
  \applyOutput #'Voice #note-five g'4.[
(
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-six a'16
\set stemLeftBeamCount = #2
\set stemRightBeamCount = #2
  \applyOutput #'Voice #note-five g'16]
)
  \applyOutput #'Voice #note-three e'4[
(
  \applyOutput #'Voice #note-five g'4]
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-three e'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-two d'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
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
  \applyOutput #'Voice #note-one c'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-one c'4[ ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
  \applyOutput #'Voice #note-dashone c'4]
}
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-three e'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
  \applyOutput #'Voice #note-two d'4[
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8
(
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
)
| \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[-\tweak #'X-offset #0.6 _.
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
  \applyOutput #'Voice #note-one c'8]
)
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 |
  \applyOutput #'Voice #note-one c'4[ ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0   \applyOutput #'Voice #note-dashone c'4 ~
  \applyOutput #'Voice #note-dashone c'4]
\bar "|."
} }
% === END JIANPU STAFF ===

\new Lyrics = "IX" { \lyricsto "jianpu" { \override LyricText #'self-alignment-X = #LEFT 花 的 心 藏 在 蕊 中 空 把 花 期 都 錯 過 你 的 心 忘 了 季 節 從 不 輕 易 讓 人 懂 為 何 不 牽 我 的 手 共 聽 日 月 唱 首 歌 黑 夜 又 白 晝 黑 夜 又 白 晝 人 生 為 歡 有 幾 何 春 去 春 會 來 花 謝 花 會 再 開 只 要 你 願 意 只 要 你 願 意 讓 夢 划 向 你 心 海 春 去 春 會 來 花 謝 花 會 再 開 只 要 你 願 意 只 要 你 願 意 讓 夢 划 向 你 心 海 } } \new Lyrics = "IY" { \lyricsto "jianpu" { \override LyricText #'self-alignment-X = #LEFT 花 瓣 淚 飄 落 風 中 雖 有 悲 意 也 從 容 你 的 淚 晶 瑩 剔 透 心 中 一 定 還 有 夢 為 何 不 牽 我 的 手 同 看 海 天 成 一 色 潮 起 又 潮 落 潮 起 又 潮 落 送 走 人 間 許 多 愁 春 去 春 會 來 花 謝 花 會 再 開 只 要 你 願 意 只 要 你 願 意 讓 夢 划 向 你 心 海 春 去 春 會 來 花 謝 花 會 再 開 只 要 你 願 意 只 要 你 願 意 讓 夢 划 向 你 心 海 只 要 你 願 意 只 要 你 願 意 讓 夢 划 向 你 心 海 } } 
>>
\layout{} }
\score {
\unfoldRepeats
<< 

% === BEGIN MIDI STAFF ===
    \new Staff { \new Voice="midi" {
\repeat volta 2 { r4. g8 g4 a4 | r4 c'8 d'8 e'4 c'4 | d'8 d'16 ( e'16 ) d'8 c'8 b4 b8 ( c'8 ) | c'4 ~ c'4 ~ c'4 ~ c'4 | r4. g'8 g'4 a'4 | r4 c''8 c''8 c''8 ( g'8 ) g'4 | a'8 a'16 ( c''16 ) a'8 g'8 e'4 e'8 ( g'8 ) | g'4 ~ g'4 ~ g'4 ~ g'4 | r4. g8 g4 a4 | r4 c'8 d'8 e'4 c'4 | d'8 d'8 d'8 e'8 c''4 a'8 ( g'8 ) | g'4 ~ g'4 ( e'4 g'4 ) | r8 e'8 e'8 e'8 e'4 d'8 ( c'8 ) | r8 d'8 d'8 e'8 d'4 c'8 ( b8 ) | b8 b8 b8 b8 b8 ( c'8 ) d'8 ( c'8 ) | c'4 ~ c'4 ~ c'4 ~ c'4 | r4 g'8 g'8 g'4 a'8 ( c''8 ) ~ | c''8 c''4. ~ c''4 ~ c''4 | r4 c''8 c''16 ( d''16 ) c''4 a'8 ( g'8 ) | g'4. ( a'16 g'16 ) e'4 ( g'4 ) | r8 e'8 e'8 e'8 e'4 d'8 ( c'8 ) | r8 d'8 d'8 e'8 d'4 c'8 ( b8 ) | b8 b8 b8 b8 b8 ( c'8 ) d'8 ( c'8 ) | c'4 ~ c'4 ~ c'4 ~ c'4 | r4 g'8 g'8 g'4 a'8 ( c''8 ) ~ | c''8 c''4. ~ c''4 ~ c''4 | r4 c''8 c''16 ( d''16 ) c''4 a'8 ( g'8 ) | g'4. ( a'16 g'16 ) e'4 ( g'4 ) | r8 e'8 e'8 e'8 e'4 d'8 ( c'8 ) | r8 d'8 d'8 e'8 d'4 c'8 ( b8 ) | b8 b8 b8 b8 b8 ( c'8 ) d'8 ( c'8 ) | c'4 ~ c'4 ~ c'4 ~ c'4 } | r8 e'8 e'8 e'8 e'4 d'8 ( c'8 ) | r8 d'8 d'8 e'8 d'4 c'8 ( b8 ) | b8 b8 b8 b8 b8 ( c'8 ) d'8 ( c'8 ) | c'4 ~ c'4 ~ c'4 ~ c'4
} }
% === END MIDI STAFF ===

>>
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4)}} }
