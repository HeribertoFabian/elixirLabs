defmodule GuessingGame do
  def compare(secret, guess \\ :no_guess)
  def compare(_secret, :no_guess), do: "Make a guess"
  def compare(secret, guess) when secret === guess, do: "Correct"

  def compare(secret, guess) when guess - 1 === secret, do: "So close"

  def compare(secret, guess) when guess + 1 === secret, do: "So close"

  def compare(secret, guess) when guess - 1 > secret, do: "Too high"

  def compare(secret, guess) when guess + 1 < secret, do: "Too low"
end
