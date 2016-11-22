class Player
  def initialize(name, color)
    @name = name
    @color = color
  end

  def get_piece
    p "Enter location of piece you'd like to move (ex: c2):  "
    entry = gets.chomp.downcase.split('')
    translate_input(entry)
  end

  def get_destination
    p "Enter destination of piece (ex: a3):  "
    entry = gets.chomp.downcase.split('')
    translate_input(entry)
  end

  def translate_input(entry)
    entry[0] = entry.first.ord - 97
    entry[1] = entry[1].to_i - 1
    entry
  end

  def invalid_entry_message
    puts "Invalid entry."
  end

end
