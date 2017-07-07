class IO
  def self.prompt_text(text)
    puts text
    user_input = gets.chomp.upcase
  end
end