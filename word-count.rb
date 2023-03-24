class WordCount

  def self.handle(text)
    puts "Thanks for the input, here's the summary:"
    words = text.split(/\s|\\n|\\t|\\r/)
    words
      .each do |word|
        next word.gsub!(/[^0-9a-zA-Z']/, '') if /\w'\w/.match(word)

        word.gsub!(/[^0-9a-zA-Z]/, '')
      end
      .each &:downcase!

    words.uniq.each do |word|
      puts "#{word.downcase}: #{count_word(word, words)}"
    end
  end

  private

  def self.count_word(word, text)
    text.join(' ').scan(/\b#{word}\b/i).size
  end
end

puts '#' * 80
puts "Welcome to the WordCount practice, please input the text to be examined\n\n"

input_text = gets

WordCount.handle(input_text)
