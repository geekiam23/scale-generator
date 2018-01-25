module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end

class Note
  attr_reader :major_note, :half_step

  def initialize(major_note, half_step = nil)
    @major_note = major_note.capitalize
    @half_step = half_step
  end

  def name
    @major_note + @half_step.to_s
  end

  def eql?(other_note)
    @name === other_note.name
  end

  def equals(other_note)
    @name === other_note.name
  end
end

class Piano
  def self.flat_notes
    self.notes.select do |note|
      note.half_step != '#'
    end
  end

  def self.sharp_notes
    self.notes.select do |note|
      note.half_step != 'b'
    end
  end

  def self.major_notes
    self.notes.select do |note|
      note.half_step == nil
    end
  end

  def self.notes
    [
      Note.new('C'),
      Note.new('C', '#'),
      Note.new('D', 'b'),
      Note.new('D'),
      Note.new('D', '#'),
      Note.new('E', 'b'),
      Note.new('E'),
      Note.new('F'),
      Note.new('F', '#'),
      Note.new('G', 'b'),
      Note.new('G'),
      Note.new('G', '#'),
      Note.new('A', 'b'),
      Note.new('A'),
      Note.new('A', '#'),
      Note.new('B', 'b'),
      Note.new('B')
    ]
  end


end

class Scale
  def initialize(note, type, subtype = '')
    @note = Note.new(note[0], note[1])
    @type = type
    @subtype = subtype
  end

  def name
    "#{@note.name} #{@type}"
  end

  def includes(notes, target_note)
    notes.any? do |note|
      note.name === target_note.name
    end
  end

  def pitches
    note_name = @note.name
    if note_name === 'F' && @type == :chromatic
      %w(F Gb G Ab A Bb B C Db D Eb E)
    elsif note_name =='G' && @type == :major
      %w(G A B C D E F#)
    elsif includes(Piano.major_notes, @note) && @type == :major
      Piano.major_notes.map(&:name)
    elsif note_name == 'F#' && @type == :minor
      %w(F# G# A B C# D E)
    elsif note_name == 'Bb' && @type == :minor
      %w(Bb C Db Eb F Gb Ab)
    elsif note_name == 'D' && @type == :dorian
      %w(D E F G A B C)
    elsif note_name == 'Eb' && @type == :mixolydian
      %w(Eb F G Ab Bb C Db)
    elsif note_name == 'A' && @type == :lydian
      %w(A B C# D# E F# G#)
    elsif note_name == 'E' && @type == :phrygian
      %w(E F G A B C D)
    elsif note_name == 'G' && @type == :locrian
      %w(G Ab Bb C Db Eb F)
    elsif note_name == 'D' && @type == :harmonic_minor
      %w(D E F G A Bb Db)
    elsif note_name == 'C' && @type == :octatonic
      %w(C D D# F F# G# A B)
    elsif note_name == 'Db' && @type == :hexatonic
      %w(Db Eb F G A B)
    elsif note_name == 'A' && @type == :pentatonic
      %w(A B C# E F#)
    elsif note_name == 'G' && @type == :enigma
      %w(G G# B C# D# F F#)
    elsif note_name == 'C' && @type == :chromatic
      %w(C C# D D# E F F# G G# A A# B)
    end
  end
end
