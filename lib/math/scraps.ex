defmodule Math.Scraps do

  @moduledoc """
  Functions for random, one-off things
  """

  @doc """
  \sum{k = 1}{n} (2k - 1)
  """
  def sum_of_2k_minus_1(n), do: Math.summation(1, n, fn k -> 2*k - 1 end)

  @doc """
  n! - n
  """
  def n_factorial_minus_n(n), do: Math.summation(1, n, fn k -> 2*k - 1 end)

  @doc """
  \sum_{k=0}{floor(lgn)} ceil(n/2k)
  """
  def sum_of_n_over_2k_ceil(n) do
    limit = n |> Math.log2 |> Float.floor |> round
    Math.summation(0, limit, fn k ->
      (n / Math.pow(2, k))
      |> Float.ceil
    end)
  end

  @doc """
  n + \sum_{k=1}{floor(lgn)} ceil(n/2k)
  """
  def sum_of_n_over_2(n) do
    limit = n |> Math.log2 |> Float.floor |> round
    sum =
      Math.summation(0, limit, fn _k -> n / 2 end)
    sum + n
  end

  @doc """
  sum to log of n
  """
  def sum_of_n_to_log2_n(n) do
    limit = n |> Math.log2 |> Float.floor |> round
    Math.summation(0, limit, fn _k -> n end)
  end
end
