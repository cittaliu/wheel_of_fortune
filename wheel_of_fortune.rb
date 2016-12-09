class WheelOfFortune
  attr_reader :theme
  def initialize(hash)
    @phrase = hash[:phrase]
    @theme = hash[:theme]
    @guess =[]
  end

  def theme
    @theme
  end

  def guesses
    @guess
  end

  def to_s
    @phrase.gsub(/[^#{@guess.join()} ]/i,"_")
  end

  def can_i_have?(input)
    input = input.downcase
    @guess.push(input)
    return @phrase.downcase.include?input
  end

  def game_over?
    return @guess.length !=0 && (to_s == @phrase)
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
