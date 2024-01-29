require "minitest/autorun"
require "./vocab"
require 'stringio'

class TestVocabCli < Minitest::Test
  def setup
    @vocab = Vocab.new
  end

  def test_add_word
    simulated_user_input = StringIO.new("Ruby\nIs both a programming language and a gemstone\n")
    $stdin = simulated_user_input

    assert @vocab.add_word, "Test to Add Word Failed"
    assert simulated_user_input
    assert @vocab.show_words, "Test to Show Word Failed"

    $stdin = STDIN
  end

end
