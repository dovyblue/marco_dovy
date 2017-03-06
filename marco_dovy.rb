# 1. Write out the Card and Deck classes to make the program work. The Deck class should hold a list of Card instances.
# 2. Change the program to use multiple choice questions. The Card class should be responsible for checking the answer.
# 3. CHALLENGE: Change the program to allow the user to retry once if they get the wrong answer.
# 4. CHALLENGE: Change the program to keep track of number right/wrong and give a score at the end.
# 5. CHALLENGE: Change the program to give the user the choice at the end of the game to retry the cards they got wrong.
# 6. CHALLENGE: Change the interface with better prompts, ASCII art, etc. Be as creative as you'd like!

class Card
  
  def initialize(question, answers)
    @question = question
    @answers = answers
    @answer = @answers[0]
  end

  def question
    @shuf = @answers.shuffle
    @a = {}
    @a[@shuf[0]] = "a"
    @a[@shuf[1]] = "b"
    @a[@shuf[2]] = "c"
   
    p @question
    p "choose one of the following:"
    p "A. #{@shuf[0]}"
    p "B. #{@shuf[1]}"
    p "C. #{@shuf[2]}"
  end
  
  def answer
    @a[@answer]
  end
end

class Deck
  def initialize(input)
    @cards = [
      @card1 =  Card.new(input.keys[0], input.values[0]),
      @card2 =  Card.new(input.keys[1], input.values[1]),
      @card3 =  Card.new(input.keys[2], input.values[2])
    ]
  end

 def remaining_cards
   @cards.length  
 
 end

 def draw_card
   a = @cards.sample
   @cards.delete(a)
 end

end

trivia_data = {
  "What is the capital of Illinois?" => ["Springfield", "Chicago", "Rockford"], 
  "Is Africa a country or a continent?" => ["Continent", "country", "none of the above"],
  "Tug of war was once an Olympic event. True or false?" => ["True", "False", "unsure"]
}



deck = Deck.new(trivia_data) # deck is an instance of the Deck class


 while deck.remaining_cards > 0
 card = deck.draw_card # card is an instance of the Card class
 
card.question

 user_answer = gets.chomp
 if user_answer.downcase == card.answer.downcase
   puts "Correct!"
 else
   puts "Incorrect!"
 end
end 

