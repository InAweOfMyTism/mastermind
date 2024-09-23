class Game
  @@color_options = ["red", "blue", "yellow", "purple", "green", "orange", "brown", "white", "black"]

  attr_accessor :winner

  def initialize()
    #do some code
    @code = Array.new(4) { @@color_options.sample() }
    display_code
    @winner = false
  end

  def show_instructions()
    puts "Mastermind:"
    puts "You have 10 attempts to guess the color code"
    puts "Each guess recevies feedback according to the code below"
    puts "enter four guesses separated by a space"
    puts "Color Options:"
    puts " -red"
    puts " -blue"
    puts " -yellow"
    puts " -purple"
    puts " -green"
    puts " -orange"
    puts " -brown"
    puts " -white"
    puts " -black"
    puts "Code:"
    puts "HOT - correct color and place"
    puts "WARM - color is in the code in a different place"
    puts "COLD - color is not anywhere in the code"
    puts "BRRR - incorrect input"
  end

  def play_game()
    round_count = 0

    until self.winner || round_count >= 10 do
      self.play_round()
      round_count += 1
      puts 'Game Over :(' if round_count >= 10
    end

  end

  def play_round()
    #prompt guess
    prompt_guess
    #get guesses from user
    guesses = gets.chomp.split(' ')
    #check guesses
    check(guesses)
    #display results
  end

  private

  def display_code()
    p @code
  end

  def prompt_guess()
    puts "Enter 4 guesses in order"
  end

  def check(guesses)
    puts "Please enter a valid guess" unless guesses.length == 4
    
    output = []

    accuracy = [false, false, false, false]
    
    guesses.each_with_index do |guess, index|
      if guesses[index] === @code[index]
        output.push('HOT')
        accuracy[index] = true
      elsif @code.include?(guesses[index])
        output.push('WARM')
      elsif @@color_options.include?(guesses[index])
        output.push('COLD')
      else
        output.push('BRRR')
      end
    end

    if accuracy.include?(false)
      @winner = false
    else
      @winner  = true
      puts "You win!"
    end
    
    p output
  end
end