defmodule Wordex.Counters.IntegerCounter do
  @moduledoc """
  Counters for integers.
  """

  @doc """
  Returns a new counter.
  """
  def new(input \\ "0") do
    String.to_integer(input)
  end

  @doc """
  Increments the counter for the given integer.
  """
  def inc(acc) do
    acc + 1
  end

  def dec(acc) do
    acc - 1
  end

  def show(acc) do
    "The count-ARR is #{acc}"
  end
end
