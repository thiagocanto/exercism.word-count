class Phrase

  def initialize(text)
    # puts "Thanks for the input, here's the summary:"
    text.gsub!(/\\n|\\t|\\r/, ' ')

    @words = text.split /\s/
    @words
      .each do |word|
        next word.gsub!(/[^0-9a-zA-Z']/, '') if /\w'\w/.match(word)

        word.gsub!(/[^0-9a-zA-Z]/, '')
      end
      .each &:downcase!
  end

  def word_count
    count = {}
    @words.uniq.each do |word|
      count[word] = count_word(word, @words)
    end

    count
  end

  private

  def count_word(word, text)
    text.join(' ').scan(/\b#{word}\b/i).size
  end
end
