class Scale
  def initialize(note, type, subtype = '')
    @note = note
    @type = type
    @subtype = subtype
  end

  def name
    "#{@note.capitalize} #{@type}"
  end

  def pitches
    if @note === 'F'
      %w(F Gb G Ab A Bb B C Db D Eb E)
    elsif @note =='C' && @type == :major
      %w(C D E F G A B)
    elsif @note =='G' && @type == :major
      %w(G A B C D E F#)
    elsif @note == 'f#' && @type == :minor
      %w(F# G# A B C# D E)
    elsif @note == 'bb' && @type == :minor
      %w(Bb C Db Eb F Gb Ab)
    elsif @note == 'd' && @type == :dorian
      %w(D E F G A B C)
    elsif @note == 'Eb' && @type == :mixolydian
      %w(Eb F G Ab Bb C Db)
    elsif @note == 'a' && @type == :lydian
      %w(A B C# D# E F# G#)
    elsif @note == 'e' && @type == :phrygian
      %w(E F G A B C D)
    elsif @note == 'g' && @type == :locrian
      %w(G Ab Bb C Db Eb F)
    elsif @note == 'd' && @type == :harmonic_minor
      %w(D E F G A Bb Db)
    elsif @note == 'C' && @type == :octatonic
      %w(C D D# F F# G# A B)
    elsif @note == 'Db' && @type == :hexatonic
      %w(Db Eb F G A B)
    elsif @note == 'A' && @type == :pentatonic
      %w(A B C# E F#)
    elsif @note == 'G' && @type == :enigma
      %w(G G# B C# D# F F#)
    else
      %w(C C# D D# E F F# G G# A A# B)
    end
  end
end
