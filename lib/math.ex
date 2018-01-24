defmodule Math do

  defdelegate log2(n), to: :math
  defdelegate pow(x, y), to: :math

  @doc """
  Computes lg*(n)

  ## Examples

      iex> Math.log2_star(2)
      1
      iex> Math.log2_star(4)
      2
      iex> Math.log2_star(16)
      3
      iex> 2 |> :math.pow(16) |>  Math.log2_star()
      4
  """
  def log2_star(n, count \\ 0)
  def log2_star(n, count) when n <= 1, do: count
  def log2_star(n, count) do
    n
    |> log2
    |> log2_star(count + 1)
  end

  @doc """
  Computes \sum{k}{n} fun(k)

  ## Examples

      iex> Math.summation(0, 10, fn k -> 2 * k end)
      110
  """
  def summation(k, n, fun, sum \\ 0)
  def summation(n, n, fun, sum), do: sum + fun.(n)
  def summation(k, n, fun, sum), do: summation(k + 1, n, fun, sum + fun.(k))

  @doc """
  Computes n!

  ## Examples

      iex> Math.factorial(0)
      1
      iex> Math.factorial(1)
      1
      iex> Math.factorial(3)
      6
      iex> Math.factorial(10)
      3_628_800
  """
  def factorial(n, product \\ 1)
  def factorial(0, product), do: product
  def factorial(n, product), do: factorial(n - 1, product * n)
end
