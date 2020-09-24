defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

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

  @doc """
    need call with ? like Cards.contains?(deck, "Ace")
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

      iex > deck = Cards.create_deck
      iex > {hand, deck} = Cards.deal(deck, 1)
      iex > hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
