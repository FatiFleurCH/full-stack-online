class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  def initialize
    @secret_word = self.class.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  def guess_word
    @guess_word
  end
  def attempted_chars
    @attempted_chars
  end
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end
  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |ele, i| 
      arr << i if char == ele
    end
    arr
  end
  def fill_indices(char, arr_i)
    arr_i.each do |i|
      @guess_word[i] = char
    end
    @guess_word
  end
  #Part 2
  def try_guess(char)
    arr_i = get_matching_indices(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if arr_i == []
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, arr_i)
      end
      return true
    end
  end
  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    return try_guess(char)
  end
  def win?
    if @guess_word == @secret_word.split("")
      p "WIN"
      return true
    else
      return false
    end
  end
  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end
  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end



end
