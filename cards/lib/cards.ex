defmodule Cards do
  def hello do
    "hi there!"
  end

  @doc """
    list comprehension
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values do
      for suit <- suits do
        "#{value} of #{suit}"
      end
    end
  end

  @doc """
    Immutability
    myDeck -> shuffle (copy list -> shuffle list) -> shuffle Array
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end
end
