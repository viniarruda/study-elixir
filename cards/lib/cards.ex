defmodule Cards do
  def hello do
    "hi there!"
  end

  @doc """
    list comprehension

      cards =
        for value <- values do
          for suit <- suits do
            template_string
          end
        end

      List.flatten(cards)
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
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

  @doc """
    my hand is always at index 0 and rest of deck at index 1
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
