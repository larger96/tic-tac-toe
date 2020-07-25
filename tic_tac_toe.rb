require 'pry'

class Game
  attr_accessor :tl, :tm, :tr, :ml, :mm, :mr, :bl, :bm, :br

  @@turns = 0
  @@rounds = 1
  @@player1_score = 0
  @@player2_score = 0

  def initialize
    @tl = ' '
    @tm = ' '
    @tr = ' '
    @ml = ' '
    @mm = ' '
    @mr = ' '
    @bl = ' '
    @bm = ' '
    @br = ' '
    @x_o = 'X'
    @game_won = false
  end

  def start
    puts "..::TIC_TAC_TOE::.."
    puts "The first player to place three of their marks in a"
    puts "horizontal, vertical or diagonal row is the winner!"
    puts "\n"
    puts "Type your square to play!!"
    puts "----------------\n"
    puts "| tl | tm | tr |\n"
    puts "----------------\n"
    puts "| ml | mm | mr |\n"
    puts "----------------\n"
    puts "| bl | bm | br |\n"
    puts "----------------\n"
    puts "\n"
    round_count
    board
  end

  def round_count
    puts "..::ROUND #{@@rounds}::.."
  end

  def board
    #winner
    puts "\s-------------\n"
    puts "\s| #{@tl} | #{@tm} | #{@tr} |\n"
    puts "\s-------------\n"
    puts "\s| #{@ml} | #{@mm} | #{@mr} |\n"
    puts "\s-------------\n"
    puts "\s| #{@bl} | #{@bm} | #{@br} |\n"
    puts "\s-------------\n"
    if @game_won == true
      puts "Player 1: #{@@player1_score}"
      puts "Player 2: #{@@player2_score}"
      new_game
    else
      print "#{whose_turn} make your move>> "
      play_game
    end
  end

  def x_o
    if @@turns.odd?
      'X'
    else
      'O'
    end
  end

  def fill_square(square)
    if square == ' '
      square[0] = x_o
    else
      puts "Space already filled. Try again."
      @@turns -= 1
    end
  end

  def play_game
    move = gets.chomp
    case move
    when 'tl'
      fill_square(@tl)
    when 'tm'
      fill_square(@tm)
    when 'tr'
      fill_square(@tr)
    when 'ml'
      fill_square(@ml)
    when 'mm'
      fill_square(@mm)
    when 'mr'
      fill_square(@mr)
    when 'bl'
      fill_square(@bl)
    when 'bm'
      fill_square(@bm)
    when 'br'
      fill_square(@br)
    else
      puts "Please enter a valid input."
      @@turns -= 1
    end
    winner
    board
  end

  def whose_turn
    @@turns += 1
    if @@turns.odd?
      "Player 1"
    else
      "Player 2"
    end
  end

  def new_game
    puts "New game? (y/n)"
    print ">> "
    result = gets.chomp
    if result == 'y'
      puts "\n"
      initialize
      @@turns = 0
      @@rounds += 1
      round_count
      board
    elsif result == 'n'
      puts "Final Score"
      puts "Player 1: #{@@player1_score}"
      puts "Player 2: #{@@player2_score}"
      puts "Thanks for playing!"
      exit
    else
      puts "Input not recognised."
      new_game
    end
  end

  def winner
    if (tl == 'X' && tm == 'X' && tr == 'X') ||
       (ml == 'X' && mm == 'X' && mr == 'X') ||
       (bl == 'X' && bm == 'X' && br == 'X') ||
       (tl == 'X' && ml == 'X' && bl == 'X') ||
       (tm == 'X' && mm == 'X' && mr == 'X') ||
       (tr == 'X' && mr == 'X' && br == 'X') ||
       (tl == 'X' && mm == 'X' && br == 'X') ||
       (bl == 'X' && mm == 'X' && tr == 'X')
      puts 'Player 1 wins!'
      @@player1_score += 1
      @game_won = true
    elsif (tl == 'O' && tm == 'O' && tr == 'O') ||
       (ml == 'O' && mm == 'O' && mr == 'O') ||
       (bl == 'O' && bm == 'O' && br == 'O') ||
       (tl == 'O' && ml == 'O' && bl == 'O') ||
       (tm == 'O' && mm == 'O' && mr == 'O') ||
       (tr == 'O' && mr == 'O' && br == 'O') ||
       (tl == 'O' && mm == 'O' && br == 'O') ||
       (bl == 'O' && mm == 'O' && tr == 'O')
      puts 'Player 2 wins!'
      @@player2_score += 1
      @game_won = true
    else
      puts "\n"
    end
  end
end

new_game = Game.new
new_game.start