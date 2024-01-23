require "minitest/autorun"
require "./vocab"

class TestVocabCli < Minitest::Test
  def setup
    @vocab = Vocab.new
  end

  def test_add_word
    output = get_user_input

    assert_equal "Test", output
    assert @vocab.add_word, "Test to Add Word Failed"
    assert @vocab.show_words, "Test to Show Word Failed"
  end

  def gets
    "Test\n"
  end

  def get_user_input
    user_input = gets.chomp
  end
end
